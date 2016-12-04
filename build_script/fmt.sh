mkdir -p build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX="$INSTALL_TO" -DCMAKE_C_FLAGS="-g -Og" -DCMAKE_CXX_FLAGS="-g -Og"
make
mkdir -p $INSTALL_TO/lib/ $INSTALL_TO/include/
cp -f fmt/*.so.*.*.* $INSTALL_TO/lib/
cp -f ../fmt/*.h $INSTALL_TO/include/