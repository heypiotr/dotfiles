#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# bash
ln -sfvnT ${BASEDIR}/bashrc ~/.bashrc
ln -sfvnT ${BASEDIR}/bash_profile ~/.bash_profile
ln -sfvnT ${BASEDIR}/inputrc ~/.inputrc

# vim
ln -sfvnT ${BASEDIR}/vimrc ~/.vimrc
ln -sfvnT ${BASEDIR}/vim ~/.vim

# git
ln -sfvnT ${BASEDIR}/gitconfig ~/.gitconfig
ln -sfvnT ${BASEDIR}/gitignore.global ~/.gitignore.global

# ruby
ln -sfvnT ${BASEDIR}/gemrc ~/.gemrc
