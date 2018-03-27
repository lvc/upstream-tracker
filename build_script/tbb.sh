sed -i -e 's/\-O[012]/-Og/' build/*.inc
CFLAGS="-g -Og" CXXFLAGS="-g -Og" make -j4
cp -f build/*_release/*.so* $INSTALL_TO/lib/