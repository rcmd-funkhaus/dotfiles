#!/usr/bin/env bash

function clone_repo() {
    if ! [[ -d ~/.config/dotfiles/.git ]]; then
        mkdir -p ~/.config/dotfiles
        git clone git://github.com/Like-all/dotfiles.git ~/.config/dotfiles
    else
        cd ~/.config/dotfiles && git pull
    fi
}


case `uname` in
    "Linux")
        if ! which git; then
            echo "Please, install git first"
            exit 1
        fi
        clone_repo
        source ~/.config/dotfiles/util/functions
        setup_linux
        ;;
    "Darwin")
        if ! which -s git; then
            echo "Please, install git first"
            exit 1
        fi
        clone_repo
        source ~/.config/dotfiles/util/functions
        setup_osx
        ;;
esac
