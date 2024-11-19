# Python - Advent of code Day 1-1 - 2023 

# Abrimos el archivo en modo lectura
with open('Day1_Input.txt', 'r') as archivo:
    lineas = archivo.readlines()

# Eliminamos el salto de línea (\n) al final de cada línea
lineas = [linea.strip() for linea in lineas]

tot = 0
for linea in lineas:
   # subTot=''
   # for car in linea:
   #    if car.isnumeric():
   #       subTot=subTot + car
   digits=[char for char in linea if char.isnumeric()]
   tot1=int(digits[0]+digits[-1])
   tot+=tot1
print(tot)
