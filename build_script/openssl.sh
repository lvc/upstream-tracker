./config -d --prefix="$INSTALL_TO" shared
sed -i -e 's/ \-O0 / /' Makefile
sed -i -e 's/ \-g / -g -Og /' Makefile
make
make install_sw