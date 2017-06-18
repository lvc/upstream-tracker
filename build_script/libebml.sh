cd make/linux/
make CXXFLAGS="-g -Og"
cp -f *.so.* $INSTALL_TO/lib/
cd ../../
mv ebml $INSTALL_TO/include/