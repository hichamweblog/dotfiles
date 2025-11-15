# My Dotfiles

Managed with GNU Stow

## Stack
- Shells: Bash, Zsh (Oh-My-Zsh)
- Prompt: Starship
- Terminal Multiplexer: Tmux
- Editor: Neovim (LazyVim)

## Fresh Install
```bash
# Clone repo
git clone <your-repo> ~/dotfiles
cd ~/dotfiles

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Stow packages
stow bash zsh git tmux config

# Install Starship
curl -sS https://starship.rs/install.sh | sh
```

## Add/Update Configs
```bash
# After editing files in ~/dotfiles/
cd ~/dotfiles
git add .
git commit -m "Update configs"
git push
```
