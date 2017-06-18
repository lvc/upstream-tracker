sed -i -e 's/-O[0123]/-g -Og/g' configure
./configure --prefix=$INSTALL_TO --enable-shared --without-gdal --without-freetype --without-tcltk
make
make install
rm -fr $INSTALL_TO/grass-*/{include/Make,bin,demolocation,docs,man,bwidget,driver,etc,gui,share,fonts,tools,scripts,AUTHORS,CHANGES,CITING,INSTALL,REQUIREMENTS.html,config.status,GPL.TXT}
rm -fr $INSTALL_TO/grass-*/*.csv
