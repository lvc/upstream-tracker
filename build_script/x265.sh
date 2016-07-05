cd source
cmake . -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX="$INSTALL_TO" -DCMAKE_C_FLAGS="-g -Og" -DCMAKE_CXX_FLAGS="-g -Og"
make x265-shared
make install
cp -f libx265.so $INSTALL_TO/lib/