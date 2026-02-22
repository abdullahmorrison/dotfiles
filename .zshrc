export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

source $HOME/.aliases && echo "🔗 aliases linked"

if [ ! -f "$HOME/.env" ]; then
    touch "$HOME/.env" && echo "➕ Created empty .env at $HOME"
fi
source $HOME/.env && echo "🔗 local .env linked"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh && echo "🔗 zsh highlights linked"
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh && echo "🔗 zsh suggestions linked"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && echo "⌛ nvm loaded"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
