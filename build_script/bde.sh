WAF=/home/andrey/Software/bde-tools-1.1/bin/waf
cp -f /home/andrey/Software/bde-tools-1.1/wscript .
CXXFLAGS="-g -Og" $WAF configure --prefix=$INSTALL_TO --library-type=shared --build-type=debug
$WAF build
$WAF install