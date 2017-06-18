# sed -i -e 's/-O[0123]/-Og/' build/config/Linux
# sed -i -e 's/-g/-g -Og/' build/config/Linux

./configure --prefix="$INSTALL_TO" --everything --no-tests --no-samples --cflags="-g -Og" --shared --odbc-lib=$M_INSTALL_ROOT/unixodbc/2.3.4/lib/ --odbc-include=$M_INSTALL_ROOT/unixodbc/2.3.4/include/
make -j2
make install
# mv lib/Linux/x86_64/* $INSTALL_TO/lib/
