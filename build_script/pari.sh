sed -i -e "s/-O[0123]/-g -Og/g" config/get_cc
CFLAGS="-g -Og -w -fpermissive" ./Configure --prefix="$INSTALL_TO"
make gp
make install
