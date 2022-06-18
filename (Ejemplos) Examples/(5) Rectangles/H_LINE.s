# Subrutina que crea una linea horizontal de un color especificado
# Argumentos:
# a0 -> Inicio de Linea
# a1 -> Distancia
# a2 -> Color

		.include "Colors.s"
		.globl H_LINE
		
H_LINE:
		.text
		mv t0, a0         # Puntero Inicial
		mv t1, a0		# Punterio Final
		
		li t4,4		# Tamaño de palabra (4 bytes)
		mul a1,a1,t4	# Distancia Real = (Distancia*Tamaño Palabra)		
		add t1, t1, a1		# Puntero Final = (Puntero + Distancia)
bucle:
		beq t0,t1,fin		# Cuando alcance el final, termina
		sw a2, 0(t0)		# Colorea un pixel
		addi t0,t0,4		# Aumenta un pixel
		b bucle
		
fin:
		ret