#!/usr/bin/env bash

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

else
    cd ~/.config/dotfiles && git pull

fi

