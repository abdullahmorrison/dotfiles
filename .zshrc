export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

source $HOME/.aliases

if [ ! -f "$HOME/.env" ]; then
    touch "$HOME/.env" && echo "➕ Created empty .env at $HOME"
fi
source $HOME/.env

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
