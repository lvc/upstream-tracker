cmake . -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=$INSTALL_TO -DCMAKE_C_FLAGS="-g -Og -w -fpermissive -fPIC" -DCMAKE_CXX_FLAGS="-g -Og -w -fpermissive -fPIC"
make
cp -f *.so $INSTALL_TO/lib/;cp -f omp.h $INSTALL_TO/include/
