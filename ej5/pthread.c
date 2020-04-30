/*
 * Javier Abell�n. 1 de Abril de 2003
 *
 * Programa de ejemplo de threads.
 *
 * Un �nico contador y dos threads para modificarlo. Uno lo incrementa y pone
 * su valor en pantalla precedido de la palabra "Padre". El otro lo 
 * decrementa y ponse su valor en pantalla precedido de la palabra "Hilo".
 * Vemos en pantalla como el contador se incrementa y se decrementa 
 * r�pidamente.
 */
#include <pthread.h>

/* Prototipo de la funci�n que va a ejecutar el thread hijo */
void *funcionThread (void *parametro);

/* Contador, global para que sea visible desde el main y desde funcionThread */
int contador = 0;

/*
 * Principal
 * Lanza un thread para la funci�n funcionThread.
 * Despu�s de comprobar el posible error, se mete en un bucle infinito
 * incrementando y mostrando el contador.
 */
main()
{
	/* Identificador del thread hijo */
	pthread_t idHilo;

	/* error devuelto por la funci�n de creaci�n del thread */
	int error;

	/* Creamos el thread.
	 * En idHilo nos devuelve un identificador para el nuevo thread,
	 * Pasamos atributos del nuevo thread NULL para que los coja por defecto
	 * Pasamos la funci�n que se ejecutar� en el nuevo hilo
	 * Pasamos NULL como par�metro para esa funci�n. */
	error = pthread_create (&idHilo, NULL, funcionThread, NULL);

	/* Comprobamos el error al arrancar el thread */
	if (error != 0)
	{
		perror ("No puedo crear thread");
		exit (-1);
	}

	/* Bucle infinito para incrementar el contador y mostrarlo en pantalla */
	while (1)
	{
		contador++;
		printf ("Padre : %d\n", contador);
	}
}

/* Funcion que se ejecuta en el thread hijo.*/
void *funcionThread (void *parametro)
{
   /* Bucle infinito para decrementar contador y mostrarlo en pantalla. */
	while (1)
	{
		contador--;
		printf ("Hilo  : %d\n", contador);
	}
}
