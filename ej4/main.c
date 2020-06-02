#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <pthread.h>
#include "interp.h"

enum fsm_state{LED_ON,LED_OFF};

volatile int flag;

//funcion de activacion
void ledOn(fsm_t* this){
  printf("led encendido  \n");
  flag=0;
}
void ledOff(fsm_t* this){
  printf("led apagado   \n");
  flag=0;

}
//funciones de comprobacion
int comprobar_puls(fsm_t* this){
  return flag;
}

static fsm_trans_t tt[] = {
{LED_ON,  comprobar_puls, LED_OFF,  ledOff},
{LED_OFF, comprobar_puls, LED_ON,   ledOn},
{-1,NULL,-1,NULL},
};
int pulsacion(char* arg){
  flag=1;
  return 0;
}

static void* interruptor(void* args){
  interp_addcmd ("s", pulsacion,"Activa el interruptor");
  interp_addcmd ("d", pulsacion, "Activa el interruptor");
  fsm_t* fsm = fsm_new(tt);
  while(1) {
    fsm_fire(fsm);

  }
}


int main(){

  pthread_t maqEst;
  pthread_create(&maqEst,NULL,interruptor,NULL);

  interp_run();
  exit(0);
  //pthread_t thInputs;
  //pthread_create(&thInputs,NULL,leeteclado,NULL);

    // fsm_t* fsm = fsm_new(tt);
  //  system ("/bin/stty raw");

  // while(1) {
  //   fsm_fire(fsm);

  // }

}








