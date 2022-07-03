#---------------------------------------------------------------
# NOTA: Subrutina diseñada para un ejemplo, puede haber sido
# ligeramente alterada. Documentación reducida. Se recomienda
# consultar/utilizar el fichero original adjuntado en "Utils"
# -------------------------------------------------------------
# Subrutina que imprime una imagen en un bitmap display 512x512 parcheando los pixeles de la imagen de fondo.
# Argumentos:
# a0: Puntero a imagen
# a1: Ancho
# a2: Alto
# a3: Coordenada x
# a4: Coordenada y
# a5: ID (background)
 
 		.include "Globals.s"
		.globl PRINT_PATCH
		
PRINT_PATCH:
		.text
		
		#-- Comienzo subruina
		addi sp, sp, -32
		sw ra, 28(sp) 
		sw a0, 24(sp)
		sw a1, 20(sp)
		sw a2, 16(sp)
		sw a5, 12(sp)
		sw a3, 8(sp)
		sw a4, 4(sp)
		
		mv a0,a3
		mv a1,a4
		li a2, SIZE
		li a3, SCREEN
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
		
		# Borrado de datos inestables
		li a6,0
		li a7,0
		
		# ----- Calcular Puntero de Imagen
		lw a5, 12(sp)		# ID -> a5
		lw t6, 8(sp)		# Coordenada X -> t6
		lw t2, 4(sp)		# Coordenada Y -> t2
		lh a6,  8(a5)		# Coordenada X' -> a6		
		lh a7, 10(a5)		# Coordenada Y' -> a7
		
		sub a6,t6,a6 		# X-X' -> a6
		sub t2,t2,a7		# Y-Y' -> t2
		
		lh a7, 12(a5)		# Ancho -> a7
		li t6,4			# Tamaño de palabra
		sub a3,a7,t0		# Salto de linea [Ancho ID-Ancho Imagen]
		mul a3,a3,t6		# Salto de linea (en bytes) [Ancho ID-Ancho Imagen]
		# Inicio de puntero

		mul a6,a6,t6	# Diferencia en X (en bytes) -> a6
		mul t2,a7,t2	# Diferencia en Y (en pixeles) [ Ancho * Dif.Y] -> t2
		mul t2,t2,t6	# Diferencia en Y (en bytes)
		
		addi a5,a5,16		# Puntero a imagen en ID
		add a5,a5,a6		# ID + Diferencia en X
		add a5,a5,t2		# ID + Diferencia en Y

		li t6, PATCH_COLOR

		
bucle:
		beq a0,t0,linea
		beq a1,t1,final
		
		lw t5, 0(t4)		# Carga el color a t5
		beq t5,t6,patch
		sw t5, 0(t3)		# Guarda el color en el pixel
continue:
		addi t4,t4,4		# Aumenta el color
		addi t3,t3,4		# Aumenta el pixel
		addi a5,a5,4		# Aumenta el pixel de ID
		addi a0,a0,1		# Aumenta el contador
		
		b bucle
		
patch:
		lw a7, 0(t3)		# Comprueba que hay en el pixel del display
		beq a7,zero,skip	# Si el pixel no tenia nada, entonces skipea
		
		lw t5, 0(a5)		# Carga color de ID
		sw t5, 0(t3)		# Guarda color en el pixel
skip:		
		b continue
linea:	
		add t3,t3,a2		 # Salta de linea
		add a5,a5,a3		# Salta de linea en ID
		mv a0,zero		# Reinicia el contador
		addi a1,a1,1		# Aumenta en 1 el contador de filas
		b bucle
final:
		#-- Fin de subrutina
		lw ra, 28(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 32
		ret
	
