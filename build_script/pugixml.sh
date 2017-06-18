g++ -g -Og src/pugixml.cpp -shared -o libpugixml.so -fPIC
cp -f libpugixml.so $INSTALL_TO/lib/
cp -f src/*.hpp $INSTALL_TO/include/
