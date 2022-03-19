user=$(whoami)
brew install zsh
sudo chsh -s /usr/local/bin/zsh "$user"
zsh --version

touch ~/.zshrc
