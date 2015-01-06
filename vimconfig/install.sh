#!/bin/bash
echo "install vim env.";
sudo apt-get install ctags cscope -y
#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir backup
mv ~/.vimrc backup/`date +%Y%m%d`.vimrc
mv ~/.vim backup/`date +%Y%m%d`.vim 

tar zxf ./vimconf.0107.tgz  -C ~/



