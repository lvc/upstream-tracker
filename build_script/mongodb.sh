sed -i -e 's/-O0/-g -Og/g' SConstruct
sed -i -e 's/-O2/-g -Og/g' SConstruct
scons all install --prefix=$INSTALL_TO --link-model="dynamic"
