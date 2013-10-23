#!/usr/bin/env bash

case `uname` in
    "Linux")
        if which git; then
            echo "Success"
        fi
        ;;
    "Darwin")
        if which -s git; then
            echo "Success on Mac"
        fi
        ;;
esac
