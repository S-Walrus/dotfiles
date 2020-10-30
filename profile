#!/bin/bash

# Defaults
export IMAGE_VIEWER="sxiv -a"
export TERMINAL="alacritty"
export BROWSER="brave"
export PDF_VIEWER="zathura"
export RSS_READER="newsboat"

# Disable capslock functionality
xmodmap -e "remove lock = Caps_Lock"

# Remap capslock to menu, then remaps menu to Ctrl+Space to change layout
#setxkbmap -option caps:menu
#xcape -e 'Menu=Control_L|space'

# Disable desktop zoom on alt+scroll
xfconf-query --set false --channel xfwm4 --property /general/zoom_desktop
