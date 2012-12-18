all: oh-my-zsh

style:=`pwd`

oh-my-zsh:
	git clone git://github.com/robbyrussell/oh-my-zsh.git

install:
	rm -rf ~/.zshrc ~/.zsh ~/.vimrc ~/.vim 2>&1 >/dev/null
	ln -sf ${style}/zshrc ~/.zshrc
	ln -sf ${style}/oh-my-zsh ~/.zsh
	ln -sf ${style}/vimrc ~/.vimrc
	ln -sf ${style}/vim ~/.vim
	echo "mystyle installed"
	exec zsh
