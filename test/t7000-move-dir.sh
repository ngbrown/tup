#! /bin/sh -e

. ../tup.sh
tup monitor
mkdir a
cp ../testMakefile Makefile
cp ../testMakefile a/Makefile

echo "int main(void) {return 0;}" > a/foo.c
update
sym_check a/foo.o main
sym_check a/prog main

# Move directory a to b
mv a b
update
tup_object_exist b/foo.c b/foo.o b/prog
tup_object_no_exist a/foo.c a/foo.o a/prog
