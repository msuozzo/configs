#!/bin/bash

## RC
config_dir=$(dirname "$(readlink -f "$0")")
for f in rc/bashrc rc/vimrc git/gitconfig git/gitignore; do
  ln -f --symbolic \
    "${config_dir}/${f}" \
    "${HOME}/.$(basename "${f}")"
done
mkdir -p "${HOME}/.config/jj"
ln -f --symbolic "${config_dir}/jj/config.toml" "${HOME}/.config/jj/config.toml"

## FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
