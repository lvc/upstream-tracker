./configure NETTLE_CFLAGS="-I$M_INSTALL_ROOT/nettle/3.4/include/" NETTLE_LIBS="-L$M_INSTALL_ROOT/nettle/3.4/lib64/" HOGWEED_CFLAGS="-I$M_INSTALL_ROOT/nettle/3.4/include/" HOGWEED_LIBS="-L$M_INSTALL_ROOT/nettle/3.4/lib64/" --prefix="$INSTALL_TO" --with-included-libtasn1 --without-p11-kit --disable-doc --disable-tests --disable-tools --enable-shared CFLAGS="-g -Og -fpermissive -w" CXXFLAGS="-g -Og -fpermissive -w" LIBS="-L$M_INSTALL_ROOT/nettle/3.4/lib64/"
sed -i -e 's/_GL_WARN_ON_USE.*//g' gl/stdio.in.h
sed -i -e 's/_GL_WARN_ON_USE.*//g' lib/gl/stdio.in.h
make
make install