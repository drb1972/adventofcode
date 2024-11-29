# python - Advent of code Day 4-1 - 2016 

import time
start_time = time.time()

# Abro el archivo en modo lectura
with open('Day4_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]

chars=''.join(chr(i) for i in range(ord('a'), ord('z') + 1))
nums =''.join(chr(i) for i in range(ord('0'), ord('9') + 1))


def check(name,sector,checksum):
   cache=''
   # count chars
   freq={}
   for char in name:
      if char in cache: continue
      freq[char]=name.count(char)
      cache+=char
   
   # paso el dict a una lista
   sort_name=[]
   for i in freq:
      sort_name.append((i,freq[i]))
   
   # Ordena una lista por el segundo valor
   sort_name=sorted(sort_name,key=lambda x: x[1], reverse=True)
   
   # print(sort_name)

   ant=(sort_name[0])[1] # valor de la primera letra mas repetida
   temp_str=''
   str=''
 
   for a ,b in sort_name:
      if b==ant:
         temp_str=temp_str+a
         # ant=b
      else:
         lst=list(temp_str)
         lst.sort()
         for char in lst:
            str=str+char 
         temp_str=a
      ant=b

   if temp_str!='':
      lst=list(temp_str)
      lst.sort()
      for char in lst:
         str=str+char 

   str=str[:5]
   
   # print(str, checksum)
   if str==checksum:
      return(int(sector))
   else:
      return(0)

tot=int(0)

for line in lines:
   name=''
   sector=''
   checksum=line[line.find("[")+1:line.find("]")] 
   line=line[:line.find("[")]

   for char in line:
      if char in nums:
         sector+=char
      elif char in chars:
         name+=char

   freq=check(name,sector,checksum)
   tot=tot + freq


print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
