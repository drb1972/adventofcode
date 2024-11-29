# python - Advent of code Day 3-2 - 2016 

import time
start_time = time.time()

# Abro el archivo en modo lectura
with open('Day3_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]
   lines = [line.split() for line in lines]

def check(a,b,c):
   a=int(a)
   b=int(b)
   c=int(c)
   if ((a+b)>c) and ((b+c)>a) and ((a+c)>b):
      return 1
   else: return 0

tot=int(0)

group1=[]
group2=[]
group3=[]

cont=0
for line in lines:
   cont=cont+1 
   group1.append(line[0])
   group2.append(line[1])
   group3.append(line[2])
   if cont==3:
     tot=tot+check(group1[0],group1[1],group1[2]) 
     tot=tot+check(group2[0],group2[1],group2[2]) 
     tot=tot+check(group3[0],group3[1],group3[2]) 
     cont=0
     group1.clear()
     group2.clear()
     group3.clear()
   
print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
