#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u 1000 -x polybar >/dev/null; do sleep 1; done

if xrandr | grep '*' | grep '1920x1080'; then
polybar topright &
polybar topleft1080
fi

if xrandr | grep ' connected' | grep '3840x2160'; then
polybar topright &
polybar topleft4k
fi

# Launch Polybar, using default config location ~/.config/polybar/config
polybar topright &
polybar topleft &

echo Polybar launched...
