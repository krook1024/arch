#!/bin/sh
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
xset r rate 300 75
exec i3
