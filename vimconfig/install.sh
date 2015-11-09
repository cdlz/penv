#!/bin/bash
echo "install vim env.";
sudo apt-get install ctags cscope -y
#git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mkdir backup 1>/dev/null 2>&1
mv ~/.vimrc backup/`date +%Y%m%d`.vimrc 1>/dev/null 2>&1
mv ~/.vim backup/`date +%Y%m%d`.vim  1>/dev/null 2>&1

#tar zxf ./vimconf.tgz  -C ~/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -R .vim ~/.vim
cp -R .vimrc ~/.vimrc

echo "finished[use BundleInstall for ensure the bundles had been installed successfully]"


