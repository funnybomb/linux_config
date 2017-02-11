#sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install google-chrome-stable
## /usr/bin/google-chrome-stable find chrome and lock it
#sudo apt-get install supervisor 
#sudo apt install shadowsocks
sudo cp ./ss_bwg_2017.json /etc/supervisor/conf.d/
sudo cp ./ss_supervisor.conf /etc/supervisor/conf.d/
sudo cp /usr/bin/sslocal /bin/
sudo service supervisor restart
sudo sed -i '$i\service supervisor start' /etc/rc.local
ps -ef | grep ssloca
ps -ef | grep supervisor
