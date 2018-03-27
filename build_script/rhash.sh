./configure --disable-static --disable-lib-static --extra-cflags="-g -Og" --prefix=$INSTALL_TO
make
make install-lib-shared PREFIX=$INSTALL_TO CFLAGS="-g -Og"
mkdir -p $INSTALL_TO/include/librhash
cp -f librhash/*.h $INSTALL_TO/include/librhash/
cp -f *.h $INSTALL_TO/include/