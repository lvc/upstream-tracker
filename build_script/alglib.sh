cd src
g++ -shared -fPIC -g -Og -o libalglib.so *.cpp
mv libalglib.so $INSTALL_TO/lib/
mv *.h $INSTALL_TO/include/
