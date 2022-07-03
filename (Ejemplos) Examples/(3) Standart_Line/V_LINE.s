#---------------------------------------------------------------
# NOTA: Subrutina diseñada para un ejemplo, puede haber sido
# ligeramente alterada. Documentación reducida. Se recomienda
# consultar/utilizar el fichero original adjuntado en "Utils"
# -------------------------------------------------------------
# Subrutina que crea una linea vertical de un color especificado
# Argumentos:
# a0 -> Inicio de Linea
# a1 -> Distancia
# a2 -> Color
# a3 -> Tamaño de pantalla

		.include "Colors.s"
		.globl V_LINE
		
V_LINE:
		.text
		mv t0, a0 		# Puntero Inicial
		mv t1, a0			# Puntero Final
		
		li t4,4			# Tamaño de palabra (4 bytes)
		mul a3,a3,t4		# Paso = (Tamaño pantalla*Tamaño Palabra)	
		mul t2,a1,a3		# Distancia Total = (Distancia*Paso) -> Numero de pasos que va a dar en bytes
		
		add t1, t1, t2		# P. Final = (P. Inicial + D. Total)
		
bucle:
		beq t0,t1,fin		# Cuando se alcance el p. final, termina
		sw a2, 0(t0)		# Colorea un pixel
		add t0,t0,a3		# Aumenta un paso
		b bucle
		
fin:
		ret