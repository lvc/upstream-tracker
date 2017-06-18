g++ *.cpp -o libimgui.so -shared -fPIC -g -Og
cp -f *.h $INSTALL_TO/include/
cp -f *.so $INSTALL_TO/lib/
