#!/bin/env bash
source ../util.sh

e_bold "Installing neovim, build-essential, gcc"
sudo apt install -y neovim build-essential gcc

e_bold "Installing spacevim"
mkdir -p ~/.SpaceVim.d/
curl -sLf https://spacevim.org/install.sh | bash
cp ./spacevim.toml ~/.SpaceVim.d/init.toml
cd ~/.SpaceVim/bundle/vimproc.vim && make
cd -