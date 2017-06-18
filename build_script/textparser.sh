sed -i -e 's/STATIC/SHARED/g' src/CMakeLists.txt
sed -i -e 's/-O[0123]/-g -Og -I$(M_INSTALL_ROOT)\/openmpi\/2.1.1\/include/g' cmake/*.cmake
cmake . -Dwith_MPI=yes -DCMAKE_BUILD_TYPE=Debug
sed -i -e 's/-O[0123]/-g -Og/g' src/CMakeFiles/*/flags.make
make
mv include/* $INSTALL_TO/include/
mv src/*.so $INSTALL_TO/lib/
