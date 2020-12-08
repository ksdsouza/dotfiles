#!/bin/env bash
source ../util.sh

e_bold "Installing git, tilix, exa, tldr, curl"
sudo apt install -y git tilix exa tldr curl

e_bold "Creating Developer folder"
mkdir -p ~/Developer

e_bold "Installing tilix color scheme + padding"
sudo apt install -y tilix
mkdir -p ~/.config/tilix/schemes/
cp ./color-scheme.tilix.json ~/.config/tilix/schemes/color-scheme-x.tilix.json

# Check if padding enabled in gnome css
mkdir -p ~/.config/gtk-3.0
cat ~/.config/gtk-3.0/gtk.css 2> /dev/null | grep 'vte-terminal' &> /dev/null
is_terminal_padding_present=$?
if [ $is_terminal_padding_present -ne 0 ]; then
    echo 'VteTerminal, TerminalScreen, vte-terminal { padding: 10px }' >> ~/.config/gtk-3.0/gtk.css
fi

e_bold "Uninstalling gnome-terminal"
sudo apt purge -y gnome-terminal

e_bold "Installing Caskaydia Cove Nerd Font"
mkdir ~/.fonts
curl -L \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete%20Mono.ttf \
  --output ~/.fonts/CaskaydiaCoveNerdFontMono.ttf 
curl -L \
  https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/complete/Caskaydia%20Cove%20Regular%20Nerd%20Font%20Complete.ttf \
  --output ~/.fonts/CaskaydiaCoveNerdFont.ttf
