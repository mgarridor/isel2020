#include "main.h"

/* led--------------------------------------------- */

/*funciones de activacion*/
void ledOn(fsm_t* this){
  printf("led encendido  \n");
  flag_led=0;
  start_temp_led=1;
}
void ledOff(fsm_t* this){
  printf("led apagado   \n");
  flag_temp_led=0;
}


/*funciones de comprobacion*/
int comprobar_puls(fsm_t* this){
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
  printf("%d \n ",pulsaciones);
}
void aumenta_pulsacion(fsm_t* this){
  pthread_mutex_lock (&m_flag_temp_alarma);
    flag_temp_alarma=0;
  pthread_mutex_unlock (&m_flag_temp_alarma);
  pulsaciones++;
  printf("%d \n ",pulsaciones);

  
  flag_alarma=0;
  start_temp_alarma=1;

}
/* funciones de comprobacion
 */
/* //comprueba si se ha pulsado el boton*/
int comprueba_primera_pulsacion(fsm_t* this){
  return flag_alarma;
}
int comprueba_pulsaciones(fsm_t* this){
    return flag_alarma && pulsaciones<codigo[posicion];
}
/* //comprueba si la cifra actual del codigo es correcta*/
int comprueba_codigo(fsm_t* this){
    return flag_temp_alarma && pulsaciones==codigo[posicion] && posicion <2;

}
/* //comprueba si el codigo completo es correcto*/
int codigo_correcto(fsm_t* this){
    return pulsaciones==codigo[posicion] && flag_temp_alarma && posicion==2;

}
/* //comprueba si el codigo pulsado es mayor que el correcto*/
int codigo_erroneo(fsm_t* this){
   return  (flag_alarma==1 && pulsaciones==codigo[posicion])||
          (pulsaciones<codigo[posicion]&& flag_temp_alarma);
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
//temporizador entre pulsacion y pulsacion de la alarma
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
int pulsacionLed(char* arg){
  flag_led=1;
  return 0;
}
/* Tareas de cada maquina de estados*/
static void* task_led(void* args){
  //periodo de la tarea
  struct timespec ts;
  ts.tv_sec = 0;
  ts.tv_nsec = 10000;

  pthread_t thInputs2;
  pthread_create(&thInputs2,NULL,tempLed,NULL);
  //inicializo los flags
  flag_led = 0;
  flag_temp_led = 0;
  start_temp_led = 0;

  //configuracion de comandos
  interp_addcmd ("s", pulsacionLed,"Activa el interruptor");
  interp_addcmd ("d", pulsacionLed, "Activa el interruptor");
  //inicializacion de maquina de estados
  fsm_t* fsm = fsm_new_led();
  while(1) {
    fsm_fire(fsm);
    nanosleep(&ts,NULL);
    
  }
}
int pulsacionAlarma(char* arg){
  flag_alarma=1;
  return 0;
}
static void* taskAlarma(void* args){
  //periodo de la tarea

  struct timespec ts;
  ts.tv_sec = 0;
  ts.tv_nsec = 10000;

  //thread del timer
  pthread_t thTemp;
  pthread_create(&thTemp,NULL,tempAlarma,NULL);
  //configuracion de comandos

  interp_addcmd ("z", pulsacionAlarma,"Boton de codigo");

  //maquina de estados
  fsm_t* fsm = fsm_new_alarma();
  pthread_mutex_init (&m_flag_temp_alarma, NULL);
  flag_alarma=0;
  pthread_mutex_lock (&m_flag_temp_alarma);
    flag_temp_alarma=0;
  pthread_mutex_unlock (&m_flag_temp_alarma);

  //inicializacion de variables
  start_temp_alarma=0;
  posicion=0;
  pulsaciones=0;

  while(1) {
    fsm_fire(fsm);
    nanosleep(&ts,NULL);
  }
}


int main(){
    
  pthread_t maqEstLed=task_new("Led",task_led,100,100,1,1024);
  pthread_t maqEstAlarma=task_new("alarma",taskAlarma,100,100,2,1024); 
  interp_run();
  exit(0);

}

