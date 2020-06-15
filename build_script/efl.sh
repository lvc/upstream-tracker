sed -i -e "s/subdir(join_paths('dbus-services'))//g" meson.build
sed -i -e "s/subdir(join_paths('systemd-services'))//g" meson.build
meson -Dphysics=true -Davahi=true --buildtype debug . build_dir --prefix="$INSTALL_TO"
cd build_dir
sed -i -e "s/ -g / -g -Og -w -fpermissive /g" build.ninja
sed -i -e "s/ -O0//g" build.ninja
ninja
ninja install
