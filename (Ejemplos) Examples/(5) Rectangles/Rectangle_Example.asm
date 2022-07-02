# ---------------- MAIN ---------------------------------------------
# Nombre: Rectangle_Example.asm
# Funcion: Programa que crea un rectangulo azul dadas unas coordenadas determinadas
# Requiere: 
# - Colors.s
# - COORD.s
# - H_LINE.s
# - RECTANGLE.s
# Display: 512x512, 0x10010000
# Ayuda:
# - Asignacion de Colores: Help(3)
# - Utilizaación de Coordenadas: Help(5)
# - Creación de Rectángulos: Help(6)
# ------------------------------------------------------------------

		.include "Colors.s"
		
		.text
		
		# Creación de Rectangulo Magenta
		li a0, 220			# Coordenada X
		li a1, 120			# Coordenada Y
		li a2,40			# Ancho
		li a3,40			# Alto
		li a4, MAGENTA	# Color
		jal RECTANGLE
		
		# Syscall para salir
		li a7, 10
		ecall
		
		
