CC=gcc
CFLAGS=-g -Wall -ansi -O -I. -DNDEBUG -D_GNU_SOURCE
LDFLAGS=-L.
LIBS = -lpthread -lreadline
main: main.o fsm.o interp.o task.o
	gcc -o main main.o fsm.o interp.o task.o $(LIBS) 

main.o : main.c
	gcc -c main.c

clean:
	rm -f *.o main