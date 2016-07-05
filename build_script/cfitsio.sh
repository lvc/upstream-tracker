./configure --prefix="$INSTALL_TO" --enable-shared CFLAGS="-g -Og" CXXFLAGS="-g -Og"
make shared
make install