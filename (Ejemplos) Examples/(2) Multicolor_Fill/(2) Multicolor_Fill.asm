		# IMPORTANTE: RECUERDA INCLUIR ESTE FICHERO
		
		
		# Ejercicio: Trata de entender por que sale dicho patrón en pantalla
		# y por que tardará mucho en alcanzar el rojo
		
		.include "Colors.s"
		.eqv FINAL_SCREEN  0x10110000  #512x512
 		.eqv SCREEN 0x10010000
		.data
		
		.text

		.globl _start

_start:

	li s0, CIAN_MEDIO       # Color Rojo
	li s1, SCREEN		# Direccion inicial
	li s2, FINAL_SCREEN    # Direccion final
	
bucle:
	beq s1, s2,fin		# Si la pantalla esta llena, termina

	addi s0,s0,1		# Altera ligeramente un color
	sw s0, 0(s1)		# Colorea un pixel
	addi s1,s1,4		#Mueve de pixel
	b bucle			# Vuelve

fin:
	li a7, 10
	ecall