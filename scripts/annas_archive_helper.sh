#!/bin/bash
# =============================================================================
# TezAtlas — Anna's Archive Helper Script
# Akademik kaynak arama ve indirme yardımcısı
# =============================================================================
#
# Kullanım:
#   ./annas_archive_helper.sh search "arama terimi"
#   ./annas_archive_helper.sh download "URL" "dosya_adi.pdf"
#   ./annas_archive_helper.sh quota
#   ./annas_archive_helper.sh check "dosya_adi"
#
# Gereksinimler: curl, jq (opsiyonel ama önerilir)
# =============================================================================

set -euo pipefail

# Yapılandırma
KAYNAKLAR_DIR="${KAYNAKLAR_DIR:-./kaynaklar}"
DOWNLOAD_TIMEOUT="${DOWNLOAD_TIMEOUT:-120}"
MAX_RESULTS="${MAX_RESULTS:-10}"
USER_AGENT="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"

# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Yardım
show_help() {
    echo -e "${BLUE}TezAtlas — Anna's Archive Helper${NC}"
    echo ""
    echo "Kullanım:"
    echo "  $0 search \"arama terimi\"      Kaynak ara"
    echo "  $0 download \"URL\" \"dosya.pdf\"  URL'den indir"
    echo "  $0 quota                       Günlük kota kontrolü"
    echo "  $0 check \"dosya_adi\"           Kaynaklar klasöründe ara"
    echo "  $0 stats                       Kaynak istatistikleri"
    echo ""
    echo "Ortam Değişkenleri:"
    echo "  KAYNAKLAR_DIR   Kaynaklar klasörü yolu (varsayılan: ./kaynaklar)"
    echo "  MAX_RESULTS     Maksimum arama sonucu (varsayılan: 10)"
}

# Kaynaklar klasörünü kontrol et
check_kaynaklar_dir() {
    if [ ! -d "$KAYNAKLAR_DIR" ]; then
        echo -e "${YELLOW}Uyarı: $KAYNAKLAR_DIR klasörü bulunamadı.${NC}"
        echo -e "Oluşturmak ister misiniz? (e/h)"
        read -r response
        if [ "$response" = "e" ]; then
            mkdir -p "$KAYNAKLAR_DIR"
            echo -e "${GREEN}$KAYNAKLAR_DIR klasörü oluşturuldu.${NC}"
        else
            echo "İşlem iptal edildi."
            exit 1
        fi
    fi
}

# Anna's Archive'da arama
search_source() {
    local query="$1"
    local encoded_query
    encoded_query=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$query'))" 2>/dev/null || echo "$query")

    echo -e "${BLUE}Aranıyor:${NC} $query"
    echo -e "${YELLOW}Not: Anna's Archive erişimi bölgenize göre değişebilir.${NC}"
    echo ""

    # Anna's Archive arama URL'si
    local search_url="https://annas-archive.org/search?q=${encoded_query}&ext=pdf&sort=&lang=&content="

    echo -e "Arama URL'si:"
    echo -e "${GREEN}$search_url${NC}"
    echo ""
    echo -e "Tarayıcıda açmak için: ${BLUE}open \"$search_url\"${NC} (macOS)"
    echo -e "                       ${BLUE}xdg-open \"$search_url\"${NC} (Linux)"
    echo ""

    # Alternatif kaynaklar
    echo -e "${BLUE}Alternatif arama kaynakları:${NC}"
    echo "  - Google Scholar: https://scholar.google.com/scholar?q=${encoded_query}"
    echo "  - Semantic Scholar: https://www.semanticscholar.org/search?q=${encoded_query}"
    echo "  - CORE: https://core.ac.uk/search?q=${encoded_query}"
    echo "  - BASE: https://www.base-search.net/Search/Results?lookfor=${encoded_query}"
    echo "  - Library Genesis: (arama motorunuzda 'libgen' arayın)"
}

# Dosya indirme
download_source() {
    local url="$1"
    local filename="${2:-}"

    check_kaynaklar_dir

    # Dosya adı belirtilmemişse URL'den çıkar
    if [ -z "$filename" ]; then
        filename=$(basename "$url" | sed 's/[?#].*//')
        if [[ ! "$filename" == *.pdf ]]; then
            filename="${filename}.pdf"
        fi
    fi

    # Dosya adını temizle
    filename=$(echo "$filename" | sed 's/[^a-zA-Z0-9._-]/_/g')

    local filepath="$KAYNAKLAR_DIR/$filename"

    # Zaten var mı kontrol et
    if [ -f "$filepath" ]; then
        echo -e "${YELLOW}Bu dosya zaten mevcut: $filepath${NC}"
        echo "Üzerine yazmak ister misiniz? (e/h)"
        read -r response
        if [ "$response" != "e" ]; then
            echo "İndirme iptal edildi."
            return 0
        fi
    fi

    echo -e "${BLUE}İndiriliyor:${NC} $url"
    echo -e "${BLUE}Hedef:${NC} $filepath"
    echo ""

    if curl -L \
        --connect-timeout 30 \
        --max-time "$DOWNLOAD_TIMEOUT" \
        -H "User-Agent: $USER_AGENT" \
        -o "$filepath" \
        "$url"; then

        # PDF mi kontrol et
        if file "$filepath" | grep -q "PDF"; then
            local size
            size=$(du -h "$filepath" | cut -f1)
            echo -e "${GREEN}Başarılı! $filename ($size) indirildi.${NC}"
        else
            echo -e "${RED}Uyarı: İndirilen dosya PDF formatında değil.${NC}"
            echo "Dosya türü: $(file "$filepath")"
            echo "Dosyayı silmek ister misiniz? (e/h)"
            read -r response
            if [ "$response" = "e" ]; then
                rm "$filepath"
                echo "Dosya silindi."
            fi
        fi
    else
        echo -e "${RED}İndirme başarısız. URL'yi kontrol edin.${NC}"
        [ -f "$filepath" ] && rm "$filepath"
    fi
}

# Kaynaklar klasöründe dosya ara
check_source() {
    local search_term="$1"

    check_kaynaklar_dir

    echo -e "${BLUE}Aranan:${NC} $search_term"
    echo -e "${BLUE}Klasör:${NC} $KAYNAKLAR_DIR"
    echo ""

    local count=0
    while IFS= read -r -d '' file; do
        count=$((count + 1))
        local basename_file
        basename_file=$(basename "$file")
        local size
        size=$(du -h "$file" | cut -f1)
        echo -e "  ${GREEN}✓${NC} $basename_file ($size)"
    done < <(find "$KAYNAKLAR_DIR" -iname "*${search_term}*" -print0 2>/dev/null)

    if [ "$count" -eq 0 ]; then
        echo -e "  ${RED}✗ Eşleşen dosya bulunamadı.${NC}"
        echo ""
        echo -e "${YELLOW}Öneriler:${NC}"
        echo "  1. Farklı arama terimleri deneyin"
        echo "  2. $0 search \"$search_term\" ile Anna's Archive'da arayın"
        echo "  3. Google Scholar'da arayın"
    else
        echo ""
        echo -e "${GREEN}$count dosya bulundu.${NC}"
    fi
}

# Kaynak istatistikleri
show_stats() {
    check_kaynaklar_dir

    echo -e "${BLUE}=== Kaynak İstatistikleri ===${NC}"
    echo ""

    # Toplam dosya sayısı
    local total_files
    total_files=$(find "$KAYNAKLAR_DIR" -name "*.pdf" -o -name "*.epub" | wc -l | tr -d ' ')
    echo -e "Toplam dosya: ${GREEN}$total_files${NC}"

    # PDF sayısı
    local pdf_count
    pdf_count=$(find "$KAYNAKLAR_DIR" -name "*.pdf" | wc -l | tr -d ' ')
    echo -e "  PDF: $pdf_count"

    # EPUB sayısı
    local epub_count
    epub_count=$(find "$KAYNAKLAR_DIR" -name "*.epub" | wc -l | tr -d ' ')
    echo -e "  EPUB: $epub_count"

    # Toplam boyut
    local total_size
    total_size=$(du -sh "$KAYNAKLAR_DIR" | cut -f1)
    echo -e "Toplam boyut: ${GREEN}$total_size${NC}"

    # En büyük 5 dosya
    echo ""
    echo -e "${BLUE}En büyük 5 dosya:${NC}"
    find "$KAYNAKLAR_DIR" -type f \( -name "*.pdf" -o -name "*.epub" \) -exec du -h {} \; | sort -rh | head -5 | while read -r size name; do
        echo "  $size  $(basename "$name")"
    done

    # En son eklenen 5 dosya
    echo ""
    echo -e "${BLUE}En son eklenen 5 dosya:${NC}"
    find "$KAYNAKLAR_DIR" -type f \( -name "*.pdf" -o -name "*.epub" \) -newer "$KAYNAKLAR_DIR" -exec ls -lt {} \; 2>/dev/null | head -5 | while read -r _ _ _ _ _ month day time name; do
        echo "  $month $day $time  $(basename "$name")"
    done
}

# Kota kontrolü
check_quota() {
    echo -e "${BLUE}=== Anna's Archive Kota Bilgisi ===${NC}"
    echo ""
    echo "Anna's Archive günlük indirme kotası bölge ve hesap durumuna göre değişir."
    echo ""
    echo "Genel kurallar:"
    echo "  - Ücretsiz: Günde ~5 indirme"
    echo "  - Üyelik: Daha yüksek kota"
    echo "  - Slow download: Kota dolduğunda yavaş indirme seçeneği"
    echo ""
    echo -e "${YELLOW}İpucu:${NC} Kotayı aşmamak için:"
    echo "  1. Önce kaynak listesini hazırlayın"
    echo "  2. Toplu indirme yerine öncelikli olanları seçin"
    echo "  3. Alternatif kaynakları kullanın (Google Scholar, CORE, Semantic Scholar)"
    echo "  4. Üniversite kütüphanesi VPN'ini deneyin (birçok makale ücretsiz erişilebilir)"
}

# Ana akış
case "${1:-help}" in
    search|ara)
        if [ -z "${2:-}" ]; then
            echo -e "${RED}Hata: Arama terimi gerekli.${NC}"
            echo "Kullanım: $0 search \"arama terimi\""
            exit 1
        fi
        search_source "$2"
        ;;
    download|indir)
        if [ -z "${2:-}" ]; then
            echo -e "${RED}Hata: URL gerekli.${NC}"
            echo "Kullanım: $0 download \"URL\" \"dosya_adi.pdf\""
            exit 1
        fi
        download_source "$2" "${3:-}"
        ;;
    check|kontrol)
        if [ -z "${2:-}" ]; then
            echo -e "${RED}Hata: Arama terimi gerekli.${NC}"
            echo "Kullanım: $0 check \"dosya_adi\""
            exit 1
        fi
        check_source "$2"
        ;;
    quota|kota)
        check_quota
        ;;
    stats|istatistik)
        show_stats
        ;;
    help|yardim|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}Bilinmeyen komut: $1${NC}"
        show_help
        exit 1
        ;;
esac
