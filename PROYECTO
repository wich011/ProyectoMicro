.global programa
.data
	OpcionCantidadMatrices:
		.string "Cuantas matrices desea?"
	Opcion2matrices:
		.string "1. 2 matrices"
	Opcion3matrices:
		.string "2. 3 matrices"
	Opcion4matrices:
		.string "3. 4 matrices"	
	IngresarOpcion:
		.string "Ingrese su opcion"		
	FilasPrimeraMatriz:
		.string "Ingrese cuantas filas desea en la primera matriz"
	ColumnasPrimeraMatriz:
		.string "Ingrese cuantas columnas desea en la primera matriz"

	FilasSegundaMatriz:
		.string "Ingrese cuantas filas desea en la segunda matriz"
	ColumnasSegundaMatriz:
		.string "Ingrese cuantas columnas desea en la segunda matriz"	
		
	FilasTerceraMatriz:
		.string "Ingrese cuantas filas desea en la tercera matriz"
	ColumnasTerceraMatriz:
		.string "Ingrese cuantas columnas desea en la tercera matriz"

	FilasCuartaMatriz:
		.string "Ingrese cuantas filas desea en la cuarta matriz"
	ColumnasCuartaMatriz:
		.string "Ingrese cuantas columnas desea en la cuarta matriz"			
	Mat2:
		.string "Eligio 2 matrices"
	Mat3:
		.string "Eligio 3 matrices"
	Mat4:
		.string "Eligio 4 matrices"
	OperacionSuma:
		.string "1. suma"
	OperacionResta:
		.string "2. resta"
	OperacionMul:
		.string "3. multiplicacion"
	OperacionDiv:
		.string "4. division"
	EleccionSuma:
		.string "Elegio suma"
	EleccionResta:
		.string "Eligio resta"
	EleccionMul:
		.string "Eligio multiplicacion"
	EleccionDiv:	
		.string "Eligio division"
	EstAprobado:
		.string "Si se puede operar entre matrices, filas y columnas iguales"
	EstDesaprobado:
		.string "No se puede operar entre matrices, filas y columnas no iguales"
.text
programa:
#Opciones
li t2, 0X31
li t3, 0X32
li t4, 0X33
li t5, 0X34
	li t0, 0XA
	la a0, OpcionCantidadMatrices
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Opcion 1
	la a0, Opcion2matrices
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Opcion 2
	la a0, Opcion3matrices
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Opcion 3
	la a0, Opcion4matrices
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Ingreso Opcion
	la a0, IngresarOpcion
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Lectura Ingreso
	li a7, 12 
	ecall
	mv t1, a0
	mv a0, t2
	beq t1, t2, Matrices2
	beq t1, t3, Matrices3
	beq t1, t4, Matrices4
	#2 Matrices
	Matrices2:
	mv a0, t0
	li a7,  11
	ecall
	la a0, Mat2
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Elecciones de operacion
	la a0, OperacionSuma
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	la a0, OperacionResta
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	la a0, OperacionMul
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	la a0, OperacionDiv
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Ingreso Opcion
	la a0, IngresarOpcion
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#Lectura Ingreso
	li a7, 12 
	ecall
	mv t1, a0
	mv a0, t2
	beq t1, t2, Suma2
	beq t1, t3, Resta2
	beq t1, t4, Mul2
	beq t1, t5, Div2
	Suma2:
	mv a0, t0
	li a7,  11
	ecall
	la a0, EleccionSuma
	li a7, 4
	ecall
	
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#IngresoFilasPrimeraMatriz
	#Ingreso Opcion
	la a0, FilasPrimeraMatriz
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#LEcturaFilas
	li a7, 12 
	ecall
	mv t1, a0
	mv a1, t1
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#IngresoColimnasPrimeraMatriz
	#Ingreso Opcion
	la a0, ColumnasPrimeraMatriz
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#LEcturaFilas
	li a7, 12 
	ecall
	mv t1, a0
	mv a2, t1
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#IngresoFilasSegundaMatriz
	#Ingreso Opcion
	la a0, FilasSegundaMatriz
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#LEcturaFilas
	li a7, 12 
	ecall
	mv t1, a0
	mv a3, t1
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#IngresoColumnasSegundaMatriz
	#Ingreso Opcion
	la a0, ColumnasSegundaMatriz
	li a7, 4
	ecall
	#enter
	mv a0, t0
	li a7,  11
	ecall
	#LEcturaFilas
	li a7, 12 
	ecall
	mv t1, a0
	mv a4, t1
	
	beq a2, a3, EstadoAprobado
	bne a2, a3, EstadoDesaprobado
	EstadoAprobado:
	mv a0, t0
	li a7,  11
	ecall
	
	la a0, EstAprobado
	li a7, 4
	ecall
	j finalizar
	EstadoDesaprobado:
	mv a0, t0
	li a7,  11
	ecall
	
	la a0, EstDesaprobado
	li a7, 4
	ecall
	j finalizar
			
	Resta2:
	mv a0, t0
	li a7,  11
	ecall
	la a0, EleccionResta
	li a7, 4
	ecall
	j finalizar
	Mul2:
	mv a0, t0
	li a7,  11
	ecall
	la a0, EleccionMul
	li a7, 4
	ecall
	j finalizar
	Div2:
	mv a0, t0
	li a7,  11
	ecall
	la a0, EleccionDiv
	li a7, 4
	ecall
	j finalizar
	#3 Matrices
	Matrices3:
	mv a0, t0
	li a7,  11
	ecall
	
	la a0, Mat3
	li a7, 4
	ecall
	j finalizar
	
	#4 Matrices
	Matrices4:
	mv a0, t0
	li a7,  11
	ecall
			
	la a0, Mat4
	li a7, 4
	ecall
	j finalizar
	
finalizar:
	li a7, 10
	ecall
