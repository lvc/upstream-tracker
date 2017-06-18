sed -i -e "s/-g'/-g -Og'/g" buildtools/wafsamba/samba_autoconf.py third_party/waf/wafadmin/Tools/*.py
./configure --prefix="$INSTALL_TO" --enable-debug --disable-python CFLAGS="-g -Og" CXXFLAGS="-g -Og"
make
make install