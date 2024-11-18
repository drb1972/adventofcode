# rexx - Advento of code Day 17-1 - 2023 

# Abrimos el archivo en modo lectura
with open('Day17_Input.txt', 'r') as archivo:
    lineas = archivo.readlines()

# Eliminamos el salto de línea (\n) al final de cada línea
lineas = [linea.strip() for linea in lineas]