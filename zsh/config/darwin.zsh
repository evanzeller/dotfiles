# macOS-specific zsh config

# Homebrew completions (must come before compinit)
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi
autoload -Uz compinit && compinit

# Coreutils dircolors (brew install coreutils)
_dc="$(brew --prefix 2>/dev/null)/opt/coreutils/libexec/gnubin/dircolors"
[[ -x "$_dc" ]] && eval "$("$_dc")"
unset _dc
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# gcloud SDK
_gcloud="/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk"
[[ -r "$_gcloud/path.zsh.inc" ]]       && source "$_gcloud/path.zsh.inc"
[[ -r "$_gcloud/completion.zsh.inc" ]] && source "$_gcloud/completion.zsh.inc"
unset _gcloud

# git prompt (Xcode CLT)
[[ -r "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh" ]] && \
    source "/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh"

# Coursier (Scala tooling)
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

# MySQL
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

# Testcontainers + Colima
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
