sed -i -e 's/-O2/-Og/g' Cross/Makefile cpan/Config-Perl-V/t/* Configure hints/*
sh Configure -de -Dprefix="$INSTALL_TO" -A ccflags="-g -Og -w -fpermissive" -DEBUGGING="-g -Og" -Doptimize=-Og -Dcccdlflags=-fPIC -Duseshrplib
make
make install
mkdir -p $INSTALL_TO/include/CORE/
cp -fr $INSTALL_TO/lib/*/*/CORE/*.h $INSTALL_TO/include/CORE/
mkdir -p $INSTALL_TO/lib64/
cp -fr $INSTALL_TO/lib/*/*/CORE/*.so* $INSTALL_TO/lib64/
rm -fr $INSTALL_TO/lib $INSTALL_TO/man $INSTALL_TO/bin