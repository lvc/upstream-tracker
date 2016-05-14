./configure --prefix="$INSTALL_TO" --disable-python --disable-perl --disable-util-oscap --disable-oval --disable-probes --disable-bindings CFLAGS="-g -Og -fpermissive -w"
sed -i -e 's/_GL_WARN_ON_USE.*//g' lib/stdio.in.h
make
make install