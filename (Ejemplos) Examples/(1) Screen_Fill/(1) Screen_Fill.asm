		.eqv COLOR 0x00ff0000
		.eqv FINAL_SCREEN  0x10110000  #512x512
 		.eqv SCREEN 0x10010000
		.data
		
		.text

		.globl _start

_start:

	li s0, COLOR 		     # Color Rojo
	li s1, SCREEN		     # Direccion inicial
	li s2, FINAL_SCREEN    # Direccion final
	
bucle:
	beq s1, s2,fin		# Si la pantalla esta llena, termina
	sw s0, 0(s1)		# Colorea un pixel
	addi s1,s1,4		#Mueve de pixel
	b bucle			# Vuelve

fin:
	li a7, 10
	ecall
	