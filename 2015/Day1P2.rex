/* rexx 2015 - Day 1 - 1 */
input_file  = 'temp.txt'
do while lines(input_file) \= 0
   line = linein(input_file)
end
call lineout input_file
chars = length(line)
floor = 0
do i = 1 to chars
   x = substr(line,i,1)
   if x = '(' then floor = floor+1
   else floor = floor -1
   if floor < 0 then leave
end
say 'Pos 'i
exit