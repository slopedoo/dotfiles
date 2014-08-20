INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

clean:
	rm $(INSTALL_DIR).bashrc
	rm $(INSTALL_DIR).aliasrc
	rm $(INSTALL_DIR).conkyrc
	rm $(INSTALL_DIR).vimrc
	rm $(INSTALL_DIR).caps
	rm $(INSTALL_DIR).config/autostart/caps_remap.desktop
	rm $(INSTALL_DIR).conkystart
	rm $(INSTALL_DIR).config/autostart/conky.desktop
	rm $(INSTALL_DIR).scripts/gmail.py

install:
	ln dotfiles/_bashrc $(INSTALL_DIR).bashrc
	ln dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	ln dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	ln dotfiles/_vimrc $(INSTALL_DIR).vimrc
	sudo cp dotfiles/fu.vim /usr/share/vim/vim74/colors/
	mkdir -p ~/bin
	ln dotfiles/_caps $(INSTALL_DIR).caps
	ln autostart/caps_remap.desktop $(INSTALL_DIR).config/autostart/
	ln dotfiles/_conkystart $(INSTALL_DIR).conkystart
	ln autostart/conky.desktop $(INSTALL_DIR).config/autostart/
	cp scripts/gmail.py $(INSTALL_DIR).scripts/
	chmod +x $(INSTALL_DIR).scripts/gmail.py
