sed -i -e 's/-O2/-Og/' ./libdwarf/configure ./configure
./configure --prefix="$INSTALL_TO" --enable-shared
CFLAGS="-g -Og" make
mkdir -p $INSTALL_TO/include/ $INSTALL_TO/lib/
cp -f libdwarf/libdwarf.h $INSTALL_TO/include/
cp -f libdwarf/libdwarf.so $INSTALL_TO/lib/