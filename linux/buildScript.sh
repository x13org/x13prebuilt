#!/bin/bash
#
# Build script for x13ashtml
#
# Copyright (C) 2015 - 2016 Dirk Eddelbuettel
#
# Released under GPL (>= 2)

set -e
set -u

srctgz="https://www.census.gov/ts/x13as/unix/x13ashtmlsrc_V1.1_B19.tar.gz"
file=$(basename ${srctgz})

td=$(tempfile -p x13)
mkdir ${td}
cd ${td}
wget ${srctgz}
tar xfz ${file}
make -f makefile.g77
echo ""
echo "Done"
ls -l x13ashtml
