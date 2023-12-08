/* rexx - Advento of code Day 1 - 2023 */

drop in.
x = 0
input_file  = 'Day1P1_Input.txt'
do while lines(input_file) \= 0
   x = x+1
   in.x = linein(input_file)
end
in.0 = x

call lineout input_file
/*-------------------------*/

tot = 0
do i = 1 to in.0 
   record = in.i 
   call buscar 
   left = char
   record = reverse(in.i)
   call buscar
   right = char
   num = left || right
   tot = tot + num  
   /* dxr */ say 'tot = ' tot
end /* do i */
exit

buscar:
   caracteres = length(record)
   do j = 1 to caracteres
      char = substr(record,j,1)
      do l = 0 to 9
         if l = char then return
      end /* do l */
   end /* do j */
return 
