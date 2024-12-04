# python - Advent of code Day 4-1 - 2024 
import time
start_time = time.time()

def find_sequence(matrix, sequence):
    rows = len(matrix)
    cols = len(matrix[0])
    seq_len = len(sequence)
    count = 0

    # Check horizontal and vertical
    for r in range(rows):
        for c in range(cols):
            if c + seq_len <= cols and ''.join(matrix[r][c:c+seq_len]) == sequence:
                count += 1
            if r + seq_len <= rows and ''.join(matrix[r+i][c] for i in range(seq_len)) == sequence:
                count += 1
            if c - seq_len >= -1 and ''.join(matrix[r][c-i] for i in range(seq_len)) == sequence:
                count += 1
            if r - seq_len >= -1 and ''.join(matrix[r-i][c] for i in range(seq_len)) == sequence:
                count += 1

    # Check diagonals
    for r in range(rows):
        for c in range(cols):
            if r + seq_len <= rows and c + seq_len <= cols and ''.join(matrix[r+i][c+i] for i in range(seq_len)) == sequence:
                count += 1
            if r + seq_len <= rows and c - seq_len >= -1 and ''.join(matrix[r+i][c-i] for i in range(seq_len)) == sequence:
                count += 1
            if r - seq_len >= -1 and c + seq_len <= cols and ''.join(matrix[r-i][c+i] for i in range(seq_len)) == sequence:
                count += 1
            if r - seq_len >= -1 and c - seq_len >= -1 and ''.join(matrix[r-i][c-i] for i in range(seq_len)) == sequence:
                count += 1

    return count

tot=0

with open('Day4_Input.txt', 'r') as f:
   lines = f.readlines()
   lines = [line.strip() for line in lines]
   print(lines)
matrix = [list(line) for line in lines]
print(matrix)
sequence = "XMAS"
tot = find_sequence(matrix, sequence)

print(tot)

end_time = time.time()
elapsed_time = end_time - start_time

print(f"Elapsed time: {elapsed_time} seconds")

exit()