sed -i -e 's/-Werror//' Makefile.inc
sed -i -e 's/-O[0123]/-Og/' Makefile.inc
CFLAGS="-g -Og -w -fpermissive" make -j2
mv lib/*.so* $INSTALL_TO/lib/
mv include/*.h include/linux $INSTALL_TO/include/
