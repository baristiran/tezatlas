#!/bin/bash
set -euo pipefail

# ============================================================================
# TezAtlas - Pandoc Disari Aktarma Yardimcisi
# ============================================================================

# Renkler
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

# Varsayilan degerler
FORMAT="docx"
UNIVERSITY=""
INPUT=""
OUTPUT=""
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATES_DIR="$PROJECT_DIR/templates/universities"

# ============================================================================
# Yardimci Fonksiyonlar
# ============================================================================

bilgi() {
    echo -e "${BLUE}[BILGI]${NC} $1"
}

basari() {
    echo -e "${GREEN}[BASARILI]${NC} $1"
}

uyari() {
    echo -e "${YELLOW}[UYARI]${NC} $1"
}

hata() {
    echo -e "${RED}[HATA]${NC} $1"
}

# ============================================================================
# Onkosul Kontrolleri
# ============================================================================

pandoc_kontrol() {
    if ! command -v pandoc &>/dev/null; then
        hata "pandoc bulunamadi!"
        echo ""
        bilgi "Pandoc kurulumu:"
        echo "  macOS:   brew install pandoc"
        echo "  Ubuntu:  sudo apt install pandoc"
        echo "  Windows: choco install pandoc"
        echo "  Genel:   https://pandoc.org/installing.html"
        echo ""
        exit 1
    fi
    bilgi "pandoc bulundu: $(pandoc --version | head -n1)"
}

# ============================================================================
# Arguman Ayristirma
# ============================================================================

argumanlari_ayristir() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --format)
                FORMAT="${2:-}"
                if [[ ! "$FORMAT" =~ ^(docx|pdf|latex)$ ]]; then
                    hata "Gecersiz format: $FORMAT"
                    hata "Desteklenen formatlar: docx, pdf, latex"
                    exit 1
                fi
                shift 2
                ;;
            --university)
                UNIVERSITY="${2:-}"
                if [ -z "$UNIVERSITY" ]; then
                    hata "--university parametresi bir universite kodu gerektirir."
                    exit 1
                fi
                shift 2
                ;;
            --input)
                INPUT="${2:-}"
                if [ -z "$INPUT" ]; then
                    hata "--input parametresi bir dosya veya dizin gerektirir."
                    exit 1
                fi
                shift 2
                ;;
            --output)
                OUTPUT="${2:-}"
                if [ -z "$OUTPUT" ]; then
                    hata "--output parametresi bir dosya adi gerektirir."
                    exit 1
                fi
                shift 2
                ;;
            --help | -h)
                yardim
                exit 0
                ;;
            *)
                hata "Bilinmeyen parametre: $1"
                echo ""
                yardim
                exit 1
                ;;
        esac
    done
}

# ============================================================================
# YAML Sablondan Pandoc Argumanlarini Olustur
# ============================================================================

yaml_deger_oku() {
    local dosya="$1"
    local anahtar="$2"
    # Basit YAML okuyucu (ic ice olmayan degerler icin)
    grep -E "^\s*${anahtar}:" "$dosya" 2>/dev/null | head -n1 | sed "s/.*${anahtar}:\s*//" | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/" | tr -d '\r'
}

universite_argumanlarini_olustur() {
    local uni_kodu="$1"
    local yaml_dosya="$TEMPLATES_DIR/${uni_kodu}.yaml"
    local pandoc_args=()

    if [ ! -f "$yaml_dosya" ]; then
        hata "Universite sablonu bulunamadi: $yaml_dosya"
        echo ""
        bilgi "Mevcut sablonlar:"
        if [ -d "$TEMPLATES_DIR" ]; then
            for sablon in "$TEMPLATES_DIR"/*.yaml; do
                if [ -f "$sablon" ]; then
                    local sablon_adi
                    sablon_adi=$(basename "$sablon" .yaml)
                    echo "  - $sablon_adi"
                fi
            done
        else
            uyari "  Sablon dizini bulunamadi: $TEMPLATES_DIR"
        fi
        exit 1
    fi

    bilgi "Universite sablonu yukleniyor: $yaml_dosya"

    # Sayfa kenar bosluklari
    local ust_kenar
    ust_kenar=$(yaml_deger_oku "$yaml_dosya" "ust")
    local alt_kenar
    alt_kenar=$(yaml_deger_oku "$yaml_dosya" "alt")
    local sol_kenar
    sol_kenar=$(yaml_deger_oku "$yaml_dosya" "sol")
    local sag_kenar
    sag_kenar=$(yaml_deger_oku "$yaml_dosya" "sag")

    [ -n "$ust_kenar" ] && pandoc_args+=("-V" "margin-top=${ust_kenar}")
    [ -n "$alt_kenar" ] && pandoc_args+=("-V" "margin-bottom=${alt_kenar}")
    [ -n "$sol_kenar" ] && pandoc_args+=("-V" "margin-left=${sol_kenar}")
    [ -n "$sag_kenar" ] && pandoc_args+=("-V" "margin-right=${sag_kenar}")

    # Yazi tipi
    local yazi_tipi
    yazi_tipi=$(yaml_deger_oku "$yaml_dosya" "adi")  # yazi_tipi.adi
    local yazi_boyutu
    yazi_boyutu=$(yaml_deger_oku "$yaml_dosya" "boyut")  # yazi_tipi.boyut

    # Ust seviye yazi_tipi alani da kontrol et
    if [ -z "$yazi_tipi" ]; then
        yazi_tipi=$(yaml_deger_oku "$yaml_dosya" "yazi_tipi")
    fi

    [ -n "$yazi_tipi" ] && pandoc_args+=("-V" "mainfont=${yazi_tipi}")
    [ -n "$yazi_boyutu" ] && pandoc_args+=("-V" "fontsize=${yazi_boyutu}")

    # Satir araligi
    local satir_araligi
    satir_araligi=$(yaml_deger_oku "$yaml_dosya" "satir_araligi")
    [ -n "$satir_araligi" ] && pandoc_args+=("-V" "linestretch=${satir_araligi}")

    if [ ${#pandoc_args[@]} -gt 0 ]; then
        basari "Sablon ayarlari yuklendi."
        echo "${pandoc_args[@]}"
    fi
}

# ============================================================================
# Metadata Yorumlarini Temizle
# ============================================================================

metadata_temizle() {
    local girdi="$1"
    # <!-- ... --> bloklarini kaldir (cok satirli dahil)
    sed '/<!--/,/-->/d' "$girdi"
}

# ============================================================================
# Disari Aktarma
# ============================================================================

disari_aktar() {
    pandoc_kontrol
    echo ""

    # Girdi kontrolu
    if [ -z "$INPUT" ]; then
        hata "Girdi dosyasi veya dizini belirtilmedi."
        hata "Kullanim: ./export.sh --input <dosya_veya_dizin>"
        exit 1
    fi

    if [ ! -e "$INPUT" ]; then
        hata "Girdi bulunamadi: $INPUT"
        exit 1
    fi

    # Cikti dosya adini belirle
    if [ -z "$OUTPUT" ]; then
        local uzanti="$FORMAT"
        [ "$FORMAT" = "latex" ] && uzanti="tex"
        OUTPUT="tez_cikti.${uzanti}"
    fi

    # Gecici dosya
    local gecici_dosya
    gecici_dosya=$(mktemp /tmp/tezatlas_export_XXXXXX.md)
    trap "rm -f '$gecici_dosya'" EXIT

    # Girdiyi hazirla
    if [ -d "$INPUT" ]; then
        bilgi "Dizin isleniyor: $INPUT"
        bilgi "Markdown dosyalari birlestiriliyor..."

        local dosya_sayisi=0
        # Dosyalari sirayla birlestir
        while IFS= read -r md_dosya; do
            bilgi "  Ekleniyor: $(basename "$md_dosya")"
            metadata_temizle "$md_dosya" >> "$gecici_dosya"
            echo -e "\n\n" >> "$gecici_dosya"
            dosya_sayisi=$((dosya_sayisi + 1))
        done < <(find "$INPUT" -name "*.md" -type f | sort)

        if [ "$dosya_sayisi" -eq 0 ]; then
            hata "Dizinde .md dosyasi bulunamadi: $INPUT"
            exit 1
        fi
        basari "$dosya_sayisi dosya birlestirildi."
    else
        bilgi "Dosya isleniyor: $INPUT"
        metadata_temizle "$INPUT" > "$gecici_dosya"
    fi
    echo ""

    # Pandoc argumanlarini olustur
    local pandoc_cmd=("pandoc" "$gecici_dosya" "-o" "$OUTPUT")

    # Format ayarlari
    case "$FORMAT" in
        docx)
            pandoc_cmd+=("--to" "docx")
            ;;
        pdf)
            pandoc_cmd+=("--to" "pdf" "--pdf-engine=xelatex")
            ;;
        latex)
            pandoc_cmd+=("--to" "latex" "--standalone")
            ;;
    esac

    # Universite sablonu
    if [ -n "$UNIVERSITY" ]; then
        local uni_args
        uni_args=$(universite_argumanlarini_olustur "$UNIVERSITY")
        if [ -n "$uni_args" ]; then
            # shellcheck disable=SC2206
            pandoc_cmd+=($uni_args)
        fi
    fi

    # Disari aktar
    bilgi "Donusturuluyor: $FORMAT formatina..."
    bilgi "Komut: ${pandoc_cmd[*]}"
    echo ""

    if "${pandoc_cmd[@]}"; then
        echo ""
        basari "Disari aktarma tamamlandi!"
        basari "Cikti dosyasi: $OUTPUT"
        if command -v du &>/dev/null; then
            local boyut
            boyut=$(du -h "$OUTPUT" | cut -f1)
            bilgi "Dosya boyutu: $boyut"
        fi
    else
        echo ""
        hata "Donusturme basarisiz oldu!"
        hata "Pandoc hata mesajini kontrol edin."
        exit 1
    fi
}

# ============================================================================
# Yardim
# ============================================================================

yardim() {
    echo -e "${BOLD}TezAtlas - Pandoc Disari Aktarma Yardimcisi${NC}"
    echo ""
    echo -e "${BOLD}Kullanim:${NC}"
    echo "  ./export.sh [secenekler]"
    echo ""
    echo -e "${BOLD}Secenekler:${NC}"
    echo "  --format <format>        Cikti formati: docx, pdf, latex (varsayilan: docx)"
    echo "  --university <kod>       Universite sablonu kodu (ornek: itu, ytu, hacettepe)"
    echo "  --input <yol>            Girdi dosyasi veya dizini"
    echo "  --output <dosya>         Cikti dosya adi (varsayilan: tez_cikti.<format>)"
    echo "  --help, -h               Bu yardim mesajini gosterir"
    echo ""
    echo -e "${BOLD}Format Aciklamalari:${NC}"
    echo "  docx     Microsoft Word formati (varsayilan)"
    echo "  pdf      PDF formati (xelatex gerektirir)"
    echo "  latex    LaTeX kaynak dosyasi"
    echo ""
    echo -e "${BOLD}Ornekler:${NC}"
    echo ""
    echo "  # Tek bir dosyayi DOCX'e donustur"
    echo "  ./export.sh --input bolumler/giris.md --output giris.docx"
    echo ""
    echo "  # Bir dizindeki tum .md dosyalarini birlestirip PDF yap"
    echo "  ./export.sh --format pdf --input bolumler/ --output tez.pdf"
    echo ""
    echo "  # ITU sablonuyla LaTeX ciktisi al"
    echo "  ./export.sh --format latex --university itu --input bolumler/"
    echo ""
    echo "  # YTU sablonuyla DOCX ciktisi al"
    echo "  ./export.sh --university ytu --input tez.md --output tez_ytu.docx"
    echo ""
    echo -e "${BOLD}Universite Sablonlari:${NC}"
    echo "  Sablonlar templates/universities/ dizininde YAML formatinda saklanir."
    echo "  Her sablon sayfa kenar bosluklari, yazi tipi ve diger"
    echo "  bicimlendirme bilgilerini icerir."
    echo ""
    echo -e "${BOLD}Notlar:${NC}"
    echo "  - PDF ciktisi icin xelatex kurulu olmalidir"
    echo "  - Dizin girdisinde dosyalar ada gore siralanir"
    echo "  - <!-- --> yorum bloklari otomatik olarak temizlenir"
    echo ""
}

# ============================================================================
# Ana Akis
# ============================================================================

if [ $# -eq 0 ]; then
    yardim
    exit 0
fi

argumanlari_ayristir "$@"
disari_aktar
