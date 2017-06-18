CC=/home/Soft/GCC-5.1/bin/gcc CXX=/home/Soft/GCC-5.1/bin/g++ meson --buildtype debug . build_dir --prefix "$INSTALL_TO"
cd build_dir
sed -i -e "s/'-g'/'-g' '-Og' '-w' '-fpermissive'/g" build.ninja
sed -i -e "s/ '-O0'//g" build.ninja
ninja
ninja install
