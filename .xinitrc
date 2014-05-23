xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

setxkbmap dk &
xrdb .Xresources

# fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# wm
xterm &
exec twm 
