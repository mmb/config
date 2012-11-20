command -v rbenv > /dev/null 2>&1 && eval "$(rbenv init -)"

if [[ $(uname) == Darwin ]]; then
  export PATH=$PATH:/usr/local/share/npm/bin
fi
