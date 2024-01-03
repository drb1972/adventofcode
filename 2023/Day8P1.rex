/* rexx 2023 Day 8 Part1 */
call leer_fichero
Tot = 0
call proceso

say 'Tot =' Tot
exit

proceso:
   dir = 'AAA'
   primero = Y
   do forever 
   /* say length(directions)   */
      do i = 1 to length(directions)
         LR = substr(directions,i,1)
         dir = stem.dir.LR
         /* say dir LR */
         Tot = Tot + 1
         if dir = 'ZZZ' then return
      end /* do i */
   end /* do forever */
return

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