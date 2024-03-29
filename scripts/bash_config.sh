mv ~/.bashrc ~/.bashrc.old
ln -s ~/.config/bash/.bashrc ~/.bashrc

sudo cp -r ~/.config/bash /etc/skel/.config/
sudo mv /etc/skel/.bashrc /etc/skel/.bashrc.old
sudo ln -s /etc/skel/.bashrc /etc/skel/.config/bash/.bashrc
sudo mv /root/.bashrc /root/.bashrc.old
sudo cp -r /etc/skel/.config/bash/.bashrc /root/.bashrc
sudo mkdir /root/.config
sudo cp -r /etc/skel/.config/bash /root/.config/ 
sudo apt install fzf

mkdir ~/.ssh
touch ~/.ssh/ssh_key_list

echo "Bash configuration complete, update ssh key list located at"
echo "~/.ssh/ssh_key_list"
echo ""
