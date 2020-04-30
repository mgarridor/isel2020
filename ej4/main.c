#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <pthread.h>


enum fsm_state{LED_ON,LED_OFF};

volatile int flag;

//funcion de activacion
void ledOn(fsm_t* this){
  printf("led encendido  \r");
  flag=0;
}
void ledOff(fsm_t* this){
  printf("led apagado   \r");
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
      }
      else 
        printf("\r");    
    }

  pthread_exit(NULL);
}
int main(){
  pthread_t thInputs;
  pthread_create(&thInputs,NULL,leeteclado,NULL);

    fsm_t* fsm = fsm_new(tt);
    system ("/bin/stty raw");

  while(1) {
    fsm_fire(fsm);

  }

}








