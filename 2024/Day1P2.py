# python - Advent of code Day 1-2 - 2024
import time
start_time = time.time()

def calc_dist(a,b):
   res=a*b[a]
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
   dict_right={}

   for i in left:
      i=int(i)
      dict_right.setdefault(i,0)
      
   for i in right:
      i=int(i)
      dict_right.setdefault(i,0)
      dict_right[i]=dict_right[i]+1

for a in left:
   res=calc_dist(int(a),dict_right)
   tot=tot+res

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()