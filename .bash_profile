
#export HISTFILESIZE=5000
#export HISTSIZE=5000

. ~/.bashrc
source /etc/environment
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
PS1="\[\e[32;40m\]\u\[\e[m\]\[\e[32m\]:\[\e[m\]\[\e[32;40m\]\h\[\e[m\] "
export FZF_DEFAULT_COMMAND='find ./ -type f -o -type d -name '.git' -prune -o -name '.cache' -prune'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if command -v most > /dev/null 2>&1; then
    export PAGER="most"
fi

source ~/.commands.sh

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
while true
 do
  startx --
  sleep 10
  lantern  &> /dev/null &  
  sleep 5
 done
fi
alias dot2='git --git-dir="$HOME/.config/dotgit/.git" --work-tree="$HOME"'
