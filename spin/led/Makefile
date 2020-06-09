all: pan
	./pan -a -f -N especLed1
	./pan -a -f -N especLed2
	./pan -a -f -N especLed3

pan: pan.c
	gcc -o pan pan.c

pan.c: modelLed.pml
	spin -a modelLed.pml