all: pan

	./pan -a -f -N espec1
	./pan -a -f -N espec2
	./pan -a -f -N espec3


pan: pan.c
	gcc -o pan pan.c

pan.c: modelAlarma.pml
	spin -a modelAlarma.pml