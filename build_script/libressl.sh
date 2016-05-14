cmake . -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX="$INSTALL_TO" -DCMAKE_C_FLAGS="-g -Og" -DCMAKE_CXX_FLAGS="-g -Og"
make
mkdir -p $INSTALL_TO/lib/
cp -f ./crypto/*.so* ./ssl/*.so* ./tls/*.so* $INSTALL_TO/lib/
mkdir -p $INSTALL_TO/include/
for i in `find include -name '*.h'`;do mkdir -p $INSTALL_TO/`dirname $i` && cp -f $i $INSTALL_TO/$i;done
rm -fr $INSTALL_TO/include/compat
