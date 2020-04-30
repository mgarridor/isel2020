#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <time.h>
#include <pthread.h>

/*descripcion del ejecicio:
  cada vez que se pulsa la tecla 's' o 'd' es como si se pulsara un interruptor.
  El interruptor enciende una luz y esta se apaga despues de 3 segundos
*/
enum fsm_state{LED_ON,LED_OFF};

volatile int flag;
volatile int flag_temp;
volatile int start_temp;

//funciones de activacion
void ledOn(fsm_t* this){
  printf("led encendido  \r");
  flag=0;
  start_temp=1;
}
void ledOff(fsm_t* this){
  printf("led apagado   \r");
  flag_temp=0;
}


//funciones de comprobacion
int comprobar_puls(fsm_t* this){
  return flag;
}
int comprobar_temp(fsm_t* this){
  return flag_temp;
}


//tabla de transicion

fsm_t* fsm_new_led(){
  static fsm_trans_t tt[] = {
    {LED_OFF, comprobar_puls, LED_ON,   ledOn},
    {LED_ON,  comprobar_temp, LED_OFF,  ledOff},
    {-1,NULL,-1,NULL},
  };
  return fsm_new(tt);
}
//hilo que lee letras del teclado
//la tecla q cierra el programa
//las teclas d y s son los interruptores
void* leeteclado(){
    system ("/bin/stty raw");

    while(1){
      char letra=getchar();
      if(letra=='q'){
        system ("/bin/stty cooked");
        exit(0);
      }
      else if(letra=='d' || letra=='s'){
        flag=1;
        printf("\r");    

      }
      else 
        printf("\r");    
    }

  pthread_exit(NULL);
}


int main(){
  //creo la maquina de estados
  fsm_t* fsm = fsm_new_led();
  //creo el hilo de lectura del teclado
  pthread_t thInputs;
  pthread_create(&thInputs,NULL,leeteclado,NULL);

  struct timespec ts;
  ts.tv_sec = 3;
  ts.tv_nsec = 0;

  while(1) {
    //si se enciende el LED se pausa la maquina de estados lo que indique el objeto ts
    if(start_temp==1){
      start_temp=0;
      nanosleep(&ts,NULL);
      flag_temp=1;
    }
    
    fsm_fire(fsm);
  }

}



