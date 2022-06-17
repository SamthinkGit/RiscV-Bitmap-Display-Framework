# Programa que crea una linea horizontal de 64 pixeles de largo (screen 64x64) y otra linea
# de 64 pixeles de alto de color rojo y verde respectivamente. Fijate como es necesario ubicar
# al puntero siempre en el inicio de linea

		.include "Colors.s"
		.eqv SCREEN 0x10010000
		.eqv FINAL_SCREEN 0x10014000
		.eqv SCREEN_SIZE 64
		.text
		li s1, 0x10012000		# Variable para Final de linea
		
		
		mv a0, s1		# Inicio
		li a1, 64			# Distancia
		li a2, ROJO		# Color
		jal H_LINE
		
		li s1, SCREEN
		addi s1, s1, 128
		
		mv a0, s1		# Inicio
		li a1, 64			# Distancia
		li a2, VERDE		# Color
		li a3, SCREEN_SIZE # Tamaño pantalla
		jal V_LINE
		
		li a7, 10
		ecall
		