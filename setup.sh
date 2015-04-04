#!/bin/bash

cd "$(dirname "$0")"

## setup git config

GIT_FILES=(".gitconfig" ".gitignore")

for ((i = 0;i < ${#GIT_FILES[*]}; i++)) {
    if [ ! -e $HOME/${GIT_FILES[$i]} ]; then
        mv $HOME/${GIT_FILES[$i]} $HOME/"${GIT_FILES[$i]}.old"
    fi
    ln -Fisv "$PWD/git/${GIT_FILES[$i]}" $HOME
}

## setup screen config

## setup tmux config

## setup emacs config

