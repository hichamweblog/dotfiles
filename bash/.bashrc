# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# Aliases
alias open="xdg-open"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Make directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract any archive
extract() {
  if [ -f "$1" ]; then
    case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *) echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Create a new script file with shebang and make it executable
newsh() {
  if [ -z "$1" ]; then
    echo "Usage: newsh <filename>"
    return 1
  fi
  echo -e '#!/usr/bin/env bash\n' >"$1"
  chmod +x "$1"
  $EDITOR "$1"
}

# Search history with fzf (if installed)
fh() {
  eval $(history | fzf +s --tac | sed 's/^ *[0-9]* *//')
}

# Better history
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups       # No duplicate entries
export HISTIGNORE="ls:ll:cd:pwd:exit:clear:c" # Don't save simple commands

# For bash only:
shopt -s histappend # Append to history, don't overwrite
shopt -s cmdhist    # Save multi-line commands as one

# Enable color support
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Colorful man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Key bindings (if fzf is installed)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash # For bash

# Aliases & PATHs
alias c="clear"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias h="history"
alias ls='eza --color=auto --icons=auto'
alias lh='eza -lh --icons --git'
alias lt='eza -lT --icons'
alias l='eza -1 --icons'
alias ll='eza -l --icons --git'
alias la='eza -la --icons --git'
alias tree='eza --tree --icons'
alias lt2='eza -lT --level=2 --icons'
alias lt3='eza -lT --level=3 --icons'
alias cat="bat"

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'

# Quick edit configs
alias ebash='$EDITOR ~/.bashrc'
alias sbash='source ~/.bashrc'



# Better defaults
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias grep='grep --color=auto'

export EDITOR=nvim
export VISUAL=nvim
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(zoxide init bash)"
eval "$(starship init bash)"
