export EDITOR=vi
export HISTIGNORE=" *"

alias update='sudo sh -c "apt-get update ; apt-get upgrade ; gem1.8 update"'

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
PS1="${PS1}\$(git branch 2>/dev/null | sed -n 's/^\* \(.*\)/ git:\[${GREEN}\]\1\[${RESET}\]/p')"
PS1="${PS1}\$ "

. ~/mybash_private.sh

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

set_pagers

alias mozrepl='rlwrap telnet localhost 4242'
alias wow='~/.wine/drive_c/Program\ Files/World\ of\ Warcraft/Launcher.exe'

# open rdoc for a ruby core class in Firefox, multiword names are converted to
# camel case: (e.g. brdoc argument error)
function brdoc {
  CLASS=`echo "$*" | sed 's/\(^\| \+\)\([a-z]\)/\u\2/g'`
  firefox http://ruby-doc.org/core/classes/${CLASS}.html
}

# open a tunnel to a remote host for an x11vnc
function x11vnctun {
  ssh -t -L 5900:localhost:5900 $1 "x11vnc -usepw -localhost"
}
