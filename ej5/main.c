#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <time.h>
#include <pthread.h>
#include "interp.h"
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
  printf("led encendido  \n");
  flag=0;
  start_temp=1;
}
void ledOff(fsm_t* this){
  printf("led apagado   \n");
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

void* temp(){
  struct timespec ts;
  ts.tv_sec = 3;
  ts.tv_nsec = 0;

  while(1){
    //si se enciende el LED se pausa la maquina de estados lo que indique el objeto ts
    if(start_temp==1){
      start_temp=0;
      nanosleep(&ts,NULL);
      flag_temp=1;
    }
  }
    pthread_exit(NULL);

}
int pulsacion(char* arg){
  flag=1;
  return 0;
}
static void* interruptor(void* args){
  interp_addcmd ("s", pulsacion,"Activa el interruptor");
  interp_addcmd ("d", pulsacion, "Activa el interruptor");
  fsm_t* fsm = fsm_new_led();
  while(1) {
    fsm_fire(fsm);

  }
}

int main(){
  pthread_t maqEst;
  pthread_t thInputs2;
  pthread_create(&thInputs2,NULL,temp,NULL);
  pthread_create(&maqEst,NULL,interruptor,NULL);

  interp_run();
  exit(0);
}



