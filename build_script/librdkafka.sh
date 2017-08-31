CFLAGS='-g -Og -fPIC' CXXFLAGS='-g -Og -fPIC' ./configure --prefix=$INSTALL_TO
make -j2
make install
