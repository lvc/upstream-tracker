sed -i -e 's/-g3/-g -Og/' library/Makefile
make CFLAGS="-g -Og" SHARED=1 DEBUG=1 all
make install DESTDIR="$INSTALL_TO"