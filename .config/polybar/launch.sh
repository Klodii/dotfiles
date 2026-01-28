#!/usr/bin/env bash
# Kill existing bars
killall -q polybar

# Wait until shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

# Font installation
FONT_DIRECTORY="/usr/share/fonts"
NERDFONT="HackNerdFont-Regular.ttf"
if [ ! -f "${FONT_DIRECTORY}/${NERDFONT}" ]; then
    # Install the font with icons
    # to show the icons run gucharmap, this application show
    # all the fonts that are installed.
    # To select the icons, choose the font you want and then go to
    # 'Private Use Area'
    cp -v HackNerdFont-Regular.ttf /usr/share/fonts/
fi

desktop_main_monitor=$(xrandr --query | grep 'DP-2')
if [[ $desktop_main_monitor = *connected* ]]; then
    polybar main &
fi
second_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $second_monitor = *connected* ]]; then
    polybar external &
fi

laptop_monitor=$(xrandr --query | grep 'LVDS-1')
if [[ $laptop_monitor = *connected* ]]; then
    polybar laptop &
fi
