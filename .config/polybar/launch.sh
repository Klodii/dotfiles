#!/usr/bin/env bash
# Kill existing bars
killall -q polybar

# Wait until shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

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
