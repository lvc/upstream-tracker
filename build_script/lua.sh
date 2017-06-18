sed -i -e 's/-O[1234]/-Og -g -fPIC/' src/Makefile config
make linux MYCFLAGS="-g -Og -fPIC"
make install INSTALL_TOP=$INSTALL_TO INSTALL_ROOT=$INSTALL_TO
#cp -f include/*.h $INSTALL_TO/include/
#cp -f src/*.a $INSTALL_TO/lib/
