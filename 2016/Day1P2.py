# python - Advent of code Day 1-2 - 2016 

# Abrimos el archivo en modo lectura
with open('Day1_Input.txt', 'r') as archivo:
   lineas = archivo.readline()

# Eliminamos el salto de línea (\n) al final de cada línea
# lineas = [linea.strip() for linea in lineas]

lista=lineas.split(", ")
old_dir='N'

pos=[0,0]
global caches
caches=['0,0']

def check(xx,yy):
   pareja=[str(xx) + ',' + str(yy)]
   if pareja not in caches:
      caches.append(pareja)
   else:
      print(pos)
      print(abs(pos[0])+abs(pos[1]))
      exit()
   print('caches: ',caches)
   return


for item in lista:
   dir=(item[0])
   far=(int(item[1:]))

#   print('old_dir: ', old_dir, 'dir: ', dir, 'far: ', str(far) ) 

   if old_dir=='N' and dir=='R':
      for x in range(0, far):
         pos[0]=pos[0]+1
         check(pos[0],pos[1])
      old_dir='E'
      continue
   if old_dir=='N' and dir=='L':
      for x in range(0, far):
         pos[0]=pos[0]-1
         check(pos[0],pos[1])
      old_dir='O'
      continue
   
   if old_dir=='S' and dir=='R':
      for x in range(0, far):
         pos[0]=pos[0]-1
         check(pos[0],pos[1])
      old_dir='O'
      continue
   if old_dir=='S' and dir=='L':
      for x in range(0, far):
         pos[0]=pos[0]+1
         check(pos[0],pos[1])
      old_dir='E'
      continue

   if old_dir=='E' and dir=='R':
      for x in range(0, far):
         pos[1]=pos[1]-1
         check(pos[0],pos[1])
      old_dir='S'
      continue
   if old_dir=='E' and dir=='L':
      for x in range(0, far):
         pos[1]=pos[1]+1
         check(pos[0],pos[1])
      old_dir='N'  
      continue

   if old_dir=='O' and dir=='R':
      for x in range(0, far):
         pos[1]=pos[1]+1
         check(pos[0],pos[1])
      old_dir='N'
      continue
   if old_dir=='O' and dir=='L':
      for x in range(0, far):
         pos[1]=pos[1]-1
         check(pos[0],pos[1])
      old_dir='S' 
      continue

print(pos)
print(abs(pos[0])+abs(pos[1]))

exit()