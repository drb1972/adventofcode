/* rexx 2023 Day 15 Part1 */
NUMERIC DIGITS 18
call leer_fichero
numeros = '123456789'
box.  = 'EMPTY'
box.0 = 256
Tot = 0
say 'map.0' map.0
do i = 1 to map.0
   SubTot = 0
   call proceso
   
   
end
say 'Tot:' Tot
exit

proceso:
   l = length(map.i)
   do j = 1 to l
      char = substr(map.i,j,1)
      select 
         when char <> '=' & char <> '-' then do 
            xx = char~c2d
            SubTot = ((SubTot + xx) * 17)//256
         end
         when char = '-' then do

         end

      
   end
return

leer_fichero:
   input_file  = 'Day15_Input.txt'
   input_file  = 'temp.txt'

   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
   end
   call lineout input_file
   input = changestr(',',line,' ')
   drop map.
   map.0 = words(input)
   do i = 1 to map.0
      map.i = word(input,i)
       /* say map.i  */
   end
return