# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!
#
# This config file uses keycodes (bindsym) and was written for the QWERTY
# layout.
#
# To get a config file with the same key positions, but for your current
# layout, use the i3-config-wizard
#

# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

# Variable setting
set $defaultmod Mod4
set $up k
set $down j
set $left h
set $right l

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:Clear Sans 12

########## Autolaunch ##########
exec --no-startup-id nm-applet
exec --no-startup-id /usr/lib64/polkit-gnome/polkit-gnome-authentication-agent-1
exec nitrogen --restore
exec compton
exec ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize
exec dropbox start
exec polybar -c ~/.config/polybar/transparent kmarc

# Custom window settings
for_window [class="Godot"] floating enable
for_window [title=".*Godot Engine*."] floating disable
for_window [class="Peek"] floating enable

# Keyboard layout
exec setxkbmap -layout us,ru
exec setxkbmap -option 'grp:alt_shift_toggle'

########## Keybindings ##########
bindsym Mod4+Shift+s exec i3lock # Easier locking

### Backlight ###
# Note: If light doesn't work, install xbacklight and 1) uncomment the two lines below.
# 2) Comment out the exec light lines.
bindsym XF86MonBrightnessUp exec xbacklight -inc 10
bindsym XF86MonBrightnessDown exec xbacklight -dec 10
# bindsym XF86MonBrightnessUp exec light -A 10 # Increase Brightness
# bindsym XF86MonBrightnessDown exec light -U 10 # Decrease Brightness

### Media Player ###
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioPrev exec playerctl previous
bindsym XF86AudioNext exec playerctl next

### Other ###
bindsym Print exec scrot -q 100

### Sound ###
# Raise Volume
bindsym XF86AudioRaiseVolume exec --no-startup-id amixer -D pulse sset Master 5%+ && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
# Lower Volume
bindsym XF86AudioLowerVolume exec --no-startup-id amixer -D pulse sset Master 5%- && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
bindsym XF86AudioMute exec --no-startup-id amixer -D pulse sset Master toggle-mute # Toggle muting

# Use Mouse+Mod4 to drag floating windows to their wanted position
floating_modifier Mod4

# start a terminal
bindsym Mod4+Return exec i3-sensible-terminal

# kill focused window
bindsym Mod4+Shift+q kill

# start dmenu (a program launcher)
bindsym Mod4+d exec rofi -show run -padding 9

# change focus
bindsym Mod4+$left focus left
bindsym Mod4+$down focus down
bindsym Mod4+$up focus up
bindsym Mod4+$right focus right

# alternatively, you can use the cursor keys:
bindsym Mod4+Left focus left
bindsym Mod4+Down focus down
bindsym Mod4+Up focus up
bindsym Mod4+Right focus right

# move focused window
bindsym Mod4+Shift+$left move left
bindsym Mod4+Shift+$down move down
bindsym Mod4+Shift+$up move up
bindsym Mod4+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym Mod4+Shift+Left move left
bindsym Mod4+Shift+Right move right
bindsym Mod4+Shift+Down move down
bindsym Mod4+Shift+Up move up

# split in horizontal orientation
 bindsym Mod4+g split h

# split in vertical orientation
bindsym Mod4+v split v

# enter fullscreen mode for the focused container
bindsym Mod4+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym Mod4+s layout stacking
bindsym Mod4+w layout tabbed
bindsym Mod4+e layout toggle split

# toggle tiling / floating
bindsym Mod4+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym Mod4+space focus mode_toggle

# focus the parent container
bindsym Mod4+a focus parent
focus_follows_mouse no

# focus the child container
#bindsym Mod4+d focus child

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod4+minus scratchpad show

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"


# switch to workspace
bindsym Mod4+1 workspace $ws1
bindsym Mod4+2 workspace $ws2
bindsym Mod4+3 workspace $ws3
bindsym Mod4+4 workspace $ws4
bindsym Mod4+5 workspace $ws5
bindsym Mod4+6 workspace $ws6
bindsym Mod4+7 workspace $ws7
bindsym Mod4+8 workspace $ws8
bindsym Mod4+9 workspace $ws9
bindsym Mod4+0 workspace $ws10

# move focused container to workspace
bindsym Mod4+Shift+1 move container to workspace $ws1
bindsym Mod4+Shift+2 move container to workspace $ws2
bindsym Mod4+Shift+3 move container to workspace $ws3
bindsym Mod4+Shift+4 move container to workspace $ws4
bindsym Mod4+Shift+5 move container to workspace $ws5
bindsym Mod4+Shift+6 move container to workspace $ws6
bindsym Mod4+Shift+7 move container to workspace $ws7
bindsym Mod4+Shift+8 move container to workspace $ws8
bindsym Mod4+Shift+9 move container to workspace $ws9
bindsym Mod4+Shift+0 move container to workspace $ws10

# move container
bindsym Mod4+z move workspace to output left
bindsym Mod4+x move workspace to output right

# reload the configuration file
bindsym Mod4+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod4+Shift+r restart

# exit i3 (logs you out of your X session)
bindsym Mod4+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 1 px or 1 ppt
        bindsym Down        resize grow height 1 px or 1 ppt
        bindsym Up          resize shrink height 1 px or 1 ppt
        bindsym Right       resize grow width 1 px or 1 ppt

        # back to normal: Enter or Escape or Mod4+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym Mod4+r mode "default"
}

bindsym Mod4+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
#bar {
#        status_command i3status
#        position top
#
#        colors {
#            background #404552
#
#            focused_workspace #3685e2 #3685e2 #fafafa
#            active_workspace #5294e2 #5294e2 #fafafa
#            inactive_workspace #404552 #404552 #fafafa
#            urgent_workspace #ff5757 #ff5757 #fafafa
#        }
#}

########## Styling ##########

client.focused          #ef5350 #AB47BC #fafafa #ef5350
client.focused_inactive #666666 #222222 #eeeeee #222222
client.unfocused        #ef5350 #222222 #eeeeee #222222
client.urgent           #ff5757 #AB47BC #ffffff
client.background       #404552

########## i3-gaps integration ##########

for_window [class="^.*"] border pixel 2
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [title="Preferences$"] floating enable

#smart_gaps on
smart_borders no_gaps
gaps inner 20
gaps outer 5
