#!/bin/bash

###############################################################################
# Move old bashrc and link the one from the repo
###############################################################################
mv ~/.bashrc ~/.bashrc.old
ln -s ~/.config/bash/.bashrc ~/.bashrc

###############################################################################
# Set up root bashrc and change the skel files so new users will have bashrc 
###############################################################################
sudo cp -r ~/.config/bash /etc/skel/.config/
sudo mv /etc/skel/.bashrc /etc/skel/.bashrc.old
sudo ln -s /etc/skel/.bashrc /etc/skel/.config/bash/.bashrc
sudo mv /root/.bashrc /root/.bashrc.old
sudo cp -r /etc/skel/.config/bash/.bashrc /root/.bashrc
sudo mkdir /root/.config
sudo cp -r /etc/skel/.config/bash /root/.config/ 

###############################################################################
# Install fzf for neovim
###############################################################################
sudo zypper in fzf
#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#~/.fzf/install

###############################################################################
# Make temp directory and clone blesh for install to ~/.local 
###############################################################################
mkdir ~/temp
cd ~/temp
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

###############################################################################
# Set up ssh key list for the ssh-agent
###############################################################################
mkdir ~/.ssh
touch ~/.ssh/ssh_key_list

###############################################################################
# Link the tmux conf file from the repo
###############################################################################
ln -s ~/.config/tmux/.tmux.conf ~/.tmux.conf


echo "Bash configuration complete, update ssh key list located at"
echo "~/.ssh/ssh_key_list"
echo ""
