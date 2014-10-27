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
	rm $(INSTALL_DIR).config/autostart/touchpad_settings.desktop
	rm $(INSTALL_DIR).config/autostart/xSwipe.desktop
	rm $(INSTALL_DIR).scripts/gmail.py
	rm $(INSTALL_DIR).config/.touchpad_settings.sh
	rm -rf $(INSTALL_DIR).xSwipe/*
	rm $(INSTALL_DIR).vim/plugin/auto-pairs.vim

install:
	ln dotfiles/_bashrc $(INSTALL_DIR).bashrc
	ln dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	ln dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	ln dotfiles/_vimrc $(INSTALL_DIR).vimrc
	sudo cp dotfiles/fu.vim /usr/share/vim/vim74/colors/
	mkdir -p ~/bin
	ln dotfiles/_caps $(INSTALL_DIR).caps
	ln autostart/* $(INSTALL_DIR).config/autostart/
	ln dotfiles/_conkystart $(INSTALL_DIR).conkystart
	mkdir -p $(INSTALL_DIR).scripts/
	cp scripts/gmail.py $(INSTALL_DIR).scripts/
	ln dotfiles/_touchpad_settings.sh $(INSTALL_DIR).config/.touchpad_settings.sh
	chmod +x $(INSTALL_DIR).config/.touchpad_settings.sh
	mkdir -p $(INSTALL_DIR).xSwipe/nScroll
	ln dotfiles/_xSwipe/eventKey.cfg $(INSTALL_DIR).xSwipe/
	ln dotfiles/_xSwipe/xSwipe.pl $(INSTALL_DIR).xSwipe/
	ln dotfiles/_xSwipe/nScroll/* $(INSTALL_DIR).xSwipe/nScroll/
	chmod +x $(INSTALL_DIR).scripts/gmail.py
	mkdir -p $(INSTALL_DIR).vim/plugins/
	ln dotfiles/auto-pairs.vim $(INSTALL_DIR).vim/plugin/auto-pairs.vim
