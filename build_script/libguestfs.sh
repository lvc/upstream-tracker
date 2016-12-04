sed -i -e 's/-O2/-Og/' configure m4/libtool.m4
PATH="/home/Soft/QEMU-2.6.1/bin/:"$PATH ./configure CFLAGS="-g -Og" CXXFLAGS="-g -Og" --prefix="$INSTALL_TO" --disable-ocaml --disable-php --disable-perl --disable-python --disable-ruby --disable-gobject PKG_CONFIG_PATH="$INSTALL_ROOT"/augeas/1.6.0/lib/pkgconfig
PATH="/home/Soft/QEMU-2.6.1/bin/:"$PATH make

mkdir -p $INSTALL_TO/include $INSTALL_TO/lib $INSTALL_TO/lib/pkgconfig/
cp -f ./src/guestfs_protocol.h ./src/guestfs.h $INSTALL_TO/include/
cp -f ./src/.libs/libguestfs.so.*.* $INSTALL_TO/lib/
cp -f ./src/libguestfs.pc $INSTALL_TO/lib/pkgconfig/