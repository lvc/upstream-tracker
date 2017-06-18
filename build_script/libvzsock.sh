sed -i -e 's/-O[0123]/-g -Og/g' Makefile
sed -i -e 's/ -s / /g' Makefile
make
make install DESTDIR=$INSTALL_TO
mv $INSTALL_TO/usr/* $INSTALL_TO/
