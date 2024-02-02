/* rexx 2015 Day 2 Part1 */
NUMERIC DIGITS 18
call leer_fichero
j = length(line)
arriba    = 10000
abajo     = 0
izquierda = 10000
derecha   = 0 
map. = 0
a = 5000
b = 5000
map.a.b = 1
do i = 1 to j 
   pieza = substr(line,i,1)
   select
      when pieza = '^' then do
         a = a-1
         map.a.b = 1
      end
      when pieza = 'v' then do
         a = a+1
         map.a.b = 1
      end
      when pieza = '<' then do
         b = b-1
         map.a.b = 1
      end
      when pieza = '>' then do
         b = b+1
         map.a.b = 1
      end
      otherwise say 'ERROR'
   end
   if b < izquierda then izquierda = b 
   if b > derecha   then derecha   = b
   if a < arriba    then arriba    = a
   if a > abajo     then abajo     = a
end 
Tot = 0
do i = arriba to abajo
   do j = izquierda to derecha
      if map.i.j = 1 then Tot = Tot + 1
   end
end

say 'Tot:' Tot
exit

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day3_Input.txt'

   cc = 0
   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
   end
   call lineout input_file
return