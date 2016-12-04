sh autogen.sh
sed -i -e 's/-O2/-Og -w -fpermissive/g' configure
./configure --prefix="$INSTALL_TO" --with-initdir=$INSTALL_TO --disable-systemd --disable-upstart --enable-shared --without-heartbeat
sed -i -e 's/extra doc cts//g' Makefile
sed -i -e 's/extra doc//g' Makefile
sed -i -e 's/LCRSODIR =/LCRSODIR = $(prefix)/g' Makefile
find . -name Makefile | xargs sed -i -e 's/ \/usr\/lib\/systemd/ $(prefix)/g'
find . -name Makefile | xargs sed -i -e 's/ \/var\/lib/ $(prefix)/g'
make
prefix=$INSTALL_TO make install prefix=$INSTALL_TO