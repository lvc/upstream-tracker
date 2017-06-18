sed -i -e 's/-O2/-g -Og -fPIC/g' Makefile
make SHARED=yes
make install-lib PREFIX=$INSTALL_TO SHARED=yes