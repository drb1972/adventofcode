/* rexx - Advent of code Day 1-1 - 2024 */
/* no esta terminado - mejor approach en 
leer una linea a la vez y llevarla a otro 
stem temporal en vez de 2 dimensiones*/
parse arg day type

/* read puzzle data in file. */
call read_input
tot=0

drop row.
row.0=file.0
do i=1 to row.0
   num=words(file.i)
   row.i.0=num
   do j=1 to row.i.0
      row.i.j=word(file.i,j)
   end
end

do i=1 to row.0
   res=0
   call calc
   if res=0 then do
      cc=0
      do k=row.i.0 to 1 by -1
         cc=cc+1
         reverse_row.i.cc=row.i.k
      end
      do k=1 to row.i.0 
         row.i.k=reverse_row.i.k
      end
      call calc
   end
   tot=tot+1
end 

say 'Tot: 'tot

say 'time: 'time('E')
exit

calc:
   ret=0
   do j=1 to row.i.0-1
      if abs(1 <= (row.i.j-row.i.j+1)) & (3 >= (row.i.j-row.i.j+1)) then do
         if row.i.j<row.i.j+1 then do
            ret=1
         end
         else do 
            res=0
            return
         end
      end
      else do
         res=0
         return
      end
   end
return

read_input:
   path_to_data='/u/users/group/product/prod001/advent_of_code/2024/'
   data=path_to_data||'Day'||day||'_Input'
   if type='t' then data=data||'_Test.txt'
   else data=data||'.txt'

   cmd = "cat "||""||data||""
   say cmd
   RRC=bpxwunix(cmd,,file.,err.)
return
