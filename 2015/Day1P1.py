# python - Advent of code Day 1-1 - 2015

# Abrimos el archivo en modo lectura
with open('Day1_Input.txt', 'r') as archivo:
   lineas = archivo.readline()

tot=0

print(type(lineas))

for char in lineas:
   if char=='(': tot=tot+1
   else: tot=tot-1

print('tot ' + str(tot))

exit()