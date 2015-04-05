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

## setup bash config

BASH_FILES=(".bashrc")

for ((i = 0;i < ${#BASH_FILES[*]}; i++)) {
    if [ ! -e $HOME/${BASH_FILES[$i]} ]; then
        mv $HOME/${BASH_FILES[$i]} $HOME/"${BASH_FILES[$i]}.old"
    fi
    ln -Fisv "$PWD/bash/${BASH_FILES[$i]}" $HOME
}

## setup screen config

## setup tmux config

## setup emacs config

EMACS_FILES=(".emacs.d")

for ((i = 0;i < ${#EMACS_FILES[*]}; i++)) {
    if [ ! -e $HOME/${EMACS_FILES[$i]} ]; then
        mv $HOME/${EMACS_FILES[$i]} $HOME/"${EMACS_FILES[$i]}.old"
    fi
    ln -Fisv "$PWD/emacs/${EMACS_FILES[$i]}" $HOME
}
