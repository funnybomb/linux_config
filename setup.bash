# run this in the folder path
cp ./rc_files/screenrc ~/.screencr
cp ./rc_files/bashrc ~/.bashrc
cp ./rc_files/bash_profile ~/.bash_profile
cp ./rc_files/vimcr ~/.bash_profile
cp ./gitconfig ~/.gitconfig
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp -r ./ssh/* ~/.ssh/ #config pubs authorized_keys
chmod 600 ~/.ssh/authorized_keys


