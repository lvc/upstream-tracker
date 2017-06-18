./configure --prefix="$INSTALL_TO" --enable-shared --enable-debug --disable-doc --extra-cflags="-Og -fpermissive -w" --disable-static --disable-optimizations --disable-mmx --disable-stripping --enable-postproc --enable-gpl
make -j8
make install