#!/usr/bin/env bash
# Kill existing bars
killall -q polybar

# Wait until shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

if xrandr --query | grep -q '^DP-2 connected'; then
    polybar main &
fi

EXTERNAL_MONITOR=$(xrandr --query | awk '/^HDMI-[01] connected/ {print $1; exit}')
if [ -n "$EXTERNAL_MONITOR" ]; then
    EXTERNAL_MONITOR="$EXTERNAL_MONITOR" polybar external &
fi

if xrandr --query | grep -qE '^LVDS-1 connected'; then
    polybar laptop &
fi
