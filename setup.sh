#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


function ctrl_c() {
    echo -e "\n${redColour}[*]${endColour}${grayColour} Exiting...${endColour}"; sleep 1
    rm $tmp_file 2>/dev/null
    tput cnorm; exit 1
}

if ! command -v stow &> /dev/null
then
    echo -e "\n${yellowColour}[!]${endColour}${grayColour} GNU Stow is not installed${endColour}"
    exit
fi

if ! command -v kitty &> /dev/null
then
    echo -e "\n${yellowColour}[!]${endColour}${grayColour} kitty is not installed${endColour}"
    exit
fi

if ! command -v nvim &> /dev/null
then
    echo -e "\n${yellowColour}[!]${endColour}${grayColour} nvim is not installed${endColour}"
    exit
fi

if [ -f "$HOME/.nvm/nvm.sh" ];
then
    echo -e "\n${greenColour}[+]${endColour}${grayColour} nvm is installed${endColour}"
else
    echo -e "\n${yellowColour}[!]${endColour}${grayColour} nvm is not installed${endColour}"
    exit
fi

if ! command -v zsh &> /dev/null
then
    echo -e "\n${yellowColour}[!]${endColour}${grayColour} zsh is not installed${endColour}"
    exit
fi

cd ~/.dotfiles/.config/oh-my-zsh
chmod +x oh-my-zsh.sh

echo -e "\n${greenColour}[+]${endColour}${grayColour} installing theme${endColour}"
git clone https://github.com/romkatv/powerlevel10k.git ~/.dotfiles/.config/oh-my-zsh/custom/themes/powerlevel10k

echo -e "\n${greenColour}[+]${endColour}${grayColour} installing autosuggestions plugin${endColour}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.dotfiles/.config/oh-my-zsh/custom/plugins/zsh-autosuggestions

echo -e "\n${greenColour}[+]${endColour}${grayColour} installing syntax highlighting plugin${endColour}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/.config/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo -e "\n${greenColour}[+]${endColour}${grayColour} installing completions plugin${endColour}"
git clone https://github.com/zsh-users/zsh-completions.git ~/.dotfiles/.config/oh-my-zsh/custom/plugins/zsh-completions

echo -e "\n${greenColour}[+]${endColour}${grayColour} enable dotfiles${endColour}"
cd ~/.dotfiles
stow .

echo -e "\n${greenColour}[+]${endColour}${grayColour} installing neovim plugins${endColour}"
nvim --headless +PlugInstall +qa
nvim +UpdateRemotePlugins +qa

