# python - Advent of code Day 3-1 - 2024 
import time
start_time = time.time()

def srch(tot,lines):
   mul=lines.find('mul(')
   if mul==-1:
      print('Tot:',tot)
      return(tot)
   mul+=4
   lines=lines[mul:]
   com=lines.find(',')
   par=lines.find(')')
   a=lines[:com]
   b=lines[com+1:par]
   if a.isdecimal() and b.isdecimal():
      tot=tot+(int(a)*int(b))
      lines=lines[par+1:]
   srch(tot,lines)

tot=0

with open('Day3_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]
   # lines = [line.split() for line in lines]

lines=str(lines)
# print(len(lines), lines[0] ,lines[1],lines[2])
tot=srch(tot,lines)

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time

print(f"Elapsed time: {elapsed_time} seconds")

exit()