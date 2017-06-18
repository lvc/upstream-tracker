cd source/Irrlicht/
make sharedlib CFLAGS="-g -Og -fPIC" CXXFLAGS="-g -Og -fPIC"
cd ../..
mv include/* $INSTALL_TO/include/
mv lib/Linux/* $INSTALL_TO/lib/
