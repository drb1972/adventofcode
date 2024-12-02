# python - Advent of code Day 2-1 - 2024 
import time
start_time = time.time()

def calc(line):
   xx=len(line)
   ret=0
   for i in range(xx-1):   
      if 1 <= abs(line[i]-line[i+1]) <= 3:
         if line[i]<line[i+1]: 
            ret=1
         else: return 0
      else: return 0
   return ret

tot=0

with open('Day2_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]
   lines = [line.split() for line in lines]

for line in lines:
   line=[int(x) for x in line]
   ret=calc(line)
   if ret==0: 
      line.reverse()   
      ret=calc(line)
   
   tot=tot+ret 

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time

print(f"Elapsed time: {elapsed_time} seconds")

exit()