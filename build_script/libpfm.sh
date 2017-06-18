sed -i -e 's/$(LDCONFIG)//' lib/Makefile
sed -i -e 's/-g /-g -Og -w -fpermissive /' config.mk
make CFLAGS="-g -Og -w -fpermissive"
make install PREFIX="$INSTALL_TO"
