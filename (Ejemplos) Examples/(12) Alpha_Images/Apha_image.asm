# Prgrama que imprime una imagen respetando los colores alpha. Alpha determinado en negro con Display en 0x10040000, (128x128)

		.data
image: 	.word 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xff1f1f1f 0xff1f1f1f 0xff1f1f1f 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xffffffff 0xff1f1f1f 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xffffffff 0xffffffff 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff1f1f1f 0xff1f1f1f 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 
		.eqv ROJO 0x00ff0000	
		
		.eqv FINAL_SCREEN  0x10050000  #128x128*4 + SCREEN
 		.eqv SCREEN 0x10040000
		.data
		
		.text
	
	# ------------------ Screen-Fill ROJO ---------------
	
	li s0, ROJO 		     # Color Rojo
	li s1, SCREEN		     # Direccion inicial
	li s2, FINAL_SCREEN    # Direccion final
	
bucle:
	beq s1, s2,next		# Si la pantalla esta llena, termina
	sw s0, 0(s1)		# Colorea un pixel
	addi s1,s1,4		#Mueve de pixel
	b bucle			# Vuelve

next: 	
	# ---------------- Imprimir Imagen ---------------------
	
	la a0, image
	li a1,20
	li a2,20
	li a3, 50
	li a4, 50
	jal IMAGE
	
	li a7, 10
	ecall
	