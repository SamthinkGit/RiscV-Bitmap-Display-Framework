import re

fichero = input("Introduce el nombre del fichero: ")

with open(fichero, 'r') as file:
    data = file.read().replace(' ', ' 0x')
    data = re.sub(r'[^a-zA-Z0-9\s]', '', data)
    print(data)

input("Pulsa ENTER para salir")
