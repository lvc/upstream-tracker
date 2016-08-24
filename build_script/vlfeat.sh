sed -i -e 's/-O[0123]/-Og/' Makefile
make DEBUG=1
mkdir -p $INSTALL_TO/include/vl/
mkdir -p $INSTALL_TO/lib/
cp -f vl/*.h $INSTALL_TO/include/vl/
cp -f bin/*/libvl.so $INSTALL_TO/lib/
