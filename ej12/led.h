#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <time.h>
#include <pthread.h>

volatile int flag_led;
volatile int flag_temp_led;
volatile int start_temp_led;

enum fsm_state_led{LED_ON,LED_OFF};



void ledOn(fsm_t*);
void ledOff(fsm_t*);

int comprobar_puls(fsm_t*);
int comprobar_temp(fsm_t*);

/* tabla de transicion */

fsm_t* fsm_new_led(){
  static fsm_trans_t tt[] = {
    {LED_OFF, comprobar_puls, LED_ON,   ledOn},
    {LED_ON,  comprobar_temp, LED_OFF,  ledOff},
    {-1,NULL,-1,NULL},
  };
  return fsm_new(tt);
}
