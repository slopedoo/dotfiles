INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

install:
	cp dotfiles/_bashrc $(INSTALL_DIR).bashrc
	cp dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	cp dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	cp caps/_caps $(INSTALL_DIR).caps
	cp caps/caps_remap.desktop $(INSTALL_DIR).config/autostart/