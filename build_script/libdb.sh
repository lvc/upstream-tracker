cd build_unix
../dist/configure --prefix=$INSTALL_TO --enable-cxx --enable-debug CFLAGS="-g -Og" CXXFLAGS="-g -Og"
make install