# Common zsh config — loaded on all platforms

# Aliases
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# Keybindings (fixes home/end in JetBrains terminals and some others)
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# FZF
[[ -x "$(command -v fzf)" ]] && source <(fzf --zsh)

# Colors
export CLICOLOR=1

# Prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT='%{%B%K{green}%}%?%k %{%B%F{green}%}%n@%m:%{%F{blue}%}%4~ %{$reset_color%}${vcs_info_msg_0_} $ '

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d "$PYENV_ROOT/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -x "$(command -v pyenv)" ]] && eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]]          && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# n (node version manager)
export N_PREFIX="$HOME/.n"
export PATH="$PATH:$N_PREFIX/bin"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
