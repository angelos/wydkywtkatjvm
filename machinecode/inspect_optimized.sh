gcc $1 -O3
xxd a.out
otool -vt a.out
rm a.out