#---------------------------------------------------------------
# NOTA: Subrutina diseñada para un ejemplo, puede haber sido
# ligeramente alterada. Documentación reducida. Se recomienda
# consultar/utilizar el fichero original adjuntado en "Utils"
# -------------------------------------------------------------
# Subrutina que diseña un rectangulo dadas sus coordenadas (512x512)
# Argumentos
# a0: Puntero inicial
# a1: Escala
# a2: Puntero Color



	.eqv SCREEN 0x10040000
	.eqv SIZE 512
	.globl RESIZE_PIXEL
		
RESIZE_PIXEL:

	li t0, 0 # Contador
	li t1, 0 # Contador de filas
	
	li t2,SIZE			# Salto de linea 4*(512-Escala) -> t2
	li t3, 4			#
	sub t2,t2,a1		#
	mul t2,t2,t3		#
	
		

bucle:
	beq t0,a1,linea	# Si completa una linea, cambia de linea
	lw t3, 0(a2)		# Carga el color
	sw t3, 0(a0)		# Guarda el color
	
	addi a0,a0,4		# Da un salto hacia delante
	addi t0,t0,1		# Suma 1 al contador
	b bucle	
	
linea:
	beq t1, a1, fin		# Si ha completado la ultima linea termina
	addi t1,t1,1		# Suma 1 al contador de filas
	addi t0,zero,0		# Resetea el contador de pixeles
	add a0,a0,t2		 # Salta de linea
	b bucle
	
fin:
	ret
	
	
	
