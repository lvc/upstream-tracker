DRI_LIB=$M_INSTALL_ROOT'/libdrm/2.4.80/lib'
NOCONFIGURE=1 sh autogen.sh
sed -i -e 's/unreachable()/\/\//g' src/mesa/drivers/dri/i965/intel_screen.c
sed -i -e 's/\-O2/-Og -g/g' configure
./configure --prefix=$INSTALL_TO --enable-shared --enable-glx --disable-osmesa --enable-debug --enable-gles2 --enable-gles1 --with-llvm-prefix=/home/Soft/LLVM-3.8.1/ PKG_CONFIG_PATH=$DRI_LIB'/pkgconfig'
make -j2
LD_LIBRARY_PATH=$DRI_LIB make install
rm -fr $INSTALL_TO/lib/dri
