#!/bin/bash
source ../util.sh

e_bold "Installing neovim"
brew install neovim

e_bold "Installing spacevim"
mkdir -p ~/.SpaceVim.d/
curl -sLf https://spacevim.org/install.sh | bash
cp ./spacevim.toml ~/.SpaceVim.d/init.toml
cd ~/.SpaceVim/bundle/vimproc.vim && make
cd -