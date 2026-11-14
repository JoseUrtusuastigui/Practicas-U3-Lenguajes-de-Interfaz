INCLUDE Irvine32.inc

.data
mensajeCaso1 BYTE "Caso 1: ECX = 0", 0
mensajeCaso2 BYTE "Caso 2: ECX = 7", 0
mensajeInvalido BYTE "EAX = 0: Entrada vacia", 0
mensajeValido BYTE "EAX = 1: Entrada no vacia", 0

.code
main PROC

    ; CASO 1: Entrada vacia
    mov edx, OFFSET mensajeCaso1
    call WriteString
    call Crlf

    mov ecx, 0
    call ValidarNoVacia

    ; Consultar el estado antes de continuar.
    test eax, eax
    jz entradaInvalida1

    mov edx, OFFSET mensajeValido
    call WriteString
    jmp segundoCaso

entradaInvalida1:
    mov edx, OFFSET mensajeInvalido
    call WriteString

segundoCaso:
    call Crlf
    call Crlf

    ; CASO 2: Entrada de siete caracteres
    mov edx, OFFSET mensajeCaso2
    call WriteString
    call Crlf

    mov ecx, 7
    call ValidarNoVacia

    test eax, eax
    jz entradaInvalida2

    mov edx, OFFSET mensajeValido
    call WriteString
    jmp finPrograma

entradaInvalida2:
    mov edx, OFFSET mensajeInvalido
    call WriteString

finPrograma:
    call Crlf
    call WaitMsg
    exit

main ENDP

ValidarNoVacia PROC

    cmp ecx, 0
    je esVacia

    mov eax, 1
    ret

esVacia:
    mov eax, 0
    ret

ValidarNoVacia ENDP

END main