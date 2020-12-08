#!/bin/env bash
source ../util.sh

e_header 'Setting up dev environment'
./install-dev.sh

e_header 'Installing zsh'
./install-zsh.sh

e_header 'Installing vim'
./install-vim.sh