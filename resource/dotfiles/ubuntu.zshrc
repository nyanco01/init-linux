prompt() {
    PS1="$(powerline-rs --shell zsh $?)"
}
precmd_functions+=(prompt)

autoload -U compinit
compinit

eval "$(sheldon source)"

ping -c 1 1.1.1.1 > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
    ACTIVE_IF=$(ip route get 1.1.1.1 | xargs -n1 echo | sed -n 5p)
fi

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:/opt/nvim-linux64/bin"
