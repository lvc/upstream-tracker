cd libraries/liblmdb
mkdir -p $INSTALL_TO/man/ $INSTALL_TO/man/man1/ $INSTALL_TO/bin/ $INSTALL_TO/lib/ $INSTALL_TO/include/
sed -i -e 's/-O2/-g -Og/' Makefile
make
make install prefix="$INSTALL_TO"