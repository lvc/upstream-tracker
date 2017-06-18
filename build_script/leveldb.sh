sed -i -e 's/-O[0123]/-Og/' Makefile
CFLAGS='-g -Og' CXXFLAGS='-g -Og' make -j4
# mv out-shared/*.so* $INSTALL_TO/lib/
mv *.so* $INSTALL_TO/lib/
mv include/* $INSTALL_TO/include/
