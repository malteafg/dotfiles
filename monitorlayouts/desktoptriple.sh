#!/bin/sh
xrandr \
    --output DP-0 --primary --mode 2560x1440 --rate 164.83 \
    --pos 1920x180 --rotate normal \
    --output DVI-D-0 --mode 1920x1080 --pos 0x420 --rotate normal \
    --output HDMI-0 --mode 1920x1080 --pos 4480x0 --rotate left \
    --output DP-1 --off --output DP-2 --off --output DP-3 --off \
    --output DP-4 --off --output DP-5 --off

xwallpaper --output DP-0 --center ~/files/wallpapers/moon-1440p.jpg
xwallpaper --output DVI-D-0 --zoom ~/files/wallpapers/fractal-1440p.jpg
xwallpaper --output HDMI-0 --zoom ~/files/wallpapers/fractal-2560p.jpg

echo "DP-0" > ~/dotfiles/local/monitorconf
echo "DVI-D-0" >> ~/dotfiles/local/monitorconf
echo "HDMI-0" >> ~/dotfiles/local/monitorconf
