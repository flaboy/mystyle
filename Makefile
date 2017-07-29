all: oh-my-zsh

style:=`pwd`

oh-my-zsh:
	git clone git://github.com/robbyrussell/oh-my-zsh.git

install: oh-my-zsh
	rm -rf ~/.zshrc ~/.zsh ~/.vimrc ~/.vim 2>&1 >/dev/null
	mv ${style} ~/.mystyle
	ln -sf ~/.mystyle/zshrc ~/.zshrc
	ln -sf ~/.mystyle/oh-my-zsh ~/.zsh
	ln -sf ~/.mystyle/vimrc ~/.vimrc
	ln -sf ~/.mystyle/vim ~/.vim
	git config --global --add oh-my-zsh.hide-status 1
	echo "mystyle installed"
	exec zsh
