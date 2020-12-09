#!/bin/bash
source ../util.sh

e_bold "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

e_bold "Installing iterm, exa, tldr, curl"
brew install exa tldr
brew cask install iterm2

e_bold "Creating Developer folder"
mkdir -p ~/Developer

# e_bold "Installing tilix color scheme + padding"
# sudo apt install -y tilix
# mkdir -p ~/.config/tilix/schemes/
# cp ./color-scheme.tilix.json ~/.config/tilix/schemes/color-scheme-x.tilix.json

e_bold "Installing Caskaydia Cove Nerd Font"
curl -L \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.ttf \
  --output /Library/Fonts/CaskaydiaCoveNerdFontMono.ttf 
curl -L \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.ttf \
  --output /Library/Fonts/CaskaydiaCoveNerdFont.ttf


e_bold "Setting up git"
git config --global credential.helper osxkeychain
git config --global user.email "ksdsouza@uwaterloo.ca"
git config --global user.name "Katie Dsouza"

