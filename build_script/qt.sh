echo "QMAKE_CXXFLAGS = -g -Og" >> qtbase/mkspecs/common/g++-base.conf
echo "QMAKE_CFLAGS = -g -Og" >> qtbase/mkspecs/common/gcc-base.conf
sed -i -e 's/-O2/-Og/g' qtbase/mkspecs/common/*.conf

CXXFLAGS="-g -Og -w -fpermissive" ./configure -prefix "$INSTALL_TO" -opensource -confirm-license -shared -debug -nomake examples -nomake tests -qt-xcb -no-libpng -skip qtwebengine
gmake -j3
gmake install
find $INSTALL_TO -name "*_p.h"|xargs rm -f
rm -fr $INSTALL_TO/phrasebooks $INSTALL_TO/translations $INSTALL_TO/plugins $INSTALL_TO/qml