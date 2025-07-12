#!/bin/sh

slstatus &
~/.fehbg &
streamdeck -n &
(sleep 1 && xcompmgr) &
exec dwm
