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
        fisher install jorgebucaran/nvm.fish
        fisher install jethrokuan/z
        fisher install evanlucas/fish-kubectl-completions
        fisher install oh-my-fish/plugin-bang-bang
        fisher install edc/bass
    '
    if fzf --version; then
        fisher install PatrickF1/fzf.fish
    else
        read -p "Install fzf (command line fuzzy finder) (y/N)?" fzf_choice
        case "$fzf_choice" in
            y|Y)
            brew install fzf
            fish -c 'fisher install PatrickF1/fzf.fish'
            ;;
            *)
            ;;
        esac
    fi

    if grc --version; then
        fisher install oh-my-fish/plugin-grc
    else
        read -p "Install grc (generic command colourizer) (y/N)?" grc_choice
        case "$grc_choice" in
            y|Y)
            brew install grc
            fish -c 'fisher install oh-my-fish/plugin-grc'
            ;;
            *)
            ;;
        esac
    fi
}

if fish --version; then
    read -p "Clear initial fish installation (Y/n)?" clear_choice
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

read -p "Set fish as default shell (Y/n)?" default_shell_choice
case "$default_shell_choice" in
    n|N);;
    *) 
    sudo chsh -s `which fish` "$user"
    ;;
esac