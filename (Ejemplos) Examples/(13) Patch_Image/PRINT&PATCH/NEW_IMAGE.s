#---------------------------------------------------------------
# NOTA: Subrutina diseñada para un ejemplo, puede haber sido
# ligeramente alterada. Documentación reducida. Se recomienda
# consultar/utilizar el fichero original adjuntado en "Utils"
# -------------------------------------------------------------
# Subrutina que guarda en memoria las propiedades de un conjunto de pixeles como objeto dinámico.
# Argumentos:
# a0: Puntero a Memoria
# a1: Coordenada X inicial
# a2: Coordendad Y inicial
# a3: Coordenada X final
# a4: Coordenada Y final
#
# Espacios de Almacenamiento:
# 0-3: Puntero a Inicio
# 4-7: Puntero a Final
# 8-9: Coordenada X inicial
# 10-11: Coordenada Y inicial
# 12-13: Ancho
# 14-15: Alto
# 16->: Mapa de bytes

		.globl NEW_IMAGE
		.eqv SIZE 512
		.eqv DISPLAY 0x10040000

NEW_IMAGE:
		.text
		#-- Comienzo subruina
		addi sp, sp, -32
		sw ra, 28(sp) 
		
		sub t0, a3,a1		# Ancho: (X-X_inicial)    ->    t0
		sub t1, a4,a2		# Alto: (Y-Y_inicial)   ->    t1
		
		# Guardado inicial de Datos
		sh a1, 8(a0)		# Coordenada X
		sh a2, 10(a0)		# Coordenada Y
		sh t0, 12(a0)		# Ancho
		sh t1, 14(a0)		# Alto
		
		# Guardado en Pila de variables sensibles
		sw a0, 24(sp) # Puntero a Memoria
		sw a3, 20(sp)	# Coordenada X final
		sw a4, 16(sp) # Coordenada Y final
		
		#Cargado de Puntero inicial
		mv a0,a1		# Coordenada X
		mv a1,a2		# Coordenada Y
		li a2, SIZE	# Tamaño Pantalla
		li a3, DISPLAY	# Puntero a Display
		jal COORD
		
		lw a1, 24(sp)	# Carga de Puntero a Memoria
		sw a0, 0(a1)	# Guardado de Puntero Inicial
		
		# Carga de Datos en pila
		lw a0, 20(sp)	# Coordenada X final
		lw a1, 16(sp)  # Coordenada Y final
		
		li a2, SIZE	# Tamaño Pantalla
		li a3, DISPLAY	# Puntero a Display
		jal COORD
		
		lw a1, 24(sp)	# Carga de Puntero a Memoria
		sw a0, 4(a1)	# Guardado de Puntero Final
		
		
		# ------------Carga de Mapa de bytes -------------
		
		# Carga de variables:
		lw a0, 0(a1)			# Puntero inicial  -> a0
		lh t0, 12(a1)			# Ancho -> t0
		lh t1, 14(a1)			# Alto -> t1
		li t2, 0				# Contador pixeles -> t2
		li t3, 0				# Contador de filas -> t3
		
		li t4, SIZE				# 512
		li t5, 4				# 4
		
		sub, t4, t4, t0			# 512 - Ancho
		mul t4, t4,t5			# 4*(512-Ancho) = Salto de Linea en Bytes -> t4
		
		addi a1, a1, 16		# Puntero a bitmap -> a1
		
		
bucle:
		beq t2,t0,jump	# Si el contador alcanza el ancho, cambia de linea
		lw t6, 0(a0)		# Carga el color del puntero inicial
		sw t6, 0(a1)		# Guarda el color en memoria
		addi a1,a1,4		# Salta una palabra en memoria
		addi a0,a0,4		# Salta una palabra en puntero
		addi t2,t2,1		# Aumenta el contador
		b bucle		
jump:
		beq t3,t1, fin		# Si el contador alcanza el alto, termina
		add a0,a0,t4		# Salta de linea
		li t2, 0			# Reinicia el contador de pixeles
		addi t3,t3,1		# Aumenta en uno el contador de filas
		
		b bucle
		
fin:
		#-- Fin de subrutina
		lw ra, 28(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 32
		ret
		
		
