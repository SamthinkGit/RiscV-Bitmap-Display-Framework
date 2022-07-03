#---------------------------------------------------------------
# NOTA: Subrutina diseñada para un ejemplo, puede haber sido
# ligeramente alterada. Documentación reducida. Se recomienda
# consultar/utilizar el fichero original adjuntado en "Utils"
# -------------------------------------------------------------
# Subrutina que parchea parte de una imagen si se ha perdido.
# Argumentos:
# a0: ID
# a1: Coordenada X (x)
# a2: Coordenada Y (y)
# a3: Ancho
# a4: Alto

		.include "Globals.s"
		.globl PATCH
		
PATCH:
		.text
		#-- Comienzo subruina
		addi sp, sp, -32
		sw ra, 28(sp) 
		
		# Borrado de datos inestables
		li t0,0 
		li t1,0
		li t4,0
		li t5,0
		# Hallamos diferencia de coordenadas
		lh t0, 8(a0)		# Coordenada X imagen (X)
		lh t1, 10(a0)		# Coordenad Y imagen (Y)
		
		sub t2,a1,t0		# X - x -> t2
		sub t3,a2,t1		# Y - y -> t3
		
		lh t4, 12(a0)		# Ancho ID -> t4
		lh t5, 14 (a0) 		# Alto ID -> t5
		li t6,4
		
		# Hallamos el inicio de puntero en ID
		addi a0,a0,16		# Inicio de imagen
		mul t2, t2, t6		# Distancia en X (en bytes)
		add a0,a0 t2		# Sumamos Distancia en X
		
		 mul t3,t3,t4 		# Distancia en Y en pixeles (Ancho de fila * Numero de filas)
		 mul t3,t3,t6		# Distancia en Y (en bytes)
		 add a0,a0,t3		# Sumamos Distancia en Y

		 # -------- Imprimimos la imagen por filas --------
		 		
		 # Guardado de datos sensibles
		 li t0,0			# Contador
		 mul t2,t4,t6		# Salto de linea en bytes (Dentro del ID) [ Ancho ID*4]
		
		sw a0, 24(sp)		# Puntero a Imagen
		sw a3, 20(sp)		# Ancho
		sw a1, 16(sp)		# Coordenada X
		sw a2, 12(sp)		# Coordenada Y
		sw t0, 8(sp)		# Contador
		sw a4, 4(sp)		# Alto
		sw t2, 0(sp)		# Salto de linea en imagen
		
		# Cargado inicial de datos (Reordenacion):
		
		lw a0, 24(sp)		# Puntero a imagen
		lw a1, 20(sp)		# Ancho
		li a2,1
		lw a3, 16(sp)		# Coordenada X
		lw a4, 12(sp)		# Coordenada Y
		lw t0, 8(sp)		# Contador
		lw t1, 4(sp)		# Alto (total)
		
bucle:
		sw t0, 8(sp)		# Actualizamos el contador
		sw a4, 12(sp)		# Axtualizamos la coordenada Y
		sw a0,24(sp)		# Actuliazmos el puntero a ID
		
		beq t0,t1,fin		# Si el contador alcanza el maximo de filas, termina
		jal IMAGE		# Imprime una fila
		
		lw a0, 24(sp)		# Puntero a imagen
		lw a1, 20(sp)		# Ancho
		li a2, 1			# Alto (impresion)
		lw a3, 16(sp)		# Coordenada X
		lw a4, 12(sp)		# Coordenada Y
		lw t0, 8(sp)		# Contador
		lw t1, 4(sp)		# Alto (total)
		lw t2, 0(sp)		# Salto de linea (En ID)
		
		addi t0,t0,1		# Sumamos 1 al contador
		addi a4,a4,1		# Sumamos 1 a la coordenada Y
		add a0,a0,t2		# Cambiamos de linea en el ID
		b bucle
		
		
fin:
		#-- Fin de subrutina
		lw ra, 28(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 32
		ret

		
		
