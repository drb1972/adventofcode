# python - Advent of code Day 1-2 - 2015

# Abrimos el archivo en modo lectura
with open('Day1_Input.txt', 'r') as archivo:
   lineas = archivo.readline()

tot=0
cont=0

print(type(lineas))

for char in lineas:
   cont=cont+1
   if char=='(': tot=tot+1
   else: tot=tot-1
   if tot==-1: break

print('cont ' + str(cont))

exit()