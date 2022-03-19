user=$(whoami)
brew install zsh
sudo chsh -s /usr/local/bin/zsh "$user"
zsh --version

touch ~/.zshrc

curl -sS https://starship.rs/install.sh | sh

echo 'eval "$(starship init zsh)"' >> ~/.zshrc
