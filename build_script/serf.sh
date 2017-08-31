case "`basename $INSTALL_TO`" in
  0.6.1)
    patch -p0 < $(dirname "$0")/../patches/serf-0.6.1.patch
  ;&
  0.*|1.0*|1.1*|1.2*)
    svn co http://svn.apache.org/repos/asf/apr/apr/trunk srclib/apr
    ./buildconf --with-apr=srclib/apr
    autoreconf --force --verbose --install
    ./configure --prefix=$INSTALL_TO
    make install CFLAGS="-g -Og"
  ;;
  *)
    scons install --install-sandbox=$INSTALL_TO DEBUG=yes CFLAGS="-Og"
  ;;
esac
