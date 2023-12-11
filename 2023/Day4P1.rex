/* rexx - Advento of code Day 4-1 - 2023 */
call leer_fichero
Tot = 0
call proceso
say 'Total = ' Tot
exit

proceso:
say 'records ' records
   do k = 1 to records
      premios = 0
      puntos  = 0
      do i = 1 to premios.k.0
         do j = 1 to numeros.k.0
            if premios.k.i = numeros.k.j then premios = premios + 1   
         end
      end 
      if premios > 0 then do
         do l = 1 to premios
            cc = k + l 
            cuantas.cc = cuantas.cc + (cuantas.k)
         end
      end
      Tot = Tot + cuantas.k
   end
return


leer_fichero:
   drop in.
   drop premios. numeros. cuantas.

   input_file  = 'temp.txt'
   input_file  = 'Day4P1_Input.txt'

   do while lines(input_file) \= 0
      aux = linein(input_file)
      parse var aux 'Card ' record ': ' premios ' | ' numeros
      record = strip(record)

      do i = 1 to words(premios)
         premios.record.i = word(premios,i)
         premios.record.0 = i
      end

      do i = 1 to words(numeros)
         numeros.record.i = word(numeros,i)
         numeros.record.0 = i  
      end
   end

   records = record
   cuantas. = 1
   cuantas.0 = records
   call lineout input_file

   /* do i = 1 to records
   kk = ''

      do j = 1 to premios.i.0
         kk = kk ' ' premios.i.j
      end
      kk = kk ' | '
      do k = 1 to numeros.i.0
         kk = kk ' ' numeros.i.k
      end
      say kk
   end */
return




