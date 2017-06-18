sed -i -e 's/-O[0123]/-Og/g' configure
./configure --enable-shared --prefix=$INSTALL_TO CFLAGS="-g -Og -w -fpermissive -fPIC" CXXFLAGS="-g -Og -w -fpermissive -fPIC" --with-log4shib=$M_INSTALL_ROOT/log4shib/1.0.9 --with-xerces=$M_INSTALL_ROOT/xerces-c/3.1.4 --with-xmlsec=$M_INSTALL_ROOT/xml-security-c/1.7.3
echo "#undef XMLTOOLING_XERCESC_HAS_XMLBYTE_RELEASE" >>config.h
make
make install
