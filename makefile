INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

install:
	cp dotfiles/_bashrc $(INSTALL_DIR).bashrc
	cp dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	cp dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	mkdir -p ~/bin
	cp dotfiles/_caps $(INSTALL_DIR).caps
	cp autostart/caps_remap.desktop $(INSTALL_DIR).config/autostart/
	cp dotfiles/_conkystart $(INSTALL_DIR).conkystart
	cp autostart/conky.desktop $(INSTALL_DIR).config/autostart/
	cp searchscript/simplesearch $(INSTALL_DIR)bin/
	cp clean/cleandownloads $(INSTALL_DIR)bin/
	chmod +x $(INSTALL_DIR)bin/simplesearch
	chmod +x $(INSTALL_DIR)bin/cleandownloads
