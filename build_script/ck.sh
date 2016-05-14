sed -i -e 's/-O2/-g -Og/' configure
./configure --prefix="$INSTALL_TO"
make
make install