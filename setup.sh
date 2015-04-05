#!/bin/bash

cd "$(dirname "$0")"

TARGETS=(".gitconfig" ".gitignore" ".bashrc" ".screenrc" ".tmux.conf" ".emacs.d")
RESOURCES=("git/.gitconfig" "git/.gitignore" "bash/.bashrc" "screen/.screenrc" "tmux/.tmux.conf" "emacs/.emacs.d")

for ((i = 0;i < ${#TARGETS[*]}; i++)) {
    if [ -f $HOME/${TARGETS[$i]} ]; then
        mv -v $HOME/${TARGETS[$i]} $HOME/"${TARGETS[$i]}.old"
    fi
    ln -Fisv "$PWD/${RESOURCES[$i]}" $HOME
}
