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
   do forever
      temp = ''
      do j = 2 to words(history)
         k = j-1 
         temp = temp (word(history,j) - word(history,k))
      end
      num = num + word(history, words(history))
      /* say num */
      history = temp
      /* say 'history:' history */
      check = changestr(" ",history,"") 
      if check = 0 then return
   end /* do forever */

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