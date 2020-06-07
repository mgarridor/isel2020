CC=gcc
CFLAGS = -Wall -g -O2 $(DEBUG) -Iinclude -Iinclude/freertos -Ifreertos/portable/GCC/Posix
LDFLAGS=-L.
LIBS = -lpthread -lreadline
main: main.o fsm.o interp.o 
	gcc -o main main.o fsm.o interp.o  $(LIBS)

main.o : main.c
	gcc -c main.c

clean:
	rm -f *.o main

vpath %.c freertos
vpath %.c freertos/portable/GCC/Posix
vpath %.c freertos/portable/MemMang
vpath %.c include
vpath %.c include/freertos

