sh autogen.sh
./configure --prefix=$INSTALL_TO CFLAGS="-g -Og"
sed -i -e 's/install_lib install_doc/install_lib/' Makefile
make
make install