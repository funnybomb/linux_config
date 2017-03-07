# linux_config
linux_config

***
[TOC]

***

this project is to setup ubuntu 16.04 system configuration
including
1. bashrc
2. vimrc
3. screenrc
4. gitconfig (to be done)
5. NVIDIA driver setup (to be done)
6. etc

## install

git clone https://github.com/funnybomb/linux_config.git

### rc config
cd linux config && bash setup_vim_screen_bash.sh

### ss config and install chrome GFW in china
cd ss_config && bash shadowsocks_config.sh


# ubuntu 16.04.01 setup & config

@(编程code示例)

## 下载安装
1. 参考[linux公社](http://www.linuxidc.com/Linux/2016-04/130520.htm)下载[usb installer](https://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/)
2. 下载[iso](http://mirrors.163.com/ubuntu-releases/16.04.1/), 使用amd64, 因为i386是32位
3. 在windows下使用usb installer把iso安装到空的U盘
4. 安装的时候最好还是选中文, full install
5. 安装完成之后根据需求再换回来

***
## ssh vim screen bash 配置

*  推荐使用linux_config来进行安装

```
git clone https://github.com/funnybomb/linux_config.gita 
cd linux config && bash xx.sh
```
	

***

1. 开启ssh, 并且添加到自动启动

	```bash
	sudo apt-get install sshd
	sudo sed -i '$i\/etc/init.d/ssh start' /etc/rc.local
	#insert /etc/init.d/ssh before last line
	mkdir ~/.ssh && chmod 700 ~/.ssh
	scp remote:~/.ssh/remote_id_rsa.pub ./ssh
	cat remote_id_rsa.pub >>authorized_keys
	chmod 600 authorized_keys
	#本地免密登录remote
	ssh-keygen -t rsa
	scp local_id_rsa.pub remote:~/.ssh
	```
***
## 安装中国源 升级ubuntu软件  
```
cd /etc/apt/
sudo cp sources.list sources.list.bak
sudo vi sources.list
```

deb http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse


```bash
sudo apt-get update
sudo apt-get upgrade hold adobe-flashplugin
```

****

## 驱动和cuda
1. 安装NVIDIA驱动, 首先去英伟达[官网](http://www.geforce.com/drivers)选择合适的对应稳定版本 NVIDIA-xx.run
```bash
sudo apt-get purge nvidia-current
sudo apt-get --purge remove xserver-xorg-video-nouveau
logout
ctrl+alt+F1
sudo service lightdm stop # or gdm or lightxxx
#ps -ef | grep dm to check x-service and lightdm类服务 
killall xorg
chmod 777 NVIDIA-xx.run
sudo sh NVIDIA-xx.run
```
2. 安装CUDA, [官方链接](https://developer.nvidia.com/cuda-downloads)
下载
```
proxychains wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
```

- [ ] 最好参考如下[链接](https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07)和[链接](https://devtalk.nvidia.com/default/topic/907218/how-to-disable-nouveau-driver-to-install-nvidia-drivers-distribution-kali-linux-2-0/)

- [x] centos的参考如下[链接](https://aspratyush.wordpress.com/2012/06/29/revisiting-nvidia-driver-and-cuda-toolkit-install-in-fedoa-17-centos-6/)
 
*** 
## chrome 安装和翻墙
* 最佳办法, 使用我的脚本安装
```bash
git clone zxcv
cd 
```

***

1. 安装chrome, 启动后 Launcher 上，在图标上右键——“锁定到启动器”，以后就可以简单地单击启动了。
```bash
sudo wget http://www.linuxidc.com/files/repo/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable
sudo apt-get install -f #if missing dependency
/usr/bin/google-chrome-stable
```
2. 安装shadowsocks, 参见[链接](https://aitanlu.com/ubuntu-shadowsocks-ke-hu-duan-pei-zhi.html), 我本地Evernote也有, 参见笔记 @(linux-ubuntu使用shadowsocks客户端配置)
3. ```sudo apt-get install proxychains
3. shadowsocks + [proxifier](https://www.proxifier.site/Proxifier-course/), key P427L-9Y552-5433E-8DSR3-58Z68
	server 127.0.0.1 sock5 port 1080
	rule add shadowsocksapp direct
	rule default                        sock5 shadow

******
## vpnss的全局设置
acc feicaiyi  pwd  sotfeno
免费美国01号线：104.217.0.221
免费美国02号线：104.217.0.222
免费美国03号线：64.185.231.72
免费美国04号线：64.185.231.74
免费日本01号线：45.32.36.18
免费日本02号线：45.76.103.245

## anaconda 的安装
1. 下载合适版本的anaconda, 20170202推荐使用anaconda4.2 [python3.5](https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh)
2. 添加anaconda的[国内源](http://www.voidcn.com/blog/huludan/article/p-6222240.html)
```bash
conda config --add channels 'https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/'
conda config --set show_channel_urls yes
```
15. 安装prody ```pip install -U ProDy```
16. 安装htmd 
```
conda config --add channels acellera
conda install htmd
```
****
## 输入法安装
1. 安装sogou,  [download](http://pinyin.sogou.com/linux/?r=pinyin)
```
**********
## 配置vim, bashrc等 to be done (after git config)
1. 配置vim, 安装 

