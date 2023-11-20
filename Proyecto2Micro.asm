.global programa 
.data
    matriz1:
        .space 1000  # Ajusta el tamaño según tus necesidades
    cantMatrices:
        .string "Ingrese la cantidad de matrices que desea: "
    promptValor:
        .string "Ingrese el valor para la posici�n [i, j]: "
    FilasyColumnas:
	    .string "??????????????????"
    cantFilas:
    	.string "Cantidad de filas: "
    cantColumnas:
    	.string "Cantidad de Columnas: "
    ResultadoTemp:
	.space 81
    ErrorMsg:
		.string "Las filas y las columnas no son validas para realizar la operacion\n"
.text
# Macro para llenar la primera matriz
#------------------------------------------MACRO-----------------------------------------

.macro sacarvalores (%filas1, %columna1, %filas12, %columna12)


.end_macro 

.macro llenarMatriz (%filas, %columnas)
 
 	     li s10, 0
 	     add %filas, %filas, t4
 	     add %columnas, %columnas, s10
   
   
    	loopFila:
    # Bucle para cada fila
      
      	     bge t4, %filas, finMatriz
        
        loopColumna:  # Bucle para cada columna
            # Imprimir el prompt para el valor en la posici�n [i, j]
            li a7, 4
            la a0, promptValor
            ecall

            # Leer el valor ingresado por el usuario
            li a7, 5
            ecall
            mv t6, a0  # Almacenar el valor en t6

            # Calcular la dirección en la matriz para la posici�n [i, j]
            mul s7, t4, %columnas
            add s7, s7, s10
            slli s8, s7, 2  # Multiplicar por 4 para obtener el desplazamiento en bytes
            la a1, matriz1
            add s9, a1, s8  # Direcci�n en la matriz

            # Almacenar el valor en la matriz
            sb t6, 0(s9) 
            # Incrementar índice de columna
            addi s10, s10, 1

            # Verificar si se ha alcanzado el final de la fila
            bge s10, %columnas, finFila

            j loopColumna

        finFila:
            # Reiniciar índice de columna
            li s10, 0

            # Incrementar índice de fila
            addi t4, t4, 1

            # Verificar si se ha alcanzado el final de la matriz
            bge t4, %filas, finMatriz

            j loopFila

        finMatriz:
  
.end_macro
# Suma de matrices#
#-------------------------------SUMA-----------------------------------#
.macro ObtenerPosicion(%nMatriz)
   		la s0, FilasyColumnas
    		li s1, 1
    		li s2, 0
	loop:
    		beq s1, %nMatriz, Finalizar_OP
    		lb s3, 0(s0)
    		lb s4, 1(s0)  # Cambié la posición del byte que se carga
    		addi s3, s3, -48
    		addi s4, s4, -48
    		mul s5, s3, s4  # Utilizo mul para multiplicar s3 y s4
    		add s2, s2, s5 
    		addi s0, s0, 2 
    		addi s1, s1, 1
    		j loop
	Finalizar_OP:
	.end_macro

#-------------------------------Macro para las filas y columnas---------------------------------	
#almacenamos el resultado en s4 y s5
	.macro ObtenerFila_Columna(%Nmatriz)
    		li s0, 0
    		#33
    		addi s1, %Nmatriz, -1
    		li s3, 2          # Inicializa s3 con el valor 2
    		mul s3, s1, s3    # Multiplica s1 por 2 y almacena el resultado en s3
    		la s4, FilasyColumnas
    		add s4, s4, s3
    		lb s5, 0(s4)
    		lb s6, 1(s4)
    		addi s4, s5, -48
    		addi s5, s6, -48
.end_macro
#-------------------------------Macro para realizar la suma---------------------------------	
.macro Suma(%Matriz1,%Nmatriz1,%Matriz2,%Nmatriz2)
		slt s0, %Nmatriz1, x0   # Compara n1 con cero y almacena el resultado en s0
		slt s1, %Nmatriz2, x0   # Compara n2 con cero y almacena el resultado en s1
		and s2, s0, s1  # Realiza la operación lógica AND entre s0 y s1 y almacena el resultado en s2
		beqz s2,SumarMatricesV
		beqz %Nmatriz1,SumarMatricesSeparadas1
		beqz %Nmatriz2,SumarMatricesSeparadas2
		j Finalizar
SumarMatricesV: # suma las matrices que estan dentro de una misma variable
		#obtengo la posicion inicial de la matriz y la almaceno en t0
		ObtenerPosicion(%Nmatriz1)
		mv t0,s2
		#obtengo la posicion inicial de la matriz y la almaceno en t1
		ObtenerPosicion(%Nmatriz2)
		mv t1,s2
		#Obtenemos la fila y columna t2 y t3
	   	ObtenerFila_Columna(%Nmatriz1)
	   	mv t2,s4
	   	mv t3,s5
	   	#obtenemos la cantidad de elementos t4 y t5
	   	ObtenerFila_Columna(%Nmatriz2)
	   	mul t4,t2,t3
	   	mul t5,s4,s5
	   	bne t4,t5,Error
#Operaciones de suma
	   	la s0,%Matriz1
	   	la s1,%Matriz2	   	
#avanza la cantidad de caracteres indicada en t0 y t1
	   	add s0,s0,t0
	   	add s1,s1,t1 
	   	li s2,0
	   	la s3,ResultadoTemp
	   	#inicio el loop de la suma
Loop_Suma:
		beq t4,s2,Finalizar	
		lb s11,0(s0)
		lb s10,0(s1)
	   	#Realizamos la suma
	   	add s8,s10,s11
	   	#almacenamos s8 como entero
	   	sb s8,0(s3)
	   	#incrementamos el contador
	   	addi s2,s2,1
	   	addi s0,s0,1
	   	addi s1,s1,1
	   	j Loop_Suma	
	   	j Finalizar
SumarMatricesSeparadas1: #Suma la primera matriz tomando resultado como matriz
	
	j Finalizar
	
	
SumarMatricesSeparadas2:#Suma la segunda matriz tomando resultado como matriz
	
	j Finalizar
Error:
		la a0,ErrorMsg
		li a7,4
		ecall	
Finalizar:

.end_macro
# Resto del c�digo (programa, finalizar, etc.)
#-------------------------------PROGRAMA-----------------------------------#
programa:
    la a0, cantMatrices
    li a7, 4
    ecall

    li a7, 12  # Espera input del teclado, y la guarda en a0
    ecall
    mv t1, a0

    # Obtener el decimal de cantMatrices
    addi t1, t1, -48

    li a7, 11
    li a0, '\n'
    ecall

    # Limitar cantidad de matrices = 9 matrices
    li s1, 9  # Si la cantidad de matrices es igual o mayor a 4 se cierra el programa
    bge t1, s1, finalizar  # 4 matrices maximo

#etiqueta matrices siguientes
MatrizFilCol:	

    addi t1, t1, -1  
    
    #comparaciones con contador
    li s6, 1
    li s7, 2 
    li s8, 3
    li s9, 4
    li s10, 5
    li s11, 6
    li t3, 7
    li a5, 8
    li a6, 9
    la t6, FilasyColumnas
                   
    li a7, 4
    la a0, cantFilas
    ecall

    # FILAS
    li a7, 12  # Espera input del teclado, y la guarda en a0
    ecall
    mv t5, a0  # t1 FILAS
    mv tp, a0
    addi t5, t5, -48
    
    li a7, 11
    li a0, '\n'
    ecall
    
    li a7, 4
    la a0, cantColumnas
    ecall

    # COLUMNAS
    li a7, 12  # Espera input del teclado, y la guarda en a0
    ecall
    mv t2, a0  # t2 COLUMNAS
    mv ra, a0
    addi t2, t2, -48
    
    li a7, 11
    li a0, '\n'
    ecall 		
    
    #saltos para llenar la variable con los datos de las filas y columnas
    addi s5, s5, 1		
    
    beq s5, s6, datosMatriz1
    beq s5, s7, datosMatriz2
    beq s5, s8, datosMatriz3
    beq s5, s9, datosMatriz4
    beq s5, s10, datosMatriz5
    beq s5, s11, datosMatriz6
    beq s5, t3, datosMatriz7
    beq s5, a5, datosMatriz8
    beq s5, a6, datosMatriz9
    		
    datosMatriz1:	    
   	sb tp, 0(t6)
    	sb ra, 1(t6)	
  	ecall    	
    	j LlenadoMatriz   	
    datosMatriz2:
   	sb tp, 2(t6)
    	sb ra, 3(t6)
    	j LlenadoMatriz
    datosMatriz3:
    	sb tp, 4(t6)
    	sb ra, 5(t6)	
    	j LlenadoMatriz
    datosMatriz4:
   	sb tp, 6(t6)
    	sb ra, 7(t6)
    	j LlenadoMatriz
    datosMatriz5:
    	sb tp, 8(t6)
    	sb ra, 9(t6)
    	j LlenadoMatriz	
    datosMatriz6:
   	sb tp, 10(t6)
    	sb ra, 11(t6)
    	j LlenadoMatriz
    datosMatriz7:
    	sb tp, 12(t6)
    	sb ra, 13(t6)	
    	j LlenadoMatriz
    datosMatriz8:
   	sb tp, 14(t6)
    	sb ra, 15(t6)
    	j LlenadoMatriz
    datosMatriz9:
   	sb tp, 16(t6)
    	sb ra, 17(t6)
    	j LlenadoMatriz
	
        LlenadoMatriz:
    
    llenarMatriz(t5, t2)
    
    #Salto para verificar si ya se llenaron todas las matrices

    bne t1, zero, MatrizFilCol
    li a6,2
    li a5,1
    Suma(matriz1,a5,matriz1,a6)

finalizar:
    li a7, 10
    ecall
