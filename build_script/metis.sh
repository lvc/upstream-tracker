sed -i -e 's/-O3/-Og/g' ./GKlib/*.cmake
sed -i -e 's/-g/-g -Og/g' ./GKlib/*.cmake
make config shared=1 debug=1 prefix="$INSTALL_TO"
make
make install

#sed -i -e 's/(cd Programs ; make )//g' Makefile
#sed -i -e 's/(cd Test ; make )//g' Makefile
#sed -i -e 's/-O2/-Og -g -fPIC/g' Makefile*
#make
#mkdir -p $INSTALL_TO/lib/ $INSTALL_TO/include/
#cp -f libmetis.a $INSTALL_TO/lib/
#cp -f Lib/*.h $INSTALL_TO/include/
