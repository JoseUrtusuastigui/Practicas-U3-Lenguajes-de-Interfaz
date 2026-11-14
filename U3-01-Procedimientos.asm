INCLUDE Irvine32.inc

.data
mensajeInicio BYTE "Inicio de programa", 0
mensajeProcedimiento BYTE "Estoy dentro del procedimiento", 0
mensajeFin BYTE "Fin del programa", 0

.code
main PROC
  mov edx, OFFSET mensajeInicio
  call WriteString
  call crlf 


  ;primera llamada 
  call mostrarAviso
  mov eax, 10


  ;segunda llamada
  call mostrarAviso
  mov eax, 20


  mov edx, OFFSET mensajeFin
  call WriteString
  call crlfs
main ENDP 

;mostrar un mensaje y regresar al punto despiues del llamado

mostrarAviso PROC
mov edx, OFFSET mensajeProcedimiento
call WriteString
call crlf
ret
mostrarAviso ENDP
END main 