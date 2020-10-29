#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u 1000 -x polybar >/dev/null; do sleep 1; done

if xrandr | grep '*' | grep '2560x1440'; then
polybar topright &
polybar topleft
fi

if xrandr | grep '*' | grep '1920x1080'; then
polybar topright &
polybar topleft
fi

if xrandr | grep ' connected' | grep '3840x2160'; then
polybar topright &
polybar topleft
fi

echo Polybar launched...
