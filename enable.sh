#!/usr/bin/env bash

# Install oh-my-zsh and modules
if [[ -d '~/.oh-my-zsh' ]]; then
  cd ~ && mv -f ~/.oh-my-zsh ~/.oh-my-zsh.previous
fi
cd ~ && git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install vim and vim modules
if [[ -d '~/.vim' ]]; then
  cd ~ && mv -f ~/.vim ~/.vim.previous
fi
cd ~ && git clone git://github.com/akitaonrails/vimfiles.git ~/.vim
cd ~/.vim && git submodule update --init
cd ~/.vim && git pull --recurse-submodules

# Install TMUX Plugin Manager
if [[ -d '~/.tmux' ]]; then
  cd ~ && mv -f ~/.tmux ~/.tmux.previous
fi
cd ~ && mkdir -p ~/.tmux/plugins
cd ~ && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
