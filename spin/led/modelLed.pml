ltl especLed1{
    [] ((botonLed==1 && flag_timer_led==0)-> <> luz); 
}
ltl especLed2{
    [] ((luz==1 && flag_timer_led==1 && botonLed)-> <> !luz);
}

ltl especLed3{
    [] (start_temp==1-> <> flag_timer_led);
}

byte estado=0;
int botonLed=0;
int luz=0;
int flag_timer_led=0;
int start_temp=0;
int t=0;



active proctype fsmLed(){
    estado=0;
    do
    :: (estado==0)->atomic{
        if
        ::botonLed==1 ->estado =1; 
            start_temp=1; 
            luz=1;
            botonLed=0; 
            t=0;
            
        fi;
    }
    :: (estado==1)->atomic{
        if
        ::t==3 -> flag_timer_led=1; t=0;
        ::t<3 -> t=t+1;
        ::flag_timer_led==1 -> flag_timer_led=0; luz=0; estado=0; start_temp=0;
        fi;

    }
    od
}


active proctype entorno(){
    do
    ::  if
        :: botonLed=1;
        ::skip
        fi
        printf("luz: %d ",luz);
        printf("boton: %d ",botonLed);
        printf("start_temp: %d",start_temp);
        printf("flag_temp: %d",flag_timer_led);
        printf("estado: %d",estado);
        printf("t: %d \n",t);
        


    od
}


