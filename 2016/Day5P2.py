# python - Advent of code Day 5-2 - 2016 
import time
start_time = time.time()
import hashlib
import numpy as np

chars=''.join(chr(i) for i in range(ord('a'), ord('z') + 1))

def calc(str2hash):
   result = hashlib.md5(str2hash.encode())
   # the equivalent hexadecimal value is:
   return(result.hexdigest())

def ask(door,cc,pwd):
   # pwd={}
   # cc=int(0)
# while len(pwd)!=8:
   if cc%1000000==0: print(cc)
   send=str(door)+str(cc)
   hex=calc(send)
   if hex[:5]=='00000':
      pos_pwd=hex[5:6]
      char_pwd=hex[6:7]
      #check exists
      if pos_pwd in chars: return(pwd)
      if int(pos_pwd)>7: return(pwd)
      if not str(pos_pwd) in pwd:
         # pwd={pos_pwd:char_pwd}
         pwd[pos_pwd]=char_pwd
         print('pwd:', pwd)
   cc=int(cc)+1 

   return(pwd)

# initializing string
# door='ugkcyxxp'
door='ugkcyxxp'
pwd={}
a=0
b=1
while len(pwd)<8:
   print('len pwd', len(pwd))
   for i in range(a*1000000,b*1000000):
      pwd=ask(door,i,pwd)
   a+=1
   b+=1

out=''
for i in range(8):
   i=str(i)
   out=out+pwd[i]

print(out)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
