PATH=$M_INSTALL_ROOT/glib/2.55.0/bin:$PATH PKG_CONFIG_PATH="$M_INSTALL_ROOT/at-spi2-atk/2.26.1/lib/pkgconfig:$M_INSTALL_ROOT/atk/2.18.0/lib/pkgconfig:$M_INSTALL_ROOT/pango/1.38.1/lib/pkgconfig:$M_INSTALL_ROOT/glib/2.55.0/lib/pkgconfig:$M_INSTALL_ROOT/graphene/1.5.2/lib64/pkgconfig:$M_INSTALL_ROOT/wayland/1.13.0/lib/pkgconfig:/home/Soft/wayland-protocols-1.10/share/pkgconfig/" CFLAGS='-g -Og -fpermissive -w' meson -Ddisable-modules=true -Denable-wayland-backend=false -Dintrospection=false -Ddemos=false -Dbuild-tests=false -Ddocumentation=false --buildtype debug . build_dir --prefix=/
cd build_dir
sed -i -e "s/'-g'/'-g' '-Og' '-w' '-fpermissive'/g" build.ninja
sed -i -e "s/ '-O0'//g" build.ninja
PATH=$M_INSTALL_ROOT/glib/2.55.0/bin:$PATH ninja -j 2
DESTDIR=$INSTALL_TO ninja install
