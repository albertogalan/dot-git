#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession


export HISTSIZE=5000
export HISTFILESIZE=4000 
export PS1='u@\h'

 export GTK_IM_MODULE=fcitx
 export QT_IM_MODULE=fcitx
 export XMODIFIERS="@im=fcitx"
 export XIM_PROGRAM=/usr/bin/fcitx
fcitx
# to config add more languages config keys fcitx-configtool
 if [ -d /etc/X11/xinit/xinitrc.d ]; then
   for f in /etc/X11/xinit/xinitrc.d/*; do
     [ -x "$f" ] && . "$f"
   done
   unset f
 fi

[[ -f ~/.Xresources ]] && xrdb -merge  ~/.Xresources

 export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

DEFAULT_SESSION='i3 --shmlog-size 0'
#exec dbus-launch $DEFAULT_SESSION
xrandr --output HDMI-1 --auto
exec dbus-launch $DEFAULT_SESSION

/usr/bin/lantern  &> /dev/null &  

