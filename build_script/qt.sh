CXXFLAGS="-g -Og -w -fpermissive" ./configure -prefix "$INSTALL_TO" -opensource -confirm-license -shared -debug -nomake examples -nomake tests -qt-xcb -no-libpng -skip qtwebengine
gmake -j2
gmake install
find $INSTALL_TO -name "*_p.h"|xargs rm -f