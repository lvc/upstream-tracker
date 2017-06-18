sed -i -e "s/'-g'/'-g -Og'/" third_party/waf/wafadmin/Tools/*.py buildtools/wafsamba/*
./configure --prefix=$INSTALL_TO --enable-debug
make
make install