# Programa que pide dos números (x,y) y te devuelve el valor de un puntero asociado a un pixel en
# dicha posicion en un display 512x512

		.eqv SCREEN 0x10010000
		.eqv FINAL_SCREEN 0x10110000
		.eqv SIZE 512
		
		.eqv PRINT_STRING 4
		.eqv READ_INT 5
		.eqv PRINT_INT_HEX 34
		.eqv EXIT 10
				
		.data
num:	.string "Por favor introduzca un numero: "

		.text
		
		la a0, num			# Syscall para pedir un numero
		li a7, PRINT_STRING	#
		ecall					#
		
		li a7, READ_INT		# Syscall para tomar un int
		ecall					#
		
		mv s0,a0				# Int X
		
		la a0, num			# Syscall para pedir un numero
		li a7, PRINT_STRING	#
		ecall					#
		
		li a7, READ_INT		# Syscall para tomar un int
		ecall					#
		
		mv s1,a0				# Int Y
		
		mv a0,s0			# Pos x
		mv a1,s1			# Pos y
		li a2, SIZE		# Tamaño de pantalla
		li a3, SCREEN		# Posicion del display
		jal COORD
		
		li a7, PRINT_INT_HEX	# Syscall para mostrar el puntero
		ecall					#
		
		li a7, 10				
		ecall
		