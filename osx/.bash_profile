# create aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# git completion
. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh

# aws completion
complete -C '/usr/local/bin/aws_completer' aws

# set colors
export CLICOLOR=1
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1) $ '

