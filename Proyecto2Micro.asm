.global programa 
.data
    matriz1:
        .space 100  # Ajusta el tamaño según tus necesidades
    cantMatrices:
        .string "Ingrese la cantidad de matrices que desea: "
    promptValor:
        .string "Ingrese el valor para la posición [i, j]: "

    cantFilas:
    	.string "Cantidad de filas: "
    cantColumnas:
    	.string "Cantidad de Columnas: "

.text

# Macro para llenar la primera matriz

.macro llenarMatriz (%filas, %columnas)
    #suma de indices
        
   
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

    li s0, 48

    # Obtener el decimal de cantMatrices
    sub t1, t1, s0

    li a7, 11
    li a0, '\n'
    ecall

    # Limitar cantidad de matrices = 3 matrices
    li s1, 5  # Si la cantidad de matrices es igual o mayor a 4 se cierra el programa
    bge t1, s1, finalizar  # 4 matrices maximo

#etiqueta matrices siguientes

    addi t1, t1, -1  

               
    li a7, 4
    la a0, cantFilas
    ecall

    # FILAS
    li a7, 12  # Espera input del teclado, y la guarda en a0
    ecall
    mv t5, a0  # t1 FILAS
    
    sub t5, t5, s0
    
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
    
    sub t2, t2, s0

    llenarMatriz(t1, t2)
    
    bn

	
finalizar:
    li a7, 10
    ecall
