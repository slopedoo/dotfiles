INSTALL_DIR=~/
VIM_DIR=~/.vim
GIT_FLAGS="--allow-unrelated-histories"
HASH=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1`

all:
	@echo "Please run 'make install'"

uninstall:
	mkdir -p $(INSTALL_DIR).bak
	if [ -f $(INSTALL_DIR).bashrc ]; then\
		mv $(INSTALL_DIR).bashrc $(INSTALL_DIR).bak/bashrc.$(date +"%d_%m_%Y").$(HASH);\
	fi
	if [ -f $(INSTALL_DIR).aliasrc ]; then\
		mv $(INSTALL_DIR).aliasrc $(INSTALL_DIR).bak/aliasrc.$(date +"%d_%m_%Y").$(HASH);\
	fi
	if [ -f $(INSTALL_DIR).vimrc ]; then\
		mv $(INSTALL_DIR).vimrc $(INSTALL_DIR).bak/vimrc.$(date +"%d_%m_%Y").$(HASH);\
	fi
	if [ -f $(INSTALL_DIR).conkyrc ]; then\
		mv $(INSTALL_DIR).conkyrc $(INSTALL_DIR).bak/conkyrc.$(date +"%d_%m_%Y").$(HASH);\
	fi
	if [ -f $(VIM_DIR)/colors/fu.vim ]; then\
		rm $(VIM_DIR)/colors/fu.vim;\
	fi

install:
	mkdir -p $(INSTALL_DIR).bak $(INSTALL_DIR).vim $(INSTALL_DIR).vim/colors $(INSTALL_DIR).vim/bundle
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
	mkdir -p ~/.config/fusuma
	ln dotfiles/fusuma_config.yml ~/.config/fusuma/config.yml
	ln dotfiles/_bashrc $(INSTALL_DIR).bashrc
	ln dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	ln dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	ln dotfiles/_vimrc $(INSTALL_DIR).vimrc
	ln -f dotfiles/fu.vim $(INSTALL_DIR).vim/colors/
	mkdir -p ~/bin
	if [ ! -d $(VIM_DIR)/bundle/Vundle.vim ]; then \
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; \
	else \
		cd $(VIM_DIR)/bundle/Vundle.vim; \
		git pull https://github.com/VundleVim/Vundle.vim.git; \
	fi 
	if [ ! -d $(VIM_DIR)/bundle/ultisnips ]; then \
		git clone https://github.com/SirVer/ultisnips ~/.vim/bundle/ultisnips; \
	else \
		cd $(VIM_DIR)/bundle/ultisnips; \
		git pull $(GIT_FLAGS) https://github.com/SirVer/ultisnips; \
	fi
	if [ ! -d $(VIM_DIR)/bundle/Auto-Pairs ]; then \
		git clone https://github.com/jiangmiao/auto-pairs ~/.vim/bundle/Auto-Pairs; \
	else \
		cd $(VIM_DIR)/bundle/Auto-Pairs; \
		git pull https://github.com/jiangmiao/auto-pairs; \
	fi
	if [ ! -d $(VIM_DIR)/bundle/vim-airline ]; then \
		git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline; \
	else \
		cd $(VIM_DIR)/bundle/vim-airline; \
		git pull https://github.com/vim-airline/vim-airline; \
	fi
	if [ ! -d $(VIM_DIR)/bundle/vim-airline-themes ]; then \
		git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes; \
	else \
		cd $(VIM_DIR)/bundle/vim-airline-themes; \
		git pull https://github.com/vim-airline/vim-airline-themes; \
	fi
