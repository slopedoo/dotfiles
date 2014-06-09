EDITOR="mousepad"

PS1='\u@\h \[\e[7m\]\w\[\e[0m\] -> '

export PROMPT_COMMAND='q="- $(date +%T)"; while [[ ${#q} -lt $COLUMNS ]]; do q="${q:0:1}$q"; done; echo -e "\033[0;90m$q\033[0;0m";'

if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

echo ""
if [ -f /usr/bin/screenfetch ]; then screenfetch; fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

#-----------------
# Import aliases
#-----------------
source ~/.aliasrc
alias aliasrc="$EDITOR ~/.aliasrc"

#-----------------
# Functions
#-----------------

# usage: extract <file>
extract ()
{
  if [ -f "$1" ] ; then
case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.Z) uncompress "$1";;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted via ex()" ;;
    esac
else
echo "'$1' is not a valid file"
  fi
}

function mkdircd() { mkdir $1; cd $1; }

function foldersize() { du -hd 1 $@ | sort -h | tail -n 21 | head -n 20; }

myip() {
/sbin/ifconfig | grep "inet 192"
wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
}

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}