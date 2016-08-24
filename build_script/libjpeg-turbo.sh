autoreconf --force --verbose --install
sh configure --prefix=$INSTALL_TO --enable-shared CFLAGS="-g -Og" CXXFLAGS="-g -Og"
make
make install