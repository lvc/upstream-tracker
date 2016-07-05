mkdir -p build
cd build
cmake .. -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX="$INSTALL_TO" -DCMAKE_C_FLAGS="-g -Og" -DCMAKE_CXX_FLAGS="-g -Og"
sed -i -e 's/-O2/-Og/' CMakeFiles/allegro.dir/flags.make
sed -i -e 's/-O2/-Og/' addons/*/CMakeFiles/*/flags.make
make
make install