#make CXX_FLAGS='-g -Og -std=c++11' CXX='g++'
#make install INSTALL_DIR=$INSTALL_TO

g++ -Isrc -Iinclude -std=c++11 -fPIC -g -Og -shared -o libjsonv.so src/jsonv/*.cpp -Wl,-soname,'libjsonv.so.'`grep -nR "JSONV_VERSION " Makefile|awk {'print $3'}`
mv libjsonv.so $INSTALL_TO/lib/
mv include/* $INSTALL_TO/include/
