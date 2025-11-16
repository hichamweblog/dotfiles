#!/bin/bash
# Installation script for VSCode-like Neovim setup
# This will install all necessary tools and dependencies

echo "🚀 Setting up VSCode-like Neovim environment..."
echo ""

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim is not installed. Please install Neovim 0.9+ first."
    exit 1
fi

# Check Neovim version
nvim_version=$(nvim --version | head -n 1 | cut -d' ' -f2 | cut -d'v' -f2)
echo "✅ Neovim version: $nvim_version"
echo ""

# Install system dependencies
echo "📦 Installing system dependencies..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v apt-get &> /dev/null; then
        # Debian/Ubuntu
        sudo apt-get update
        sudo apt-get install -y git curl ripgrep fd-find nodejs npm python3 python3-pip
    elif command -v pacman &> /dev/null; then
        # Arch
        sudo pacman -S --needed git curl ripgrep fd nodejs npm python python-pip
    elif command -v dnf &> /dev/null; then
        # Fedora
        sudo dnf install -y git curl ripgrep fd-find nodejs npm python3 python3-pip
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &> /dev/null; then
        brew install git curl ripgrep fd node python
    else
        echo "❌ Homebrew not found. Please install Homebrew first."
        exit 1
    fi
fi

echo "✅ System dependencies installed"
echo ""

# Install language servers and tools
echo "📦 Installing LSP servers and formatters..."
echo "   (This will be done through Mason in Neovim)"
echo ""

# First run Neovim to initialize lazy.nvim
echo "🔧 Initializing Neovim and installing plugins..."
echo "   This may take a few minutes..."
echo ""

# Run headless Neovim to install plugins
nvim --headless "+Lazy! sync" +qa

echo ""
echo "✅ Plugins installed"
echo ""

# Install Mason tools
echo "🔧 Installing LSP servers, formatters, and linters..."
nvim --headless "+MasonInstall prettier black stylua shfmt eslint_d pylint pyright vtsls lua-language-server" +qa

echo ""
echo "✅ LSP servers and formatters installed"
echo ""

# Final message
echo "🎉 Setup complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Open Neovim: nvim"
echo "   2. Wait for remaining plugins to install"
echo "   3. Run :checkhealth to verify everything is working"
echo "   4. Run :Mason to install additional LSP servers if needed"
echo ""
echo "📚 Quick reference (LazyVim keybindings):"
echo "   - <leader><space>: Find files"
echo "   - <leader>fg: Find in files (grep)"
echo "   - <leader>e: Toggle file explorer"
echo "   - <leader>cr: Rename symbol"
echo "   - K: Show hover documentation"
echo "   - <leader>ca: Code actions"
echo "   - Press <leader> and wait to see all keybindings!"
echo ""
echo "   For complete guide, see: ~/.config/nvim/VSCODE-FEATURES.md"
echo ""
echo "Happy coding! 🚀"
