#!/bin/sh

# allow vim to be used as a pager and accept input through stdin
# or as filename args

LESS_MACRO=''
# places to look for less.vim
for POSSIBLE in \
  /usr/share/vim/vim72/macros/less.vim \
  /usr/share/vim/vim73/macros/less.vim
do
  if [ -e ${POSSIBLE} ]; then
    LESS_MACRO="-u ${POSSIBLE} "
    break
  fi
done

if [ ! -t 0 ]; then
  # input on stdin
  # exit if the buffer is empty
  vim -R -c 'if line2byte(line("$") + 1) == 2 | q | endif' ${LESS_MACRO}-
else
  # input as args
  # exit if the buffer is empty
  if [ "$@" ]; then
    vim -R -c 'if line2byte(line("$") + 1) == 2 | q | endif' ${LESS_MACRO}$@
  fi
fi
