#!/bin/bash

# install fish
sudo apt-get install fish

# set as default shell
fish_path=$(which fish)
chsh -s "$fish_path"

# configure fish
fish -c conda init fish
fish -c fish_add_path /opt/homebrew/bin

# setup nvim
sudo apt-get install neovim
rm -rf ~/.config/nvim
cp -r ./nvim ~/.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install python language server
pip install -U jedi-language-server

# install ripgrep for telescope
sudo apt-get install ripgrep
