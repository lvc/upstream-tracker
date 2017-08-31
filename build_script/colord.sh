mkdir build
cd build
PKG_CONFIG_PATH="$M_INSTALL_ROOT/libgusb/0_2_11/lib/pkgconfig:$M_INSTALL_ROOT/glib/2.52.3/lib/pkgconfig" ../configure --disable-argyllcms-sensor --disable-systemd-login --disable-bash-completion --disable-gusb --disable-sane --with-udevrulesdir=$INSTALL_TO/udev --with-tmpfilesdir=$INSTALL_TO/tmp --with-systemdsystemunitdir=$INSTALL_TO/systemd
make
make install
rm -fr $INSTALL_TO/lib/colord-plugins/ $INSTALL_TO/lib/colord-sensors/
