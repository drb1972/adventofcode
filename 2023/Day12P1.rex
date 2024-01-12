/* rexx 2023 Day 12 Part1 */


leer_fichero:
   input_file  = 'Day11_Input.txt'
   input_file  = 'temp.txt'

   i = 0
   drop aux1.
   do while lines(input_file) \= 0
      line = linein(input_file)
      i = i+1
      aux1.i = line
   end
   call lineout input_file
   aux1.0 = i       
return