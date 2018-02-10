# Makefile

OBJS	= bison.o lex.o

CC	= gcc
CFLAG	= -g -Wall -ansi -pedantic

all:		$(OBJS)

lex.o:		lex.c
		$(CC) $(CFLAGS) -c lex.c -o lex.o

lex.c:		lang.lex
		flex lang.lex
		cp lex.yy.c lex.c

bison.o:	bison.c
		$(CC) $(CFLAGS) -c bison.c -o bison.o

bison.c:	semantics.y
		bison -d -v semantics.y
		cp semantics.tab.c bison.c
		cmp -s semantics.tab.h tok.h || cp semantics.tab.h tok.h

clean:
	rm -f *.o *~ lex.c lex.yy.c bison.c tok.h semantics.tab.c semantics.tab.h semantics.output
