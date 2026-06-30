#!/bin/bash

# install fish
brew install fish

# set as default shell
fish_path=$(which fish)
chsh -s "$fish_path"

# configure fish
fish -c conda init fish
fish -c fish_add_path /opt/homebrew/bin

# setup nvim
brew install nvim
cp -r ./nvim ~/.config/
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install python language server
pip install -U jedi-language-server

# install ripgrep for telescope
brew install ripgrep

# install tmux
brew install tmux

# install claude code (native installer)
curl -fsSL https://claude.ai/install.sh | bash

# install the tmux-dev session helper (claude/nvim/term windows per repo)
mkdir -p ~/.local/bin
ln -sf "$(pwd)/bin/tmux-dev" ~/.local/bin/tmux-dev
