# ---------------- SUBRUTINA ---------------------------------------------
# Nombre: IMAGE.s
# Funcion: # Subrutina que imprime una imagen en un bitmap display 512x512 (Variable con la constante SIZE)
# Requiere:
# - COORD.s
# Argumentos:
# a0: Puntero a imagen
# a1: Ancho
# a2: Alto
# a3: Coordenada x
# a4: Coordenada y
# Ayuda: Help(7)
# -----------------------------------------------------------------------

 # -----------------------------------------------------------------------
# 
#     CUIDADO: IMAGE.s entra en conflicto con ALPHA_IMAGE.s,
#     no utilizar las dos a la vez.
#
# ----------------------------------------------------------------------

# ---------------- CONSTANTES  --------------------------------------
 		 .eqv SIZE 512				# Ancho de Pantalla
 		.eqv SCREEN 0x10040000	# Posición de Display
 
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
		
		# Obtención de puntero para inicio imagen
		mv a0,a3		# Coordenada X
		mv a1,a4		# Coordenada Y
		li a2, SIZE	# Ancho
		li a3, SCREEN	# Display
		jal COORD
		
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

bucle:
		beq a0,t0,linea	
		beq a1,t1,final
		
		lw t5, 0(t4)		# Carga el color a t5
		sw t5, 0(t3)		# Guarda el color en el pixel
		
		addi t4,t4,4		# Salta al siguiente color a imprimir
		addi t3,t3,4		# Incrementa el puntero de display (cambia de pixel)
		addi a0,a0,1		# Incrementa el contador
		
		b bucle
		
linea:	
		add t3,t3,a2		 # Salta de linea
		mv a0,zero		# Reinicia el contador
		addi a1,a1,1		# Incrementa el contador de líneas recorridas
		b bucle
final:
		#-- Fin de subrutina
		lw ra, 28(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 32
		ret
	
