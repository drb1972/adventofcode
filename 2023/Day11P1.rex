/* rexx 2023 Day 11 Part1 */
call leer_fichero
call expand
aux1. = aux2.
call voltear
aux1. = aux2.
call expand
aux1. = aux2.
call voltear

/* do i = 1 to aux2.0
   say aux2.i
end */

call crear_map 

do i = 1 to map.0
   say map.i.1 map.i.2
end

call proceso
/* say 'Cont:' cont */
say 'Tot: ' Tot
exit

proceso:
cont = 0
Tot = 0
vueltas = map.0 -1 
do i = 1 to vueltas
   a = map.i.1
   b = map.i.2
   do j = (i+1) to map.0 
      cont = cont+1   
      /* say map.j.1 '-' a '+' map.j.2 '-' b '=' (map.j.1) - a + (map.j.2) - b */
      if map.j.1 < a then uno = a - map.j.1
      else uno = map.j.1 -a
      if map.j.2 < b then dos = b - map.j.2
      else dos = map.j.2 - b
      Tot = Tot + uno + dos
   end /* do j */
end /* do i */
return

crear_map:
   drop map.
   cc = 0
   do i = 1 to aux2.0
      do j = 1 to length(aux2.1)
         if substr(aux2.i,j,1)= '#' then do
            cc = cc+1
            map.cc.1 = i 
            map.cc.2 = j
         end
      end
   end
   map.0 = cc

return 

voltear:
   aux2. = ''
   aux1.1 = strip(aux1.1)
   do i = 1 to length(aux1.1)
      do j = 1 to aux1.0
         aux2.i = aux2.i || substr(aux1.j,i,1)
      end
      aux2.i = strip(aux2.i)
   end
   aux2.0 = i
return

expand:
   drop aux2.
   j = 0
   do i = 1 to aux1.0
      j = j+1
      aux2.j = aux1.i
      if pos('#',aux1.i) = 0 then do
         j = j+1
         aux2.j = aux1.i
      end
   end
   aux2.0 = j

return

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