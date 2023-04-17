#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
ln -sfvn ${BASEDIR}/bashrc ~/.bashrc
ln -sfvn ${BASEDIR}/bash_profile ~/.bash_profile
ln -sfvn ${BASEDIR}/inputrc ~/.inputrc

# git
ln -sfvn ${BASEDIR}/gitconfig ~/.gitconfig
ln -sfvn ${BASEDIR}/gitignore.global ~/.gitignore.global

# irb
ln -sfvn ${BASEDIR}/irbrc ~/.irbrc

# mitmproxy
mkdir -p ~/.mitmproxy
ln -sfvn ${BASEDIR}/mitmproxy_config.yaml ~/.mitmproxy/config.yaml

# ruby
ln -sfvn ${BASEDIR}/gemrc ~/.gemrc

# ssh
mkdir -p ~/.ssh/multiplex
ln -sfvn ${BASEDIR}/ssh_config ~/.ssh/config

# vim
ln -sfvn ${BASEDIR}/vimrc ~/.vimrc
ln -sfvn ${BASEDIR}/vimrc.plug ~/.vimrc.plug
[[ ! -f ~/.vim/autoload/plug.vim ]] && \
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
  && vim -u ~/.vimrc.plug +PlugInstall +qall

# zephyr
ln -sfvn ${BASEDIR}/zephyrrc ~/.zephyrrc
