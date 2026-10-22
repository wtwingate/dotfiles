#!/usr/bin/env bash
set -euo pipefail

# Check dependencies
for cmd in emacs vim git; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: $cmd is not installed or not in PATH." >&2
        exit 1
    fi
done

# Get parent directory of script
DOTFILES=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Symlink configuration files
ln -sfn "$DOTFILES/.emacs" "$HOME/.emacs"
ln -sfn "$DOTFILES/.vimrc" "$HOME/.vimrc"

# Set up Vim directory
mkdir -p "$HOME/.vim/backup" "$HOME/.vim/undo"

# Install Vim packages
install_package() {
    local repo="$1"
    local author="${repo%%/*}"
    local name="${repo##*/}"
    local dir="$HOME/.vim/pack/$author/start/$name"

    if [[ ! -d "$dir" ]]; then
        mkdir -p "$(dirname "$dir")"
        git clone "https://github.com/$repo.git" "$dir"
    fi

    if [[ -d "$dir/doc" ]]; then
        vim -u NONE -es -c "helptags $dir/doc" -c q
    fi
}

install_package junegunn/fzf
install_package junegunn/fzf.vim
install_package morhetz/gruvbox
install_package tpope/vim-fugitive
install_package tpope/vim-repeat
install_package tpope/vim-sleuth
install_package tpope/vim-surround
