pkill -f volctl 
pkill -f blueman-applet
pkill -f nm-applet

blueman-applet &
nm-applet --indicator &
volctl &
