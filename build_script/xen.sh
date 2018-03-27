./configure --disable-docs --prefix=/usr
sed -i -e 's/ -g$/ -g -Og -w -fpermissive/' Config.mk
sed -i -e 's/-O0 -g3/-Og -g/' tools/Rules.mk
sed -i -e 's/ -O0 / -Og -g /' tools/Rules.mk
sed -i -e 's/-O1/-Og/' config/StdGNU.mk
make dist DISTDIR=$INSTALL_TO debug=y -j4
mv $INSTALL_TO/install/usr/lib64 $INSTALL_TO/
mv $INSTALL_TO/install/usr/include $INSTALL_TO/
rm -fr $INSTALL_TO/install $INSTALL_TO/README $INSTALL_TO/COPYING $INSTALL_TO/install.sh