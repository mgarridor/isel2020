#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <time.h>
#include <pthread.h>

//estados
enum fsm_state{IDLE,PULSANDO,FIN_PULSACION};

//flags
volatile int flag;
volatile int flag_temp;
volatile int start_temp;

//funciones activacion
void aumenta_posicion();
void resultado_ok();
void resultado_err();
void empieza_timer();
void aumenta_pulsacion();

//funciones comprobacion
int inicio();
int comprueba_pulsaciones();
int comprueba_codigo();
int codigo_correcto();
int codigo_erroneo();

//hilos
void* temporizador();
void* leeteclado();



fsm_t* fsm_new_alarma();