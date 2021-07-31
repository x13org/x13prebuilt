#!/bin/bash
#
# Build script for x13ashtml
#
# Copyright (C) 2015 - 2016 Christoph Sax
#
# Released under GPL (>= 2)

set -e
set -u

DLURL="https://www2.census.gov/software/x-13arima-seats/x13as/unix-linux/program-archives/x13as_htmlsrc-v1-1-b57.tar.gz"

# temporary direction for installation
mkdir -p /tmp/x13dl
mkdir -p /tmp/x13ashtmlsrc

cd /tmp/x13dl

# download
curl -s -k -L -O $DLURL
tar xzv -C /tmp/x13ashtmlsrc -f x13as_htmlsrc-v1-1-b57.tar.gz

# prepare source code
cd /tmp/x13ashtmlsrc

# a) remove the -static option in line 291, which otherwise causes an error
sed 's/ \-static / /' makefile.gf > makefile.gfortran

# b) renamed misspelled files
mv ADJREG.f adjreg.f
mv Acf.f acf.f

make -f makefile.gfortran

# rename resulting binary
mv x13asHTMLsv11b57 x13ashtml

mkdir -p /tmp/x13ashtml/bin
mkdir -p /tmp/x13ashtml/lib

cp x13ashtml /tmp/x13ashtml/bin

# show dependent libaries: otool -L x13ashtml
# no need to change: /usr/lib/libSystem.B.dylib

# copy dependent libaries to designated folder
cd /tmp/x13ashtml/lib
cp /usr/local/gfortran/lib/libgfortran.5.dylib libgfortran.5.dylib
cp /usr/local/gfortran/lib/libgcc_s.1.dylib libgcc_s.1.dylib
cp /usr/local/gfortran/lib/libquadmath.0.dylib libquadmath.0.dylib

# Using Apple's install_name_tool to change the internal library-path
# information to relative form.
# (as suggested by Allin Cottrell)

# libgfortran.5.dylib
install_name_tool -id @executable_path/../lib/libgfortran.5.dylib libgfortran.5.dylib
install_name_tool -change /usr/local/gfortran/lib/libgcc_s.1.dylib  @executable_path/../lib/libgcc_s.1.dylib libgfortran.5.dylib
install_name_tool -change /usr/local/gfortran/lib/libquadmath.0.dylib  @executable_path/../lib/libquadmath.0.dylib libgfortran.5.dylib

# libgcc_s.1.dylib
install_name_tool -id @executable_path/../lib/libgcc_s.1.dylib libgcc_s.1.dylib

# libquadmath.0.dylib
install_name_tool -id @executable_path/../lib/libquadmath.0.dylib libquadmath.0.dylib
install_name_tool -change /usr/local/gfortran/lib/libgcc_s.1.dylib  @executable_path/../lib/libgcc_s.1.dylib libquadmath.0.dylib

# x13ashtml
cd /tmp/x13ashtml/bin
install_name_tool -change /usr/local/gfortran/lib/libgfortran.5.dylib  @executable_path/../lib/libgfortran.5.dylib x13ashtml
install_name_tool -change /usr/local/gfortran/lib/libgcc_s.1.dylib  @executable_path/../lib/libgcc_s.1.dylib x13ashtml
install_name_tool -change /usr/local/gfortran/lib/libquadmath.0.dylib  @executable_path/../lib/libquadmath.0.dylib x13ashtml

cd /tmp
tar -cvf x13ashtml.tar.gz x13ashtml

