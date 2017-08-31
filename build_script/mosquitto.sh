sed -i -e 's/-O[0123]/-Og/g' config.mk Makefile src/Makefile client/Makefile lib/Makefile lib/cpp/Makefile
sed -i -e 's/-nopie/ /g' config.mk Makefile src/Makefile client/Makefile lib/Makefile lib/cpp/Makefile
sed -i -e 's/ -s / /g' config.mk Makefile src/Makefile client/Makefile lib/Makefile lib/cpp/Makefile

make -j2
make install DESTDIR=$INSTALL_TO prefix=''
