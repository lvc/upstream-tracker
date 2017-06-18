sed -i -e 's/\/usr\/local/$${QWT_INSTALL_TO}/' qwtconfig.pri
qmake-qt4 -r QMAKE_CXXFLAGS+='-g -Og -w -fpermissive' CONFIG+=debug QWT_CONFIG-=designer QWT_INSTALL_TO=$INSTALL_TO
sed -i -e 's/-O[0123]/-g -Og/g' src/Makefile textengines/mathml/Makefile designer/Makefile
make
make install
rm -fr $INSTALL_TO/qwt-*/{doc,plugins,features}
