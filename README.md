# .dotfiles
How I set up my WSL system from scratch.

## Get Started
Start with updating the distro
```
sudo apt update
```
Install git to be able to clone this repo.
```
sudo apt install git -y
```
Install ansible. This is the tool that will automate the rest of the installations
```
sudo apt install -y ansible
```
Clone the repo and its submodules (neovim repo) within the code directory of the root folder (my preferred place to store git repos). It will be made if it doesn't already exist
```
mkdir -p $HOME/code && cd $HOME/code
git clone --recurse-submodules -j8 https://github.com/abdullahmorrison/dotfiles.git 
cd dotfiles
```
Note: -j8 is an optional performance optimization that became available in version 2.8, and fetches up to 8 submodules at a time in parallel
overwrite: n 

Run the ansible playbook to install all required libraries in sudo and, when prompted, give your sudo password.
```
ansible-playbook .bootstrap/setup.yml --ask-become-pass
```
then use [GNU Stow](https://www.youtube.com/watch?v=y6XCebnB9gs) to create the symlinks to the `$HOME` directory (putting linked copies of the dotfiles where they belong)
```
stow -t $HOME .
```
install nvm
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
```
install neovim
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```
install starship
```
curl -sS https://starship.rs/install.sh | sh
```
Change your default shell from bash to zsh. Then restart your terminal
```
chsh -s /bin/zsh
exit
```

## Set up
### Git
set up git config
```
git config --global user.email abdullahmorrison@gmail.com
git config --global user.name "Abdullah Morrison"
```
gh was installed through the ansible playbook. Set up your git authentication by running the following command.
```
gh auth login
```
after answering the questions given, you will receive an auth code. Insert the given code to [github.com/login/device](https://github.com/login/device)

### Tmux
open tmux and run the following to set up keybinding and settings and open tmux
```
tmux source ~/.config/tmux/tmux.conf
tmux
```
Within tmux, run `<prefix>-I` to install tmux themes and dependencies
## Install Nerd Fonts to WSL
1. [Download the nerd font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip) (this download link is for JetBrainsMono)
2. Extract the downloaded zip in your downloads folder
3. Go to Settings > Personalization > Fonts
4. Click Browse and install fonts. It will open an explorer, go to the downloads folder and select all the files within the extracted font folder and click accept
5. Open your terminal
6. Open the terminal settings (`ctrl ,`)
7. Navigate to your WSL Profile (Ubuntu)
8. Under font face, select the font you downloaded
9. Click Save

## Troubleshoot
run the following command if you already have some file in your $HOME dir that is in your .dotfiles. 
```
stow --adopt .
```
This moves any conflicting files to the .dotfiles directory
Prompt flow: Concise 1
Enable transient prompt: yes y
Instant Prompt mode: verbose 1

