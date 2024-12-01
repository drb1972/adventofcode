# python - Advent of code Day 5-1 - 2016 
import time
start_time = time.time()
import hashlib

def calc(str2hash):
   result = hashlib.md5(str2hash.encode())
   # the equivalent hexadecimal value is:
   return(result.hexdigest())

def ask(door):
   pwd=''
   # door='abc3231928'
   cc=int(0)
   while len(pwd)!=8:
      send=str(door)+str(cc)
      hex=calc(send)
      if hex[:5]=='00000':
         pwd=pwd+hex[5:6]
         print('pwd:', pwd)
      cc=int(cc)+1 
   return(pwd)

# initializing string
door='ugkcyxxp'
pwd=ask(door)

print(pwd)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
