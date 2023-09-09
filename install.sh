#!/bin/bash

set -x

# Install base packages
if [[ `uname` == "Linux" ]]; then
	./install_linux.deps
else
	./install_osx.deps
fi

# Install zplug
rm -rf ~/.zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"
sudo mv ./bin/chezmoi /usr/local/bin/ && rm -rf bin

# Install AstroNvim
mv ~/.config/nvim ~/.config/nvim_bak
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
