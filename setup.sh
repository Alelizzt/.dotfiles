#!/bin/bash

if ! command -v stow &> /dev/null
then
    echo "GNU Stow is not installed"
    exit
fi

if ! command -v kitty &> /dev/null
then
    echo "kitty is not installed"
    exit
fi

if ! command -v nvim &> /dev/null
then
    echo "nvim is not installed"
    exit
fi

if ! command -v zsh &> /dev/null
then
    echo "zsh is not installed"
    exit
fi

cd .dotfiles/.config/oh-my-zsh
chmod +x oh-my-zsh.sh

git clone https://github.com/romkatv/powerlevel10k.git ~/.dotfiles/.config/oh-my-zsh/custom/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.dotfiles/.config/oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/.config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-completions.git ~/.dotfiles/.config/oh-my-zsh/custom/plugins/zsh-completions


