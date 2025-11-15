# My Dotfiles

Managed with GNU Stow for easy deployment across multiple machines.

## Stack

- **Shells:** Bash, Zsh (Oh-My-Zsh)
- **Prompt:** Starship
- **Terminal Multiplexer:** Tmux (with TPM plugin manager)
- **Editor:** Neovim (LazyVim)
- **Modern CLI Tools:** eza, bat, zoxide, fzf, fd
- **Package Managers:** Cargo (Rust)

## Fresh Install on New Server

### 1. Install System Dependencies

#### Ubuntu/Debian

```bash
sudo apt update && sudo apt install -y \
  curl \
  git \
  stow \
  zsh \
  tmux \
  build-essential \
  unzip \
  wget
```

#### Fedora/RHEL/CentOS

```bash
sudo dnf install -y \
  curl \
  git \
  stow \
  zsh \
  tmux \
  gcc \
  make \
  unzip \
  wget
```

> **Note:** We'll install Neovim manually in a later step to get version 0.11.5+ (repo versions are often outdated)

### 2. Clone Dotfiles Repository

```bash
git clone https://github.com/hichamweblog/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Backup and Remove Existing Dotfiles

```bash
# Create backup directory
mkdir -p ~/.dotfiles_backup

# Backup existing files (optional)
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.dotfiles_backup/
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.dotfiles_backup/
[ -f ~/.bash_logout ] && mv ~/.bash_logout ~/.dotfiles_backup/
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.dotfiles_backup/
[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.dotfiles_backup/
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.dotfiles_backup/

# Remove config directories
rm -rf ~/.config/nvim
rm -f ~/.config/starship.toml
rm -rf ~/.config/lazygit
rm -rf ~/.config/tmux
```

### 4. Install Oh-My-Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

### 5. Install Zsh Plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### 6. Deploy Dotfiles with Stow

```bash
cd ~/dotfiles

# Stow each package
stow bash
stow zsh
stow git
stow tmux
stow config
```

### 7. Install Neovim 0.11.5

```bash
# Create local bin directory
mkdir -p ~/.local/bin
cd ~/.local/bin

# Download Neovim 0.11.5
wget https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz

# Extract the tarball
tar xzvf nvim-linux-x86_64.tar.gz

# Remove the tarball
rm nvim-linux-x86_64.tar.gz

# Create symbolic link
ln -sf ~/.local/bin/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim

# Return to home directory
cd ~

# Verify installation
nvim --version
```

> **Note:** The PATH is already set in both .bashrc and .zshrc to include `~/.local/bin`

### 8. Install Starship Prompt

```bash
curl -sS https://starship.rs/install.sh | sh
```

### 9. Install Rust and Modern CLI Tools

```bash
# Install Rust (needed for cargo)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install modern CLI tools
cargo install eza       # Modern ls replacement
cargo install bat       # Better cat with syntax highlighting
cargo install zoxide    # Smarter cd command
cargo install fd-find   # Better find alternative

# Install fzf (fuzzy finder)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-bash --no-fish
```

### 10. Install JetBrains Mono Nerd Font

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download and install JetBrains Mono Nerd Font
cd ~/.local/share/fonts
curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip

# Refresh font cache
fc-cache -fv
cd ~
```

### 11. Install Tmux Plugin Manager (TPM)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 12. Set Zsh as Default Shell

```bash
# Change default shell to zsh
chsh -s $(which zsh)

# For systems with SELinux or restricted environments, add to ~/.bashrc:
# if [ -t 1 ]; then
#   exec zsh
# fi
```

### 13. Finalize Setup

```bash
# Source the new zsh config
source ~/.zshrc

# Start tmux and install plugins (press prefix + I)
tmux
# Inside tmux, press: Ctrl+a then Shift+I to install plugins
```

## Post-Install Configuration

### Install Tmux Plugins

After starting tmux for the first time:

1. Press `Ctrl+a` then `Shift+I` to install all TPM plugins
2. Wait for installation to complete

### Optional: Install Additional Tools

```bash
# lazygit (Terminal UI for git)
# Ubuntu/Debian
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# Fedora/RHEL
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit -y
```

## Key Features

### Zsh Plugins Included

- **git** - Git aliases and functions
- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Syntax highlighting in terminal
- **zsh-completions** - Additional completion definitions

### Custom Aliases

- Modern replacements: `ls` → eza, `cat` → bat
- Quick navigation: `..`, `...`, `....`
- Git shortcuts: `gs`, `ga`, `gc`, `gp`, `gl`
- Safety nets: `rm -i`, `cp -i`, `mv -i`

### Custom Functions

- `mkcd <dir>` - Create and cd into directory
- `extract <file>` - Extract any archive type
- `newsh <name>` - Create executable bash script
- `fh` - Search command history with fzf

### Tmux Key Bindings

- **Prefix:** `Ctrl+a` (instead of Ctrl+b)
- **Split panes:** `|` (horizontal), `-` (vertical)
- **Reload config:** `Ctrl+a` then `r`
- **Vim-style navigation:** Works seamlessly with Neovim splits

## Update/Modify Configs

```bash
# After editing files in ~/dotfiles/
cd ~/dotfiles
git add .
git commit -m "Update configs"
git push
```

## Troubleshooting

### Zsh not set as default on SELinux systems

Add this to the top of `~/.bashrc`:

```bash
if [ -t 1 ]; then
  exec zsh
fi
```

### Tmux colors not working

Ensure your terminal supports 256 colors and true color:

```bash
export TERM=xterm-256color
```

### Starship not showing

Make sure it's initialized in your shell config (already included in .zshrc and .bashrc)

## License

Free to use and modify for personal use.
