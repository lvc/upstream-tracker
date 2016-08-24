sed -i -e 's/-O1\|-O2\|-O3/-Og/' Makefile
make install prefix=$INSTALL_TO