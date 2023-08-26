#!/bin/sh

# Programs
dunst &
picom -b
nm-applet &
nitrogen --restore &
xfce4-power-manager &

# Trackpad configuration
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Accel Speed" .10
