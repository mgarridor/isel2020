#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <time.h>
#include <pthread.h>

/* variables globales */
int pulsaciones;
int codigo[3]={3,2,3};
int codigoPulsado[3];
int posicion;


/* estados */
enum fsm_state_alarma{IDLE,PULSANDO,FIN_PULSACION};

/* flags */
volatile int flag_alarma;
volatile int flag_temp_alarma;
volatile int start_temp_alarma;

/* funciones activacion */
void aumenta_posicion();
void resultado_ok();
void resultado_err();
void empieza_timer();
void aumenta_pulsacion();

/* funciones comprobacion */
int comprueba_pulsaciones();
int comprueba_codigo();
int codigo_correcto();
int codigo_erroneo();

/* hilos */
void* temporizador();
void* leeteclado();


/* tabla de transicion */
fsm_t* fsm_new_alarma(){
  static fsm_trans_t tt[] = {
    
    {IDLE,comprueba_pulsaciones,PULSANDO,empieza_timer},
    {PULSANDO,comprueba_pulsaciones,PULSANDO,aumenta_pulsacion},
    {PULSANDO,codigo_erroneo,IDLE,resultado_err},
    {PULSANDO,comprueba_codigo,IDLE,aumenta_posicion},
    {PULSANDO,codigo_correcto,IDLE,resultado_ok},

    {-1,NULL,-1,NULL},
  };
  return fsm_new(tt);
}