# create aliases
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

      autoload -Uz compinit
        compinit
fi

# gcloud completion
[[ -r "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]] && source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
[[ -r "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]] && source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

# git completion
[[ -r "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh" ]] && . "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"

# aws completion
[[ -r "/opt/homebrew/bin/aws_completer" ]] && complete -C '/opt/homebrew/bin/aws_completer' aws

autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
PROMPT='%{%B%F{green}%}%n@%m:%{%F{blue}%}%4~ %{$reset_color%}${vcs_info_msg_0_} $ '


eval $(/opt/homebrew/opt/coreutils/libexec/gnubin/dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export CLICOLOR=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/evan.zeller/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/evan.zeller/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/evan.zeller/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/evan.zeller/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export N_PREFIX=$HOME/.n
export PATH=$PATH:$N_PREFIX/bin

# JAVA HOME
export JAVA_HOME=/Users/evan.zeller/Library/Java/JavaVirtualMachines/azul-1.8.0_352/Contents/Home
