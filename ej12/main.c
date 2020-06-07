#include "main.h"

/* led--------------------------------------------- */

/* //funciones de activacion
 */void ledOn(fsm_t* this){
  printf("led encendido  \n");
  flag_led=0;
  start_temp_led=1;
}
void ledOff(fsm_t* this){
  printf("led apagado   \n");
  flag_temp_led=0;
}


/* //funciones de comprobacion
 */int comprobar_puls(fsm_t* this){
  return flag_led;
}
int comprobar_temp(fsm_t* this){
  return flag_temp_led;
}



/* alarma-------------------------------- */

/* funciones de activacion */
void aumenta_posicion(fsm_t* this){
  
  posicion++;
  pulsaciones=0;
  flag_temp_alarma=0;
  printf("posicion %d \n ",posicion );
}
void resultado_ok(fsm_t* this){
  flag_alarma=0;
  posicion=0;
  pulsaciones=0;
  pthread_mutex_lock (&m_flag_temp_alarma);
    flag_temp_alarma=0;
  pthread_mutex_unlock (&m_flag_temp_alarma);
  printf("codigo correcto \n");
}
void resultado_err(fsm_t* this){
  flag_alarma=0;
  posicion=0;
  pulsaciones=0;
  pthread_mutex_lock (&m_flag_temp_alarma);
    flag_temp_alarma=0;
  pthread_mutex_unlock (&m_flag_temp_alarma);

  printf("codigo erroneo \n");
}
void empieza_timer(fsm_t* this){
  pulsaciones =1;
  start_temp_alarma=1;
  flag_alarma=0;
  printf("pulsaciones: %d \n ",pulsaciones);
}
void aumenta_pulsacion(fsm_t* this){
  pthread_mutex_lock (&m_flag_temp_alarma);
    flag_temp_alarma=0;
  pthread_mutex_unlock (&m_flag_temp_alarma);
  pulsaciones++;
  printf("pulsaciones: %d \n ",pulsaciones);

  
  flag_alarma=0;
  start_temp_alarma=1;

}
/* funciones de comprobacion
 */
/* //comprueba si se ha pulsado el boton
 */int comprueba_primera_pulsacion(fsm_t* this){
  return flag_alarma;
}
int comprueba_pulsaciones(fsm_t* this){
    return flag_alarma && pulsaciones<codigo[posicion];
}
/* //comprueba si la cifra actual del codigo es correcta
 */int comprueba_codigo(fsm_t* this){
    return flag_temp_alarma && pulsaciones==codigo[posicion] && posicion <2;

}
/* //comprueba si el codigo completo es correcto
 */int codigo_correcto(fsm_t* this){
    return pulsaciones==codigo[posicion] && flag_temp_alarma && posicion==2;

}
/* //comprueba si el codigo pulsado es mayor que el correcto
 */int codigo_erroneo(fsm_t* this){
   return  (flag_alarma==1 && pulsaciones==codigo[posicion])||
          (pulsaciones<codigo[posicion]&& flag_temp_alarma);

}
int pulsacionCodigo(char* arg){
  printf("\n");
  flag_alarma=1;
  return 0;
}
void* tempAlarma(){

  struct timespec ts;
  ts.tv_sec = 1;
  ts.tv_nsec = 0;
  while(1){
    if(start_temp_alarma==1){
      nanosleep(&ts,NULL);
      start_temp_alarma=0;
      pthread_mutex_lock (&m_flag_temp_alarma);
        flag_temp_alarma=1;
      pthread_mutex_unlock (&m_flag_temp_alarma);    
    }
  }
    
}


/* threads----------------------------------------------- */

//temporizador para el apagado del led
void* tempLed(){
  struct timespec ts;
  ts.tv_sec = 3;
  ts.tv_nsec = 0;
  while(1){
    //si se enciende el LED se pausa la maquina de estados lo que indique el objeto ts
    if(start_temp_led==1){
      start_temp_led=0;
      nanosleep(&ts,NULL);
      flag_temp_led=1;
    }
  }
    pthread_exit(NULL);

}
int pulsacionLed(char* arg){
  flag_led=1;
  return 0;
}

int pulsacionAlarma(char* arg){
  flag_alarma=1;
  return 0;
}


static void bucle_ppal(void* args){

  //lanzo thread timers
  pthread_t thTemp;
  pthread_create(&thTemp,NULL,tempAlarma,NULL);

  pthread_t thTemp2;
  pthread_create(&thTemp2,NULL,tempLed,NULL);

  //inicializo los flags
  flag_led = 0;
  flag_temp_led = 0;
  start_temp_led = 0;

  pthread_mutex_init (&m_flag_temp_alarma, NULL);
  flag_alarma=0;
  pthread_mutex_lock (&m_flag_temp_alarma);
    flag_temp_alarma=0;
  pthread_mutex_unlock (&m_flag_temp_alarma);

  start_temp_alarma=0;
  posicion=0;
  pulsaciones=0;

  //comandos terminal

  interp_addcmd ("s", pulsacionLed,"Activa el interruptor");
  interp_addcmd ("d", pulsacionLed, "Activa el interruptor");

  interp_addcmd ("z", pulsacionAlarma,"Boton de codigo");

  //creo las maquinas de estados
  fsm_t* fsmLed = fsm_new_alarma();
  fsm_t* fsmAlarma = fsm_new_led();

  //hiperperiodo de cada tarea
  struct timespec ts;
  ts.tv_sec = 0;
  ts.tv_nsec = 10000;

  while(1) {
    fsm_fire(fsmAlarma);
    fsm_fire(fsmLed);
    nanosleep(&ts,NULL);
  }

}

int main(){
  pthread_t principal;
  pthread_create(&principal,NULL,bucle_ppal,NULL);
  interp_run();
  exit(0);

}

