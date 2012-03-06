# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mmb"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

plugins=(
ant
bundler
gem
git
github
heroku
node
npm
pip
python
rake
ruby
ssh-agent
)

export BROWSER=google-chrome
export EDITOR=vi
export HISTIGNORE=" *"
export RUBYOPT="r rubygems w"
export PYTHONSTARTUP=$HOME/.pythonrc.py

alias bdrop='$BROWSER $HOME/Dropbox'
alias httphead='wget -O /dev/null -q -S'
alias update='sudo sh -c "apt-get update ; apt-get upgrade ; gem1.8 update"'
alias mozrepl='rlwrap telnet localhost 4242'
alias wow='~/.wine/drive_c/Program\ Files/World\ of\ Warcraft/Launcher.exe'

# open rdoc for a ruby core class in a browser, multiword names are converted
# to camel case: (e.g. brdoc argument error)
function brdoc {
  CLASS=`echo "$*" | sed 's/\(^\| \+\)\([a-z]\)/\u\2/g'`
  $BROWSER http://ruby-doc.org/core/classes/${CLASS}.html
}

# convert a unix time to a readable time
function epoch {
  date -d @$1
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

# open a local port that tunnels to a remote rdp server, then rdesktop to
# the remote rdp server via the tunnel
# example: rdptun 3390 jump_server rdp_server 1680x1050 rdp_user
function rdptun {
  ssh -C -f -L localhost:$1:$3:3389 -N $2
  rdesktop -g $4 -u $5 localhost:$1
}

# open a sock5 proxy listening locally and sending requests through a tunnel
function sockstun {
  ssh -C -f -D localhost:1080 -N $1
}

# extract audio from a video file and save in mp3
function vid2mp3 {
  VIDEO=$1
  MP3=${VIDEO%.*}.mp3
  ffmpeg -i ${VIDEO} -vn -ar 44100 -ac 2 -ab 192 -f mp3 ${MP3}
}

# open a tunnel to a remote host for an x11vnc
function x11vnctun {
  ssh -t -L 5900:localhost:5900 $1 "x11vnc -usepw -localhost -xkb"
}

set_pagers

PATH=$PATH:$HOME/.rvm/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

[[ -f ~/zsh_private.sh ]] && . ~/zsh_private.sh
