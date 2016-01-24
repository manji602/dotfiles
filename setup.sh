#!/bin/bash

cd "$(dirname "$0")"

TARGETS=(
".gitconfig"
".gitignore"
".gitmessage"
".git-completion.bash"
".bashrc"
".bashrc.osx"
".screenrc"
".tmux.conf"
".emacs.d"
".zshrc"
".zshrc.custom"
".zshrc.osx"
".zsh.d"
)

RESOURCES=(
"git/.gitconfig"
"git/.gitignore"
"git/.gitmessage"
"git/.git-completion.bash"
"bash/.bashrc"
"bash/.bashrc.osx"
"screen/.screenrc"
"tmux/.tmux.conf"
"emacs/.emacs.d"
"zsh/.zshrc"
"zsh/.zshrc.custom"
"zsh/.zshrc.osx"
"zsh/.zsh.d"
)

OLD_DOTFILES_DIR="dotfiles-old"
CURRENT_TIMESTAMP=`date '+%Y%m%d_%H:%M:%S'`

if [ ! -d $HOME/$OLD_DOTFILES_DIR ]; then
    mkdir $HOME/$OLD_DOTFILES_DIR
fi

if [ ! -d $HOME/.emacs.d ]; then
    mkdir $HOME/.emacs.d
fi

for ((i = 0;i < ${#TARGETS[*]}; i++)) {

    if [ -f $HOME/${TARGETS[$i]} -o -d $HOME/${TARGETS[$i]} ]; then
        if [ -L $HOME/${TARGETS[$i]} ]; then
            unlink $HOME/${TARGETS[$i]}
        else
            mv -f $HOME/${TARGETS[$i]} $HOME/$OLD_DOTFILES_DIR/${TARGETS[$i]}.$CURRENT_TIMESTAMP
        fi
    fi

    ln -Fisv "$PWD/${RESOURCES[$i]}" $HOME
}
