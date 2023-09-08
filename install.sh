#!/bin/env bash

# Install base packages
if [[ `uname` == "Linux" ]]; then
	./install_linux.deps
fi

# Install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Install chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"
sudo mv ./bin/chezmoi /usr/local/bin/ && rm -rf bin

# Install AstroNvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
