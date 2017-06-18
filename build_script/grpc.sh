sed -i -e "s/-O[0123]/-g -Og/g" Makefile
sed -i -e "s/ strip-shared_c / /g" Makefile
sed -i -e "s/ strip-shared_cxx / /g" Makefile
PATH=$PATH:$M_INSTALL_ROOT/protobuf/3.2.0/bin/ PKG_CONFIG_PATH=$M_INSTALL_ROOT/protobuf/3.2.0/lib/pkgconfig:$M_INSTALL_ROOT/c-ares/1_12_0/lib/pkgconfig make PROTOC=$M_INSTALL_ROOT/protobuf/3.2.0/bin/protoc CFLAGS="-g -Og -w -fpermissive -std=c11" CXXFLAGS="-g -Og -w -fpermissive -std=c++11" install_c install_cxx prefix=$INSTALL_TO
