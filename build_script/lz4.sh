sed -i -e 's/-O[0123]/-g -Og/' lib/Makefile Makefile
sed -i -e 's/sudo //g' Makefile
make all CFLAGS="-fPIC -g -Og"
make install PREFIX=$INSTALL_TO
