# ---------------- MAIN -------------------------------------------------------
# Nombre: Screen_Fill.asm
# Funcion: Colorea todo el display de un color determinado
# Requiere: -
# Display: 512x512, 0x10010000 (Pixels 1x1)
# Ayuda:
# - Uso de Display: Help (1)
# - Uso de Memoria: Help (2)
# - Uso de Colores: Help (3)
# ------------------------------------------------------------------------------


# -------------- CONSTANTES ---------------------------------------------

		.eqv COLOR 0x00ff0000			# Color de Display
		.eqv FINAL_SCREEN  0x10110000	# (L) Final de Display
 		.eqv SCREEN 0x10010000			# (L) Inicio de Display
 		.eqv JUMP 4						# (L) Salto entre guardados
		
# ---------------- PROGRAMA PRINCIPAL  ------------------------------
		.text

	# Inicializacion de variables
	li s0, COLOR 		     # Color Rojo
	li s1, SCREEN		     # Direccion inicial
	li s2, FINAL_SCREEN    # Direccion final
	
	# Bucle para colorear la pantalla
bucle:
	beq s1, s2,fin		# Si el puntero alcanza el final, termina
	sw s0, 0(s1)		# Guarda un color en memoria
	addi s1,s1,JUMP	# Desplaza el puntero en memoria hacia delante
	b bucle			# Vuelve

fin:
	# Terminar Programa
	li a7, 10
	ecall
	
