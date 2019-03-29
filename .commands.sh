#!/bin/bash 


# improving CLI
#alias cat='bat'
#alias ping='prettyping --nolegend'
source /usr/share/autojump/autojump.bash

alias preview="fzf --preview 'bat --color \"always\" {}'"
alias vm='vim -p $(fzf -m)'
#alias dot='git --git-dir="$HOME/.config/dotgit/repo" --work-tree="$HOME"' 

alias dot='PATH="$HOME/.config/dotgit/bin:$PATH" git --git-dir="$HOME/.config/dotgit/repo" --work-tree="$HOME"'

# add support for ctrl+o to open selected file in VS Code
##export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

#alias du="ncdu  -rr -x --exclude .git --exclude node_modules"

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
xoo(){
  local files
  #IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
   files=$(fzf  --multi )
  IFS=' '
  read -ra ff <<< "$files"
  echo ${ff[@]}
	    for f in "${ff[@]}";do
	     #xdg-open "$ff"  &> /dev/null
	     echo xdg-open "$f"  
	    done
	    
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR


fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
    file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
   # [ "$key" == "ctrl-o" ] && xdg-open "$file" || ${EDITOR:-vim} "$file"
     xdg-open "$file" 
     #echo $(head -2 <<< "$out")
  fi
}


foo() {
  local IFS=$'\n'
  local out=()
    local key
      local file
      
        out=(
	    "$(
	            fzf-tmux \
			              --query="$1" \
				                --exit-0 \
						          --expect=ctrl-o,ctrl-e
		        )"
			  )
			  key="$(head -1 <<< "${out[@]}")"
			  file="$(head -2 <<< "${out[@]}" | tail -1)" || return
		  
		    if [[ "$key" == ctrl-o ]]; then
		        "${OPENER:-xdg-open}" "$file"
		  else
		      "${EDITOR:-vim}" "$file"
	        fi
	}


# - including hidden directories
 fda() {
   local dir
   dir=$(fd -f --type f --hidden | fzf +m) && cd "$dir"
}

# use vim with rg install fzf.vim
# https://www.reddit.com/r/vim/comments/7i1yv8/how_do_you_search_for_a_string_in_all_files_under/

jj() {
    if [[ "$#" -ne 0 ]]; then
	    cd $(autojump $@)
	 return
fi
cd "$(autojump -s | sed '/_____/Q;s/^[0-9,.:]*\s*//' |  fzf --height 40% --reverse --inline-info)" 
}

