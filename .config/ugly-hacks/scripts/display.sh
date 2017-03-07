#!/usr/bin/env bash

export DISPLAY=:0

function connect() {
    xrandr --output VIRTUAL1 --off --output DP3 --off --output DP2 --mode 1920x1080 --pos 0x0 --rotate left --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1600x900 --pos 1080x1020 --rotate normal --output VGA1 --off

}

function disconnect() {
    xrandr --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1600x900 --pos 0x0 --rotate normal --output VGA1 --off
}

xrandr | grep "DP2 connected" &> /dev/null && connect || disconnect