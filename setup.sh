#!/bin/bash

function add_bashrc() {
  SOURCE_STMT="source $(pwd)/bashrc"
  RC_PATH=~/.bashrc
  if [[ -z $(grep "$SOURCE_STMT" $RC_PATH) ]]; then
    (echo $SOURCE_STMT; cat $RC_PATH) > tmp && \
    mv tmp $RC_PATH
  fi
}

ln -f gitignore ~/.gitignore
ln -f gitconfig ~/.gitconfig
add_bashrc
