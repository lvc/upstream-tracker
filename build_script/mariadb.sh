git init
rm -fr libmariadb
git submodule add https://github.com/MariaDB/mariadb-connector-c libmariadb
# git submodule add https://github.com/facebook/rocksdb.git storage/rocksdb/rocksdb
PKG_CONFIG_PATH=$M_INSTALL_ROOT/lz4/1.8.1.2/lib/pkgconfig cmake . -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX="$INSTALL_TO" -DCMAKE_C_FLAGS="-g -Og -w -fpermissive -fPIC" -DCMAKE_CXX_FLAGS="-g -Og -w -fpermissive -fPIC" -DWITH_UNIT_TESTS=OFF -DCONC_WITH_UNITTEST=OFF -DPLUGIN_ROCKSDB=NO -DBUILD_TESTING=OFF
sed -i -e 's/SOURCE_REVISION/"0"/' sql/sys_vars.cc client/mysql.cc
make -j6
make install
rm -fr $INSTALL_TO/{data,mysql-test,scripts,sql-bench,support-files} $INSTALL_TO/lib/plugin