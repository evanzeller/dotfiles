# Linux-specific zsh config (including WSL/Arch)

# Completions
autoload -Uz compinit && compinit

# dircolors
[[ -x "$(command -v dircolors)" ]] && eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
