#!/usr/bin/env bash

case `uname` in
    "Linux")
        if which git; then
            echo "Success"
        fi
        ;;
    "Darwin")
        ;;
esac
