# ---------------- MAIN ---------------------------------------------
# Nombre: Standart_Line.asm
# Funcion: Programa que crea una linea horizontal de 64 pixeles de largo (screen 64x64) y otra linea
# de 64 pixeles de alto de color rojo y verde respectivamente. Fijate como es necesario ubicar al
# puntero siempre en el inicio de linea
# Requiere:
# - Colors.s
# - H_LINE.s
# - V_LINE.s
# Display: 64x64, 0x10010000 (Pixel 1x1)
# Ayuda:
# - Colores: Help(3)
# - Creación de líneas: Help(4)
# -------------------------------------------------------------------

		.include "Colors.s"

# ---------------- CONSTANTES ---------------------------------------

		.eqv SCREEN 0x10010000			# Puntero a Inicio de Display
		.eqv FINAL_SCREEN 0x10014000		# Puntero a Final de Display 
		.eqv SCREEN_SIZE 64				# (L) Ancho de Display
		.eqv LINEA_1 0x10012000			# (L) Posicion Linea 1
		
# ---------------- PROGRAMA PRINCIPAL  ------------------------------
		.text
		
		li s1, LINEA_1		# Variable para Inicio de linea
		
		# Imprimir linea horizontal
		mv a0, s1		# Inicio
		li a1, SCREEN_SIZE	# Distancia
		li a2, ROJO		# Color
		jal H_LINE
		
		# Calcular Linea Vertical
		li s1, SCREEN		# Inicio de Display
		li s2, SCREEN_SIZE	# Ancho
		li s3, 2			# 2
		div s2,s2,s3		# Ancho/2
		
		addi s1, s1, s2 	# Sumamos Ancho/2 (en bytes), centrar linea.
		
		# Imprimir Linea Vertical
		mv a0, s1		# Inicio
		li a1, SCREEN_SIZE	# Distancia
		li a2, VERDE		# Color
		li a3, SCREEN_SIZE # Tamaño pantalla
		jal V_LINE
		
		# Terminar
		li a7, 10
		ecall
		
