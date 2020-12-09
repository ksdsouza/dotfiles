#!/bin/bash
source ../util.sh

e_bold "Installing zsh"
brew install zsh

e_bold "Installing zgen"
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

e_bold "Installing starship zsh prompt"
mkdir -p ~/.config
cp ~/.config/starship.toml ~/.config/starship.toml-backup-$(date --iso-8601)

curl -fsSL https://starship.rs/install.sh | bash
cp ./starship.toml ~/.config/starship.toml

e_bold "Copying zshrc file (backup will be created)"
cp ~/.zshrc ~/.zshrc-backup-$(date --iso-8601)
cp ./zshrc ~/.zshrc

e_bold "Setting default shell to zsh"
chsh -s `which zsh` $USER

e_bold "Installing zshrc stuff"
cat <<EOT >> ~/.zshrc
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions
zgen load rupa/z

alias fixup='git commit --fixup HEAD
alias ls='exa --icons'
alias l='exa -la --icons'
EOT
