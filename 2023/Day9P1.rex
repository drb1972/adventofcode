/* rexx 2023 Day 8 Part1 */
call leer_fichero
Tot = 0
exit

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day8_Input.txt'
   do while lines(input_file) \= 0
      line = linein(input_file)
      select
         when line = ''then iterate
         when pos('=',line) = 0 then directions = line
         otherwise do
            parse var line A ' = (' B ', 'C')'
            stem.A.L = B
            stem.A.R = C 
         end
      end
   end
   call lineout input_file
return