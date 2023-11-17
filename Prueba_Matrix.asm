.global Prueba_Cantidad_Matriz
.data
	CantidadMatricez:	
		.word 0
	IngreseColumnas:
		.string "Ingrese la cantidad de Columnas que desea"
	IngreseFilas:
		.string "Ingrese la cantidad de Filas que desea"
.text

Prueba_Cantidad_Matriz:
leer:
		li a7,12
		li a2,10
		ecall
		beq a0,a2,Fue_Enter	
		bne a0,a2,leer
Fue_Enter:
	lw a2,CantidadMatricez
# Cargar la dirección del número en a1
    la   a1, CantidadMatricez

    # Imprimir el contenido de la dirección de memoria
    li   a7, 10      # System call code para imprimir entero
    li   a0, 1       # Descriptor de archivo (salida estándar)
    lw   a1, 0(a1)    # Cargar el contenido de la dirección de memoria
    ecall
finalizar:
	li a7, 10  #Parametro para finalizar programa
	ecall      #int 21h