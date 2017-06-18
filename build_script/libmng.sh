sed -i -e "s/-O[1234]/-g -Og -fPIC/g" makefiles/makefile.linux
make -f makefiles/makefile.linux install prefix=$INSTALL_TO
