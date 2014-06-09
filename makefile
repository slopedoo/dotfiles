INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

install:
	cp dotfiles/_bashrc $(INSTALL_DIR).bashrc
	cp dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	cp dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	cp caps/_caps $(INSTALL_DIR).caps
	cp caps/caps_remap.desktop $(INSTALL_DIR).config/autostart/
	cp searchscript/simplesearch $(INSTALL_DIR)bin/
	cp clean/cleandownloads $(INSTALL_DIR)bin/
	cp up/up $(INSTALL_DIR)bin/
	chmod +x $(INSTALL_DIR)bin/up
	chmod +x $(INSTALL_DIR)bin/simplesearch
	chmod +x $(INSTALL_DIR)bin/cleandownloads