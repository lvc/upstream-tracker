sed -i -e 's/\/usr\/local/$${QWT_INSTALL_TO}/' qwtpolarconfig.pri
qmake-qt4 -r QMAKE_CXXFLAGS+='-g -Og -w -fpermissive' CONFIG+=debug QWT_CONFIG-=designer QWT_INSTALL_TO=$INSTALL_TO LFLAGS+='-L'$M_INSTALL_ROOT'/qwt/6.1.3/qwt-6.1.3/lib/' INCLUDEPATH+=$M_INSTALL_ROOT'/qwt/6.1.3/qwt-6.1.3/include/'
sed -i -e 's/-O[0123]/-g -Og/g' src/Makefile designer/Makefile
make -j2
make install
rm -fr $INSTALL_TO/qwtpolar-*/{doc,plugins,features}
