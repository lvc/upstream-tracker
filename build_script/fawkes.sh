sed -i -e 's/-O[0123]/-Og/' etc/buildsys/btypes/*.mk
sed -i -e 's/-g /-g -Og /' etc/buildsys/btypes/*.mk
sed -i -e 's/-Werror//' etc/buildsys/btypes/*.mk
sed -i -e 's/V4L2_CID_HCENTER/0/' src/libs/fvcams/v4l2.cpp
sed -i -e 's/V4L2_CID_VCENTER/0/' src/libs/fvcams/v4l2.cpp
CXXFLAGS='-g -Og -w -fpermissive' make -j4
