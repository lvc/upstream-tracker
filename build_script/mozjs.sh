cd js/src
sed -i -e 's/\-O[1234]/-Og/' configure
mkdir obj
cd obj
../configure --enable-debug --disable-tests --disable-jemalloc --with-intl-api --prefix="$INSTALL_TO" --enable-optimize="-Og -fpermissive -w"
make
make install
#find $INSTALL_TO/include -type l -delete
#mkdir -p $INSTALL_TO/include/js $INSTALL_TO/include/mozilla
#cp -fr ../../public/*.h $INSTALL_TO/include/js/
#cp -fr ../*.h $INSTALL_TO/include/
#cp -fr ../../../mfbt/*.h $INSTALL_TO/include/mozilla/
