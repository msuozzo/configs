#!/bin/sh

## RC
config_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
for f in rc/shrc rc/bashrc rc/zshrc rc/vimrc rc/ignore git/gitconfig git/gitignore; do
  ln -f -s \
    "${config_dir}/${f}" \
    "${HOME}/.$(basename "${f}")"
done
mkdir -p "${HOME}/.config/jj"
ln -f -s "${config_dir}/jj/config.toml" "${HOME}/.config/jj/config.toml"
for p in "${config_dir}"/jj/confd_*.toml; do
  mkdir -p "${HOME}/.config/jj/conf.d/"
  fname=$(basename "$p")
  ln -f -s \
    "$p" \
    "${HOME}/.config/jj/conf.d/${fname#confd_}"
done
mkdir -p "${HOME}/.vim/colors/" "${HOME}/.vim/cache/"
ln -f -s \
  "${config_dir}/kanagawa-dragon.vim" \
  "${HOME}/.vim/colors/kanagawa-dragon.vim"

## FZF
[ -d "${HOME}/.fzf" ] || git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}/.fzf"
