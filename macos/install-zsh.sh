#!/bin/bash
user=$(whoami)

function uninstall_zsh {
    brew uninstall zsh
    mv ~/.zshrc ~/.zshrc.backup
    echo "Old zshrc file backed up to ~/.zshrc.backup"
}


function install_fzf {
    if fzf --version &> /dev/null; then
        echo 'zgenom load unixorn/fzf-zsh-plugin' >> ~/.zshrc
        fisher install PatrickF1/fzf.fish
    else
        read -p "Install fzf (command line fuzzy finder) (y/N)? " fzf_choice
        case "$fzf_choice" in
            y|Y)
            brew install fzf
            echo 'zgenom load unixorn/fzf-zsh-plugin' >> ~/.zshrc
            ;;
            *)
            ;;
        esac
    fi
}

function install_zsh {
    brew install zsh
    # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
    cp resources/zshrc.template ~/.zshrc
    install_fzf
}

if zsh --version &> /dev/null; then
    read -p "Clear initial zsh installation (Y/n)? " clear_choice
    case "$clear_choice" in
        n|N);;
        *) 
        uninstall_zsh
        install_zsh
        ;;
    esac
else
    install_zsh
fi

curl -sS https://starship.rs/install.sh | sh

if [ -f "~/.config/starship.toml" ]; then
    read -p "Starship config file already exists. Replace (y/N)? " choice
    case "$choice" in 
        y|Y ) mv ./resources/starship.toml ~/.config/starship.toml;;
        * ) ;;
    esac 
else
    mv ./resources/starship.toml ~/.config/starship.toml
fi

read -p "Set zsh as default shell (Y/n)? " default_shell_choice
case "$default_shell_choice" in
    n|N);;
    *) 
    sudo chsh -s /usr/local/bin/zsh "$user"
    ;;
esac
