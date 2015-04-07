#!/bin/bash
echo "install vim env.";
sudo apt-get install ctags cscope -y
#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir backup 1>/dev/null 2>&1
mv ~/.vimrc backup/`date +%Y%m%d`.vimrc 1>/dev/null 2>&1
mv ~/.vim backup/`date +%Y%m%d`.vim  1>/dev/null 2>&1

tar zxf ./vimconf.0107.tgz  -C ~/
echo "finished"


