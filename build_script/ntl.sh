cd src
./configure SHARED=on CXXFLAGS="-g -Og" PREFIX=$INSTALL_TO
sed -i -e "s/-g[0123]/-Og'/g" makefile
make -j2
make install
