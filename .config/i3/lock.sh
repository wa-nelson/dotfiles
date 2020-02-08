#!/bin/bash

lock-blur() {
	TMPBG=/tmp/screen.png
	scrot $TMPBG
#	convert $TMPBG -scale 10% -scale 1000% $TMPBG ## faster performance
	convert $TMPBG -blur 0x8 $TMPBG
	i3lock -i $TMPBG
}

lock-blur && sleep 10 && xset dpms force off
