.global programa 
.data
    matriz1:
        .space 1000  # Ajusta el tamaño según tus necesidades
    cantMatrices:
        .string "Ingrese la cantidad de matrices que desea: "
    promptValor:
        .string "Ingrese el valor para la posición [i, j]: "
    FilasyColumnas:
	.string "??????????????????"
    cantFilas:
    	.string "Cantidad de filas: "
    cantColumnas:
    	.string "Cantidad de Columnas: "

.text

# Macro para llenar la primera matriz
#------------------------------------------MACRO-----------------------------------------
.macro llenarMatriz (%filas, %columnas)
 
 	     li s10, 0
 	     add %filas, %filas, t4
 	     add %columnas, %columnas, s10
   
   
    	loopFila:
    # Bucle para cada fila
      
      	     bge t4, %filas, finMatriz
        
        loopColumna:  # Bucle para cada columna
            # Imprimir el prompt para el valor en la posición [i, j]
            li a7, 4
            la a0, promptValor
            ecall

            # Leer el valor ingresado por el usuario
            li a7, 5
            ecall
            mv t6, a0  # Almacenar el valor en t6

            # Calcular la dirección en la matriz para la posición [i, j]
            mul s7, t4, %columnas
            add s7, s7, s10
            slli s8, s7, 2  # Multiplicar por 4 para obtener el desplazamiento en bytes
            la a1, matriz1
            add s9, a1, s8  # Dirección en la matriz

            # Almacenar el valor en la matriz
            sb t6, 0(s9)
            
            
            
            mv a0, t6
            
            addi a0, a0, 48
            
           li a7, 11
           ecall 
           

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

# Resto del código (programa, finalizar, etc.)
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

    # Limitar cantidad de matrices = 3 matrices
    li s1, 9  # Si la cantidad de matrices es igual o mayor a 4 se cierra el programa
    bge t1, s1, finalizar  # 4 matrices maximo

#etiqueta matrices siguientes
MatrizFilCol:	

    addi t1, t1, -1  

    #contador para guardar filas y columnas 
    #contador empieza en 1 con el addi
    li s5, 0
    addi s5, s5 1    
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
    
    addi t2, t2, -48
    
    li a7, 11
    li a0, '\n'
    ecall 		
    
    #saltos para llenar la variable con los datos de las filas y columnas		
    
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
    	sb t5, 0(t6)
    	sb t2, 1(t6)	
    	li a7, 11
    	ecall
    	j LlenadoMatriz   	
    datosMatriz2:
   	sb t5, 2(t6)
    	sb t2, 3(t6)
    	j LlenadoMatriz
    datosMatriz3:
    	sb t5, 4(t6)
    	sb t2, 5(t6)	
    	j LlenadoMatriz
    datosMatriz4:
   	sb t5, 6(t6)
    	sb t2, 7(t6)
    	j LlenadoMatriz
    datosMatriz5:
    	sb t5, 8(t6)
    	sb t2, 9(t6)
    	j LlenadoMatriz	
    datosMatriz6:
   	sb t5, 10(t6)
    	sb t2, 11(t6)
    	j LlenadoMatriz
    datosMatriz7:
    	sb t5, 12(t6)
    	sb t2, 13(t6)	
    	j LlenadoMatriz
    datosMatriz8:
   	sb t5, 14(t6)
    	sb t2, 15(t6)
    	j LlenadoMatriz
    datosMatriz9:
   	sb t5, 16(t6)
    	sb t2, 17(t6)
    	j LlenadoMatriz
	
    LlenadoMatriz:
    
    llenarMatriz(t5, t2)
    
    #Salto para verificar si ya se llenaron todas las matrices

    bne t1, zero, MatrizFilCol
    #J SALTOSIGUIENTEINSTRUCCION
    #HACER UN SALTO A LO SIGUIENTE QUE SE NECESITE 
    
    #etiquetas para llenar la variable
    
    
    
    
	
finalizar:
    li a7, 10
    ecall
