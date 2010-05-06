export EDITOR=vi
export HISTIGNORE=" *"
export RUBYOPT=rubygems

alias httphead='wget -O /dev/null -q -S'
alias update='sudo sh -c "apt-get update ; apt-get upgrade ; gem1.8 update"'
alias mozrepl='rlwrap telnet localhost 4242'
alias wow='~/.wine/drive_c/Program\ Files/World\ of\ Warcraft/Launcher.exe'

# open rdoc for a ruby core class in Firefox, multiword names are converted to
# camel case: (e.g. brdoc argument error)
function brdoc {
  CLASS=`echo "$*" | sed 's/\(^\| \+\)\([a-z]\)/\u\2/g'`
  firefox http://ruby-doc.org/core/classes/${CLASS}.html
}

function git_count_unpushed {
  git status 2> /dev/null | sed -n "s/# Your branch is ahead of '.\+' by \([0-9]\+\) commits\?\./\(\\1 unpushed\)/p"
}

function set_pagers {
  `which more > /dev/null` &&
    PAGER=more
  `which less > /dev/null` &&
    PAGER=less
  `which vim > /dev/null` &&
    PAGER="${HOME}/bin/vim_pager.sh" &&
    export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
      vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
      -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
      -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

  export PAGER
  alias less=\$PAGER
  alias more=\$PAGER
}

# open a tunnel to a remote host for an x11vnc
function x11vnctun {
  ssh -t -L 5900:localhost:5900 $1 "x11vnc -usepw -localhost"
}

BLUE='\e[0;34m'
GREEN='\e[0;32m'
PURPLE='\e[0;35m'
BRIGHT_PURPLE='\e[1;35m'
RESET='\e[0m'

PS1="${debian_chroot:+($debian_chroot)}\u@\h "
# show number of background jobs if any
PS1="${PS1}\$(jobs | wc -l | sed -n 's/^\([1-9][:digit:]*\)/\[${BRIGHT_PURPLE}\]\1\[${PURPLE}\]bg\[${RESET}\] /p')"
PS1="${PS1}\[${BLUE}\]\w\[${RESET}\]"
# current git branch
PS1="${PS1}\$(git branch 2>/dev/null | sed -n 's/^\* \(.*\)/ git:\[${GREEN}\]\1\[${RESET}\]/p')\$(git_count_unpushed)"
PS1="${PS1}\$ "

set_pagers

. ~/mybash_private.sh
