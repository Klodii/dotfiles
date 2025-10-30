#!/usr/bin/env bash

# Kill existing bars
killall -q polybar

# Wait until shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

polybar main &
second_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $second_monitor = *connected* ]]; then
    polybar external &
fi
