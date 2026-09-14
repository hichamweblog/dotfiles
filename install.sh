#!/usr/bin/env bash
# ==============================================================================
#  My Dotfiles - One-Click Bootstrap & Installation Script
#  https://github.com/hichamweblog/dotfiles
# ==============================================================================
#  Supports: Fedora/RHEL/CentOS, Ubuntu/Debian/Pop!_OS, Arch/Manjaro, macOS
# ==============================================================================

set -eo pipefail

# --- Color Definitions ---
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# --- Script Settings & State ---
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/backup_$(date +%Y%m%d_%H%M%S)"
HAS_BACKUPS=false

NON_INTERACTIVE=false
STOW_ONLY=false
SKIP_PACKAGES=false
SKIP_FONTS=false
DRY_RUN=false

# Packages managed by GNU Stow in this repository
STOW_PACKAGES=("zsh" "git" "tmux" "config" "wezterm" "ranger")

# --- UI Helpers ---
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_step() {
    echo -e "\n${BOLD}${CYAN}==>${NC} ${BOLD}$1${NC}"
}

log_success() {
    echo -e "${GREEN}[✔]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_banner() {
    echo -e "${MAGENTA}${BOLD}"
    cat << 'EOF'
  __  __         _____        _    __ _ _           
 |  \/  |       |  __ \      | |  / _(_) |          
 | \  / |_   _  | |  | | ___ | |_| |_ _| | ___  ___ 
 | |\/| | | | | | |  | |/ _ \| __|  _| | |/ _ \/ __|
 | |  | | |_| | | |__| | (_) | |_| | | | |  __/\__ \
 |_|  |_|\__, | |_____/ \___/ \__|_| |_|_|\___||___/
          __/ |                                     
         |___/                                      
EOF
    echo -e "${NC}"
    echo -e "${CYAN}Dotfiles One-Click Bootstrap & Automated Installer${NC}"
    echo -e "Repository: ${BOLD}$DOTFILES_DIR${NC}"
    echo -e "Target:     ${BOLD}$HOME${NC}\n"
}

print_help() {
    echo "Usage: ./install.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -y, --yes              Non-interactive mode (assume yes to all prompts)"
    echo "  --stow-only            Only back up conflicts and stow symlinks (skip system packages & tools)"
    echo "  --skip-packages        Skip system package manager installs (dnf/apt/pacman/brew)"
    echo "  --skip-fonts           Skip downloading JetBrains Mono Nerd Font"
    echo "  --dry-run              Simulate actions without modifying files or running commands"
    echo "  -h, --help             Display this help message"
    echo ""
}

# --- Parse Arguments ---
while [[ $# -gt 0 ]]; do
    case "$1" in
        -y|--yes)
            NON_INTERACTIVE=true
            shift
            ;;
        --stow-only)
            STOW_ONLY=true
            shift
            ;;
        --skip-packages)
            SKIP_PACKAGES=true
            shift
            ;;
        --skip-fonts)
            SKIP_FONTS=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        -h|--help)
            print_help
            exit 0
            ;;
        *)
            log_error "Unknown option: $1"
            print_help
            exit 1
            ;;
    esac
done

# --- 1. System & Package Manager Detection ---
detect_os() {
    log_step "1. Detecting Operating System & Environment"

    OS_NAME="unknown"
    PKG_MGR="unknown"
    ARCH="$(uname -m)"

    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS_NAME="macOS"
        PKG_MGR="brew"
    elif [ -f /etc/os-release ]; then
        . /etc/os-release
        OS_NAME="$NAME"
        case "$ID" in
            fedora|rhel|centos|rocky|alma)
                PKG_MGR="dnf"
                ;;
            ubuntu|debian|pop|linuxmint|elementary)
                PKG_MGR="apt"
                ;;
            arch|manjaro|endeavouros|artix)
                PKG_MGR="pacman"
                ;;
            opensuse*|sles)
                PKG_MGR="zypper"
                ;;
            *)
                if command -v dnf &>/dev/null; then PKG_MGR="dnf";
                elif command -v apt-get &>/dev/null; then PKG_MGR="apt";
                elif command -v pacman &>/dev/null; then PKG_MGR="pacman";
                fi
                ;;
        esac
    fi

    log_success "Operating System: ${BOLD}$OS_NAME${NC} ($ARCH)"
    log_success "Package Manager:  ${BOLD}$PKG_MGR${NC}"

    if [ "$PKG_MGR" = "unknown" ] && [ "$SKIP_PACKAGES" = false ] && [ "$STOW_ONLY" = false ]; then
        log_warn "Could not identify supported package manager. Skipping system package installation."
        SKIP_PACKAGES=true
    fi
}

# --- 2. Install System Prerequisites ---
install_system_packages() {
    if [ "$STOW_ONLY" = true ] || [ "$SKIP_PACKAGES" = true ]; then
        log_info "Skipping system package installation as requested."
        return 0
    fi

    log_step "2. Installing Base System Packages"

    local SUDO=""
    if [ "$(id -u)" -ne 0 ]; then
        if command -v sudo &>/dev/null; then
            SUDO="sudo"
        else
            log_error "This step requires root privileges. Please install sudo or run as root."
            exit 1
        fi
    fi

    if [ "$DRY_RUN" = true ]; then
        log_info "[DRY-RUN] Would install packages using $PKG_MGR"
        return 0
    fi

    case "$PKG_MGR" in
        dnf)
            log_info "Updating dnf cache and installing packages..."
            $SUDO dnf install -y \
                curl wget git stow zsh tmux gcc gcc-c++ make unzip \
                ranger w3m highlight atool mediainfo poppler-utils \
                jq ripgrep fd-find
            ;;
        apt)
            log_info "Updating apt cache and installing packages..."
            $SUDO apt-get update -y
            $SUDO apt-get install -y \
                curl wget git stow zsh tmux build-essential unzip \
                ranger w3m highlight atool mediainfo poppler-utils \
                jq ripgrep fd-find
            ;;
        pacman)
            log_info "Updating pacman mirrors and installing packages..."
            $SUDO pacman -Sy --needed --noconfirm \
                curl wget git stow zsh tmux base-devel unzip \
                ranger w3m highlight atool mediainfo poppler \
                jq ripgrep fd
            ;;
        brew)
            log_info "Installing packages with Homebrew..."
            brew install git stow zsh tmux wget ranger jq ripgrep fd eza bat zoxide fzf
            ;;
        zypper)
            log_info "Installing packages with zypper..."
            $SUDO zypper install -y \
                curl wget git stow zsh tmux gcc gcc-c++ make unzip \
                ranger jq ripgrep fd
            ;;
    esac

    log_success "System prerequisites installed successfully"
}

# --- 3. Backup Conflicts & Existing Configs ---
backup_target() {
    local target="$1"
    local full_path="$HOME/$target"

    if [ ! -e "$full_path" ] && [ ! -L "$full_path" ]; then
        return 0
    fi

    # Check if target is already a symlink pointing inside our dotfiles repository
    if [ -L "$full_path" ]; then
        local link_dest
        link_dest="$(readlink -f "$full_path" || true)"
        if [[ "$link_dest" == "$DOTFILES_DIR"* ]]; then
            log_info "Symlink for $target already points to dotfiles ($link_dest). No backup needed."
            return 0
        fi
    fi

    # Target is a real file or external link, backup safely
    if [ "$DRY_RUN" = true ]; then
        log_info "[DRY-RUN] Would backup $full_path to $BACKUP_DIR/$target"
        return 0
    fi

    mkdir -p "$BACKUP_DIR/$(dirname "$target")"
    mv "$full_path" "$BACKUP_DIR/$target"
    HAS_BACKUPS=true
    log_warn "Backed up existing: $target -> $BACKUP_DIR/$target"
}

backup_conflicts() {
    log_step "3. Backing Up Existing Dotfiles to Prevent Stow Collisions"

    backup_target ".zshrc"
    backup_target ".gitconfig"
    backup_target ".gitignore_global"
    backup_target ".tmux.conf"
    backup_target ".config/nvim"
    backup_target ".config/starship.toml"
    backup_target ".config/wezterm"
    backup_target ".config/ranger"

    if [ "$HAS_BACKUPS" = true ]; then
        log_success "All conflicting files safely archived in: ${BOLD}$BACKUP_DIR${NC}"
    else
        log_success "No conflicting dotfiles found. Clean workspace ready for Stow!"
    fi
}

# --- 4. Deploy with GNU Stow ---
stow_dotfiles() {
    log_step "4. Deploying Dotfiles with GNU Stow"

    if ! command -v stow &>/dev/null; then
        log_error "GNU Stow is not installed. Cannot deploy dotfiles."
        exit 1
    fi

    mkdir -p "$HOME/.config"

    for pkg in "${STOW_PACKAGES[@]}"; do
        if [ ! -d "$DOTFILES_DIR/$pkg" ]; then
            log_warn "Package directory $pkg does not exist in $DOTFILES_DIR. Skipping."
            continue
        fi

        log_info "Stowing package: ${BOLD}$pkg${NC}..."
        if [ "$DRY_RUN" = true ]; then
            stow -d "$DOTFILES_DIR" -t "$HOME" -n -v "$pkg"
        else
            stow -d "$DOTFILES_DIR" -t "$HOME" -R "$pkg"
            log_success "Stowed $pkg"
        fi
    done
}

# --- 5. Oh-My-Zsh & Zsh Plugins ---
setup_zsh() {
    if [ "$STOW_ONLY" = true ]; then return 0; fi

    log_step "5. Setting Up Oh-My-Zsh & Custom Plugins"

    if [ "$DRY_RUN" = true ]; then
        log_info "[DRY-RUN] Would install Oh-My-Zsh and plugins"
        return 0
    fi

    # Install Oh-My-Zsh if not already present
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        log_info "Installing Oh-My-Zsh (unattended)..."
        RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        # Oh-My-Zsh may create a default .zshrc; re-stow our dotfile .zshrc
        stow -d "$DOTFILES_DIR" -t "$HOME" -R zsh
        log_success "Oh-My-Zsh installed"
    else
        log_info "Oh-My-Zsh already installed"
    fi

    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    mkdir -p "$ZSH_CUSTOM/plugins"

    # Clone zsh plugins if missing
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        log_info "Cloning zsh-autosuggestions..."
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        log_info "Cloning zsh-syntax-highlighting..."
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi

    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-completions" ]; then
        log_info "Cloning zsh-completions..."
        git clone --depth=1 https://github.com/zsh-users/zsh-completions "$ZSH_CUSTOM/plugins/zsh-completions"
    fi

    log_success "Zsh plugins ready"
}

# --- 6. Neovim Version Check & Release Installer ---
setup_neovim() {
    if [ "$STOW_ONLY" = true ]; then return 0; fi

    log_step "6. Checking Neovim Installation (0.10+)"

    local need_install=true
    if command -v nvim &>/dev/null; then
        local nvim_ver
        nvim_ver="$(nvim --version | head -n 1 | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -n 1)"
        log_info "Found existing Neovim: v$nvim_ver"

        # Compare version: requires 0.10.0+
        local major minor
        major=$(echo "$nvim_ver" | cut -d. -f1)
        minor=$(echo "$nvim_ver" | cut -d. -f2)
        if [ "$major" -gt 0 ] || [ "$minor" -ge 10 ]; then
            log_success "Neovim version v$nvim_ver satisfies requirements (>= 0.10)"
            need_install=false
        else
            log_warn "Existing Neovim is older than 0.10.0. Installing modern standalone build..."
        fi
    else
        log_info "Neovim not found. Installing latest official build..."
    fi

    if [ "$need_install" = true ]; then
        if [ "$DRY_RUN" = true ]; then
            log_info "[DRY-RUN] Would download and install Neovim into ~/.local/bin"
            return 0
        fi

        mkdir -p "$HOME/.local/bin"
        local ARCH="$(uname -m)"
        local TARBALL_URL=""

        if [[ "$OSTYPE" == "darwin"* ]]; then
            TARBALL_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-macos-arm64.tar.gz"
            if [ "$ARCH" = "x86_64" ]; then
                TARBALL_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-macos-x86_64.tar.gz"
            fi
        else
            TARBALL_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
            if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
                TARBALL_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz"
            fi
        fi

        log_info "Downloading Neovim from: $TARBALL_URL..."
        local TMP_DIR
        TMP_DIR=$(mktemp -d)
        curl -fSL "$TARBALL_URL" -o "$TMP_DIR/nvim.tar.gz"
        tar -xzf "$TMP_DIR/nvim.tar.gz" -C "$HOME/.local/bin"
        
        # Link binary
        local EXTRACTED_DIR
        EXTRACTED_DIR="$(find "$HOME/.local/bin" -maxdepth 1 -type d -name "nvim-*" | head -n 1)"
        if [ -n "$EXTRACTED_DIR" ] && [ -x "$EXTRACTED_DIR/bin/nvim" ]; then
            ln -sf "$EXTRACTED_DIR/bin/nvim" "$HOME/.local/bin/nvim"
        fi
        rm -rf "$TMP_DIR"
        log_success "Neovim installed to ~/.local/bin/nvim ($($HOME/.local/bin/nvim --version | head -n 1))"
    fi
}

# --- 7. Tmux Plugin Manager (TPM) ---
setup_tmux_tpm() {
    if [ "$STOW_ONLY" = true ]; then return 0; fi

    log_step "7. Setting Up Tmux Plugin Manager (TPM)"

    if [ "$DRY_RUN" = true ]; then
        log_info "[DRY-RUN] Would clone TPM into ~/.tmux/plugins/tpm"
        return 0
    fi

    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        log_info "Cloning TPM..."
        git clone --depth=1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
        log_success "TPM installed"
    else
        log_info "TPM already installed"
    fi
}

# --- 8. Starship Prompt ---
setup_starship() {
    if [ "$STOW_ONLY" = true ]; then return 0; fi

    log_step "8. Checking Starship Prompt"

    if ! command -v starship &>/dev/null && [ ! -x "$HOME/.local/bin/starship" ]; then
        log_info "Starship not detected. Installing..."
        if [ "$DRY_RUN" = true ]; then
            log_info "[DRY-RUN] Would install Starship into ~/.local/bin"
        else
            mkdir -p "$HOME/.local/bin"
            curl -sS https://starship.rs/install.sh | sh -s -- -y --bin-dir "$HOME/.local/bin"
            log_success "Starship prompt installed"
        fi
    else
        log_success "Starship prompt is already installed"
    fi
}

# --- 9. JetBrains Mono Nerd Font ---
setup_nerd_fonts() {
    if [ "$STOW_ONLY" = true ] || [ "$SKIP_FONTS" = true ]; then return 0; fi

    log_step "9. Checking JetBrains Mono Nerd Font"

    local FONT_DIR="$HOME/.local/share/fonts"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        FONT_DIR="$HOME/Library/Fonts"
    fi

    local font_installed=false
    if command -v fc-list &>/dev/null; then
        if fc-list : family | grep -iq "JetBrainsMono Nerd Font"; then
            font_installed=true
        fi
    elif [ -d "$FONT_DIR" ] && find "$FONT_DIR" -iname "*JetBrainsMono*Nerd*" | grep -q .; then
        font_installed=true
    fi

    if [ "$font_installed" = true ]; then
        log_success "JetBrains Mono Nerd Font is already installed"
    else
        log_info "Nerd Font not found. Downloading JetBrains Mono Nerd Font..."
        if [ "$DRY_RUN" = true ]; then
            log_info "[DRY-RUN] Would download and extract font into $FONT_DIR"
            return 0
        fi

        mkdir -p "$FONT_DIR"
        local TMP_DIR
        TMP_DIR=$(mktemp -d)
        curl -fsSL -o "$TMP_DIR/JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
        unzip -oq "$TMP_DIR/JetBrainsMono.zip" -d "$FONT_DIR"
        rm -rf "$TMP_DIR"
        command -v fc-cache &>/dev/null && fc-cache -f "$FONT_DIR"
        log_success "JetBrains Mono Nerd Font installed to $FONT_DIR"
    fi
}

# --- 10. Summary & Verification ---
verify_and_summary() {
    log_step "10. Verifying Active Symlinks & Environment"

    echo ""
    echo -e "${BOLD}Symlink Verification:${NC}"
    for check in \
        ".config/nvim:../dotfiles/config/.config/nvim" \
        ".config/wezterm:../dotfiles/wezterm/.config/wezterm" \
        ".config/starship.toml:../dotfiles/config/.config/starship.toml" \
        ".tmux.conf:dotfiles/tmux/.tmux.conf" \
        ".zshrc:dotfiles/zsh/.zshrc" \
        ".gitconfig:dotfiles/git/.gitconfig" \
        ".gitignore_global:dotfiles/git/.gitignore_global"
    do
        local file="${check%%:*}"
        local expected="${check##*:}"
        if [ -L "$HOME/$file" ]; then
            echo -e "  ${GREEN}✔${NC} ~/$file -> $(readlink "$HOME/$file")"
        else
            echo -e "  ${YELLOW}⚠${NC} ~/$file is not a symlink"
        fi
    done

    echo ""
    echo -e "${BOLD}${GREEN}======================================================${NC}"
    echo -e "${BOLD}${GREEN}   🎉 Dotfiles Installation Successfully Completed!   ${NC}"
    echo -e "${BOLD}${GREEN}======================================================${NC}"
    echo ""
    echo -e "${BOLD}Next Steps for Your New Setup:${NC}"
    echo -e "  1. ${CYAN}Set Zsh as default shell${NC} (if not already):"
    echo -e "     ${BOLD}chsh -s \$(which zsh)${NC}"
    echo ""
    echo -e "  2. ${CYAN}Install Tmux Plugins${NC}:"
    echo -e "     Start tmux with ${BOLD}tmux${NC}, then press ${BOLD}Ctrl+a${NC} followed by ${BOLD}I${NC} (Shift+i)"
    echo ""
    echo -e "  3. ${CYAN}Launch Neovim${NC}:"
    echo -e "     Open ${BOLD}nvim${NC} — lazy.nvim will automatically sync plugins on first run"
    echo ""
    echo -e "  4. ${CYAN}Enjoy WezTerm${NC}:"
    echo -e "     Launch WezTerm for hardware-accelerated rendering with codeSTACKr/Vivid Black theme"
    echo ""
}

# --- Main Execution ---
main() {
    print_banner
    detect_os
    install_system_packages
    backup_conflicts
    stow_dotfiles
    setup_zsh
    setup_neovim
    setup_tmux_tpm
    setup_starship
    setup_nerd_fonts
    verify_and_summary
}

main
