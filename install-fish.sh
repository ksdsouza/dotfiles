user=$(whoami)

function uninstall_fish {
    brew uninstall fish
    mv ~/.config/fish/ ~/.config/fish.BACKUP/
    echo "Old zshrc file backed up to ~/.zshrc.backup"
}

function install_fish {
    brew install fish
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    fisher install jorgebucaran/nvm.fish
    fisher install jethrokuan/z
    fisher install PatrickF1/fzf.fish
    fisher install oh-my-fish/plugin-grc
    fisher install evanlucas/fish-kubectl-completions
    fisher install oh-my-fish/plugin-bang-bang
    fisher install edc/bass
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