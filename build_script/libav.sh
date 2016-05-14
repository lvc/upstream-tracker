./configure --prefix="$INSTALL_TO" --enable-shared --disable-doc
CXXFLAGS="-g -Og" make
make install