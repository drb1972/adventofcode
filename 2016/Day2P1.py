# rexx - Advent of code Day 2-1 - 2016 

# Abro el archivo en modo lectura
with open('Day2_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.rstrip() for line in lines]

number=''

def find():
   # global pos
   # global char
   if   char=='U' and pos.real!=1: pos=pos-(1+0j)
   elif char=='D' and pos.real!=3: pos=pos+(1+0j)
   elif char=='L' and pos.imag!=1: pos=pos-(0+1j)
   elif char=='R' and pos.imag!=3: pos=pos+(0+1j)
   return(char,pos)

def trans():
   # global number
   if   pos==1+1j: number=number+'1'
   elif pos==1+2j: number=number+'2'
   elif pos==1+3j: number=number+'3'
   elif pos==2+1j: number=number+'4'
   elif pos==2+2j: number=number+'5'
   elif pos==2+3j: number=number+'6'
   elif pos==3+1j: number=number+'7'
   elif pos==3+2j: number=number+'8'
   elif pos==3+3j: number=number+'9'
   return(number)

# 123 - 1,1 1,2 1,3
# 456 - 2,1 2,2 2,3
# 789 - 3,1 3,2 3,3

# Posicion inicial
pos=2+2j

for line in lines:
   for char in line:
      find()
   number=trans()

print(number)

exit()
