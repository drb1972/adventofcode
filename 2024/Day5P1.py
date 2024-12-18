# python - Advent of code Day 5-1 - 2024 
import time
start_time = time.time()

def check(line,order):
    cache = []
    pages = []
    line.reverse() 
    for item in line:
       print('item: ',item, 'cache: ',cache, 'pages: ', pages)
       if item in cache:
          print('Entro')
          return(0)
       else:
          pages.append(item)
          if item not in order:
              continue
          for value in order[item]:
             cache.append(value)
    # print('pages: ', pages)
    middle = 'len: ',len(pages)+1
    middle = len(pages)//2
    # print('middle: ',middle)
    return int(pages[middle])
               
tot=0

with open('Day5_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]

order = {}
update = []
for line in lines:
    if '|' in line:
        key, value = line.split('|')
        # key = int(key)
        # value = int(value)
        if key in order:
            order[key].append(value)
        else:
            order[key] = [value]
    else:
        update.append(line)
order['0']='0'

for i in range(len(update)):
    update[i]=update[i].split(',')

update.remove([''])

for line in update: 
    tot=tot+check(line,order)

# print(order)
# print(update)

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time

print(f"Elapsed time: {elapsed_time} seconds")

exit()