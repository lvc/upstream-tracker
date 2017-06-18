sed -i -e 's/-\O[0123]/-g -Og/g' Makefile
CFLAGS='-g -Og' make DEBUG=1
mv *.so* $INSTALL_TO/lib/
mv src/*.h $INSTALL_TO/include/
