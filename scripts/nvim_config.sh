#!/bin/bash

#sudo add-apt-repository ppa:neovim-ppa/unstable
#sudo apt-get update
#sudo apt-get install neovim clangd python node-js xclip fd-find ripgrep

###############################################################################
# Install neovim and dependencies: nodejs, xlip, fd, and ripgrep
###############################################################################
sudo zypper in neovim nodejs xclip fd ripgrep 

###############################################################################
# Clone packer down for neovim
###############################################################################
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

###############################################################################
# Link nvim folder into .config
###############################################################################

ln -s ~/.dotfiles/nvim ~/.config/
