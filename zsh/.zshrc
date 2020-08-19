# zgen initialization
source "${HOME}/.zgen/zgen.zsh"
# if the init scipt doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh

  # generate the init script from plugins above
  zgen save
fi


# Plugins
zgen load zsh-users/zsh-syntax-highlighting
zgen load denysdovhan/spaceship-prompt spaceship
zgen load zsh-users/zsh-autosuggestions
zgen load dracula/zsh

# Aliases
alias uwcs="ssh ksdsouza@linux.student.cs.uwaterloo.ca"
alias cdw="cd ~/Developer"
