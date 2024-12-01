# python - Advent of code Day 1-1 - 2024 
import time
start_time = time.time()

def calc_dist(a,b):
   if b>a:
      res=b-a
   else:
      res=a-b
   return(res)

tot=0
left=[]
right=[]

with open('Day1_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]
   lines = [line.split('   ') for line in lines]
   for line in lines:
      left.append(line[0])
      right.append(line[1])
   left.sort()
   right.sort()   

for a,b in zip(left,right):
   res=calc_dist(int(a),int(b))
   tot=tot+res

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()