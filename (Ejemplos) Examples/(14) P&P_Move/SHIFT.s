# Subrutina que desplaza una imagen dinámica en la direccion definida
# Argumentos:
# a0: Direccion de Imagen
# a1: Direccion
# a2: Distancia
# a3: Velocidad


		.globl SHIFT
		
SHIFT:

		.text
		#-- Comienzo subruina
		addi sp, sp, -16
		sw ra, 12(sp) 
		

		mv t0,a0  # ID -> t0
		mv t1, a1 # Direccion -> t1
		mv t2,a2	# Distancia -> t2
		mv t3,a3	# Velocidad -> t3
		
		sw a1, 4(sp)	# Guardamos Direccion
		sw a0, 0(sp)	# Guardamos ID
		
		mul a5, t2, t3 # Multipllica la distancia por el numero de pasos
		sub a5,a5,t3	# Correcion: Restamos 1 paso 
		sw a5, 8(sp)	# Guardamos Distancia


		
		addi a0,a0,16 # Puntero a imagen (ID+16)
		lh a1, 12(t0)	# Ancho
		lh a2, 14(t0)	# Alto
		lh a3, 8(t0)	# Coordenada x
		lh a4, 10(t0)	# Coordenada y
		mv a5,t1		# Direccion
		mv a6, t2		# Distancia
		mv a7,t3		# Paso
		jal SPEED_MOVE
		
		lw t5, 8(sp)	# Cargamos Distancia
		lw a1, 4(sp)	# Cargamos Direccion
		lw a0, 0(sp) 	# Recuperamos ID
		
		li a3,0
		li a4,1
		li a5,2
		li a6,3
		
		beq a1, a3, derecha
		beq a1, a4, abajo
		beq a1, a5, izquierda
		beq a1, a6, arriba
fin:
		lw ra, 12(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 16
		ret
		
derecha:
		li t0,0		 # Borramos datos inestables
		lh t0, 8(a0)	 # Coordenada x
		add t0,t0,t5	# Sumamos Distancia Recorrida
		sh t0, 8(a0)	# Guardamos nueva coordenada
		b fin
		
izquierda:
		li t0,0		 # Borramos datos inestables
		lh t0, 8(a0)	 # Coordenada x
		sub t0,t0,t5	# Restamos Distancia Recorrida
		sh t0, 8(a0)	# Guardamos nueva coordenada
		b fin
		
abajo:
		li t0,0		 # Borramos datos inestables
		lh t0, 10(a0)	 # Coordenada y
		add t0,t0,t5	# Sumamos Distancia Recorrida
		sh t0, 10(a0)	# Guardamos nueva coordenada
		b fin

arriba:
		li t0,0		 # Borramos datos inestables
		lh t0, 10(a0)	 # Coordenada x
		sub t0,t0,t5	# Restamos Distancia Recorrida
		sh t0, 10(a0)	# Guardamos nueva coordenada
		b fin
		
