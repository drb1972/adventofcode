/* rexx 2023 Day 9 Part1 */
NUMERIC DIGITS 18
call leer_fichero
Tot = 0
do i = 1 to history.0
   call proceso
   Tot = Tot + num
end
say 'Tot:' Tot
exit

proceso:
   history = history.i 
   num = 0 
   drop stem.
   cc = 0
   do forever
      temp = ''
      cc = cc+1
      stem.cc = word(history,1)
      do j = 2 to words(history)
         k = j-1 
         temp = temp (word(history,j) - word(history,k))
      end
      history = temp
      /* say 'history:' history */
      check = changestr(" ",history,"") 
      if check = 0 then do
         anterior = 0
         leave 
      end
   end /* do forever */
   stem.0 = cc
   do l = stem.0 to 1 by -1
      anterior = stem.l - anterior
   end
   /* say anterior */
   num = anterior
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day9_Input.txt'
   cc = 0
   drop history.
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc = cc+1
      history.cc = line
   end
   call lineout input_file
   history.0 = cc
return