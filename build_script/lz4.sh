sed -i -e 's/-O[0123]/-g -Og/' lib/Makefile
make all CFLAGS="-fPIC -g -Og"
make install PREFIX=$INSTALL_TO
