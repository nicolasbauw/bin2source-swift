# bin2source

Creates a C bytes array from a file.
This repository is the swift rewrite of the original C version.

Usage:
bin2source inputfile outputfile arrayname

Example:
```
echo "abcd" > test.txt
bin2source test.txt test.c TESTARRAY
cat test.c
typedef unsigned char UINT8;
const UINT8 TESTARRAY[5] = {
        97,
        98,
        99,
        100,
        10,
};
```
You can change the typedef or array type to whatever you want, of course.

With the --amiga commutator (I use it with VBCC for instance), the output will be like:
```
#include <exec/types.h>
const UBYTE TESTARRAY[5] = {
...
```
I use that in place of the AsmPro INCBIN macro. To use this data in your source, you can make an 'extern' declaration:
```
extern const UBYTE test[5];
```

