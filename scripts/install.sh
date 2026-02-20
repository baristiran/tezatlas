#!/bin/bash
set -euo pipefail

# ============================================================================
# TezAtlas - Kurulum Scripti
# ============================================================================

# Renkler
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

# Script dizinini tespit et
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"

# ============================================================================
# Yardimci Fonksiyonlar
# ============================================================================

banner() {
    echo -e "${BLUE}"
    echo '  ________              _____   __  .__                '
    echo '  \__    /____  _______/  _  \_/  |_|  | _____  ______'
    echo '    |    \/ __ \/___  /  /_\  \   __\  | \__  \ \____ \'
    echo '    |    /  ___/ /  _/    |    \  | |  |__/ __ \|  |_> >'
    echo '    |___/ \___  >____\____|__  /__| |____(____  /   __/ '
    echo '              \/             \/               \/|__|     '
    echo -e "${NC}"
    echo -e "${BOLD}  Akademik Tez Yazim Asistani — Skill Graph Mimarisi${NC}"
    echo ""
}

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

onkosullari_kontrol_et() {
    bilgi "Onkosullar kontrol ediliyor..."

    # Bash kontrolu
    if [ -z "${BASH_VERSION:-}" ]; then
        hata "Bash gereklidir. Lutfen bash ile calistirin."
        exit 1
    fi
    basari "Bash bulundu: v${BASH_VERSION}"

    # curl kontrolu
    if ! command -v curl &>/dev/null; then
        hata "curl bulunamadi. Lutfen curl yukleyin."
        exit 1
    fi
    basari "curl bulundu: $(curl --version | head -n1 | cut -d' ' -f1-2)"

    echo ""
}

# ============================================================================
# Kurulum
# ============================================================================

kur() {
    banner
    onkosullari_kontrol_et

    bilgi "TezAtlas kuruluyor..."
    echo ""

    # Claude komutlarini kopyala
    bilgi "Claude komutlari kopyalaniyor..."

    local komut_kaynak="$PROJECT_DIR/.claude/commands"

    if [ ! -d "$komut_kaynak" ]; then
        hata "Komut dosyalari bulunamadi: $komut_kaynak"
        hata "Proje dizininin dogru oldugundan emin olun."
        exit 1
    fi

    # Hedef dizini olustur
    if [ ! -d "$CLAUDE_COMMANDS_DIR" ]; then
        bilgi "~/.claude/commands/ dizini olusturuluyor..."
        mkdir -p "$CLAUDE_COMMANDS_DIR"
    fi

    # Komut dosyalarini kopyala
    local kopyalanan=0
    for dosya in "$komut_kaynak"/*; do
        if [ -f "$dosya" ]; then
            local dosya_adi
            dosya_adi="$(basename "$dosya")"
            cp "$dosya" "$CLAUDE_COMMANDS_DIR/$dosya_adi"
            basari "  Kopyalandi: $dosya_adi"
            kopyalanan=$((kopyalanan + 1))
        fi
    done

    if [ "$kopyalanan" -eq 0 ]; then
        uyari "Kopyalanacak komut dosyasi bulunamadi."
    else
        basari "$kopyalanan komut dosyasi kopyalandi."
    fi
    echo ""

    # Scriptleri calistirilabilir yap
    bilgi "Script dosyalari calistirilabilir yapiliyor..."
    chmod +x "$PROJECT_DIR"/scripts/*.sh
    basari "Tum script dosyalari calistirilabilir."
    echo ""

    # Basari mesaji
    echo -e "${GREEN}============================================================================${NC}"
    echo -e "${GREEN}  TezAtlas basariyla kuruldu!${NC}"
    echo -e "${GREEN}============================================================================${NC}"
    echo ""
    echo -e "  ${BOLD}Kullanim:${NC}"
    echo ""
    echo -e "  ${YELLOW}/tez-baslat${NC}     - Yeni bir tez projesi baslatir (Turkce)"
    echo -e "  ${YELLOW}/thesis-start${NC}   - Start a new thesis project (English)"
    echo ""
    echo -e "  Bu komutlari Claude Code icinde kullanabilirsiniz."
    echo -e "  Daha fazla bilgi icin: ${BLUE}https://github.com/web3alkan/tezatlas${NC}"
    echo ""
    echo -e "  ${BOLD}Yerel LLM Kullanicilari Icin:${NC}"
    echo -e "  TezAtlas platform-agnostiktir. Claude Code disinda:"
    echo -e "  - Ollama + Qwen 2.5 72B veya Llama 3.1 70B (minimum onerilir)"
    echo -e "  - /tez-baslat yerine: 'tez-baslat.md dosyasini oku ve uygula'"
    echo -e "  - Subagent: ayri terminal oturumu veya tmux kullanin"
    echo -e "  - Kucuk context window (<8K): her alt bolumu ayri oturum olarak isleyin"
    echo ""
}

# ============================================================================
# Kaldirma
# ============================================================================

kaldir() {
    banner

    bilgi "TezAtlas kaldiriliyor..."
    echo ""

    local komut_kaynak="$PROJECT_DIR/.claude/commands"
    local kaldirilan=0

    if [ -d "$komut_kaynak" ]; then
        for dosya in "$komut_kaynak"/*; do
            if [ -f "$dosya" ]; then
                local dosya_adi
                dosya_adi="$(basename "$dosya")"
                local hedef="$CLAUDE_COMMANDS_DIR/$dosya_adi"
                if [ -f "$hedef" ]; then
                    rm "$hedef"
                    basari "  Silindi: $dosya_adi"
                    kaldirilan=$((kaldirilan + 1))
                else
                    uyari "  Bulunamadi (atlaniyor): $dosya_adi"
                fi
            fi
        done
    fi

    if [ "$kaldirilan" -eq 0 ]; then
        uyari "Kaldirilacak komut dosyasi bulunamadi."
    else
        basari "$kaldirilan komut dosyasi kaldirildi."
    fi

    # Bos kalan dizini temizle
    if [ -d "$CLAUDE_COMMANDS_DIR" ] && [ -z "$(ls -A "$CLAUDE_COMMANDS_DIR" 2>/dev/null)" ]; then
        rmdir "$CLAUDE_COMMANDS_DIR"
        bilgi "Bos ~/.claude/commands/ dizini silindi."
    fi

    echo ""
    echo -e "${GREEN}TezAtlas basariyla kaldirildi.${NC}"
    echo ""
}

# ============================================================================
# Yardim
# ============================================================================

yardim() {
    banner

    echo -e "${BOLD}Kullanim:${NC}"
    echo "  ./install.sh              TezAtlas'i kurar"
    echo "  ./install.sh --uninstall  TezAtlas'i kaldirir"
    echo "  ./install.sh --help       Bu yardim mesajini gosterir"
    echo ""
    echo -e "${BOLD}Aciklama:${NC}"
    echo "  Bu script, TezAtlas Claude komutlarini ~/.claude/commands/"
    echo "  dizinine kopyalar ve script dosyalarini calistirilabilir yapar."
    echo ""
    echo -e "${BOLD}Kurulumdan sonra:${NC}"
    echo "  Claude Code icinde asagidaki komutlari kullanabilirsiniz:"
    echo ""
    echo "  /tez-baslat     - Yeni bir tez projesi baslatir (Turkce)"
    echo "  /thesis-start   - Start a new thesis project (English)"
    echo ""
}

# ============================================================================
# Ana Akis
# ============================================================================

case "${1:-}" in
    --uninstall)
        kaldir
        ;;
    --help | -h)
        yardim
        ;;
    *)
        kur
        ;;
esac
