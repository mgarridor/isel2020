CC=gcc
CFLAGS=-g -Wall -ansi -O -I. -DNDEBUG
LDFLAGS=-L.
LIBS = -lpthread -lreadline
main: main.o fsm.o interp.o 
	gcc -o main main.o fsm.o interp.o  $(LIBS)

main.o : main.c
	gcc -c main.c

clean:
	rm -f *.o main