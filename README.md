# .dotfiles
How I set up my system from scratch.

[GNU Stow](https://www.youtube.com/watch?v=y6XCebnB9gs) is used to symlink files to the `$HOME` directory.

## Requirements
Ensure you have the following installed on your system

### Git
```
sudo apt install git
```

### Ansible
```
sudo apt-get update
sudo apt-get install -y ansible

```
## Installation
Naviagte to your root directory and clone the repo
```
cd $HOME
git clone https://github.com/abdullahmorrison/dotfiles.git
cd dotfiles
```

Run Ansible playbook to install all required libraries
```
ansible-playbook .bootstrap/setup.yml --ask-become-pass
```

then use GNU stow to create the symlinks
```
stow .
```

To set up your .zshrc config & aliases run the following cmd
```
source $HOME/.zshrc
```

## Set up
### Git
gh was installed through the ansible playbook. Set up your git authentication by running the following command.
```
gh auth login
```
after answering the questions given, you will recieve an auth code. Insert the given code to [github.com/login/device](https://github.com/login/device)

### Tmux
open tmux and run the following to set up keybinding and settings
```
tmux source ~/.config/tmux/tmux.conf
```
then navigate to the tmux.conf file and run `<prefix>-I` to install tmux themes and dependencies
```
cd  ~/.config/tmux/tmux.conf
```
### Nvim
go to https://github.com/abdullahmorrison/nvim to view setup

Install submodules with the following commands
```
git submodule init
git submodule update
```

## Trouble Shoot
run the following command if you already have some file in your $HOME dir that is in your .dotfiles. 
```
stow --adopt .
```
This moves any conflicting files to the .dotfiles directory
