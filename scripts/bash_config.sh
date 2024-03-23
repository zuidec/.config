mv ~/.bashrc ~/.bashrc.old
ln -s ~/.config/bash/.bashrc ~/.bashrc

cd ~/.config

touch ~/.ssh/ssh_key_list

echo "Bash configuration complete, update ssh key list located at"
echo "~/.ssh/ssh_key_list"
echo ""
