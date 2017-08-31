sed -i -e 's/-g/-g -Og/' Makefile
# sed -i -e 's/$(STRIP)/#/' Makefile
mkdir -p $INSTALL_TO/lib64/pkgconfig
GLEW_DEST="$INSTALL_TO" MAKECMDGOALS=debug STRIP= make install
