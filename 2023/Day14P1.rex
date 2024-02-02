/* rexx 2023 Day 14 Part1 */
call leer_fichero

cc = 0
set = 0
do until set = 1
cc = cc+1 ; say cc
   call process
end
Tot = 0
call calculate 
say 'Tot:' Tot
exit

calculate:
   do i = 1 to rows
      do j = 1 to cols
         if mirrors.i.j = 'O' then Tot = Tot + rows - i + 1
      end 
   end 
return

process:
   set = 1
   do i = 2 to rows
      do j = 1 to cols
         k = i-1
         if mirrors.i.j = 'O' & mirrors.k.j = '.' then do
            mirrors.k.j = 'O'
            mirrors.i.j = '.'
            set = 0
         end    
      end 
   end 
return

display:
   do i = 1 to rows
      kk = ''
      do j = 1 to cols
         kk = kk || mirrors.i.j
      end 
      say kk
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day14_Input.txt'

   cc = 0
   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc = cc+1
      map.cc = line
   end
   call lineout input_file
   map.0 = cc
   rows = map.0
   drop mirrors.
   cols = length(map.1)
   do i = 1 to rows
      do j = 1 to cols
         mirrors.i.j = substr(map.i,j,1)
      end /* j */
   end /* i */
return