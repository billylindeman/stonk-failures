#!/bin/bash


mkdir -p downloads/
cd downloads/
wget -O - https://www.sec.gov/data/foiadocsfailsdatahtm | grep zip | cut -d = -f 3 | cut -d ' ' -f 1 | cut -d '"' -f 2 |  awk '{ print "https://www.sec.gov" $0 }' | wget -i -
cd - 

mkdir txt/
cd txt
for i in `find ../downloads/*.zip`; do unzip $i; done;
cd -