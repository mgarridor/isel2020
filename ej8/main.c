#include "main.h"



//variables globales
int pulsaciones;
int codigo[3]={3,2,3};
int codigoPulsado[3];
int posicion;

static pthread_mutex_t m_flag_temp;

//funciones de activacion
void aumenta_posicion(){
  
  posicion++;
  pulsaciones=0;
  flag_temp=0;
  printf("posicion %d \n",posicion );
}
void resultado_ok(){
  flag=0;
  start_temp=0;
  posicion=0;
  pulsaciones=0;
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);
  printf("codigo correcto \n");

}
void resultado_err(){
  flag=0;
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);  start_temp=0;
  posicion=0;
  pulsaciones=0;
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;

  printf("codigo erroneo \n");
}

void aumenta_pulsacion(){
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);

  pulsaciones++;
  printf("pulsaciones: %d \n ",pulsaciones);

  flag=0;
  pthread_t thTemp;
  start_temp=1;

  pthread_create(&thTemp,NULL,temporizador,NULL);

}
//////////////////////////////////////////////funciones de comprobacion

//comprueba si se ha pulsado el boton
int comprueba_pulsaciones(){
  if(flag_temp==0)
    return flag;
  else 
    return 0;
}
//comprueba si la cifra actual del codigo es correcta
int comprueba_codigo(){
  if(pulsaciones==codigo[posicion]&& flag_temp==1 && posicion <2)
    return 1;
  else
    return 0;
}
//comprueba si el codigo completo es correcto
int codigo_correcto(){
  if(pulsaciones==codigo[posicion]&& flag_temp==1&& posicion==2)
    return 1;
  else
    return 0;
}
//comprueba si el codigo pulsado es mayor que el correcto
int codigo_erroneo(){
  if((pulsaciones>codigo[posicion])||(pulsaciones<codigo[posicion]&& flag_temp==1))
    return 1;
  else
    return 0;
}

int pulsacionCodigo(char* arg){
  flag=1;
  return 0;
}

static void* codigoMain(void* args){
  interp_addcmd ("z", pulsacionCodigo,"Boton de codigo");
    
    
    //creo la maquina de estados
  fsm_t* fsm = fsm_new_alarma();
  pthread_mutex_init (&m_flag_temp, NULL);
  flag=0;
  pthread_mutex_lock (&m_flag_temp);
    flag_temp=0;
  pthread_mutex_unlock (&m_flag_temp);

  start_temp=0;
  posicion=0;
  pulsaciones=0;

  while(1) {
    fsm_fire(fsm);
  }
}

int main(){

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

    if(start_temp==1){
      start_temp=0;
      nanosleep(&ts,NULL);

  pthread_mutex_lock (&m_flag_temp);
    flag_temp=1;
  pthread_mutex_unlock (&m_flag_temp);    
  }
}