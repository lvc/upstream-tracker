
make install prefix="$INSTALL_TO" build=release XCFLAGS="-g -Og -fPIC"
echo -e "\nshared:" >> Makefile
echo -e "\tgcc \$(CFLAGS) \$(MUPDF_OBJ) \$(THIRD_OBJ) -shared -o libmupdf.so" >> Makefile
echo -e "\tgcc \$(CFLAGS) \$(THIRD_OBJ) -shared -o libmupdfthird.so" >> Makefile
echo -e "\tgcc \$(CFLAGS) \$(MUTOOL_OBJ) -shared -o libmutools.so" >> Makefile
make shared XCFLAGS="-g -Og -fPIC"
cp -f *.so $INSTALL_TO/lib/
