INSTALL_DIR=~/
HASH=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1`

all:
	@echo "Please run 'make install'"

uninstall:
	rm $(INSTALL_DIR).bashrc
	rm $(INSTALL_DIR).aliasrc
	rm $(INSTALL_DIR).conkyrc
	rm $(INSTALL_DIR).vimrc

install:
	mkdir -p $(INSTALL_DIR).bak
	if [ -f $(INSTALL_DIR).bashrc ]; then\
		mv $(INSTALL_DIR).bashrc $(INSTALL_DIR).bak/bashrc.$(HASH);\
	fi
	if [ -f $(INSTALL_DIR).aliasrc ]; then\
		mv $(INSTALL_DIR).aliasrc $(INSTALL_DIR).bak/aliasrc.$(HASH);\
	fi
	if [ -f $(INSTALL_DIR).vimrc ]; then\
		mv $(INSTALL_DIR).vimrc $(INSTALL_DIR).bak/vimrc.$(HASH);\
	fi
	if [ -f $(INSTALL_DIR).conkyrc ]; then\
		mv $(INSTALL_DIR).conkyrc $(INSTALL_DIR).bak/conkyrc.$(HASH);\
	fi
	ln dotfiles/_bashrc $(INSTALL_DIR).bashrc
	ln dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	ln dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	ln dotfiles/_vimrc $(INSTALL_DIR).vimrc
	sudo mkdir -p /usr/share/vim/vim74/colors
	sudo cp dotfiles/fu.vim /usr/share/vim/vim74/colors/
	mkdir -p ~/bin
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone https://github.com/SirVer/ultisnips ~/.vim/bundle/
	git clone https://github.com/jiangmiao/auto-pairs ~/.vim/bundle/
	git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/
	git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/
