#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MAIN=DP-3
SECONDARY="eDP-1"

MONITOR=$MAIN polybar main-left &
MONITOR=$MAIN polybar main-right &
MONITOR=$MAIN polybar tray &

if [ -n "$SECONDARY" ]; then
    MONITOR=$SECONDARY polybar secondary-left &
fi


echo "Bars launched..."
