#!/bin/sh

#compton -b --config ~/.config/compton/compton.conf
#unclutter
compton --blur-background -CG -c -o .55 -b # CG => no shadow on dock/panel, -c shadows, -o opacity, -b daemon
setxkbmap -layout us -variant altgr-intl
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -option ctrl:nocaps
xmodmap -e 'add Mod3 = Alt_R'
xautolock -time 10 -locker "~/scripts/i3lock-color.sh -i ~/.config/i3/lockscreen.png"
