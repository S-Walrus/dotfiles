# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022


################ CUSTOM CODE ################ 

# Disable capslock functionality
# [fxce4]
# xmodmap -e "remove lock = Caps_Lock"

# Remap capslock to menu, then remaps menu to Ctrl+Space to change layout
setxkbmap -option caps:menu
xcape -e 'Menu=Control_L|space'

# Disable desktop zoom on alt+scroll
# TODO: execute on xfce4 only
# xfconf-query --set false --channel xfwm4 --property /general/zoom_desktop

#################### END #################### 


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"
