# ---------------- SUBRUTINA ---------------------------------------------
# Nombre: COORD.s
# Funcion: Subrutina de devuelve un puntero a memoria asociado 
# a las coordenadas y display especificados.
# Requiere: -
# Argumentos:
# - a0: Coordenada x
# - a1: Coordenada y
# - a2: Ancho de pantalla
# - a3: Puntero de Display (generalmente 0x10010000)
# Devuelve:
# - a0: Puntero
# Ayuda: Help(5)
# -----------------------------------------------------------------------

# ---------------- PROGRAMA PRINCIPAL  ------------------------------
		.globl COORD
		.text

COORD:
		li t0, 4			# Ancho de palabra
		addi a0,a0,1		# Sumamos 1 a la coordenada X, (Para que comience por 0)
		mul t1,t0,a0		# X = Ancho de palabra * Distancia x

		mul t2,a1,a2		# Y = Ancho de pantalla * Distancia en y * Ancho de palabra
		mul t2,t2,t0		#
		
		add t3,t2,t1		# Total = X+Y
		add a0,a3,t3		# Puntero = Puntero Inicial + Total
		addi a0,a0,-4		# Restamos 1 posicion al Puntero (Para que comienze por 0)
		
		ret
