#!/usr/bin/env bash

function install_vim-task() {
    if ! [[ -d ~/.vim ]]; then
        mkdir ~/.vim
    fi
    git clone https://github.com/samsonw/vim-task.git ~/.config/vim-task
    rm ~/.config/vim-task/README.mkd
    cp -rv ~/.config/vim-task/* ~/.vim/
    rm -fr ~/.config/vim-task/
}

function install_vimrc() {
    ln -is ~/.config/dotfiles/vimrc ~/.vimrc
}

function install_i3cfg() {
    if ! [[ -d ~/.i3 ]]; then
        mkdir ~/.i3
    fi
    ln -is ~/.config/dotfiles/i3/config ~/.i3/config
}

function clone_repo() {
    if ! [[ -d ~/.config/dotfiles/.git ]]; then
        mkdir -p ~/.config/dotfiles
        git clone git://github.com/Like-all/dotfiles.git ~/.config/dotfiles
    else
        cd ~/.config/dotfiles && git pull
    fi
}

function setup_linux() {
    install_vimrc
    install_i3cfg
    install_vim-task
}

function setup_osx() {
    install_vimrc
    install_vim-task
}

case `uname` in
    "Linux")
        if ! which git; then
            echo "Please, install git first"
            exit 1
        fi
        clone_repo
        setup_linux
        ;;
    "Darwin")
        if ! which -s git; then
            echo "Please, install git first"
            exit 1
        fi
        clone_repo
        setup_osx
        ;;
esac


