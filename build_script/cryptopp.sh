sed -i -e "s/-O[01234]/-Og/" GNUmakefile
# sed -i -e "s/*.a/*.a *.so/" GNUmakefile
# echo -e "\nlibcryptopp.so: \$(LIBOBJS)" >> GNUmakefile
# echo -e "\t\$(CXX) -shared -o \$@ \$(LIBOBJS)" >> GNUmakefile
# make -f GNUmakefile libcryptopp.so all install PREFIX=$INSTALL_TO CXXFLAGS="-g -Og -fpermissive -w -fPIC"
# make -f GNUmakefile dynamic all install PREFIX=$INSTALL_TO CXXFLAGS="-g -Og -fpermissive -w -fPIC"
make -f GNUmakefile shared all install PREFIX=$INSTALL_TO CXXFLAGS="-g -Og -fpermissive -w -fPIC"
