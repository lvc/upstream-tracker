./configure --prefix="$INSTALL_TO" --with-included-libtasn1 --without-p11-kit --disable-doc --disable-tests --enable-shared CFLAGS="-g -Og -fpermissive -w"
sed -i -e 's/_GL_WARN_ON_USE.*//g' gl/stdio.in.h
sed -i -e 's/_GL_WARN_ON_USE.*//g' lib/gl/stdio.in.h
make
make install