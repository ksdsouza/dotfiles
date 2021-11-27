sudo dnf install -y fish curl fzf
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
