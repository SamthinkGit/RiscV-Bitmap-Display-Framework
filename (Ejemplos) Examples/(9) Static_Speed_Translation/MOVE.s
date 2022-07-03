#---------------------------------------------------------------
# NOTA: Subrutina diseñada para un ejemplo, puede haber sido
# ligeramente alterada. Documentación reducida. Se recomienda
# consultar/utilizar el fichero original adjuntado en "Utils"
# -------------------------------------------------------------
# Programa que realiza una traslación estática de una imagen dada hacia una direccion determinada. (Solo traslaciones ortogonales) Utilizable en display 512x512
# Argumentos:
# a0: Puntero a Imagen
# a1: Ancho
# a2: Alto
# a3: Coordenada x Inicial
# a4: Coordenada y Inicial
# a5: Orientación
# - 0: Derecha
# - 1: Abajo
# - 2: Izquierda
# - 3: Arriba
# a6: Desplazamiento
		.globl MOVE
		.eqv SIZE 512
		.eqv DISPLAY 0x10040000
		.eqv TRAIL_COLOR 0

MOVE:
		.text
		# Inicio Subrutina
		addi sp, sp, -64
		sw ra, 60(sp)
				
		# Inicializacion de valores para comprobacion de desplazamiento
		li t0,0
		li t1,1
		li t2,2
		li t3,3
		
		li t4,0 # Contador
		
		# Comprobacion de valor de desplazamiento
		beq a5,t0,derecha
		beq a5,t1, abajo
		beq a5,t2, izquierda
		beq a5,t3, arriba
		
derecha:
	beq t4, a6, fin
	jal Guardado
	
	# Obtencion de coordenadas
	mv a0,a3			# Coordenada x
	mv a1,a4			# Coordenada y
	li a2, SIZE		# Display
	li a3, DISPLAY		# Puntero a display
	jal COORD
	sw a0, 24(sp)		# Guarda el resultado
	
	# Creacion de Linea Negra
	jal Carga
	lw a0, 24(sp)		# Puntero -> a0
	addi a0, a0, -4	# Correción de puntero
	
	mv a1,a2	 		# Distancia (Alto) -> a1
	li a2, TRAIL_COLOR	# Color (Negro) -> a2
	li a3, SIZE		# Display -> a3
	jal V_LINE		# Haz una linea vertical negra a la izquierda
	
	# Impresion de nueva imagen
	jal Carga
	jal IMAGE		# Imprime Imagen
	jal Carga
	
	# Cambio de pixel
	addi a3,a3,1		# Desplaza un pixel a la derecha
	addi t4,t4,1		# Aumenta en 1 el contador
	
	b derecha

izquierda:
	beq t4, a6, fin
	jal Guardado
	
	# Obtencion de coordenadas
	mv a0,a3			# Coordenada x
	add a0,a0, a1		# Movemos la coordenada a la derecha de la imagen
	mv a1,a4			# Coordenada y
	li a2, SIZE		# Display
	li a3, DISPLAY		# Puntero a display
	jal COORD
	sw a0, 24(sp)		# Guarda el resultado
	
	# Creacion de Linea Negra
	jal Carga
	lw a0, 24(sp)		# Puntero -> a0
	mv a1,a2	 		# Distancia (Alto) -> a1
	li a2, TRAIL_COLOR	# Color (Negro) -> a2
	li a3, SIZE		# Display -> a3
	jal V_LINE		# Haz una linea vertical negra a la izquierda
	
	# Impresion de nueva imagen
	jal Carga
	jal IMAGE		# Imprime Imagen
	jal Carga
	
	# Cambio de pixel
	addi a3,a3,-1		# Desplaza un pixel a la izquierda
	addi t4,t4,1		# Aumenta en 1 el contador
	
	b izquierda

arriba:
	beq t4, a6, fin
	jal Guardado
	
	# Obtencion de coordenadas
	mv a0,a3			# Coordenada x
	mv a1,a4			# Coordenada y
	add a1,a1, a2		# Movemos la coordenada a la esquina inferior de la imagen
	li a2, SIZE		# Display
	li a3, DISPLAY		# Puntero a display
	jal COORD
	sw a0, 24(sp)		# Guarda el resultado
	
	# Creacion de Linea Negra
	jal Carga
	lw a0, 24(sp)		# Puntero -> a0
	li a2, TRAIL_COLOR	# Color (Negro) -> a2
	jal H_LINE		# Haz una linea horizontal desde abajo
	
	# Impresion de nueva imagen
	jal Carga
	jal IMAGE		# Imprime Imagen
	jal Carga
	
	# Cambio de pixel
	addi a4,a4,-1		# Desplaza un pixel hacia arriba
	addi t4,t4,1		# Aumenta en 1 el contador
	
	b arriba

abajo:
	beq t4, a6, fin
	jal Guardado
	
	# Obtencion de coordenadas
	mv a0,a3			# Coordenada x
	mv a1,a4			# Coordenada y
	addi a1,a1,-1		# Correcion de linea
	li a2, SIZE		# Display
	li a3, DISPLAY		# Puntero a display
	jal COORD
	sw a0, 24(sp)		# Guarda el resultado
	
	# Creacion de Linea Negra
	jal Carga
	lw a0, 24(sp)		# Puntero -> a0
	li a2, TRAIL_COLOR	# Color (Negro) -> a2
	jal H_LINE		# Haz una linea horizontal desde arriba
	
	# Impresion de nueva imagen
	jal Carga
	jal IMAGE		# Imprime Imagen
	jal Carga
	
	# Cambio de pixel
	addi a4,a4,1		# Desplaza un pixel hacia abajo
	addi t4,t4,1		# Aumenta en 1 el contador
	
	b abajo

Guardado:
		# Guardado de datos
		sw a0, 56(sp)
		sw a1, 52(sp)
		sw a2, 48(sp)
		sw a3, 44(sp)
		sw a4, 40(sp)
		sw a6, 32(sp)
		sw t4, 28(sp)
		ret
Carga:

		# Carga de datos
		lw a0, 56(sp)
		lw a1, 52(sp)
		lw a2, 48(sp)
		lw a3, 44(sp)
		lw a4, 40(sp)
		lw a6, 32(sp)
		lw t4, 28(sp)
		ret
		
fin:
		#-- Fin de subrutina
		lw ra, 60(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 64
		ret