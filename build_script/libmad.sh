cd libmad
sed -i -e 's/-fforce-mem/ /g' ./configure
sed -i -e 's/-g"/-g -Og"/g' ./configure
./configure --prefix=$INSTALL_TO --enable-shared --disable-static --enable-debugging
make
make install
