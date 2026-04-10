#!/bin/bash

## RC
config_dir=$(dirname "$(readlink -f "$0")")
for f in rc/bashrc rc/vimrc rc/ignore git/gitconfig git/gitignore; do
  ln -f --symbolic \
    "${config_dir}/${f}" \
    "${HOME}/.$(basename "${f}")"
done
mkdir -p "${HOME}/.config/jj"
ln -f --symbolic "${config_dir}/jj/config.toml" "${HOME}/.config/jj/config.toml"
for p in ${config_dir}/confd_*.toml; do
  mkdir -p "${HOME}/.config/jj/conf.d/"
  fname=$(basename "$p")
  ln -f --symbolic \
    "$p" \
    "${HOME}/.config/jj/conf.d/${fname#confd_}"
done
mkdir -p "${HOME}/.vim/colors/"
ln -f --symbolic \
  "${config_dir}/kanagawa_dragon.vim" \
  "${HOME}/.vim/colors/kanagawa_dragon.vim"

## FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
