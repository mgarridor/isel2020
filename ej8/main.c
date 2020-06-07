#include "main.h"



//variables globales
int pulsaciones;
int codigo[3]={3,2,3};
int posicion;

static pthread_mutex_t m_flag_temp;

//funciones de activacion
void empieza_timer(fsm_t* this){
  pulsaciones =1;
  start_temp=1;
  flag=0;
  printf("pulsaciones: %d \n ",pulsaciones);

}
void aumenta_posicion(fsm_t* this){
  
  posicion++;
  pulsaciones=0;
  flag_temp=0;
  printf("posicion %d \n",posicion );
}
void resultado_ok(fsm_t* this){
  flag=0;
  posicion=0;
  pulsaciones=0;
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);
  printf("codigo correcto \n");

}
void resultado_err(fsm_t* this){
  flag=0;
  posicion=0;
  pulsaciones=0;
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);  


  printf("codigo erroneo \n");
}

void aumenta_pulsacion(fsm_t* this){
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);
  pulsaciones++;
  printf("pulsaciones: %d \n ",pulsaciones);

  
  flag=0;
  start_temp=1;

}
/////////////////////funciones de comprobacion

//comprueba si se ha pulsado el boton
int comprueba_primera_pulsacion(fsm_t* this){
    return flag;
}
int comprueba_pulsaciones(fsm_t* this){
    return flag && pulsaciones<codigo[posicion];
}

//comprueba si la cifra actual del codigo es correcta
int comprueba_codigo(fsm_t* this){
    return flag_temp && pulsaciones==codigo[posicion] && posicion <2;
}
//comprueba si el codigo completo es correcto
int codigo_correcto(fsm_t* this){
  return pulsaciones==codigo[posicion] && flag_temp && posicion==2;
}
//comprueba si el codigo pulsado es mayor que el correcto
int codigo_erroneo(fsm_t* this){
  return  (flag==1 && pulsaciones==codigo[posicion])||
          (pulsaciones<codigo[posicion]&& flag_temp);

}

int pulsacionCodigo(char* arg){
  printf("\n");
  flag=1;
  return 0;
}

static void* codigoMain(void* args){
  struct timespec ts;
  ts.tv_sec = 0;
  ts.tv_nsec = 10000;

  interp_addcmd ("z", pulsacionCodigo,"Boton de codigo");
    
  //creo la maquina de estados
  fsm_t* fsm = fsm_new_alarma();
  //inicio mutex
  pthread_mutex_init (&m_flag_temp, NULL);
  //inicializo variables
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);
  flag=0;
  start_temp=0;
  posicion=0;
  pulsaciones=0;
  // thread timer
  pthread_t thTemp;
  pthread_create(&thTemp,NULL,temporizador,NULL);

  while(1) {
    fsm_fire(fsm);
    nanosleep(&ts,NULL);
  }
}

int main(){

//thread principal
  pthread_t maqEst;
  pthread_create(&maqEst,NULL,codigoMain,NULL);

  interp_run();
  exit(0);

}

////////////////////////////////////////threads
void* temporizador(){

  struct timespec ts;
  ts.tv_sec = 1;
  ts.tv_nsec = 0;
  while(1){
    if(start_temp==1){
      nanosleep(&ts,NULL);
      start_temp=0;
      pthread_mutex_lock (&m_flag_temp);
        flag_temp=1;
      pthread_mutex_unlock (&m_flag_temp);    
    }
  }
    
}