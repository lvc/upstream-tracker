git clone https://github.com/babelouest/orcania.git lib/orcania/
git clone https://github.com/babelouest/yder.git lib/yder/

cd lib/orcania/
make

cd lib/yder/
make

cd ../../

sed -i -e 's/CFLAGS=/CFLAGS+=/g' src/Makefile
sed -i -e 's/-O[0123]/-Og/g' src/Makefile
sed -i -e 's/ldconfig/#/g' src/Makefile

CFLAGS='-g -Og -I'$M_INSTALL_ROOT'/libmicrohttpd/0.9.54/include/' make debug
cd src
make install PREFIX=$INSTALL_TO
