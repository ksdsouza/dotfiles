user=$(whoami)

read -p "Clear initial zsh installation (Y/n)?" clear_choice
case "$clear_choice" in
    y|Y )
        brew uninstall zsh
        mv ~/.zshrc ~/.zshrc.backup
        echo "Old zshrc file backed up to ~/.zshrc.backup"
        ;;
    *);;
esac


brew install zsh
sudo chsh -s /usr/local/bin/zsh "$user"
zsh --version

touch ~/.zshrc

curl -sS https://starship.rs/install.sh | sh

echo 'eval "$(starship init zsh)"' >> ~/.zshrc

if [ -f "~/.config/starship.toml" ]; then
    mv ./resources/starship.toml ~/.config/starship.toml
else
    read -p "Starship config file already exists. Replace (y/N)?" choice
    case "$choice" in 
        y|Y ) mv ./resources/starship.toml ~/.config/starship.toml;;
        * ) ;;
    esac
fi
