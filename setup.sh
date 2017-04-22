#!/bin/bash

## RC
function add_bashrc() {
  SOURCE_STMT="source $(pwd)/rc/bashrc"
  RC_PATH=~/.bashrc
  if [[ -z $(grep "$SOURCE_STMT" $RC_PATH) ]]; then
    (echo $SOURCE_STMT; cat $RC_PATH) > tmp && \
    mv tmp $RC_PATH
  fi
}

ln -f rc/vimrc ~/.vimrc
ln -f rc/latexmkrc ~/.latexmkrc
add_bashrc

## Git
ln -f git/gitignore ~/.gitignore
ln -f git/gitconfig ~/.gitconfig

## Virtualenv
VENV_DIR=~/.virtualenvs
if [[ -e $VENV_DIR ]]; then
  ln -f virtualenv/postactivate $VENV_DIR/postactivate
  ln -f virtualenv/postdeactivate $VENV_DIR/postdeactivate
fi

## FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
