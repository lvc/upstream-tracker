sed -i -e 's/-O[0123]/-Og/' config.pri
sed -i -e 's/ examples//' maliit-framework.pro
/home/Soft/Qt-5.7.1/bin/qmake -r QMAKE_CXXFLAGS+='-g -Og -w -fpermissive' CONFIG+=nodoc CONFIG+=notests CONFIG+=local-install CONFIG+=debug PREFIX=$INSTALL_TO LIBDIR=$INSTALL_TO/lib
make -j2
make install
