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

/* funciones activacion */
void aumenta_posicion(fsm_t*);
void resultado_ok(fsm_t*);
void resultado_err(fsm_t*);
void empieza_timer(fsm_t*);
void aumenta_pulsacion(fsm_t*);

/* funciones comprobacion */
int comprueba_primera_pulsacion(fsm_t*);
int comprueba_pulsaciones(fsm_t*);
int comprueba_codigo(fsm_t*);
int codigo_correcto(fsm_t*);
int codigo_erroneo(fsm_t*);

//hilos
void* temporizador();




//tabla de transicion
fsm_t* fsm_new_alarma(){
  static fsm_trans_t tt[] = {
    
    {IDLE,comprueba_primera_pulsacion,PULSANDO,empieza_timer},
    {PULSANDO,comprueba_codigo,PULSANDO,aumenta_posicion},
    {PULSANDO,codigo_erroneo,IDLE,resultado_err},
    {PULSANDO,comprueba_pulsaciones,PULSANDO,aumenta_pulsacion},
    {PULSANDO,codigo_correcto,IDLE,resultado_ok},

    {-1,NULL,-1,NULL},
  };
  return fsm_new(tt);
}
extern fsm_t* fsm_new_alarma();