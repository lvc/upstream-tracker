sed -i -e 's/-O[0123]/-g -Og -fPIC/' configure
./configure --prefix=$INSTALL_TO
sed -i -e 's/prefix\s*=/prefix?=/' Makefile
sed -i -e 's/CFLAGS=/CFLAGS?=/' Makefile
mkdir -p $INSTALL_TO/include/
mkdir -p $INSTALL_TO/lib/
make install CFLAGS="-g -Og -fPIC" prefix=$INSTALL_TO exec_prefix=$INSTALL_TO
