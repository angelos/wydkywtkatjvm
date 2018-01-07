gcc $1
xxd a.out
otool -vt a.out
rm a.out