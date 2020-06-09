
#include <stdio.h>
#include <stdlib.h>
#include "fsm.h"
#include <time.h>
#include <pthread.h>
#include "interp.h"
/* led------------------------- */
volatile int flag_led;
volatile int flag_temp_led;
volatile int start_temp_led;

enum fsm_state_led{LED_ON,LED_OFF};



void ledOn(fsm_t*);
void ledOff(fsm_t*);

int comprobar_puls(fsm_t*);
int comprobar_temp(fsm_t*);

void* tempLed();
/* tabla de transicion */

fsm_t* fsm_new_led(){
  static fsm_trans_t tt[] = {
    {LED_OFF, comprobar_puls, LED_ON,   ledOn},
    {LED_ON,  comprobar_temp, LED_OFF,  ledOff},
    {-1,NULL,-1,NULL},
  };
  return fsm_new(tt);
}
/* alarma---------------------------- */


/* variables globales */
int pulsaciones;
int codigo[3]={3,2,3};
int codigoPulsado[3];
int posicion;

/*mutex */
static pthread_mutex_t m_flag_temp_alarma;


/* estados */
enum fsm_state_alarma{IDLE,PULSANDO,FIN_PULSACION};

/* flags */
volatile int flag_alarma;
volatile int flag_temp_alarma;
volatile int start_temp_alarma;

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

/* hilos */
void* tempAlarma();


/* tabla de transicion */
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