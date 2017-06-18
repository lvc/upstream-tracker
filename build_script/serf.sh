# sed -i -e 's/-g/-g -Og/' SConstruct
scons PREFIX=$INSTALL_TO CFLAGS='-g -Og' DEBUG=yes install
