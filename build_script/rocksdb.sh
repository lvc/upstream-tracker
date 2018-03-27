sed -i -e 's/-O[0123]/-Og -w -fpermissive/g' Makefile
CXX=/home/Soft/GCC-5.1/bin/g++ EXTRA_CFLAGS='-g -Og -w -fpermissive' EXTRA_CXXFLAGS='-g -Og -w -fpermissive' make shared_lib -j4 VERBOSE=1
INSTALL_PATH=$INSTALL_TO make install VERBOSE=1
