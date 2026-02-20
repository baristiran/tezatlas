#!/bin/bash
set -euo pipefail

# ============================================================================
# TezPilot - Kaynak Dogrulama Scripti
# ============================================================================

# Renkler
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

# Yapilandirma
KAYNAKLAR_DIR="${KAYNAKLAR_DIR:-./kaynaklar}"
ENVANTER_FILE="${1:-KAYNAK_ENVANTERI.md}"
KOMUT="${2:-verify}"

# Komut satiri arguman sirasi: komut once, envanter sonra
if [[ "${1:-}" =~ ^(verify|orphans|missing|stats|help)$ ]]; then
    KOMUT="${1}"
    ENVANTER_FILE="${2:-KAYNAK_ENVANTERI.md}"
else
    ENVANTER_FILE="${1:-KAYNAK_ENVANTERI.md}"
    KOMUT="${2:-verify}"
fi

# ============================================================================
# Yardimci Fonksiyonlar
# ============================================================================

bilgi() {
    echo -e "${BLUE}[BILGI]${NC} $1"
}

basari() {
    echo -e "${GREEN}[OK]${NC} $1"
}

uyari() {
    echo -e "${YELLOW}[UYARI]${NC} $1"
}

hata() {
    echo -e "${RED}[HATA]${NC} $1"
}

baslik() {
    echo ""
    echo -e "${BOLD}━━━ $1 ━━━${NC}"
    echo ""
}

# ============================================================================
# verify: Tam dogrulama
# ============================================================================

dogrula() {
    baslik "Kaynak Dogrulama Raporu"

    # Kaynaklar dizinini kontrol et
    if [ ! -d "$KAYNAKLAR_DIR" ]; then
        hata "Kaynaklar dizini bulunamadi: $KAYNAKLAR_DIR"
        hata "KAYNAKLAR_DIR ortam degiskeniyle dizin belirtebilirsiniz."
        exit 1
    fi

    # PDF dosyalarini say
    local pdf_sayisi
    pdf_sayisi=$(find "$KAYNAKLAR_DIR" -name "*.pdf" -type f 2>/dev/null | wc -l | tr -d ' ')
    bilgi "Kaynaklar dizininde $pdf_sayisi PDF dosyasi bulundu."
    echo ""

    # Envanter dosyasini kontrol et
    if [ ! -f "$ENVANTER_FILE" ]; then
        uyari "Envanter dosyasi bulunamadi: $ENVANTER_FILE"
        uyari "Capraz referans kontrolu atlanacak."
        echo ""
    else
        baslik "Envanter Capraz Referans Kontrolu"

        # Envanterden dosya adlarini cikar (markdown link formatinda)
        local envanter_dosyalari
        envanter_dosyalari=$(grep -oP '\[.*?\]\((.*?\.pdf)\)' "$ENVANTER_FILE" 2>/dev/null | grep -oP '\((.*?\.pdf)\)' | tr -d '()' || true)

        if [ -z "$envanter_dosyalari" ]; then
            # Alternatif format: satir basinda dosya adi
            envanter_dosyalari=$(grep -oP '[^\s]+\.pdf' "$ENVANTER_FILE" 2>/dev/null || true)
        fi

        if [ -z "$envanter_dosyalari" ]; then
            uyari "Envanterde PDF referansi bulunamadi."
        else
            local envanter_sayisi
            envanter_sayisi=$(echo "$envanter_dosyalari" | wc -l | tr -d ' ')
            bilgi "Envanterde $envanter_sayisi PDF referansi bulundu."
            echo ""

            # Envanterde var ama diskte yok
            local eksik=0
            echo -e "${BOLD}Envanterde var, diskte yok:${NC}"
            while IFS= read -r dosya; do
                local tam_yol="$KAYNAKLAR_DIR/$(basename "$dosya")"
                if [ ! -f "$tam_yol" ]; then
                    hata "  EKSIK: $dosya"
                    eksik=$((eksik + 1))
                fi
            done <<< "$envanter_dosyalari"
            if [ "$eksik" -eq 0 ]; then
                basari "  Tum envanter dosyalari diskte mevcut."
            else
                hata "  $eksik dosya eksik!"
            fi
            echo ""

            # Diskte var ama envanterde yok
            local kayitsiz=0
            echo -e "${BOLD}Diskte var, envanterde yok:${NC}"
            while IFS= read -r dosya; do
                local dosya_adi
                dosya_adi=$(basename "$dosya")
                if ! echo "$envanter_dosyalari" | grep -qF "$dosya_adi"; then
                    uyari "  KAYITSIZ: $dosya_adi"
                    kayitsiz=$((kayitsiz + 1))
                fi
            done < <(find "$KAYNAKLAR_DIR" -name "*.pdf" -type f 2>/dev/null)
            if [ "$kayitsiz" -eq 0 ]; then
                basari "  Tum disk dosyalari envanterde kayitli."
            else
                uyari "  $kayitsiz dosya envanterde kayitli degil."
            fi
            echo ""
        fi
    fi

    # Bozuk/bos PDF kontrolu
    baslik "PDF Butunluk Kontrolu"
    local bozuk=0
    local bos=0

    while IFS= read -r dosya; do
        local dosya_adi
        dosya_adi=$(basename "$dosya")
        local boyut
        boyut=$(wc -c < "$dosya" | tr -d ' ')

        if [ "$boyut" -eq 0 ]; then
            hata "  BOS DOSYA (0 byte): $dosya_adi"
            bos=$((bos + 1))
        else
            # PDF basligi kontrolu (%PDF)
            local baslangic
            baslangic=$(head -c 5 "$dosya" 2>/dev/null || true)
            if [ "$baslangic" != "%PDF-" ]; then
                hata "  BOZUK (gecersiz PDF basligi): $dosya_adi"
                bozuk=$((bozuk + 1))
            fi
        fi
    done < <(find "$KAYNAKLAR_DIR" -name "*.pdf" -type f 2>/dev/null)

    if [ "$bozuk" -eq 0 ] && [ "$bos" -eq 0 ]; then
        basari "Tum PDF dosyalari gecerli gorunuyor."
    else
        [ "$bos" -gt 0 ] && hata "$bos bos dosya bulundu."
        [ "$bozuk" -gt 0 ] && hata "$bozuk bozuk dosya bulundu."
    fi

    echo ""
    basari "Dogrulama tamamlandi."
}

# ============================================================================
# orphans: Referans edilmeyen PDF'leri bul
# ============================================================================

sahipsizleri_bul() {
    baslik "Sahipsiz PDF Kontrolu"
    bilgi "Hicbir .md dosyasinda referans edilmeyen PDF'ler araniyor..."
    echo ""

    if [ ! -d "$KAYNAKLAR_DIR" ]; then
        hata "Kaynaklar dizini bulunamadi: $KAYNAKLAR_DIR"
        exit 1
    fi

    local sahipsiz=0
    local toplam=0

    while IFS= read -r dosya; do
        local dosya_adi
        dosya_adi=$(basename "$dosya")
        toplam=$((toplam + 1))

        # Tum .md dosyalarinda bu PDF'e referans var mi?
        local referans_var=false
        while IFS= read -r md_dosya; do
            if grep -qlF "$dosya_adi" "$md_dosya" 2>/dev/null; then
                referans_var=true
                break
            fi
        done < <(find . -name "*.md" -type f 2>/dev/null)

        if [ "$referans_var" = false ]; then
            uyari "  SAHIPSIZ: $dosya_adi"
            sahipsiz=$((sahipsiz + 1))
        fi
    done < <(find "$KAYNAKLAR_DIR" -name "*.pdf" -type f 2>/dev/null)

    echo ""
    if [ "$sahipsiz" -eq 0 ]; then
        basari "Tum PDF dosyalari en az bir .md dosyasinda referans ediliyor."
    else
        uyari "$toplam PDF'den $sahipsiz tanesi hicbir .md dosyasinda referans edilmiyor."
    fi
}

# ============================================================================
# missing: Eksik kaynak etiketlerini tara
# ============================================================================

eksikleri_tara() {
    baslik "Eksik Kaynak Etiketi Taramasi"
    bilgi "[KAYNAK BEKLENIYOR] etiketleri araniyor..."
    echo ""

    local toplam=0

    while IFS= read -r md_dosya; do
        local satirlar
        satirlar=$(grep -n "\[KAYNAK BEKLENIYOR\]" "$md_dosya" 2>/dev/null || true)
        if [ -n "$satirlar" ]; then
            echo -e "${BOLD}$md_dosya:${NC}"
            while IFS= read -r satir; do
                local satir_no
                satir_no=$(echo "$satir" | cut -d: -f1)
                local icerik
                icerik=$(echo "$satir" | cut -d: -f2-)
                uyari "  Satir $satir_no: $icerik"
                toplam=$((toplam + 1))
            done <<< "$satirlar"
            echo ""
        fi
    done < <(find . -name "*.md" -type f 2>/dev/null)

    if [ "$toplam" -eq 0 ]; then
        basari "Hicbir eksik kaynak etiketi bulunamadi."
    else
        echo ""
        hata "Toplam $toplam eksik kaynak etiketi bulundu!"
        bilgi "Bu etiketleri uygun kaynaklar ile degistirin."
    fi
}

# ============================================================================
# stats: Ozet istatistikler
# ============================================================================

istatistikler() {
    baslik "Kaynak Istatistikleri"

    # PDF sayisi
    local pdf_sayisi=0
    if [ -d "$KAYNAKLAR_DIR" ]; then
        pdf_sayisi=$(find "$KAYNAKLAR_DIR" -name "*.pdf" -type f 2>/dev/null | wc -l | tr -d ' ')
    fi

    # Toplam PDF boyutu
    local toplam_boyut="0"
    if [ -d "$KAYNAKLAR_DIR" ] && [ "$pdf_sayisi" -gt 0 ]; then
        toplam_boyut=$(find "$KAYNAKLAR_DIR" -name "*.pdf" -type f -exec du -ch {} + 2>/dev/null | tail -n1 | cut -f1 || echo "0")
    fi

    # Markdown dosya sayisi
    local md_sayisi
    md_sayisi=$(find . -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')

    # Eksik kaynak etiketi sayisi
    local eksik_etiket=0
    while IFS= read -r md_dosya; do
        local sayi
        sayi=$(grep -c "\[KAYNAK BEKLENIYOR\]" "$md_dosya" 2>/dev/null || echo "0")
        eksik_etiket=$((eksik_etiket + sayi))
    done < <(find . -name "*.md" -type f 2>/dev/null)

    # Envanter kayit sayisi
    local envanter_kayit=0
    if [ -f "$ENVANTER_FILE" ]; then
        envanter_kayit=$(grep -cP '\.pdf' "$ENVANTER_FILE" 2>/dev/null || echo "0")
    fi

    echo -e "  ${BOLD}PDF Dosyalari:${NC}           $pdf_sayisi adet"
    echo -e "  ${BOLD}Toplam PDF Boyutu:${NC}       $toplam_boyut"
    echo -e "  ${BOLD}Markdown Dosyalari:${NC}      $md_sayisi adet"
    echo -e "  ${BOLD}Envanter Kayitlari:${NC}      $envanter_kayit adet"
    echo -e "  ${BOLD}Eksik Kaynak Etiketleri:${NC} $eksik_etiket adet"
    echo ""

    if [ "$eksik_etiket" -gt 0 ]; then
        uyari "Tamamlanmamis kaynak referanslari var. 'missing' komutuyla detaylari gorun."
    else
        basari "Tum kaynak referanslari tamamlanmis."
    fi
}

# ============================================================================
# Yardim
# ============================================================================

yardim() {
    echo -e "${BOLD}TezPilot - Kaynak Dogrulama Araci${NC}"
    echo ""
    echo -e "${BOLD}Kullanim:${NC}"
    echo "  ./verify_sources.sh [komut] [envanter_dosyasi]"
    echo ""
    echo -e "${BOLD}Komutlar:${NC}"
    echo "  verify   Tam dogrulama (varsayilan)"
    echo "           - PDF sayimini yapar"
    echo "           - Envanter ile capraz referans kontrolu"
    echo "           - Bos/bozuk PDF tespiti"
    echo ""
    echo "  orphans  Hicbir .md dosyasinda referans edilmeyen PDF'leri bulur"
    echo ""
    echo "  missing  Tum .md dosyalarinda [KAYNAK BEKLENIYOR] etiketlerini tarar"
    echo ""
    echo "  stats    Ozet istatistikleri gosterir"
    echo ""
    echo "  help     Bu yardim mesajini gosterir"
    echo ""
    echo -e "${BOLD}Ortam Degiskenleri:${NC}"
    echo "  KAYNAKLAR_DIR  PDF kaynak dizini (varsayilan: ./kaynaklar)"
    echo ""
    echo -e "${BOLD}Ornekler:${NC}"
    echo "  ./verify_sources.sh                              # Tam dogrulama"
    echo "  ./verify_sources.sh orphans                      # Sahipsiz PDF'ler"
    echo "  ./verify_sources.sh missing                      # Eksik etiketler"
    echo "  ./verify_sources.sh stats                        # Istatistikler"
    echo "  ./verify_sources.sh verify KAYNAKLAR.md          # Ozel envanter dosyasi"
    echo "  KAYNAKLAR_DIR=./refs ./verify_sources.sh verify  # Ozel kaynak dizini"
    echo ""
}

# ============================================================================
# Ana Akis
# ============================================================================

case "$KOMUT" in
    verify)
        dogrula
        ;;
    orphans)
        sahipsizleri_bul
        ;;
    missing)
        eksikleri_tara
        ;;
    stats)
        istatistikler
        ;;
    help | --help | -h)
        yardim
        ;;
    *)
        hata "Bilinmeyen komut: $KOMUT"
        echo ""
        yardim
        exit 1
        ;;
esac
