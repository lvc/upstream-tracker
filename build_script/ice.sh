cd cpp
make CXXFLAGS="-g -Og -fPIC -lpthread"
make install prefix=$INSTALL_TO
rm -fr $INSTALL_TO/bin $INSTALL_TO/man $INSTALL_TO/config $INSTALL_TO/slice