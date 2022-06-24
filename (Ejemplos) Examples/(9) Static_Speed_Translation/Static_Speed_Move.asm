# Programa que imprime la imagen Cursor.png en el bitmap display y lo mueve un determinado numero de pasos . Display ubicado con base adress en 
# 0x10040000 por razones de espacio (512x512). Necesarias subrutinas COORD.s, IMAGE.s, MOVE.s,  H_LINE.s y V_LINE.s
# Puedes jugar con la direccion (0,1,2 o 3) para moverlo en distintas direcciones y con el paso para ir mas rapido o m�s lento.

		.data

image:	.word  0xff000000 0xff000000 0xff000000 0xfff699fb 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffed8ef7 0xffee8ff7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffe483f3 0xff000000 0xffe585f4 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffdb79ef 0xff000000 0xff000000 0xffdd7bf0 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffd16deb 0xff000000 0xff000000 0xff000000 0xffd470ec 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffc863e7 0xff000000 0xff000000 0xff000000 0xff000000 0xffcb66e8 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffbf58e3 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffc35ce4 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffb64edf 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffba52e1 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffac42db 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffb148dd 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa438d7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa93ed9 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff9a2dd3 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xffa034d5 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff9122cf 0xff000000 0xff000000 0xff000000 0xff9425d0 0xff9426d0 0xff9527d1 0xff9527d1 0xff9628d1 0xff9729d1 0xff972ad2 0xff982ad2 0xff000000 0xff000000 0xff000000 0xff000000 0xff8717ca 0xff000000 0xff000000 0xff8919cb 0xff8a1acb 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7f0dc7 0xff000000 0xff800ec7 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7501c2 0xff7602c2 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff7400c2 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 0xff000000 

		.text
		la a0, image		# Imagen a cargar
		li a1, 16			# Ancho
		li a2, 16			# Alto
		li a3, 0			# Coordenada x
		li a4, 0			# Coordenada y
		li a5,0			# Direccion
		li a6,60			# Desplazamiento (Numero de Pasos)
		li a7, 3			# Paso  (Tama�o de Paso)
		jal SPEED_MOVE
		
		
		
		# Fin de programa
		li a7,10
		ecall
