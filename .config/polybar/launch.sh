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

# Detect if battery exists
if ls /sys/class/power_supply/ | grep -q "^BAT"; then
    export HAS_BATTERY="battery" # battery is the name of the polybar module to use when the battery is there
else
    export HAS_BATTERY=""
fi


polybar main &
second_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $second_monitor = *connected* ]]; then
    polybar external &
fi
