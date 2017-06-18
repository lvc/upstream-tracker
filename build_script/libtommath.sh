sed -i -e "s/-O[0-3]/-Og/g" makefile.shared makefile.include
sed -i -e 's|/usr|$(IPREFIX)|g' makefile.shared
IPREFIX=$INSTALL_TO CFLAGS="-g -Og" INSTALL_USER="andrey" INSTALL_GROUP="andrey" LIBPATH=$INSTALL_TO/lib/ INCPATH=$INSTALL_TO/include/ DATAPATH=$INSTALL_TO/shared make -f makefile.shared install