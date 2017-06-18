sed -i -e 's/ install-crit//' Makefile
sed -i -e 's/-O[0123]/-Og/' Makefile
CFLAGS="-g -Og -w -fpermissive" make -j2
make install PREFIX=$INSTALL_TO
