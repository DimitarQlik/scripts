#!/bin/bash

find . -type f -name \*.sln -exec sed -i '/^.*Sense.*Win32.*$/d' {} + -exec perl -i -pe 's/$/\r/' {} \;
find . -type f -name \*.vcxproj -exec perl -i ./stripWin32.pl {} \; -exec perl -i -pe 'chomp if eof' {} \;

