# ---------------- MAIN ---------------------------------------------
# Nombre: Multicolor_Fill.asm
# Funcion: Colorea la pantalla de un degradado de colores
# Requiere: Colors.s
# Display: 512X512, 0x10010000 (Pixel 1x1)
# Ayuda:
# - Uso de Display: Help(1)
# - Uso de Memoria: Help(2)
# - Uso de Colores: Help(3)
# -------------------------------------------------------------------
		
		.include "Colors.s"
		
# ---------------- CONSTANTES ---------------------------------------
		.eqv FINAL_SCREEN  0x10110000 # Final de Display
 		.eqv SCREEN 0x10010000		 # Inicio de DIsplay
 		.eqv DESFASE 1			  	 # (L) Desfase de Color
 		.eqv JUMP 4  				  	 # (L) Salto entre guardados
		
# ---------------- PROGRAMA PRINCIPAL  ------------------------------
		.text
		
	li s0, CIAN_MEDIO      	 # Color Rojo
	li s1, SCREEN			 # Direccion inicial
	li s2, FINAL_SCREEN	 # Direccion final
	
bucle:
	beq s1, s2,fin		# Si el puntero a memoria alcanza el final, termina

	addi s0,s0, DESFASE		# Altera ligeramente el color
	sw s0, 0(s1)		# Guarda el color en memoria
	addi s1,s1,JUMP	# Salta una palabra
	b bucle			# Vuelve

fin:
	li a7, 10
	ecall
