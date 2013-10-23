#!/usr/bin/env bash

function install_vimrc() {
    ln -is ~/.config/dotfiles/vimrc ~/.vimrc
}

function install() {
    install_vimrc
}
case `uname` in
    "Linux")
        if ! which git; then
            echo "Please, install git first"
            exit 1
        fi
        ;;
    "Darwin")
        if ! which -s git; then
            echo "Please, install git first"
            exit 1
        fi
        ;;
esac

if ! [[ -d ~/.config/dotfiles/.git ]]; then
    mkdir -p ~/.config/dotfiles
    git clone git://github.com/Like-all/dotfiles.git ~/.config/dotfiles
    install
else
    cd ~/.config/dotfiles && git pull
    install
fi

