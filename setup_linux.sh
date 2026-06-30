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
# apt only ships neovim 0.6.1, too old for this config (needs 0.8+).
# Install latest stable user-local instead.
curl -fsSL -o /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz
tar xzf /tmp/nvim.tar.gz -C /tmp
rm -rf ~/.local/nvim-app
mv /tmp/nvim-linux-x86_64 ~/.local/nvim-app
mkdir -p ~/.local/bin
ln -sf ~/.local/nvim-app/bin/nvim ~/.local/bin/nvim
# ensure ~/.local/bin is on PATH for fish
fish -c 'fish_add_path ~/.local/bin'
rm -rf ~/.config/nvim
cp -r ./nvim ~/.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
~/.local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install python language server
pip install -U jedi-language-server

# install ripgrep for telescope
sudo apt-get install ripgrep
