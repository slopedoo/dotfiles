INSTALL_DIR=~/

all:
	@echo "Please run 'make install'"

install:
	cp _bashrc $(INSTALL_DIR).bashrc
	cp _aliasrc $(INSTALL_DIR).aliasrc
	cp _conkyrc $(INSTALL_DIR).conkyrc
