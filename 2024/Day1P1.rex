/* rexx - Advent of code Day 2-1 - 2024 */
parse arg day type


/* read puzzle data in file. */
call read_input


say 'Tot: 'tot

say 'time: 'time('E')
exit

read_input:
   path_to_data='/u/users/group/product/prod001/advent_of_code/2024/'
   data=path_to_data||'Day'||day||'_Input'
   if type='t' then data=data||'_Test.txt'
   else data=data||'.txt'

   cmd = "cat "||""||data||""
   say cmd
   RRC=bpxwunix(cmd,,file.,err.) 
return


