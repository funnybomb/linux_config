# run this in the folder path
cp ./screenrc ~/.screencr
cp ./bashrc ~/.bashrc
cp ./bash_profile ~/.bash_profile
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cp -r ./ssh/* ~/.ssh/ #config pubs authorized_keys
chmod 600 ~/.ssh/authorized_keys


