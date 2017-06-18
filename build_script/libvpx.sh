sed -i -e 's/-O[23]/-Og/g' build/make/configure.sh
./configure --prefix="$INSTALL_TO" --enable-shared --enable-debug --disable-docs --disable-examples --disable-static --disable-unit-tests --extra-cflags="-g -Og" --extra-cxxflags="-g -Og"
make
make install