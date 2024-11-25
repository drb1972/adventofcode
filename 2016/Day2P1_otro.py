# python - Advent of code Day 2-1 - 2016 
# con lista

import time
start_time = time.time()

# Abro el archivo en modo lectura
with open('Day2_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.rstrip() for line in lines]

number=''

def find():
   global pos
   global char
   if   char=='U' and pos[0]!=1: pos[0]-=1
   elif char=='D' and pos[0]!=3: pos[0]+=1
   elif char=='L' and pos[1]!=1: pos[1]-=1
   elif char=='R' and pos[1]!=3: pos[1]+=1
   return(char,pos)

def trans():
   global number
 
   if   pos==[1,1]: number=number+'1'
   elif pos==[1,2]: number=number+'2'
   elif pos==[1,3]: number=number+'3'
   elif pos==[2,1]: number=number+'4'
   elif pos==[2,2]: number=number+'5'
   elif pos==[2,3]: number=number+'6'
   elif pos==[3,1]: number=number+'7'
   elif pos==[3,2]: number=number+'8'
   elif pos==[3,3]: number=number+'9'
   return number

# 123 - 1,1 1,2 1,3
# 456 - 2,1 2,2 2,3
# 789 - 3,1 3,2 3,3

# Posicion inicial
pos=[2,2]

for line in lines:
   for char in line:
      find()
   number=trans()

print(number)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
