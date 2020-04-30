#include "alarma.h"





/* funciones de activacion */
void aumenta_posicion(){
  
  codigoPulsado[posicion]=pulsaciones;
  posicion++;
  pulsaciones=0;
  flag_temp_alarma=0;
  printf("posicion %d \n \r",posicion );
}
void resultado_ok(){
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;
  flag_temp_alarma=0;

  printf("codigo correcto \n \r");
  exit(0);
}
void resultado_err(){
  codigoPulsado[0]=0;
  codigoPulsado[1]=0;
  codigoPulsado[2]=0;
  flag_temp_alarma=0;

  printf("codigo erroneo \r");
}
void empieza_timer(){
  start_temp_alarma=1;
  flag_alarma=0;
}
void aumenta_pulsacion(){
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
 */int comprueba_pulsaciones(){
  return flag_alarma;
}
/* //comprueba si la cifra actual del codigo es correcta
 */int comprueba_codigo(){
  if(pulsaciones==codigo[posicion]&& flag_temp_alarma==1 && posicion <2)
    return 1;
  else
    return 0;
}
/* //comprueba si el codigo completo es correcto
 */int codigo_correcto(){
  if(pulsaciones==codigo[posicion]&& flag_temp_alarma==1&& posicion==2)
    return 1;
  else
    return 0;
}
/* //comprueba si el codigo pulsado es mayor que el correcto
 */int codigo_erroneo(){
  if((pulsaciones>codigo[posicion])||(pulsaciones<codigo[posicion]&& flag_temp_alarma==1))
    return 1;
  else
    return 0;
}






/* ////////////////////////////////////////threads
 */void* temporizador(){
  struct timespec ts;
  ts.tv_sec = 1;
  ts.tv_nsec = 0;

    if(start_temp_alarma==1){
      start_temp_alarma=0;
      nanosleep(&ts,NULL);
      flag_temp_alarma=1;
    
  }
}


