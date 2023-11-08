mv ~/.bashrc ~/.bashrc.old
ln -s ~/.config/bash/.bashrc ~/.bashrc

cd ~/.config

git submodule init
git submodule update

touch ~/.ssh/ssh_key_list

echo "Bash configuration complete, update ssh key list located at"
echo "~/.ssh/ssh_key_list"
echo ""
