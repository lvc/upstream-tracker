DRI_DIR=$M_INSTALL_ROOT'/libdrm/2.4.88'
DRI_LIB=$DRI_DIR'/lib'

NOCONFIGURE=1 sh autogen.sh
sed -i -e 's/unreachable()/\/\//g' src/mesa/drivers/dri/i965/intel_screen.c
sed -i -e 's/\-O[0123]/-Og -g/g' configure configs/*
./configure --prefix=$INSTALL_TO --enable-llvm --enable-shared --enable-glx --enable-osmesa --enable-opengl --enable-egl --enable-debug --enable-gles2 --enable-gles1 --with-llvm-prefix=/home/Soft/LLVM-5.0.0/ --with-dri-searchpath=$DRI_DIR --with-dri-driverdir=$DRI_DIR PKG_CONFIG_PATH=$DRI_LIB'/pkgconfig' LDFLAGS="-ldrm_nouveau -L$DRI_LIB" CFLAGS='-g -Og' CXXFLAGS='-g -Og'
LD_LIBRARY_PATH=$DRI_LIB make -j3
LD_LIBRARY_PATH=$DRI_LIB make install
rm -fr $INSTALL_TO/lib/dri
