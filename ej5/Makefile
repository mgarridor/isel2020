CC=gcc
CFLAGS=-g -Wall -ansi -O -I. -DNDEBUG
LDFLAGS=-L.
LIBS = -lpthread
main: main.o fsm.o
	gcc -o main main.o fsm.o $(LIBS)

main.o : main.c
	gcc -c main.c

clean:
	rm -f *.o main