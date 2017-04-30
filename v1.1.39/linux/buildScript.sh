#!/bin/bash
#
# Build script for x13asHTML
#
# Copyright (C) 2015 - 2016 Dirk Eddelbuettel
#
# Released under GPL (>= 2)

set -e
set -u

srctgz="https://www.census.gov/ts/x13as/unix/x13ashtmlsrc_V1.1_B39.tar.gz"
file=$(basename ${srctgz})

td=$(mktemp -d -p /tmp x13dirXXXXXX)
cd ${td}
wget ${srctgz}
tar xaf ${file}
make -f makefile.gf
echo ""
echo "Done in build directory ${td}"
ls -l x13asHTML*
