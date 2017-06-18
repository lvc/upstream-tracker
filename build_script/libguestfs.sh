sed -i -e 's/-O2/-Og/' configure m4/libtool.m4
PATH="/home/Soft/QEMU-2.6.1/bin/:"$PATH ./configure CFLAGS="-g -Og" CXXFLAGS="-g -Og" --prefix="$INSTALL_TO" --disable-ocaml --disable-php --disable-perl --disable-python --disable-ruby --disable-gobject --disable-lua PKG_CONFIG_PATH="$M_INSTALL_ROOT"/augeas/1.6.0/lib/pkgconfig
PATH="/home/Soft/QEMU-2.6.1/bin/:"$PATH make

mkdir -p $INSTALL_TO/lib/pkgconfig/
cp -f ./*/guestfs_protocol.h ./lib/guestfs.h $INSTALL_TO/include/
cp -f ./*/.libs/libguestfs.so.*.* $INSTALL_TO/lib/
cp -f ./*/libguestfs.pc $INSTALL_TO/lib/pkgconfig/