.global programa
.data
	Operacion:
		.string "A*B+(C+D)"
.text
	.macro BuscarSigno(%inicio,%final,%cadena)
	    li t0, %inicio
    li t1, %final
    li t2, 0
    li t3, 0

    Loop:
        lbu t4, %Cadena(t2)
        beqz t4, Finalizar_Macro
        beq t4, t0, Encontrar_Inicio
        j Siguiente

    Encontrar_Inicio:
        addi t2, t2, 1
        li t3, 0

    Encontrar_Final:
        addi t2, t2, 1
        lbu t4, %Cadena(t2)
        beqz t4, Finalizar_Macro
        beq t4, t1, Retornar_Subcadena
        j Encontrar_Final

    Retornar_Subcadena:
        addi t2, t2, -t3
        addi t3, t3, 1
        j Loop

    Siguiente:
        addi t2, t2, 1
        j Loop

    Finalizar_Macro:	
	.end_macro 
programa:
	BuscarSigno("(",")",Operacion)
	la a0,t3
	li a7,4
	ecall
terminar:
	li a7,10
	ecall