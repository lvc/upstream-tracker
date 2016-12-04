python configure.py --prefix=$INSTALL_TO
sed -i -e 's/-g /-g -Og /' Makefile
sed -i -e 's/-O3\|-O2\|-O1\|-O0/-g -Og/' Makefile
make
make install