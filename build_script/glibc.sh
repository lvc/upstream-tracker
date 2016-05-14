sed -i -e 's/3\.\[89\]\*/3.[89]* | 4.*/g' configure
mkdir -p build
cd build
../configure --prefix="$INSTALL_TO" CFLAGS="-g -Og -fpermissive -w"
make
make install