sed -i -e 's/-O[0123]/-Og/g' configure
./configure --prefix="$INSTALL_TO" --enable-dynamic CFLAGS="-g -Og -fPIC"
make so
make soinstall
cp -f base/*.h $INSTALL_TO/include/