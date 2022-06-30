# Subrutina que realiza una traslacion estática con un paso mayor a 1. (Solo traslaciones ortogonales) Utilizable en display 512x512
# Argumentos:
# a0: Puntero a Imagen
# a1: Ancho
# a2: Alto
# a3: Coordenada x Inicial
# a4: Coordenada y Inicial
# a5: Orientación
# a6: Desplazamiento
# a7: Paso
		.globl SPEED_MOVE
		.eqv SIZE 512
		.eqv DISPLAY 0x10040000

# ------------- COMPROBACIONES
SPEED_MOVE:
		.text
		# Inicio Subrutina
		addi sp, sp, -64
		sw ra, 60(sp)

		li t4, 0 # Contador
		
		# Asignacion de direccion
		li t1,1
		li t2,2
		beq a5,zero,derecha
		beq a5,t1, abajo
		beq a5,t2, izquierda
		b arriba

# --------------- MOVIMIENTOS ---------
arriba:
		beq t4, a6, fin
		jal Guardado
		
		la a0, background
		mv a1,a3			# Coordenada x
		add a2,a4, a2		# Coordenada y
		lw a3,52(sp)		# Ancho del rectangulo
		mv a4,a7			# Alto del rectangulo (Paso)
		jal PATCH
	
		# Impresion de nueva imagen
		jal Carga
		la a5, background
		jal PRINT_PATCH		# Imprime Imagen
		jal Carga
	
		# Cambio de pixel
		sub a4,a4,a7		# Desplaza un paso hacia arriba
		addi t4,t4,1		# Aumenta en 1 el contador
	
		b arriba
		
abajo:
		beq t4, a6, fin
		jal Guardado
		
		la a0, background
		mv a1,a3		# Coordenada x
		mv t6,a4		# Coordenada y
		sub a2,t6,a7		# Correcion por desplazamiento
		lw a3,52(sp)		# Ancho del rectangulo
		mv a4,a7			# Alto del rectangulo (Paso)
		jal PATCH
		
		# Impresion de nueva imagen
		jal Carga
		la a5, background
		jal PRINT_PATCH		# Imprime Imagen
		jal Carga
	
		# Cambio de pixel
		add a4,a4,a7		# Desplaza un paso hacia abajo
		addi t4,t4,1		# Aumenta en 1 el contador
	
		b abajo
		
izquierda:
		beq t4, a6, fin
		jal Guardado
		
		la a0, background
		add a1, a3, a2 # Coordenada x
		mv a2,a4		# Coordenada y
		mv a3,a7		# Ancho del rectangulo
		lw a4, 48(sp)	# Alto del rectangulo
		jal PATCH
	
		# Impresion de nueva imagen
		jal Carga
		la a5, background
		jal PRINT_PATCH		# Imprime Imagen
		jal Carga
	
		# Cambio de pixel
		sub a3,a3,a7		# Desplaza un paso a la izquierda
		addi t4,t4,1		# Aumenta en 1 el contador
	
		b izquierda

derecha:
		beq t4, a6, fin
		jal Guardado
		
		la a0, background
		sub a1,a3,a7	# Correcion por desplazamiento
		mv a2,a4		# Coordenada y
		mv a3,a7		# Ancho del rectangulo
		lw a4, 48(sp)	# Alto del rectangulo
		jal PATCH
	
		# Impresion de nueva imagen
		jal Carga
		la a5, background
		jal PRINT_PATCH		# Imprime Imagen
		jal Carga
	
		# Cambio de pixel
		add a3,a3,a7		# Desplaza un paso a la derecha
		addi t4,t4,1		# Aumenta en 1 el contador
	
		b derecha


#---------------------- PILA DE DATOS ----------------------------
Guardado:
		# Guardado de datos
		sw a0, 56(sp)	
		sw a1, 52(sp)
		sw a2, 48(sp)
		sw a3, 44(sp)
		sw a4, 40(sp)
		sw a6, 32(sp)
		sw t4, 28(sp)
		sw a7, 24(sp)
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
		lw a7,24(sp)
		ret
fin:
		#-- Fin de subrutina
		lw ra, 60(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 64
		ret
