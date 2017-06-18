# sed -i -e 's/default://' iwlib.c
# sed -i -e 's/\/usr\/local/\$\(PREFIX\)/' Makefile
# mkdir -p $INSTALL_TO/sbin
# mkdir -p $INSTALL_TO/man/man8

sed -i -e 's/BUILD_STATIC/#/' Makefile
make all CFLAGS="-g -Og -fPIC"
make install PREFIX=$INSTALL_TO
