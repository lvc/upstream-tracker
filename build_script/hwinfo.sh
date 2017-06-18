echo $VERSION >VERSION
sed -i -e 's/-O[0123]/-Og/g' Makefile.common
sed -i -e 's/ ids//g' src/Makefile
# sed -i -e 's/-shared/-shared $(CFLAGS) $(LDFLAGS) $(EXTRA_LDFLAGS)/g' src/Makefile
# EXTRA_FLAGS='-g -Og -I'$M_INSTALL_ROOT'/libx86emu/1.11/include' EXTRA_LDFLAGS='-lx86emu -L'$M_INSTALL_ROOT'/libx86emu/1.11/lib'
CFLAGS='-g -Og -I'$M_INSTALL_ROOT'/libx86emu/1.11/include' LDFLAGS='-lx86emu -L'$M_INSTALL_ROOT'/libx86emu/1.11/lib' make shared
mv src/*.so* $INSTALL_TO/lib/
mv src/hd/*.h $INSTALL_TO/include/
