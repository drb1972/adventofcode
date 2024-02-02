/* rexx 2015 Day 2 Part1 */
NUMERIC DIGITS 18
call leer_fichero
call sort
   /* do i = 1 to map.0
      say map.i.1 map.i.2 map.i.3
   end  */
Tot = 0
call process
say 'Tot:' Tot
exit

process:
   do i = 1 to map.0
      Tot = Tot + (2*map.i.1+map.i.2) + (map.i.1 * map.i.2 * map.i.3)
   end
return

sort:
   do i = 1 to map.0
      ordenados = 'no'
      do until ordenados = 'si'
         ordenados = 'no'
         select
            when map.i.1 <= map.i.2 & map.i.2 <= map.i.3  then ordenados = 'si'
            when map.i.2 < map.i.1 then do
               aux = map.i.1
               map.i.1 = map.i.2
               map.i.2 = aux
            end
            when map.i.3 < map.i.2 then do
               aux = map.i.2
               map.i.2 = map.i.3
               map.i.3 = aux
            end
            otherwise say 'ERROR'
         end
      end
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day2_Input.txt'

   cc = 0
   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc = cc+1
      parse var line map.cc.1'x'map.cc.2'x'map.cc.3
   end
   call lineout input_file
   map.0 = cc

   /* do i = 1 to map.0
      say map.i.1 map.i.2 map.i.3
   end */
return