make defconfig
echo "DOSTRIP=n" >> .config
make -j8 BUILD_CFLAGS="-g -Og" UCLIBC_EXTRA_CFLAGS="-g -Og -I/usr/include -w -fpermissive" install PREFIX=$INSTALL_TO
mv $INSTALL_TO/usr/x86_64-linux-uclibc/lib/* $INSTALL_TO/lib/
mv $INSTALL_TO/usr/x86_64-linux-uclibc/usr/include/ $INSTALL_TO/include/
rm -fr $INSTALL_TO/usr
rm -f $INSTALL_TO/lib/ld*
