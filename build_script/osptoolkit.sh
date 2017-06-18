cd src
sed -i -e 's/-O/-Og -g/' Makefile
make build
mv ../lib/*.a $INSTALL_TO/lib/
mv ../include/* $INSTALL_TO/include/
