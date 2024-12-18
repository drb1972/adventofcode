# python - Advent of code Day 9-1 - 2024 
import time
start_time = time.time()

with open('Day9_Input.txt', 'r') as f:
    file = [list(line.strip()) for line in f]
   #  file = [line.split() for line in file]
# file=file[0]


file = [char for line in file for char in line]

# print(file)
file='2333133121414131402'
file=list(file)
# print('len: ',len(file))
# print('file0 ' ,file[0])
# print('file1 ' ,file[1])

def suma(file):
    total=0
    while file[-1] == '.': file.pop()
    for i in range(len(file)): 
        # print(file[i],i,int(file[i])*i)
        total+=int(file[i])*i
    return total

# 00...111...2...333.44.5555.6666.777.888899
def inflate(file):
   res=''
   cc=0
   for i, val in enumerate(file):
      if i % 2 == 0:
         res += int(val) * str(cc)
         # if cc==10: cc=-1
         cc+=1
      else:
          res += '.'*int(val)
      print(res)
   return res
       
def order_file(file):
   while True:
      while file[-1] == '.': file.pop()
      
      if '.' in file:
         idx = file.index('.')
         file[idx] = file[-1]
         file.pop()
         print(file)
      else: return file



file=inflate(file)
print(file)
file=list(file)
file=order_file(file)
# print(file)
tot=suma(file)
print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()