# ---------------- SUBRUTINA ---------------------------------------------
# Nombre: Alpha_Image.s
# Funcion: Subrutina que imprime una imagen en un bitmap display.
# Un color determinado no será impreso (parecido a un PNG, partícula alfa).
# Alfa por defecto en Negro (0xff000000)
# Requiere:
# - COORD.s
# Argumentos:
# - a0: Puntero a imagen
# - a1: Ancho
# - a2: Alto
# - a3: Coordenada x
# - a4: Coordenada y
# Ayuda: Help(13)
# -----------------------------------------------------------------------
# 
#     CUIDADO: ALPHA_IMAGE.s entra en conflicto con IMAGE.s,
#     no utilizar las dos a la vez.
#
# ----------------------------------------------------------------------
 
 
# ---------------- CONSTANTES  --------------------------------------
 
 		.eqv SIZE 128 					# Ancho de Display
 		.eqv SCREEN 0x10040000		# Base Address del Display
 		.eqv ALPHA_COLOR 0xff000000	# Color seleccionado por partícula alfa (no se imprime)
 
 # ---------------- PROGRAMA PRINCIPAL  ------------------------------
 
		.globl IMAGE	
IMAGE:
		.text
		
		#-- Comienzo subruina
		addi sp, sp, -32
		sw ra, 28(sp) 
		sw a0, 24(sp)
		sw a1, 20(sp)
		sw a2, 16(sp)
		
		# Hallar puntero inicial a display -------------------------
		mv a0,a3		# Coordenada X
		mv a1,a4		# Coordenada Y
		li a2, SIZE	# Ancho
		li a3, SCREEN	# Display
		jal COORD
		
		
		# Inicialización de variables para impresión ----------------
		mv t3, a0		# Puntero a Pixel (Inicial)
		lw t4, 24(sp)	# Puntero a Imagen (Colores)
		
		li a0, 0		# Contador
		li a1, 0		# Contador de filas
		
		lw t0, 20(sp) 		# Ancho
		lw t1, 16(sp)		#Alto
		
		li a2, SIZE		# Ancho de pantalla (512)
		sub a2,a2,t0		# Salto de linea (512-Ancho)
		
		li a3,4			# Salto en bytes ((512-Ancho)*4)
		mul a2,a2,a3		#
		li t6, ALPHA_COLOR	# Partícula alfa

		# Impresión de imagen  --------------
bucle:
		beq a0,t0,linea	# Cuando completa una linea salta
		beq a1,t1,final	# Cuando complete todas las lineas termina
		lw t5, 0(t4)		# Carga el color a t5
		beq t5,t6,skip		# Si el color a guardar (t5) es el alfa, no imprimas
		sw t5, 0(t3)		# Imprime el color en t3
skip:
		addi t4,t4,4		# Incrementa el color en el bitmap
		addi t3,t3,4		# Incrementa el puntero a display
		addi a0,a0,1		# Incrementa el contador
		
		b bucle
		
linea:	
		add t3,t3,a2		 # Salta de linea
		mv a0,zero		# Reinicia el contador
		addi a1,a1,1		# Aumenta en 1 el número de líneas recorridas
		b bucle
final:
		#-- Fin de subrutina
		lw ra, 28(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 32
		ret
	
