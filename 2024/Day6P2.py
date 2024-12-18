# python - Advent of code Day 6-1 - 2024 
import time
start_time = time.time()

with open('Day6_Input.txt', 'r') as f:
   matrix = [list(line.strip()) for line in f]

dir = '^'
# print(matrix)
for i, row in enumerate(matrix):
   for j, char in enumerate(row):
      if char == '^':
         print(f"Character '^' found at position: ({i}, {j})")
         pos = [i, j]
         break

def next_pos(pos, dir):
   row, col = pos
   if dir == '^':
      row -= 1
   elif dir == 'v':
      row += 1
   elif dir == '<':
      col -= 1
   elif dir == '>':
      col += 1
   return [row, col]

def new_dir(dir):
   if dir == '^':
      return '>'
   elif dir == '>':
      return 'v'
   elif dir == 'v':
      return '<'
   elif dir == '<':
      return '^'

def check(matrix,pos):
   dir = '^'
   rows = len(matrix)
   cols = len(matrix[0])
   cache = []
   while 0 <= pos[0] < rows and 0 <= pos[1] < cols:
      char = next_pos(pos, dir)
      if char[0] < 0 or char[0] >= rows or char[1] < 0 or char[1] >= cols:
         # matrix[pos[0]][pos[1]] = 'X'
         return 0
      if (matrix[char[0]][char[1]]) == '#':
         dir = new_dir(dir)
      posdir=(pos,dir)
      # print('posdir: ', posdir ,'cache: ', cache)
      if (posdir) in cache: 
         return 1
      cache.append(posdir)
      # matrix[pos[0]][pos[1]] = 'X'
      pos = next_pos(pos, dir)
   # print(pos)


def first_cache(mat, pos):
   dir = '^'
   rows = len(mat)
   cols = len(mat[0])
   while 0 <= pos[0] < rows and 0 <= pos[1] < cols:
      char = next_pos(pos, dir)
      if char[0] < 0 or char[0] >= rows or char[1] < 0 or char[1] >= cols:
         mat[pos[0]][pos[1]] = 'X'
         break
      if (mat[char[0]][char[1]]) == '#':
         dir = new_dir(dir)

      mat[pos[0]][pos[1]] = 'X'
      pos = next_pos(pos, dir)
   return(mat)
   # print(pos)

mat = matrix[:]
cache1 = []
mat=first_cache(mat,pos)
for i, row in enumerate(mat):
   for j, char in enumerate(row):
      if char == 'X':
         cache1.append([i,j])

# print('cache1: ',cache1)
with open('Day6_Input.txt', 'r') as f:
   matrix = [list(line.strip()) for line in f]
tot=0
for i, row in enumerate(matrix):
   for j, char in enumerate(row):
            
      ole = [i,j]
      if ole == [1, 123]: 
         print('OLE', ole in cache1)
      # print('row: ', ole)
      if ole in cache1: 
         print('Entro', ole, matrix[i][j])
         if (matrix[i][j]) == '.':
            
            matrix[i][j] = '#'  
            tot=tot+check(matrix,pos)
            matrix[i][j] = '.'  

            print(row)
         
         
             
print(tot)
# print(ole,cache1)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()