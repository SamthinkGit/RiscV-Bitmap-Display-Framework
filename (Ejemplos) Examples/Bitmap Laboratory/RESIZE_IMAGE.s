# Subrutina que imprime una imagen en un bitmap display 512x512 (Variable con la constante SIZE)
# Argumentos:
# a0: Puntero a imagen
# a1: Ancho
# a2: Alto
# a3: Coordenada x
# a4: Coordenada y
# a5: Escala
 		.include "Globals.s"
 		
		.globl RESIZE_IMAGE
		
RESIZE_IMAGE:
		.text
		
		#-- Comienzo subruina
		addi sp, sp, -64
		sw ra, 60(sp) 
		sw a0, 56(sp)
		sw a1, 52(sp)
		sw a2, 48(sp)
		sw a5, 44(sp)
		
		mv a0,a3	
		mv a1,a4
		li a2, SIZE
		li a3, SCREEN
		jal COORD
		
		mv t3, a0		# Puntero a Pixel (Inicial)
		lw t4, 56(sp)	# Puntero a Imagen (Colores)
		
		li a0, 0		# Contador
		li a1, 0		# Contador de filas
		
		lw t0, 52(sp) 		# Ancho
		lw t1, 48(sp)		# Alto
		lw t6, 44(sp)		# Escala
		
		# Salto de linea: (512*Escala*4)-(Ancho*Escala*4) = Escala*4*(512-Ancho)
		
		li a2, SIZE		# Ancho de pantalla (512)
		sub a2,a2,t0		# Salto de linea (512-Ancho)
		
		li a3,4			# Salto en bytes ((512-Ancho)*4)
		mul a2,a2,a3		#
		
		mul a2, a2,t6 		# Salto Final  ((512-Ancho)*4)*Escala
		sw a2, 8(sp)

		

bucle:
		beq a0,t0,linea
		beq a1,t1,final

		
		#Guardado de datos
		sw a0, 40(sp)		# Contador de pixel
		sw a1, 36(sp)		# Contador de linea
		sw t0, 32(sp)		# Ancho de Imagen
		sw t1, 28(sp)		# Alto de Imagen
		sw t3, 20(sp)		# Puntero a Pixel
		sw t4, 16(sp)		# Puntero a color
		
		mv a0,t3		# Puntero 
		lw a1, 44(sp)	# Escala
		mv a2, t4		# Puntero a color
		jal RESIZE_PIXEL
		
		#Carga de datos
		lw t6, 44(sp)		# Salto de linea (bytes)
		lw a0, 40(sp)
		lw a1, 36(sp)
		lw t0, 32(sp)
		lw t1, 28(sp)
		lw t3, 20(sp)
		lw t4, 16(sp)

		addi t4,t4,4		# Cambia de color
						
		li a3, 4 			# Aumento de pixel (Puntero Pixel + Escala*4)
		mul a3, a3,t6		#
		add t3,t3,a3		#
		
		addi a0,a0,1		# Aumenta el contador de pixel
		
		b bucle
		
linea:	
		lw a2, 8(sp)		# Carga el salto de linea
		
		add t3,t3,a2		 # Salta de linea
		mv a0,zero		# Resetea el contador de pixel
		addi a1,a1,1		# Incrementa el contador de linea
		b bucle
final:
		#-- Fin de subrutina
		lw ra, 60(sp) #-- Recurperar el registro ra de la pila
		addi sp, sp, 64
		ret
	
