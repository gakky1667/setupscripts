#! /bin/bash
sudo apt-get install vim tmux

cp ./dotfiles/vimrc ~/.vimrc 
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
mkdir -p ~/.vim/colors  
cp ./dotfiles/molokai.vim ~/.vim/colors/molokai.vim

if [ -e ~/.tmux.conf ]; then
    echo "-------- Create .emacs.d backup --------"
    cp -r ~/.tmux.conf ~/.tmux.conf.backup
    rm -rf ~/.tmux.conf
fi
cp -r ./dotfiles/tmux.conf ~/.tmux.conf