# python - Advent of code Day 1-1 - 2016 

# Abrimos el archivo en modo lectura
with open('Day1_Input.txt', 'r') as archivo:
   lineas = archivo.readline()

# Eliminamos el salto de línea (\n) al final de cada línea
# lineas = [linea.strip() for linea in lineas]

lista=lineas.split(", ")
old_dir='N'

pos=[0,0]

for item in lista:
   dir=(item[0])
   far=(int(item[1:]))

#   print('old_dir: ', old_dir, 'dir: ', dir, 'far: ', str(far) ) 

   if old_dir=='N' and dir=='R':
      pos[0]=pos[0]+far
      old_dir='E'
      continue
   if old_dir=='N' and dir=='L':
      pos[0]=pos[0]-far
      old_dir='O'
      continue
   
   if old_dir=='S' and dir=='R':
      pos[0]=pos[0]-far
      old_dir='O'
      continue
   if old_dir=='S' and dir=='L':
      pos[0]=pos[0]+far
      old_dir='E'
      continue

   if old_dir=='E' and dir=='R':
      pos[1]=pos[1]-far
      old_dir='S'
      continue
   if old_dir=='E' and dir=='L':
      pos[1]=pos[1]+far
      old_dir='N'  
      continue

   if old_dir=='O' and dir=='R':
      pos[1]=pos[1]+far
      old_dir='N'
      continue
   if old_dir=='O' and dir=='L':
      pos[1]=pos[1]-far
      old_dir='S' 
      continue

print(pos)
print(abs(pos[0])+abs(pos[1]))

exit()