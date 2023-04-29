# make makefile
#
# Tools used:
#  Compile::Watcom Resource Compiler
#  Compile::GNU C
#  Compile::Watcom Linker
#  Make: GNU make
all : checkers.exe

checkers.exe : checkers.obj ckrdraw.obj checkers.res checkers.def
	gcc -Zomf checkers.obj ckrdraw.obj checkers.res checkers.def -o checkers.exe
	wrc checkers.res

checkers.obj : checkers.c checkers.h
	gcc -Wall -Zomf -c -O2 checkers.c -o checkers.obj

ckrdraw.obj : ckrdraw.c checkers.h
	gcc -Wall -Zomf -c -O2 ckrdraw.c -o ckrdraw.obj

checkers.res : checkers.rc
	wrc -r checkers.rc

clean :
	rm -rf *exe *RES *obj
