sed -i -e 's/-O3/-Og/g' configure
./configure --prefix="$INSTALL_TO" --enable-shared --disable-doc --extra-cflags='-g -Og'
CXXFLAGS='-g -Og' make -j2
make install