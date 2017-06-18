sed -i -e 's/\-O[0123]/-Og -w -fpermissive/g' Makefile
CFLAGS='-g -Og' make
make install DESTDIR=$INSTALL_TO
