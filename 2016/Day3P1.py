# python - Advent of code Day 3-1 - 2016 

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

for line in lines:
   tot=tot+check(line[0],line[1],line[2])
   
print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
