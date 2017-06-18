sed -i -e 's/-O[01234]/-Og/g' config/Makefile.linux* cmake/modules/*.cmake etc/Makefile.arch etc/vmc/Makefile.linux
mkdir my_build
cd my_build
cmake .. -DCMAKE_INSTALL_PREFIX=$INSTALL_TO -DCMAKE_CXX_FLAGS="-g -Og" -Dfortran=OFF -Dpython=OFF
find interpreter -type f|xargs sed -i -e 's/-g -Og//g'
make -j4
make install
rm -fr $INSTALL_TO/{tmva,README,macros,fonts,emacs,config,cmake,aclocal,test,tutorials}
find $INSTALL_TO -name "*.pcm"|xargs rm -f
find $INSTALL_TO -name "*.rootmap"|xargs rm -f
rm -f $INSTALL_TO/lib/libCling.so
