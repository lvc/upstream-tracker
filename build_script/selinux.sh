sed -i -e 's/sepolgen//g' Makefile
sed -i -e 's/checkpolicy//g' Makefile
sed -i -e 's/secilc//g' Makefile
sed -i -e 's/policycoreutils//g' Makefile
sed -i -e 's/-g3/-g -fPIC/g' Makefile
LDFLAGS="-L../../libsepol/src" CFLAGS="-g -Og -w -fPIC" PREFIX=$INSTALL_TO DESTDIR=$INSTALL_TO make install
rm -fr $INSTALL_TO/usr/share
rmdir $INSTALL_TO/usr