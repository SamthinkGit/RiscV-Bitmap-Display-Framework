# Programa que crea un rectangulo azul dadas unas coordenadas determinadas (display 512x512)

		.eqv EXIT 10
		.include "Colors.s"
		
		.text
		
		li a0, 220			# Coordenada X
		li a1, 220			# Coordenada Y
		li a2,40			# Ancho
		li a3,40			# Alto
		li a4, MAGENTA	# Color
		jal RECTANGLE
		
		# Syscall para salir
		li a7, EXIT
		ecall
		
		