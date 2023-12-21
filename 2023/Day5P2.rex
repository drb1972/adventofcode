/* rexx - Advento of code Day 5-1 - 2023 */
NUMERIC DIGITS 12
call leer_fichero
call extend_seeds 
call proceso

min = menor.1
do i = 2 to mm
   if menor.i < min then min = menor.i 
end
say 'Min ' min 
do i = 1 to mm
say menor.i 
end
exit

proceso:
   drop menor.
   mm = 0
   i = 0
   do forever
      i = i + 1
      parse var seeds.i num range loopmap
      num = strip(num)
      range = strip(range)
      max = num + (range - 1)
      do j = loopmap to maps.0
         do k = 1 to maps.j.0
            parse var maps.j.k A B C 
            A = strip(A)
            B = strip(B)
            C = strip(C)
            D = B + C - 1
            select 
               when max < B then do 
                  /* say 'Mapa-'||j 'Entra por opcion 1 ' num  */
                  iterate 
               end
               when num > D then do
                  /* say 'Mapa-'||j 'Entra por opcion 2' num */
                  iterate 
               end
               when num >= B & max <= D then do
                  /* say 'Mapa-'||j 'Entra por opcion 3' num */
                  num = num - B + A 
                  max = num + range - 1  
                  leave   
               end
               when num < B & max >= B & max <= D then do
                  /* say 'Mapa-'||j 'Entra por opcion 4' num  */
                  new = seeds.0 + 1
                  seeds.new = num (B - num) j
                  seeds.0 = new

                  num = B 
                  max = max 

                  num = num - B + A 
                  max = max - B + A
                  leave
               end
               when D >= num & num >= B & max > D then do
                  /* say 'Mapa-'||j 'Entra por opcion 5' num  */
                  new = seeds.0 + 1
                  seeds.new = (D + 1) (max - D) j
                  seeds.0 = new                  

                  num = num          
                  max = D  

                  num = num - B + A 
                  max = max - B + A
                  leave
               end
               when num < B & max > D then do
                  /* say 'Mapa-'||j 'Entra por opcion 6' num  */
                  new = seeds.0 + 1
                  seeds.new = num (B - num) j
                  seeds.0 = new

                  new = seeds.0 + 1
                  seeds.new = (D + 1) (max - D) j
                  seeds.0 = new  

                  num = B 
                  max = D 
                  num = num - B + A 
                  max = max - B - A
                  leave
               end
               otherwise say 'Mapa-'||j 'ERROR' 
            end
         end k
      end j 
      mm = mm + 1
      menor.mm = num 
      if i = seeds.0 then leave
   end 
return



extend_seeds:
   drop seeds_range.
   cc = 0
   do i = 1 to seeds.0 by 2
      j = i + 1
      cc = cc + 1
      seeds.cc = seeds.i seeds.j '1'
   end
   seeds.0 = cc
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