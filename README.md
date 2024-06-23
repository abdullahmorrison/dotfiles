# .dotfiles
How I set up my system from scratch.

[GNU Stow](https://www.youtube.com/watch?v=y6XCebnB9gs) is used to symlink files to the `$HOME` directory.

## Requirements
Ensure you have the following installed on your system

### Git
```
sudo apt install git
```

### GNU Stow
```
sudo apt install stow
```
## Installation
First, checkout the dotfiles repo in your $HOME/code directory using git
```
git clone https://github.com/abdullahmorrison/.dotfiles.git
cd .dotfiles
```
then use GNU stow to create the symlinks
```
stow .
```
To set up your .zshrc config & aliases run the following cmd
```
source $HOME/.zshrc
```

## Trouble Shoot
run the following command if you already have some file in your $HOME dir that is in your .dotfiles. 
```
stow --adopt .
```
This moves any conflicting files to the .dotfiles directory
