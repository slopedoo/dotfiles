INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

install:
	cp .bashrc $(INSTALL_DIR)
	cp .aliasrc $(INSTALL_DIR)
	cp .conkyrc $(INSTALL_DIR)
