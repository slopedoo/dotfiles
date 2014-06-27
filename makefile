INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

install:
	cp dotfiles/_bashrc $(INSTALL_DIR).bashrc
	cp dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	cp dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	cp dotfiles/_vimrc $(INSTALL_DIR).vimrc
	mkdir -p ~/bin
	cp dotfiles/_caps $(INSTALL_DIR).caps
	cp autostart/caps_remap.desktop $(INSTALL_DIR).config/autostart/
	cp dotfiles/_conkystart $(INSTALL_DIR).conkystart
	cp autostart/conky.desktop $(INSTALL_DIR).config/autostart/
	cp scripts/simplesearch $(INSTALL_DIR)bin/
	cp scripts/cleandirectory $(INSTALL_DIR)bin/
	cp scripts/gmail.py $(INSTALL_DIR).scripts/
	chmod +x $(INSTALL_DIR)bin/simplesearch
	chmod +x $(INSTALL_DIR)bin/cleandirectory
