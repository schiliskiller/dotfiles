#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

twm &
setxkbmap es -option "terminate:ctrl_alt_bksp" &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
xterm -geometry 80x66+0+0 -name login &
picom -f --config ~/.config/picom.conf &
ulauncher --hide-window &
xrdb -merge ~/.Xresources &
feh --bg-max --randomize ~/Pictures/Wallpapers/* &
discord &
steam-runtime &
alacritty &
i3 &
exec xautolock -time 20 -locker "systemctl suspend" -detectsleep
