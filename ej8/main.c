#include "main.h"



//variables globales
int pulsaciones;
int codigo[3]={3,2,3};
int codigoPulsado[3];
int posicion;



//funciones de activacion
void aumenta_posicion(){
  
  codigoPulsado[posicion]=pulsaciones;
  posicion++;
  pulsaciones=0;
  flag_temp=0;
  printf("posicion %d \n \r",posicion );
}
void resultado_ok(){
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;
  flag_temp=0;

  printf("codigo correcto \n \r");
  exit(0);
}
void resultado_err(){
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;
  flag_temp=0;

  printf("codigo erroneo \r");
}
void empieza_timer(){
  start_temp=1;
  flag=0;
}
void aumenta_pulsacion(){
  pulsaciones++;
  printf("pulsaciones: %d \n \r",pulsaciones);

  flag=0;
  pthread_t thTemp;
  start_temp=1;

    pthread_create(&thTemp,NULL,temporizador,NULL);

}
//////////////////////////////////////////////funciones de comprobacion

//comprueba si se ha pulsado el boton
int comprueba_pulsaciones(){
  return flag;
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



int main(){
  //creo la maquina de estados
  fsm_t* fsm = fsm_new_alarma();
  //creo el hilo de lectura del teclado
  pthread_t thInputs;

  flag=0;
  flag_temp=0;
  start_temp=0;
  posicion=0;
  pulsaciones=0;

  pthread_create(&thInputs,NULL,leeteclado,NULL);

  while(1) {    
    fsm_fire(fsm);
  }

}



////////////////////////////////////////threads
void* temporizador(){
  struct timespec ts;
  ts.tv_sec = 1;
  ts.tv_nsec = 0;

    if(start_temp==1){
      start_temp=0;
      nanosleep(&ts,NULL);
      flag_temp=1;
    
  }
}


//hilo que lee letras del teclado
//la tecla q cierra el programa
//las tecla z es el interruptor
void* leeteclado(){
    system ("/bin/stty raw");

    while(1){
      char letra=getchar();
      if(letra=='q'){
        system ("/bin/stty cooked");
        exit(0);
      }
      else if(letra=='z'){
        flag=1;
        printf("\r");    

      }
       
    }

  pthread_exit(NULL);
}