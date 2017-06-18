cp ../_projects/Linux/Makefile .
sed -i -e 's/CFLAGS =/CFLAGS = -g -Og -fPIC -fpermissive -w/' Makefile
echo -e "\nlibziparch.so: \$(OBJS) \$(OBJP)" >> Makefile
echo -e "\t\$(CC) -shared -o \$@ \$(OBJS) \$(OBJP)" >> Makefile
make
make libziparch.so
make install prefix=$INSTALL_TO
mv libziparch.so $INSTALL_TO/lib
