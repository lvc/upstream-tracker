python configure.py --toolchain gcc -c debug -t linux
sed -i -e "s/-g/-g -Og -w -fpermissive -fPIC/g" build.ninja
ninja
cp -f ./bin/linux/debug/x86-64/*.so* $INSTALL_TO/lib/
cp -f ./rpmalloc/*.h $INSTALL_TO/include/
