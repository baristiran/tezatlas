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

# API Anahtarı Yükleme
# Öncelik sırası:
#   1. Ortam değişkeni: ANNAS_ARCHIVE_API_KEY
#   2. Proje yapılandırma dosyası: .tezatlas/config (git tarafından yoksayılır)
#   3. Global yapılandırma: ~/.tezatlas_config
ANNAS_API_KEY="${ANNAS_ARCHIVE_API_KEY:-}"

if [ -z "$ANNAS_API_KEY" ] && [ -f ".tezatlas/config" ]; then
    ANNAS_API_KEY=$(grep -E "^ANNAS_ARCHIVE_API_KEY=" ".tezatlas/config" 2>/dev/null | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)
fi

if [ -z "$ANNAS_API_KEY" ] && [ -f "$HOME/.tezatlas_config" ]; then
    ANNAS_API_KEY=$(grep -E "^ANNAS_ARCHIVE_API_KEY=" "$HOME/.tezatlas_config" 2>/dev/null | cut -d'=' -f2- | tr -d '"' | tr -d "'" || true)
fi

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
    echo "  KAYNAKLAR_DIR         Kaynaklar klasörü yolu (varsayılan: ./kaynaklar)"
    echo "  MAX_RESULTS           Maksimum arama sonucu (varsayılan: 10)"
    echo "  ANNAS_ARCHIVE_API_KEY Anna's Archive API anahtarı (isteğe bağlı)"
    echo ""
    echo "API Anahtarı Yapılandırma (tercih sırası):"
    echo "  1. Ortam değişkeni:   export ANNAS_ARCHIVE_API_KEY=\"anahtariniz\""
    echo "  2. Proje config:      .tezatlas/config dosyasına ANNAS_ARCHIVE_API_KEY=xxx"
    echo "  3. Global config:     ~/.tezatlas_config dosyasına ANNAS_ARCHIVE_API_KEY=xxx"
    echo ""
    echo "  Hızlı kurulum: $0 setup-api-key"
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

# Anna's Archive API ile doğrudan indirme (MD5 hash ile)
download_by_md5() {
    local md5="$1"
    local filename="${2:-}"

    if [ -z "$ANNAS_API_KEY" ]; then
        echo -e "${YELLOW}API anahtarı bulunamadı. Tarayıcı indirmesine yönlendiriliyor...${NC}"
        echo ""
        echo -e "Tarayıcıda açın: ${GREEN}https://annas-archive.org/md5/${md5}${NC}"
        echo ""
        echo -e "${YELLOW}API anahtarı eklemek için:${NC} $0 setup-api-key"
        return 1
    fi

    check_kaynaklar_dir

    if [ -z "$filename" ]; then
        filename="${md5}.pdf"
    fi

    filename=$(echo "$filename" | sed 's/[^a-zA-Z0-9._-]/_/g')
    local filepath="$KAYNAKLAR_DIR/$filename"

    if [ -f "$filepath" ]; then
        echo -e "${YELLOW}Bu dosya zaten mevcut: $filepath${NC}"
        echo "Üzerine yazmak ister misiniz? (e/h)"
        read -r response
        if [ "$response" != "e" ]; then
            echo "İndirme iptal edildi."
            return 0
        fi
    fi

    echo -e "${BLUE}MD5 ile indiriliyor:${NC} $md5"
    echo -e "${BLUE}Hedef:${NC} $filepath"
    echo ""

    # Anna's Archive API endpoint (hesap gerektirir)
    local api_url="https://annas-archive.org/dyn/api/fast_download.json?md5=${md5}&key=${ANNAS_API_KEY}"

    local download_url
    download_url=$(curl -s \
        -H "User-Agent: $USER_AGENT" \
        "$api_url" 2>/dev/null | \
        python3 -c "import sys, json; d=json.load(sys.stdin); print(d.get('download_url', ''))" 2>/dev/null || echo "")

    if [ -z "$download_url" ]; then
        echo -e "${RED}API yanıtı alınamadı veya indirme URL'si bulunamadı.${NC}"
        echo -e "Tarayıcıda deneyin: ${GREEN}https://annas-archive.org/md5/${md5}${NC}"
        return 1
    fi

    if curl -L \
        --connect-timeout 30 \
        --max-time "$DOWNLOAD_TIMEOUT" \
        -H "User-Agent: $USER_AGENT" \
        -o "$filepath" \
        "$download_url"; then
        if file "$filepath" 2>/dev/null | grep -q "PDF"; then
            local size
            size=$(du -h "$filepath" | cut -f1)
            echo -e "${GREEN}Başarılı! $filename ($size) /kaynaklar/'a indirildi.${NC}"
        else
            echo -e "${RED}Uyarı: İndirilen dosya PDF değil.${NC}"
            rm -f "$filepath"
            return 1
        fi
    else
        echo -e "${RED}İndirme başarısız.${NC}"
        echo -e "Tarayıcıda deneyin: ${GREEN}https://annas-archive.org/md5/${md5}${NC}"
        rm -f "$filepath"
        return 1
    fi
}

# API anahtarı kurulum asistanı
setup_api_key() {
    echo -e "${BLUE}=== Anna's Archive API Anahtarı Kurulumu ===${NC}"
    echo ""
    echo "API anahtarınızı nereye kaydetmek istiyorsunuz?"
    echo "  1) Sadece bu proje (.tezatlas/config — git tarafından yoksayılır, ÖNERİLİR)"
    echo "  2) Tüm projeler için (~/.tezatlas_config — global)"
    echo "  3) İptal"
    echo ""
    read -r -p "Seçin (1/2/3): " choice

    if [ "$choice" = "3" ]; then
        echo "İptal edildi."
        return 0
    fi

    echo ""
    read -r -p "API anahtarınızı girin: " api_key

    if [ -z "$api_key" ]; then
        echo -e "${RED}Hata: Boş anahtar kabul edilmez.${NC}"
        return 1
    fi

    if [ "$choice" = "1" ]; then
        mkdir -p ".tezatlas"
        echo "ANNAS_ARCHIVE_API_KEY=${api_key}" > ".tezatlas/config"
        # .gitignore'a ekle
        if [ -f ".gitignore" ]; then
            if ! grep -q "^\.tezatlas/config" ".gitignore"; then
                echo ".tezatlas/config" >> ".gitignore"
            fi
        fi
        echo -e "${GREEN}API anahtarı .tezatlas/config dosyasına kaydedildi.${NC}"
        echo -e "${GREEN}.gitignore'a eklendi (hassas veri Git'e gitmeyecek).${NC}"
    elif [ "$choice" = "2" ]; then
        echo "ANNAS_ARCHIVE_API_KEY=${api_key}" > "$HOME/.tezatlas_config"
        chmod 600 "$HOME/.tezatlas_config"
        echo -e "${GREEN}API anahtarı ~/.tezatlas_config dosyasına kaydedildi (600 izni).${NC}"
    fi

    echo ""
    echo -e "${YELLOW}Not: API anahtarınızı asla Git'e commit etmeyin!${NC}"
}

# Dosya indirme (URL ile)
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

    # API anahtarı varsa header olarak ekle
    local auth_header=""
    if [ -n "$ANNAS_API_KEY" ]; then
        auth_header="-H \"X-AA-Key: $ANNAS_API_KEY\""
    fi

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
    md5)
        if [ -z "${2:-}" ]; then
            echo -e "${RED}Hata: MD5 hash gerekli.${NC}"
            echo "Kullanım: $0 md5 MD5_HASH dosya_adi.pdf"
            exit 1
        fi
        download_by_md5 "$2" "${3:-}"
        ;;
    setup-api-key|api-kur)
        setup_api_key
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
