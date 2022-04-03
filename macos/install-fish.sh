#!/bin/bash
user=$(whoami)

function uninstall_fish {
    brew uninstall fish
    mv ~/.config/fish/ ~/.config/fish.BACKUP/
    echo "Old zshrc file backed up to ~/.zshrc.backup"
}

function install_fish {
    brew install fish
    echo "Installing fish plugins:"
    fish -c '
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
        fisher install \
            jorgebucaran/nvm.fish \
            jethrokuan/z \
            evanlucas/fish-kubectl-completions \
            oh-my-fish/plugin-bang-bang edc/bass
    '
    if fzf --version &> /dev/null; then
        fisher install PatrickF1/fzf.fish
    else
        read -p "Install fzf (command line fuzzy finder) (y/N)? " fzf_choice
        case "$fzf_choice" in
            y|Y)
            brew install fzf
            fish -c 'fisher install PatrickF1/fzf.fish'
            ;;
            *)
            ;;
        esac
    fi

    if grc --version &> /dev/null; then
        fisher install oh-my-fish/plugin-grc
    else
        read -p "Install grc (generic command colourizer) (y/N)? " grc_choice
        case "$grc_choice" in
            y|Y)
            brew install grc
            fish -c 'fisher install oh-my-fish/plugin-grc'
            ;;
            *)
            ;;
        esac
    fi
    echo 'Installing vi key bindings:'
    echo 'fish_vi_key_bindings' >> ~/.config/fish/config.fish
}

if fish --version &> /dev/null; then
    read -p "Clear initial fish installation (Y/n)? " clear_choice
    case "$clear_choice" in
        n|N);;
        *) 
        uninstall_fish
        install_fish
        ;;
    esac
else
    install_fish
fi

curl -sS https://starship.rs/install.sh | sh
echo 'starship init fish | source' >> ~/.config/fish/config.fish

if [ -f "~/.config/starship.toml" ]; then
    read -p "Starship config file already exists. Replace (y/N)?" choice
    case "$choice" in 
        y|Y ) mv ./resources/starship.toml ~/.config/starship.toml;;
        * ) ;;
    esac 
else
    mv ./resources/starship.toml ~/.config/starship.toml
fi


read -p "Set fish as default shell (Y/n)?" default_shell_choice
case "$default_shell_choice" in
    n|N);;
    *) 
    sudo chsh -s `which fish` "$user"
    ;;
esac