#!/bin/bash

#Back up any existing vimrc or vim dir
if [ -e ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.old
fi
if [ -d ~/.vim ]
then
	mv ~/.vim ~/.vim.old
fi


#Create links in the home dir
ln -s `pwd`/vimrc `echo ~`/.vimrc
ln -s `pwd`/dotvim `echo ~`/.vim

#Install vundle 
if [ ! -d ~/.vim/bundle/vundle ]
then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim +BundleInstall +qall


#Back up any existing screenrc
if [ -e ~/.screenrc ]
then
	mv ~/.screenrc ~/.screenrc.old
fi

ln -s `pwd`/screenrc `echo ~`/.screenrc
