./configure --prefix=/ --enable-debug CFLAGS="-g -Og"
sed -i -e 's/ \-O0 / /g' Makefile
make
DESTDIR="$INSTALL_TO" make install