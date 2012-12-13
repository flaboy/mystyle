#!/bin/sh
cd `dirname $0`
style=`pwd`
rm -rf ~/.zshrc ~/.zsh ~/.vimrc ~/.vim 2>&1 >/dev/null
ln -sf "$style/zshrc" ~/.zshrc
ln -sf "$style/zsh" ~/.zsh
ln -sf "$style/vimrc" ~/.vimrc
ln -sf "$style/vim" ~/.vim
echo "mystyle installed"
exec zsh
