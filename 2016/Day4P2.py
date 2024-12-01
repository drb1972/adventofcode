# python - Advent of code Day 4-2 - 2016 

import time
start_time = time.time()

# Abro el archivo en modo lectura
with open('Day4_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]

chars=''.join(chr(i) for i in range(ord('a'), ord('z') + 1))
nums =''.join(chr(i) for i in range(ord('0'), ord('9') + 1))
len_abc=len(chars)
chars2=chars*2
# Split por caracter en una lista
table=[chars2[i:i+1] for i in range(0, len(chars2))]

# Ordena un string
def sort_string(string):
   str=''
   lst=list(string)
   lst.sort()
   for char in lst:
      str=str+char 
   return(str)

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
   
   ant=(sort_name[0])[1] # valor de la primera letra mas repetida
   temp_str=''
   str=''
   for a ,b in sort_name:
      if b==ant:
         temp_str=temp_str+a
         # ant=b
      else:
         str=str+sort_string(temp_str)
         temp_str=a
      ant=b

   if temp_str!='':
      str=str+sort_string(temp_str)

   print(str)

   str=str[:5]
   
   # print(str, checksum)
   if str==checksum:
      return(int(sector))
   else:
      return(0)

def shift_name(name,sector,len_abc,table):
   remainder=int(sector)%len_abc
   new_name=''
   for char1 in name:
      for i, char2 in enumerate(table):
         if char1==char2:
            i=i+remainder
            new_name=new_name+table[i]
            break
   return(new_name)

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

   # print(name)
   new_name=shift_name(name,sector,len_abc,table)
   print(new_name)
   # freq=check(new_name,sector,checksum)
   # tot=tot + freq
   if 'northpoleobjects' in new_name:
      tot=sector

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()
