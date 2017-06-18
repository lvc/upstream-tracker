sed -i -e "s/-g/-g -Og -fPIC/g" Makefile libwcs/Makefile
# sed -i -e "s/-g/-g -Og -fPIC/g" libned/Makefile
make -j4
mv libwcs/*.a $INSTALL_TO/lib/
mv libwcs/*.h $INSTALL_TO/include/

# mv libned/*.a $INSTALL_TO/lib/
# mv libned/*.h $INSTALL_TO/include/
