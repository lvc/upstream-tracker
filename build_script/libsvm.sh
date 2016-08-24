sed -i -e 's/-O[0123]/-g -Og/' Makefile
make lib
mkdir -p $INSTALL_TO/include/
mkdir -p $INSTALL_TO/lib/
cp -f svm.h $INSTALL_TO/include/
cp -f libsvm.so* $INSTALL_TO/lib/
