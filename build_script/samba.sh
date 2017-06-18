sed -i -e "s/-g'/-g -Og'/g" buildtools/wafsamba/samba_autoconf.py
sed -i -e 's/-O1/-Og/g' buildtools/wafsamba/samba_autoconf.py
sed -i -e 's/-O3/-Og/g' script/autobuild.py
./configure --prefix="$INSTALL_TO" --enable-debug --with-shared-modules=ALL  CFLAGS="-g -Og" CXXFLAGS="-g -Og"
make
make install