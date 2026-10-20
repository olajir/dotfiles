#!/usr/bin/env bash
# Länkar in dotfiles i hemkatalogen. Säker att köra flera gånger:
# befintliga filer som inte redan är länkar flyttas till <fil>.orig.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$DOTFILES/$1" dst="$2"
    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
        return
    fi
    if [[ -e "$dst" || -L "$dst" ]]; then
        mv -v "$dst" "$dst.orig"
    fi
    mkdir -p "$(dirname "$dst")"
    ln -sv "$src" "$dst"
}

link bash_profile ~/.bash_profile
link bashrc       ~/.bashrc
link gitconfig    ~/.gitconfig
link vimrc        ~/.vimrc

for dir in "$DOTFILES"/config/*/; do
    name="$(basename "$dir")"
    link "config/$name" ~/.config/"$name"
done
