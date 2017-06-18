cd src
export QT_SELECT=5
export PKG_CONFIG_PATH=$M_INSTALL_ROOT/lua/5.3.4/lib/pkgconfig/
make install IPEPREFIX=$INSTALL_TO CXXFLAGS="-g -Og -fPIC -I$M_INSTALL_ROOT/lua/5.3.4/include/" LDFLAGS="-L$M_INSTALL_ROOT/lua/5.3.4/lib/ -llua -ldl"
