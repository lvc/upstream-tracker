make  CFLAGS="-fPIC -g -Og"
mkdir -p $INSTALL_TO/include/
mkdir -p $INSTALL_TO/lib/
cp -fr include/* $INSTALL_TO/include/
cp -f  uv.a $INSTALL_TO/lib/libuv.a
