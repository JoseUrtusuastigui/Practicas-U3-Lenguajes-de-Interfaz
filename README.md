# Practicas-U3-Lenguajes-de-interfaz
practicas de la u3
Programa 1:

Se imprime "Inicio de programa" y se llama dos veces a mostrarAviso, que muestra "Estoy dentro del procedimiento" y regresa con ret al punto siguiente a la llamada. Entre una llamada y otra se guardan 10 y 20 en EAX, sin efecto visible. Al final se imprime "Fin del programa". El ejemplo demuestra el funcionamiento básico de call y ret.

Programa 2:

main llama a RutinaA, que a su vez llama a RutinaB. Cada rutina imprime su mensaje, y los textos aparecen en el orden 1 (main), 2 (rutina A), 3 (rutina B), 4 (regreso a A) y 5 (regreso a main). Cada call apila la dirección de retorno y cada ret la recupera, por lo que el regreso ocurre en orden inverso al de las llamadas.

Programa 3:

El procedimiento ValidarNoVacia recibe una longitud en ECX y devuelve en EAX un 1 si es distinta de cero o un 0 si es cero. El programa lo prueba con ECX = 0 y con ECX = 7, y emplea test eax, eax y jz para imprimir "Entrada vacia" en el primer caso y "Entrada no vacia" en el segundo. Termina esperando una tecla con WaitMsg.

Programa 4:

main apila los valores 3 y 25 y llama a SumarPila, que arma un marco de pila con EBP, lee los argumentos en [ebp + 8] y [ebp + 12] y los multiplica con imul, dejando 75 en EAX. EBX se guarda y se restaura para no alterarlo, y ret 8 libera los argumentos de la pila. No se imprime nada.

Programa 5:

Se definen dos macros: mostrarMensaje, que imprime una cadena con salto de línea, y multiplicar, que multiplica dos cantidades con mul y deja el producto en EAX. main muestra los mensajes de bienvenida, despedida y la etiqueta del resultado, y luego multiplica 7 por 8 y presenta el 56 con WriteDec.
