
#export PATH="$HOME/.cargo/bin:$PATH"
# include .bashrc if it exists
#if [ -f "$HOME/.bashrc" ]; then
#    . "$HOME/.bashrc"
#fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Startx Automatically
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty4 ]]; then
. startx
logout
fi
