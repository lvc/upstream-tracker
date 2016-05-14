PKG_CONFIG_PATH=/usr/lib/pkgconfig/ /home/andrey/Software/cmake-3.2.3/bin/cmake . -DCMAKE_INSTALL_PREFIX=$INSTALL_TO -DCMAKE_C_FLAGS="-g -Og" -DCMAKE_CXX_FLAGS="-g -Og" -DCMAKE_BUILD_TYPE="Debug"
make
make install