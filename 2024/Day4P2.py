# python - Advent of code Day 4-1 - 2024 
import time
start_time = time.time()

def find_sequence(matrix, sequence):
    rows = len(matrix)
    cols = len(matrix[0])
    tot = 0
    # Check horizontal and vertical
    # for r in range(rows):
    #     for c in range(cols):
    #         if c + seq_len <= cols and ''.join(matrix[r][c:c+seq_len]) == sequence:
    #             count += 1
    #         if r + seq_len <= rows and ''.join(matrix[r+i][c] for i in range(seq_len)) == sequence:
    #             count += 1
    #         if c - seq_len >= -1 and ''.join(matrix[r][c-i] for i in range(seq_len)) == sequence:
    #             count += 1
    #         if r - seq_len >= -1 and ''.join(matrix[r-i][c] for i in range(seq_len)) == sequence:
    #             count += 1

    # Check diagonals
    for r in range(1,rows-1):
        for c in range(1,cols-1):
            if matrix[r][c] == 'A':
                if (matrix[r-1][c-1] == 'M' and matrix[r+1][c+1] == 'S' or  \
                    matrix[r-1][c-1] == 'S' and matrix[r+1][c+1] == 'M') and \
                   (matrix[r-1][c+1] == 'M' and matrix[r+1][c-1] == 'S' or  \
                   matrix[r-1][c+1] == 'S' and matrix[r+1][c-1] == 'M'): 
                      tot+=1
    return tot
tot=0

with open('Day4_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]
#    print(lines)
matrix = [list(line) for line in lines]
# print(matrix)
sequence = "MAS"
tot = find_sequence(matrix, sequence)

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time

print(f"Elapsed time: {elapsed_time} seconds")

exit()