#!/bin/bash

## RC
config_dir=$(dirname "$(readlink -f "$0")")
for f in rc/bashrc rc/vimrc rc/ignore git/gitconfig git/gitignore; do
  ln -f -s \
    "${config_dir}/${f}" \
    "${HOME}/.$(basename "${f}")"
done
mkdir -p "${HOME}/.config/jj"
ln -f -s "${config_dir}/jj/config.toml" "${HOME}/.config/jj/config.toml"
for p in ${config_dir}/jj/confd_*.toml; do
  mkdir -p "${HOME}/.config/jj/conf.d/"
  fname=$(basename "$p")
  ln -f -s \
    "$p" \
    "${HOME}/.config/jj/conf.d/${fname#confd_}"
done
mkdir -p "${HOME}/.vim/colors/"
ln -f -s \
  "${config_dir}/kanagawa-dragon.vim" \
  "${HOME}/.vim/colors/kanagawa-dragon.vim"

## FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
