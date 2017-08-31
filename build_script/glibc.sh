sed -i -e 's/3\.\[89\]\*/3.[89]* | 4.*/g' configure
mkdir -p build
cd build
../configure --prefix="$INSTALL_TO" CFLAGS="-g -Og -fpermissive -w" --with-binutils=$M_INSTALL_ROOT/binutils/2.29/bin/
make -j2
make install