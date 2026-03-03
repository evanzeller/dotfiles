#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "  linked: $dst"
}

echo "Dotfiles: $DOTFILES"
echo ""

echo "Shell (zsh)"
link "$DOTFILES/zsh/.zshrc"           "$HOME/.zshrc"
link "$DOTFILES/zsh/config/common.zsh" "$HOME/.config/zsh/common.zsh"
link "$DOTFILES/zsh/config/darwin.zsh" "$HOME/.config/zsh/darwin.zsh"
link "$DOTFILES/zsh/config/linux.zsh"  "$HOME/.config/zsh/linux.zsh"

echo "Git"
link "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

echo "Neovim"
link "$DOTFILES/nvim" "$HOME/.config/nvim"

echo "Tmux"
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

echo "Claude"
mkdir -p "$HOME/.claude"
link "$DOTFILES/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

echo ""
echo "Done. Manual steps remaining:"
echo ""

if [[ ! -f "$HOME/.gitconfig.local" ]]; then
    echo "  git identity — create ~/.gitconfig.local:"
    echo "    [user]"
    echo "      name = Evan Zeller"
    echo "      email = evanrzeller@gmail.com"
    echo ""
fi

if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    echo "  tmux plugins — install TPM:"
    echo "    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
    echo "    then inside tmux: prefix + I"
    echo ""
fi
