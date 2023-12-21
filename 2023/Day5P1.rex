/* rexx - Advento of code Day 5-1 - 2023 */
NUMERIC DIGITS 12
call leer_fichero
drop resul.
do i = 1 to seeds.0
   seed = seeds.i 
   call proceso
   resul.i = seed
end

min = resul.1
do i = 2 to seeds.0
   if resul.i < min then min = resul.i 
end
say 'Min ' min
exit

proceso:
   do j = 1 to maps.0
      do k = 1 to maps.j.0
         /* say j'.'k maps.j.k */
         parse var maps.j.k A B C 
         A = strip(A)
         B = strip(B)
         C = strip(C)
         D = B + C 
         if D > seed <= B then do 
            seed = seed - B + A
            leave
         end         
      end
   end
   say seed
return

leer_fichero:
   drop seeds. records. map.
   cont = 0

   input_file  = 'temp.txt'
   input_file  = 'Day5P1_Input.txt'

   map_n = 0
   do while lines(input_file) \= 0
      aux = linein(input_file)
      select
         when aux = '' then iterate
         when pos('seeds: ',aux) > 0 then do
            parse var aux 'seeds: ' numbers
            x = words(numbers)
            do i = 1 to x
               seeds.i = word(numbers,i)
            end
            seeds.0 = x
         end
         otherwise do
            cont = cont + 1
            records.cont = aux
         end
      end /* select */
   end /* do while */

   records.0 = cont 

   mapas = 0
   do i = 1 to records.0
      if pos(':',records.i) > 0 then do 
         if mapas > 0 then maps.mapas.0 = r 
         mapas = mapas + 1
         r = 0
         iterate
      end
      r = r + 1
      maps.mapas.r = records.i 
   end 
   maps.mapas.0 = r
   maps.0 = mapas
return   
   
