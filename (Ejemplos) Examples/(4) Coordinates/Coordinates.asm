# ---------------- MAIN ---------------------------------------------
# Nombre: 
# Funcion: Programa que pide dos números (x,y) y te devuelve el valor de un puntero a memoria 
# asociado a un pixel en dicha posicion en un display 512x512
# Requiere: COORD.s
# Display: -
# Ayuda: 
# - Obtencion de Coordenadas: Help(5)
# -------------------------------------------------------------------

# ---------------- CONSTANTES ---------------------------------------
		.eqv SCREEN 0x10010000			# (L) Inicio de Display
		.eqv FINAL_SCREEN 0x10110000		# Final de Display
		.eqv SIZE 512						# (L) Ancho de Display
		
		# Syscalls
		.eqv PRINT_STRING 4
		.eqv READ_INT 5
		.eqv PRINT_INT_HEX 34
				
# ---------------- PROGRAMA PRINCIPAL  ------------------------------

		.data
num:	.string "Por favor introduzca un numero: "

		.text
		
		#  Syscall para pedir un numero
		la a0, num			
		li a7, PRINT_STRING	
		ecall					
		
		# Syscall para tomar un int
		li a7, READ_INT		
		ecall	
		
		mv s0,a0				# Guardar int X
		
		# Syscall para pedir un numero
		la a0, num			
		li a7, PRINT_STRING
		ecall	
		
		# Syscall para tomar un int
		li a7, READ_INT		
		ecall					
		
		mv s1,a0				# Guardar int Y
		
		# Calculo de puntero a coordenadas
		mv a0,s0			# Pos x
		mv a1,s1			# Pos y
		li a2, SIZE		# Tamaño de pantalla
		li a3, SCREEN		# Posicion del display
		jal COORD
		
		# Syscall para mostrar el puntero
		li a7, PRINT_INT_HEX	
		ecall					
		
		# Terminar
		li a7, 10				
		ecall
		
