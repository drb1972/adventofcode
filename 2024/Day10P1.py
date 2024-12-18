# python - Advent of code Day 6-1 - 2024 
import time
start_time = time.time()

with open('Day10_Input.txt', 'r') as f:
    file = [list(line.strip()) for line in f]


def start(file,row,col,come_from=''):
    val = int(file[row][col])

    print('row: ',row,'col: ',col,'val: ',val)

    if row < 0 or row > rows or col < 0 or col > cols: 
        print('Salgo de rango')
        return 0
    if val == 9:
        return 1
    way = 'UDRL'
    if come_from != '': way.remove(come_from) 

    print('Entro', way) 

    for char in way:
        print('char: ',char)    
        if char == 'R':
            col += 1
            come_from = 'L'
        elif char == 'L':
            col -= 1
            come_from = 'R'
        elif char == 'U':
            row -= 1
            come_from = 'D'
        elif char == 'D':
            row += 1
            come_from = 'U'

        print('row: ',row,'col: ',col,'val+1: ',val+1)

        if file[row][col] == val+1: 
            # print('row: ',row,'col: ',col,'val: ',val+1)
            start(file,row,col,come_from)
        print('Salgo de secuencia') 
    return 0

tot = 0
rows = len(file)
cols = len(file[0])
for i, row in enumerate(file):
    for j, col in enumerate(row):
        if int(file[i][j]) == 0:
            tot+= start(file,i,j,'')


print(tot)