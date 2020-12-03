#!/bin/bash

files="\
aclocal.m4
autom4te.cache
compile
config.h
config.h.in
config.log
config.status
configure
depcomp
install-sh
Makefile
Makefile.in
missing
stamp-h1
src/Makefile
src/Makefile.in
src/.deps
"

for f in "$files"; do rm -rf $f; done
