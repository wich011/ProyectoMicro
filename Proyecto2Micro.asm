.global programa 
.data
    cantMatrices:
        .string "Ingrese la cantidad de matrices que desea: "
    promptValor:
        .string "Ingrese el valor para la posición [i, j]: "
    matriz1:
        .space 100  # Ajusta el tamaño según tus necesidades

.text

# Macro para llenar la primera matriz
.macro llenarMatriz (%filas, %columnas)
    li t4, 0  # �?ndice de fila
    li t5, 0  # �?ndice de columna

    # Bucle para cada fila
    loopFila:
        # Bucle para cada columna
        loopColumna:
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
            add s7, s7, t5
            slli s8, s7, 2  # Multiplicar por 4 para obtener el desplazamiento en bytes
            la a1, matriz1
            add s9, a1, s8  # Dirección en la matriz

            # Almacenar el valor en la matriz
            sb t6, 0(s9)

            # Incrementar índice de columna
            addi t5, t5, 1

            # Verificar si se ha alcanzado el final de la fila
            bge t5, %columnas, finFila

            j loopColumna

        finFila:
            # Reiniciar índice de columna
            li t5, 0

            # Incrementar índice de fila
            addi t4, t4, 1

            # Verificar si se ha alcanzado el final de la matriz
            bge t4, %filas, finMatriz

            j loopFila

        finMatriz:
.end_macro

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

    addi t1, t1, -1  # Primera columna

    # FILAS
    li a7, 12  # Espera input del teclado, y la guarda en a0
    ecall
    mv t1, a0  # t1 FILAS

    # COLUMNAS
    li a7, 12  # Espera input del teclado, y la guarda en a0
    ecall
    mv t2, a0  # t2 COLUMNAS

    llenarMatriz(t1, t2)

finalizar:
    li a7, 10
    ecall