; Materia: Lenguajes de Interfaz
; Alumno: Jose Luis Urtusuastigui Villaseñor
; Horario: 8-9
; Docente: Dr José Luis Medina Jiménez
; Práctica: 3

INCLUDE Irvine32.inc                

.data

mensajeCaso1    BYTE "Caso 1: ECX = 0", 0
mensajeCaso2    BYTE "Caso 2: ECX = 7", 0
mensajeInvalido BYTE "EAX = 0: Entrada vacia", 0
mensajeValido   BYTE "EAX = 1: Entrada no vacia", 0

.code
main PROC

    mov edx, OFFSET mensajeCaso1    ; EDX apunta a la cadena que WriteString imprimira.
    call WriteString                ; Mostrar el caso que se probara.
    call Crlf                       ; Salto de linea.

    mov ecx, 0                      ; Longitud simulada: cero caracteres.
    call ValidarNoVacia             ; Procedimiento: devuelve en EAX 1 (valida) o 0 (vacia).

    ; Comprobar el estado devuelto por el procedimiento.
    test eax, eax                   ; EAX AND EAX: activa ZF si EAX = 0.
    jz entradaInvalida1             ; Si ZF = 1 (EAX = 0), saltar al mensaje de entrada vacia.

    mov edx, OFFSET mensajeValido   ; EAX = 1: preparar el mensaje de entrada valida.
    call WriteString                ; Mostrar que la entrada no esta vacia.
    jmp segundoCaso                 ; Evitar el mensaje de entrada invalida.

entradaInvalida1:
    mov edx, OFFSET mensajeInvalido ; EAX = 0: preparar el mensaje de entrada vacia.
    call WriteString                ; Mostrar que la entrada esta vacia.

segundoCaso:
    call Crlf                       ; Terminar la linea del resultado.
    call Crlf                       ; Linea en blanco para separar ambos casos.

  
    mov edx, OFFSET mensajeCaso2    ; Cadena que identifica el caso 2.
    call WriteString                ; Mostrarla en pantalla.
    call Crlf

    mov ecx, 7                      ; Longitud simulada: siete caracteres.
    call ValidarNoVacia             ; Llamar al procedimiento; resultado en EAX.
    test eax, eax                   ; Verificar si EAX es cero.
    jz entradaInvalida2             ; EAX = 0 -> entrada vacia.

    mov edx, OFFSET mensajeValido   ; EAX = 1 -> entrada valida.
    call WriteString                ; Mostrar el mensaje de entrada no vacia.
    jmp finPrograma                 ; Saltar el mensaje de entrada invalida.

entradaInvalida2:
    mov edx, OFFSET mensajeInvalido ; Preparar el mensaje de entrada vacia.
    call WriteString                ; Mostrarlo (no se ejecuta con ECX = 7).

finPrograma:
    call Crlf                       ; Salto de linea final.
    call WaitMsg                    ; Pausa: "Press any key to continue..." para ver la salida.
    exit                            ; Terminar el programa (macro de Irvine32).

main ENDP

ValidarNoVacia PROC

    cmp ecx, 0                      ; Comparar la longitud con cero.
    je esVacia                      ; Si ECX = 0, ir a la rama de entrada vacia.
