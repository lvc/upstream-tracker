cd build/Linux-x86_64-GCC/
sed -i -e 's/-O[0123]/-g -Og -fPIC/' Makefile
make
mv softfloat.a $INSTALL_TO/lib/libsoftfloat.a
cd ../../
mv source/include/* $INSTALL_TO/include/
