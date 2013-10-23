#!/usr/bin/env bash

case `uname` in
    "Linux")
        if !$(which git); then
            echo "Fail"
        else
            echo "Success"
        fi
        ;;
    "Darwin")
        if !$(which -s git); then
            echo "Fail on Mac"
        else
            echo "Success on Mac"
        fi
        ;;
esac
