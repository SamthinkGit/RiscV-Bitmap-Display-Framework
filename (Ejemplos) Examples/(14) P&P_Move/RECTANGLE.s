# Subrutina que diseña un rectangulo dadas sus coordenadas (512x512)
# Argumentos
# a0: Coordenada X
# a1: Coordenada Y
# a2: Ancho
# a3: Largo
# a4: Color

# Esquema de Pila:
# 28 -> Registro ra
# 24 -> Coordenada X actual
# 20 -> Coordenada Y actual
# 16 -> Ancho
# 12 -> Largo
# 8 -> Color
# 4 Puntero (x,y) Inicial
# 0 Puntero (x,y) última fila

	.eqv SCREEN 0x10040000
	.eqv BYTE_SIZE 512  # (512px*4)
	.globl RECTANGLE
		
RECTANGLE:

	.text
	#-- Comienzo subruina
	addi sp, sp, -32
	sw ra, 28(sp) #-- Guardar registro ra en la pila
	
	# Guardado de variables
	sw a0, 24(sp)
	sw a1, 20(sp)
	sw a2, 16(sp)
	sw a3, 12(sp)
	sw a4, 8(sp)
	
	li a2, BYTE_SIZE		# Tamaño de pantalla
	li a3, SCREEN		# Puntero Inicial
	jal COORD		# a0 -> Puntero (x,y)
	
	sw a0 4(sp)		# Guardamos Coordenadas Iniciales
	
	lw a0, 24(sp)		# Recuperamos Coordenada X
	lw a1, 20(sp)		# Recuperamos Coordenada Y
	lw,t0, 16(sp)		# Recuperamos Ancho
	lw t1, 12(sp)		# Recuperamos Alto
	
	add a1,a1,t1		# Hallamos la coordendada Y final (Para saber el puntero de la ultima fila)
	
	li a2, BYTE_SIZE		# Tamaño de pantalla
	li a3, SCREEN		# Puntero Inicial
	jal COORD
	
	sw a0, 0(sp)		# Guardamos Puntero de la ultima fila
	lw a5, 4(sp)		# Recuperamos Puntero Actual
	
bucle:

	lw,a2, 16(sp)		# Recuperamos Ancho
	lw a4, 8(sp)		# Recuperamos Color

	lw a6, 0(sp)		# Recuperamos Puntero Final
	
	beq a5,a6,fin		 # Si el puntero final y el inicial coinciden, salta
	
	mv a0,a5			# Puntero actual
	mv a1, a2		# Distancia (Ancho)
	mv a2,a4			#Color
	jal H_LINE
	
	lw a5, 4(sp)		# Recuperamos Puntero Actual
	
	li t0, BYTE_SIZE	# 512
	li t1, 4			# 4
	mul t0,t0,t1		# 512 * 4
	add a5, a5, t0		# Cambiamos de fila sumando 512* 4
	sw a5, 4(sp)
	
	b bucle
	
fin:
	#-- Fin de subrutina
	lw ra, 28(sp) #-- Recurperar el registro ra de la pila
	addi sp, sp, 32
	ret
	
	
	
