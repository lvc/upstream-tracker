cd googletest
autoreconf --force --verbose --install
./configure --prefix=$INSTALL_TO --enable-debug --enable-shared CXXFLAGS="-g -Og -w -fpermissive"
make
cp -f ./lib/.libs/libgtest.so $INSTALL_TO/lib/
cp -fr ./include/* $INSTALL_TO/include/
rm -fr $INSTALL_TO/include/gtest/internal/

cd ../googlemock
autoreconf --force --verbose --install
./configure --prefix=$INSTALL_TO --enable-debug --enable-shared CXXFLAGS="-g -Og -w -fpermissive" GTEST_CONFIG=../googletest/scripts/gtest-config
make
cp -f ./lib/.libs/libgmock.so $INSTALL_TO/lib/
cp -fr ./include/* $INSTALL_TO/include/
rm -fr $INSTALL_TO/include/gmock/internal/
