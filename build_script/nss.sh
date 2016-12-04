cp -fr /home/Soft/nspr ..
sed -i -e 's/-O2/-Og -g -w -fpermissive/' coreconf/*.mk lib/*/Makefile lib/*/*/*.mk ../nspr/configure
make nss_build_all USE_64=1 BUILD_OPT=0
mkdir $INSTALL_TO/lib
cp -f lib/*/*/*.so lib/*/*/*/*.so $INSTALL_TO/lib/