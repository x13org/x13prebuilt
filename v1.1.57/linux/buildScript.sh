#!/bin/bash
#
# Build script for x13asHTML
#
# Copyright (C) 2015 - 2021  Dirk Eddelbuettel
#
# Released under GPL (>= 2)

set -e
set -u

srctgz="https://www2.census.gov/software/x-13arima-seats/x13as/unix-linux/program-archives/x13as_htmlsrc-v1-1-b57.tar.gz"
file=$(basename ${srctgz})

td=$(mktemp -d -p /tmp x13dirXXXXXX)
cd ${td}
wget ${srctgz}
tar xaf ${file}
make -f makefile.gf
echo ""
echo "Done in build directory ${td}"
ls -l x13asHTML*
