INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

clean:
	rm $(INSTALL_DIR).bashrc
	rm $(INSTALL_DIR).aliasrc
	rm $(INSTALL_DIR).conkyrc
	rm $(INSTALL_DIR).vimrc
	#rm $(INSTALL_DIR).caps
	#rm $(INSTALL_DIR).config/autostart/caps_remap.desktop
	#rm $(INSTALL_DIR).conkystart
	#rm $(INSTALL_DIR).config/autostart/conky.desktop
	#rm $(INSTALL_DIR).config/autostart/touchpad_settings.desktop
	#rm $(INSTALL_DIR).config/autostart/xSwipe.desktop
	#rm $(INSTALL_DIR).scripts/gmail.py
	#rm $(INSTALL_DIR).config/.touchpad_settings.sh
	#rm -rf $(INSTALL_DIR).xSwipe/*
	#rm $(INSTALL_DIR).vim/plugin/auto-pairs.vim
	#rm $(INSTALL_DIR)bin/scdl.py

install:
	mkdir -p $(INSTALL_DIR).bak
	if [ -f $(INSTALL_DIR).bashrc ]; then\
		mv $(INSTALL_DIR).bashrc $(INSTALL_DIR).bak/bashrc.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1);\
	fi
	if [ -f $(INSTALL_DIR).aliasrc ]; then\
		mv $(INSTALL_DIR).aliasrc $(INSTALL_DIR).bak/aliasrc.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1);\
	fi
	if [ -f $(INSTALL_DIR).vimrc ]; then\
		mv $(INSTALL_DIR).vimrc $(INSTALL_DIR).bak/vimrc.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1);\
	fi
	if [ -f $(INSTALL_DIR).conkyrc ]; then\
		mv $(INSTALL_DIR).conkyrc $(INSTALL_DIR).bak/conkyrc.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1);\
	fi
	ln dotfiles/_bashrc $(INSTALL_DIR).bashrc
	ln dotfiles/_aliasrc $(INSTALL_DIR).aliasrc
	ln dotfiles/_conkyrc $(INSTALL_DIR).conkyrc
	ln dotfiles/_vimrc $(INSTALL_DIR).vimrc
	mkdir -p $(INSTALL_DIR).vim/plugin && ln -f vim/plugin/* $(INSTALL_DIR).vim/plugin/
	mkdir -p $(INSTALL_DIR).vim/autoload && ln -f vim/autoload/* $(INSTALL_DIR).vim/autoload/
	mkdir -p $(INSTALL_DIR).vim/doc && ln -f vim/doc/* $(INSTALL_DIR).vim/doc/
	mkdir -p $(INSTALL_DIR).vim/test && ln -f vim/test/* $(INSTALL_DIR).vim/test/
	sudo cp dotfiles/fu.vim /usr/share/vim/vim74/colors/
	mkdir -p ~/bin
	#ln dotfiles/_caps $(INSTALL_DIR).caps
	#ln autostart/* $(INSTALL_DIR).config/autostart/
	#ln dotfiles/_conkystart $(INSTALL_DIR).conkystart
	#mkdir -p $(INSTALL_DIR).scripts/
	#cp scripts/gmail.py $(INSTALL_DIR).scripts/
	#ln dotfiles/_touchpad_settings.sh $(INSTALL_DIR).config/.touchpad_settings.sh
	#chmod +x $(INSTALL_DIR).config/.touchpad_settings.sh
	#mkdir -p $(INSTALL_DIR).xSwipe/nScroll
	#ln dotfiles/_xSwipe/eventKey.cfg $(INSTALL_DIR).xSwipe/
	#ln dotfiles/_xSwipe/xSwipe.pl $(INSTALL_DIR).xSwipe/
	#ln dotfiles/_xSwipe/nScroll/* $(INSTALL_DIR).xSwipe/nScroll/
	#chmod +x $(INSTALL_DIR).scripts/gmail.py
	#mkdir -p $(INSTALL_DIR).vim/plugin/
	#ln dotfiles/auto-pairs.vim $(INSTALL_DIR).vim/plugin/auto-pairs.vim
	#ln scripts/scdl.py $(INSTALL_DIR)bin/
	#chmod +x $(INSTALL_DIR)bin/scdl.py
