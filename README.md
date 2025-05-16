# hw11
## Description
This code prints out 2 inputs, one the professor gave me the other I put in.
1. buf1: 83 6A 88 DE 9A C3 54 9A 2. buf2: 3C A5 7E 00 FF B2 4D 19

To compile :
nasm -f elf32 hw11.asm -o hw11.o
ld -m elf_i386 hw11.o -o hw11
./hw11


OUTPUT:
83 6A 88 DE 9A C3 54 9A
3C 6A 7E 00 FF B2 4D 19

Prints out a test case that the professor gave us and my own test case. 
