sed -i -e 's/-O2/-Og/' tools/build/src/tools/*.jam libs/config/configure tools/build/src/engine/build.jam libs/regex/build/*.mak libs/regex/build/*.sh
sed -i -e 's/-O0/-Og/' tools/build/src/tools/*.jam tools/build/src/engine/build.jam
sh bootstrap.sh
./b2 install variant=debug cxxflags="-g -Og" cflags="-g -Og" --prefix=$INSTALL_TO