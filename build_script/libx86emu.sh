echo $VERSION >VERSION
sed -i -e 's/-O[0123]/-Og/g' Makefile
CFLAGS='-g -Og' make shared
ln -s libx86emu.so.* libx86emu.so
mv *.so* $INSTALL_TO/lib/
mv include/* $INSTALL_TO/include/
