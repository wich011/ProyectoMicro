.global programa 
.data

	cantMatrices:
		.string "Ingrese la cantidad de matrices que desea: "

.text

	
	#li diuna a registro
	#la guardar de .data
programa:

	la a0, cantMatrices
	li a7, 4
	ecall
	
	li a7, 12  #espera input del teclado, y la guarda en a0
	ecall
	mv t1, a0

	li, s0, 48
	
	#Obtener el decimal de cantMatrices
	sub t1, t1, s0	
	
	li a7, 11
	li a0, '\n'
	ecall
	
	#limitar cantidad de matrices = 3 matrices

	li s1, 5		#Si la cantidad de matrices es igual o mayor a 4 se cierra el progrema 	
	bge t1, s0, finalizar	#4 matrices maximo
	
	addi t1, t1, -1 	#Primera columna 
	
	#FILAS
	
	li a7, 12  #espera input del teclado, y la guarda en a0
	ecall
	mv t1, a0  #t1 FILAS
	
	
	#COLUMNAS
	li a7, 12  #espera input del teclado, y la guarda en a0
	ecall
	mv t2, a0  #t2 COLUMNAS	

	
finalizar:
	li a7, 10
	ecall

