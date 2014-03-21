setxkbmap dk &
xrdb .Xresources

# fonts
xset +fp /usr/share/fonts/local
xset fp rehash

# wm
exec i3 -V >> ~/.i3/i3log 2>&1

