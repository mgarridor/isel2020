

ltl espec1{
    [] ((boton==1 )-> <>(estado==1));
}
ltl espec2{
    [](pulsaciones > codigo[posicion]-> <> codigo_err);
}
ltl espec3{
    [](((pulsaciones == codigo[2] && posicion==2) && flag_t==1  )-> <> codigo_ok);
}

int pulsaciones;
int codigo[3] = {2,3,2};
int posicion;

int flag_t;
int start_t;

int boton;
int t;

int estado;

int codigo_ok;
int codigo_err;


active proctype fsmAlarma(){
    estado=0;


    do
    ::(estado==0)-> atomic{
        if
        ::boton==1 -> pulsaciones= 1; 
        boton=0;
        start_t=1;
        codigo_err=0;
        codigo_ok=0;
        estado=1;
        fi;
    }

    ::(estado==1)->atomic{
        if
        ::(flag_t==1 && pulsaciones==codigo[posicion] && posicion<2)-> 
            posicion=posicion+1;
            flag_t=0;
            pulsaciones=0;
            estado=1;

        ::(boton==1 && pulsaciones<codigo[posicion])->
            pulsaciones=pulsaciones+1;
            start_t=1;
            boton=0;
            flag_t=0;
            estado=1;
        ::( (boton==1 && pulsaciones==codigo[posicion] && flag_t==0)|| (flag_t==1 && pulsaciones< codigo[posicion]))->
            posicion=0;
            pulsaciones=0;
            boton=0;
            flag_t=0;
            codigo_err=1;
            printf("codigo erroneo \n");
            estado=0;

        :: (flag_t==1 && pulsaciones==codigo[posicion]&& posicion==2)->
            posicion=0;
            pulsaciones=0;
            flag_t=0;
            codigo_ok=1;
            boton=0;
            printf("codigo correcto \n");

            estado=0;

        :: (t==0 && start_t==1)->start_t=0; t=1; estado=1
        :: (t==10) -> flag_t=1; t=0; estado=1;
        :: (t<10 && t>0) -> t=t+1; estado=1;

        fi;
    }
    od

}


active proctype entorno(){
    
    do
    ::  if
        ::boton=1;
        ::skip
        fi
        printf("boton: %d ",boton);
        printf("start_temp: %d ",start_t);
        printf("flag_temp: %d \n",flag_t);
        printf("codigo: %d", codigo[posicion])

        printf("estado: %d",estado);
        printf("t: %d",t);
        printf("posicion: %d", posicion);
        printf("pulsaciones: %d \n \n",pulsaciones);

    od
}




