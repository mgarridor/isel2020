#include "main.h"

/* led--------------------------------------------- */

/* //funciones de activacion
 */void ledOn(fsm_t* this){
  printf("led encendido  \r");
  flag_led=0;
  start_temp_led=1;
}
void ledOff(fsm_t* this){
  printf("led apagado   \r");
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
  
  codigoPulsado[posicion]=pulsaciones;
  posicion++;
  pulsaciones=0;
  flag_temp_alarma=0;
  printf("posicion %d \n \r",posicion );
}
void resultado_ok(fsm_t* this){
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;
  flag_temp_alarma=0;

  printf("codigo correcto \n \r");
  exit(0);
}
void resultado_err(fsm_t* this){
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;
  flag_temp_alarma=0;

  printf("codigo erroneo \r");
}
void empieza_timer(fsm_t* this){
  start_temp_alarma=1;
  flag_alarma=0;
}
void aumenta_pulsacion(fsm_t* this){
  pulsaciones++;
  printf("pulsaciones: %d \n \r",pulsaciones);

  flag_alarma=0;
  pthread_t thTemp;
  start_temp_alarma=1;

    pthread_create(&thTemp,NULL,temporizador,NULL);

}
/* funciones de comprobacion
 */
/* //comprueba si se ha pulsado el boton
 */int comprueba_pulsaciones(fsm_t* this){
  return flag_alarma;
}
/* //comprueba si la cifra actual del codigo es correcta
 */int comprueba_codigo(fsm_t* this){
  if(pulsaciones==codigo[posicion]&& flag_temp_alarma==1 && posicion <2)
    return 1;
  else
    return 0;
}
/* //comprueba si el codigo completo es correcto
 */int codigo_correcto(fsm_t* this){
  if(pulsaciones==codigo[posicion]&& flag_temp_alarma==1&& posicion==2)
    return 1;
  else
    return 0;
}
/* //comprueba si el codigo pulsado es mayor que el correcto
 */int codigo_erroneo(fsm_t* this){
  if((pulsaciones>codigo[posicion])||(pulsaciones<codigo[posicion]&& flag_temp_alarma==1))
    return 1;
  else
    return 0;
}

 void* temporizador(){
  struct timespec ts;
  ts.tv_sec = 1;
  ts.tv_nsec = 0;

    if(start_temp_alarma==1){
      start_temp_alarma=0;
      nanosleep(&ts,NULL);
      flag_temp_alarma=1;
    
  }
}


/* threads----------------------------------------------- */

//hilo que lee letras del teclado
//la tecla q cierra el programa
//las tecla z es el interruptor
void *leeteclado()
{
    system("/bin/stty raw");
    while (1){
        char letra = getchar();
        if (letra == 'q'){
            system("/bin/stty cooked");
            exit(0);
        }
        else if (letra == 'z'){
            flag_alarma = 1;
            printf("\r");
        }
        else if (letra == 'd' || letra == 's'){
            flag_led = 1;
            printf("\r");
        }
    }

    pthread_exit(NULL);
}
//temporizador para el apagado del led
void* temp(){
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


int main(){
    //creo la maquina de estados
    fsm_t *fsm_led = fsm_new_led();
    fsm_t *fsm_alarma = fsm_new_alarma();

    //creo el hilo de lectura del teclado
    pthread_t thInputs;
    pthread_create(&thInputs, NULL, leeteclado, NULL);
    pthread_t thInputs2;
    pthread_create(&thInputs2,NULL,temp,NULL);

    //inicializo los flags
    flag_led = 0;
    flag_temp_led = 0;
    start_temp_led = 0;

    flag_alarma = 0;
    flag_temp_alarma = 0;
    start_temp_alarma = 0;
    posicion = 0;
    pulsaciones = 0;

    while (1){

        fsm_fire(fsm_alarma);
        fsm_fire(fsm_led);
    }
}

