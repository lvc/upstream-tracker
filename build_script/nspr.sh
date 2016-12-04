sed -i -e 's/-O2/-Og -g -w -fpermissive/' configure
./configure --prefix=$INSTALL_TO --enable-64bit --enable-debug="-Og -g"
make
make install