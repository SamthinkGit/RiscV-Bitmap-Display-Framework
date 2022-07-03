# RiscV-Bitmap-Display-Framework

This repository contains a RiscV Bitmap Display Framework. It includes source code for the framework, as well as documentation and examples. 
The framework is designed to simplify the process of using the bitmap display on the RiscV (RARs) platform. It includes functions for drawing basic 
shapes, and images. We believe that it is important that all users are able to easily understand this framework, and the best way to achieve 
this is through explanation in Spanish. Is for this reason that all explanations for the contents of this course will be found in the "HELP" folder
fully in Spanish. We hope that this will be helpful for those who want to learn how to use this tool for their own projects. 

If you have any questions, please do not hesitate to contact us and we will do our best to answer your inquiries.


---------------------------------------------------------------------------------------------------------------------------------------------------

# RiscV-Bitmap-Display-Framework

Este repositorio contiene un framework para el Bitmap Display de RiscV. Incluye código fuente, así como documentación y ejemplos.
El framework está diseñado para simplificar el proceso de uso del Bitmap Display en la plataforma RiscV (RAR). Incluye funciones para el dibujo básico
de formas básicas e imágenes. Creemos que es importante que todos los usuarios puedan entender fácilmente este framework y la mejor manera de lograr
esto es mediante la explicación en español. Es por esta razón que todas las explicaciones de los contenidos de este curso se encontrarán en la carpeta 
"HELP" íntegramente en español. Esperamos que esto sea útil para aquellos que quieran aprender a usar esta herramienta 
para sus propios proyectos.

Si tiene alguna pregunta, no dude en ponerse en contacto con nosotros y haremos todo lo posible para responder a sus consultas.



------------------------------ CONTENIDOS -------------------------------------

Directorios:
- HELP: Contiene una serie de archivos de texto que explican el funcionamiento del Bitmap Display del RISCV en detalle, así como varios conceptos
  relacionados con la manipulación de imágenes y la creación de gráficos en general. Los archivos están numerados en orden de la lectura recomendada,
  y cubren temas como la asignación de espacio en memoria para almacenar imágenes, el uso de diferentes colores y la manipulación de coordenadas.
  También se explican conceptos avanzados como la impresión de imágenes con transparencia, el parcheado de imágenes o transformaciónes estáticas/dinámicas.

- Utils: Contiene un conjunto de códigos que permiten manipular el Bitmap Display. Las funciones varian entre creación de figuras, transformación
  de imagenes o creación de imagenes inteligentes. Para llamarlas basta con moverse al puntero global especificado al principio de cada subrutina,
  pasando los argumentos requeridos. Más información de funcionalidad y uso sobre cada código vendra incluido en sus comentarios, se recomienda 
  consultar el código de los utiles directamente desde esta carpeta en vez de los adjuntados en los ejemplos, los utiles de los ejemplos contienen una
  documentación reducida.

- Examples: Contiene una serie de ejemplos de código que ponen en práctica los conceptos explicados en la carpeta HELP. Los ejemplos están ordenados 
  por tema, y cada uno contiene un archivo principal (.asm) y varios archivos de subrutinas (.s) necesarios para ejecutar el programa. Se recomienda 
  probar los ejemplos en el orden especificado, y jugar con los parámetros de las subrutinas para ver los cambios que pueden suceder. (Puedes activar
  la opción de "Assemble all files in directory" para abrir con el Rars solo el fichero ".asm"). 

  IMPORTANTE: NO se recomienda cambiar las subrutinas '.s' incluidas en los ejemplos directamente por los de la carpteta "Utils", en algunos ejemplos los
  ficheros contienen ligeras modificaciones en constantes globales para el correcto funcionamiento del programa principal.
  
  Dentro de los ejemplos encontraras constantes con la marca de laboratorio (L), estas se tratan de variables que se recomienda modificar con el fin de
  entender más profundamente lo que sucede internamente en cada programa.
   
  El último ejemplo, 'Bitmap Laboratory', contiene un programa que muestra la mayoría de contenidos que se explican en este curso, y se recomienda
  de visualizar como primer ejemplo como demostración de lo que se explicará aquí y los resultados que se pueden obtener con las subrutinas ofrecidas.
  También es un buen ejemplo para empezar a familiarizarse con el código y las subrutinas, por lo que se recomienda indagar y probar a fondo las 
  subrutinas en este laboratorio. Se pueden cambiar los parámetros, las animaciones, el orden de los elementos (o añadir nuevos). Ten cuidado con 
  cambiar las constantes globales sin conocer los parámetros que se estan alterando, puede resultar en un grave malfuncionamiento del programa.

  Si te cuesta comprender el código del 'Bitmap Laboratory', la carpeta 'Laboratory Help' explicará mas detalladamente cada accion realizada para
  obtener la animación final.


Lista de Utiles:

- ALPHA_IMAGE.s: Imprime en pantalla una imagen con partícula alfa. (Un color a elegir no se imprimira, parecido a imagenes PNG)
- COORD.s: Devuelve la direccion a un espacio en memoria asociado a unas coordenadas en el display.
- CUT.s*: Corta una imagen y la pega en unas coordenadas especificadas
- H_LINE.s: Imprime en el display una linea horizontal de longitud especificada
- IMAGE.s: Imprime en pantalla una imagen (necesario un bitmap)
- MOVE.s: Realiza un desplazamiento a una imagen en una direccion determinada (Bitmap necesario, paso pixel a pixel)
- NEW_IMAGE.s: Asocia un ID a un conjunto de pixeles en pantalla.
- P&P_IMAGE.s: Imprime en pantalla una imagen respetando una imagen de fondo. (Bitmap necesario, parecido a imagenes PNG respecto a una imagen de fondo)
- PATCH.s*: Parchea/Recupera un fragmento de imagen en el display
- PATCH_SPEED_MOVE.s*: Realiza un desplazamiento a una imagen con una direccion y velocidad determinada parcheando su entorno. (Se tratara como PNG 
  respecto a un fondo con ID de tag "background") CUIDADO: Genera conflictos con SPEED_MOVE.s
- RECTANGLE.s: Crea un rectángulo de color y dimensiones determinadas en el display
- REMOVE.s*: Elimina una imagen en pantalla (Devuelve al color de fondo)
- RESIZE_IMAGE.s: Imprime en pantalla una imagen con dimensiones reescaladas (necesario bitmap)
- RESIZE_PIXEL.s: Imprime en pantalla un cuadrado nxn
- RiscVGenerator.py: Convierte una secuencia de colores en hexadecimal a un formato aceptado por RARs. Más informacion en HELP(7)
- SHIFT.s*: Realiza un desplazamiento a una imagen en una direccion y velocidad determinada. (Parchea o no su entorno en funcion de la subrutina integrada)
- SPEED_MOVE.s: Realiza un desplazamiento a una imagen en una direccion determinada(bitmap necesario, pasos de más de un pixel por paso)
- V_LINE.s: Imprime en el display una linea vertical de direccion determinada.

*Solo utilizable en imagenes/espacios con ID


------------------------------ USO DE EJEMPLOS -------------------------------------

Para ejecutar los ejemplos incluidos en los contenidos, se recomienda seguir los siguientes pasos:

- Abrir el Simulador de RISCV RARs
- Activar la opción "Settings/Assemble all files in directory"
- Abrir el fichero .asm
- Compilar el programa
- Abrir Tools/Bitmap Display
- Ajustar los parámetros en función de lo especificado por el programa principal (Asegurate de que coincida el Base Address)
- Pulsar "Connect to Program" en el Bitmap Display
- Ensamblar el programa principal
- Ejecutar el programa
- Pulsar "Reset" para preparar el display para una nueva ejecución


Nota: Recuerda que la ventana del Bitmap Display a veces puede no estar totalmente ampliada. Ampliala colocando el cursor en el borde de la ventana y
estirando lo que sea necesario.

