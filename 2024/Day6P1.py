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

dir = '^'
rows = len(matrix)
cols = len(matrix[0])
while 0 <= pos[0] < rows and 0 <= pos[1] < cols:
   char = next_pos(pos, dir)
   # print('char: ', char)
   if char[0] < 0 or char[0] >= rows or char[1] < 0 or char[1] >= cols:
      matrix[pos[0]][pos[1]] = 'X'
      break
   if (matrix[char[0]][char[1]]) == '#':
      dir = new_dir(dir)

   matrix[pos[0]][pos[1]] = 'X'
   pos = next_pos(pos, dir)
   # print(pos)


tot=0
for i, row in enumerate(matrix):
   print(row)
   for j, char in enumerate(row):
      if char == 'X':
         tot=tot+1

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Elapsed time: {elapsed_time} seconds")

exit()