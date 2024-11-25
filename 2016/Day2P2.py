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
   # print('>',pos)
   if   char=='U' and pos not in [[3,1],[2,2],[1,3],[2,4],[3,5]]: pos[0]-=1
   elif char=='D' and pos not in [[3,1],[4,2],[5,3],[4,4],[3,5]]: pos[0]+=1 
   elif char=='L' and pos not in [[1,3],[2,2],[3,1],[4,2],[5,3]]: pos[1]-=1
   elif char=='R' and pos not in [[1,3],[2,4],[3,5],[4,4],[5,3]]: pos[1]+=1 
   # print(pos)
   return(char,pos)

def trans():
   global number
   if   pos==[1,3]: number=number+'1'
   elif pos==[2,2]: number=number+'2'
   elif pos==[2,3]: number=number+'3'
   elif pos==[2,4]: number=number+'4'
   elif pos==[3,1]: number=number+'5'
   elif pos==[3,2]: number=number+'6'
   elif pos==[3,3]: number=number+'7'
   elif pos==[3,4]: number=number+'8'
   elif pos==[3,5]: number=number+'9'
   elif pos==[4,2]: number=number+'A'
   elif pos==[4,3]: number=number+'B'
   elif pos==[4,4]: number=number+'C'
   elif pos==[5,3]: number=number+'D'
   return number

#     1     -             [1,3]
#   2 3 4   -       [2,2] [2,3] [2,4]
# 5 6 7 8 9 - [3,1] [3,2] [3,3] [3,4] [3,5]  
#   A B C   -       [4,2] [4,3] [4,4]
#     D     -             [5,3]

# Posicion inicial
pos=[3,1]

for line in lines:
   for char in line:
      find()
   number=trans()

print(number)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
