sed -i -e 's/O0/Og/' Make.defaults
sed -i -e 's/\$(STATICLIBTARGETS) //' src/Makefile
sed -i -e 's/efivar efivar-static/efivar/' src/Makefile
CFLAGS="-fpermissive -w -g -Og -flto" make install DESTDIR="$INSTALL_TO"