mv ~/.bashrc ~/.bashrc.old
ln -s ~/.config/bash/.bashrc ~/.bashrc

cd ~/.config

git submodule init
git submodule update
