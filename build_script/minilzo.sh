gcc -shared -fPIC -g -Og minilzo.h minilzo.c -o libminilzo.so
mv libminilzo.so $INSTALL_TO/lib/
mv *.h $INSTALL_TO/include/