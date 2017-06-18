cd build/autotools
autoreconf -i
sed -i -e 's/-O[0123]/-Og/g' configure
./configure --disable-sdltest --disable-samples --prefix="$INSTALL_TO" CFLAGS='-g -Og'
make
make install
