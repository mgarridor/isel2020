#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <time.h>
#include <pthread.h>
#include "interp.h"

//estados
enum fsm_state{IDLE,PULSANDO};

//flags
volatile int flag;
volatile int flag_temp;
volatile int start_temp;

//funciones activacion
void aumenta_posicion();
void resultado_ok();
void resultado_err();
void aumenta_pulsacion();

//funciones comprobacion
int comprueba_pulsaciones();
int comprueba_codigo();
int codigo_correcto();
int codigo_erroneo();

//hilos
void* temporizador();




//tabla de transicion
fsm_t* fsm_new_alarma(){
  static fsm_trans_t tt[] = {
    
    {IDLE,comprueba_pulsaciones,PULSANDO,aumenta_pulsacion},
    {PULSANDO,comprueba_codigo,PULSANDO,aumenta_posicion},
    {PULSANDO,codigo_erroneo,IDLE,resultado_err},

    {PULSANDO,comprueba_pulsaciones,PULSANDO,aumenta_pulsacion},
    {PULSANDO,codigo_correcto,IDLE,resultado_ok},

    {-1,NULL,-1,NULL},
  };
  return fsm_new(tt);
}
extern fsm_t* fsm_new_alarma();