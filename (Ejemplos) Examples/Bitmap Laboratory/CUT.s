# Subrutina que corta y pega una imagen dinámica a una posicion especificada
# Argumentos:
# a0: ID
# a1: Coordenada x
# a2: Coordenada y
		.include "Globals.s"
		.globl CUT
CUT:
		.text
		#-- Comienzo subruina
		addi sp, sp, -16
		sw ra, 12(sp)
		
		# Guardado de Datos
		sw a0, 8(sp)
		sw a1, 4(sp)
		sw a2, 0(sp)
		
		# Borrado de imagen
		jal REMOVE
		
		# Borrado de datos inestables
		li a1,0
		li a2,0
		
		
		# Copiado de imagen -------------
		lw t0, 8(sp)	# Cargamos ID
		
		addi a0, t0, 16	# Puntero a imagen
		lh a1, 12(t0)		# Ancho
		lh a2, 14(t0)		# Alto
		lw a3, 4(sp)		# Coordenada X
		lw a4, 0(sp)		# Coordenada Y
		jal IMAGE
		
		# Actualizacion de posicion ---------
		
		# Borrado de datos inestables
		li a1,0
		li a2,0
		
		lw t0, 8(sp)	# Cargamos ID
		lw a1, 4(sp)		# Coordenada X
		lw a2, 0(sp)		# Coordenada Y
		
		sh a1, 8(t0)		# Guardamos Coordenada X
		sh a2, 10(t0)		# Guardamos Coordenada Y
		
		# Final subrutina
		lw ra, 12(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 16
		ret
		
