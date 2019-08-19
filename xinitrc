#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

setxkbmap dk &
xrdb .Xresources

# add custom keymapping
xmodmap ~/.xmodmap

# no beeps
xset -b

# fonts
xset +fp /usr/share/fonts/local
xset fp rehash

export GTK2_RC_FILES=$HOME/.gtkrc-2.0

# wm
exec i3 -V >> ~/.i3/i3log
