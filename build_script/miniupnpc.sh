sed -i -e 's/-O/-Og -g/' Makefile
CFLAGS='-g -Og -fPIC' INSTALLPREFIX=$INSTALL_TO make install