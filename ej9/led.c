#include "led.h"

/*descripcion del ejecicio:
  cada vez que se pulsa la tecla 's' o 'd' es como si se pulsara un interruptor.
  El interruptor enciende una luz y esta se apaga despues de 3 segundos
*/


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





