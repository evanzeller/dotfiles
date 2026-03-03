# Zsh entry point — sources platform-specific then common config.
#
# Symlink setup:
#   ~/.zshrc               -> dotfiles/zsh/.zshrc
#   ~/.config/zsh/         -> dotfiles/zsh/config/ (or symlink each file)

_ZSH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

case "$OSTYPE" in
    darwin*) [[ -f "$_ZSH_CONFIG/darwin.zsh" ]] && source "$_ZSH_CONFIG/darwin.zsh" ;;
    linux*)  [[ -f "$_ZSH_CONFIG/linux.zsh"  ]] && source "$_ZSH_CONFIG/linux.zsh"  ;;
esac

[[ -f "$_ZSH_CONFIG/common.zsh" ]] && source "$_ZSH_CONFIG/common.zsh"

# Machine-local overrides (not tracked in git)
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
