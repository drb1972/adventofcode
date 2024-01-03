/* rexx - Advento of code Day 3-2 - 2023 */

call leer_fichero
call tabla_coordenadas
call dejar_solo_numeros
Tot = 0
call proceso
say 'Total = ' Tot
exit

proceso:

   do i = 1 to asterisco.0
      parse var asterisco.i fila ',' columna
      fila = strip(fila)
      columna = strip(columna)
      contador = 0
      call buscar_candidato
      if candidatos > 1 then do
         hay = 0
         call buscar_izq
         call buscar_derecha
         call buscar_arriba
         call buscar_abajo
         if hay > 1 then do
            say 'fila 'fila 'col ' columna' num_i ' num_i 'num_d 'num_d 'num_a' num_a 'num_b' num_b 
            prod = strip(num_a * num_b * num_i * num_d)
            Tot = Tot + prod 
         end
      end
   end /* do i */
return

buscar_candidato:
   candidatos = 0
   do j = -1 to 1
      fil = fila + j
      do k = -1 to 1
         col = columna + k
         aux = substr(numeros.fil,col,1)
         if aux \= ' ' then candidatos = candidatos + 1
      end
   end
return

buscar_arriba:
   col = columna   
   fil = fila - 1
   num_a = substr(numeros.fil,col,1)

   do forever
      col = col-1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_a = aux || num_a 
      end
      else leave
   end

   col = columna
   do forever
      col = col+1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_a = num_a || aux
      end
      else leave
   end
   if words(num_a) = 1 then hay = hay + 1
   if words(num_a) = 2 then do
      num_a = word(num_a,1) * word(num_a,2)
      hay = hay + 2
   end
      if num_a = '' then num_a = '1'
return


buscar_abajo:
   col = columna   
   fil = fila + 1
   num_b = substr(numeros.fil,col,1)

   do forever
      col = col-1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_b = aux || num_b 
      end
      else leave
   end

   col = columna
   do forever
      col = col+1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_b = num_b || aux
      end
      else leave
   end

   if words(num_b) = 1 then hay = hay + 1
   if words(num_b) = 2 then do
      num_b = word(num_b,1) * word(num_b,2)
      hay = hay + 2
   end
   if num_b = '' then num_b = '1'
return

buscar_izq:
   num_i = ''
   col = columna   
   do forever
      col = col -1
      aux = substr(numeros.fila,col,1)
      if aux \= ' ' then do
         num_i = aux || num_i
      end
      else leave
   end
   if num_i = '' then num_i = '1'
   else hay = hay+1
return

buscar_derecha:
   num_d = ''
   col = columna   
   do forever
      col = col + 1
      aux = substr(numeros.fila,col,1)
      if aux \= ' ' then do
         num_d = num_d || aux
      end
      else leave
   end
   if num_d = '' then num_d = '1'
   else hay = hay+1
return

dejar_solo_numeros:
   call copio_record_a_work
   do i = 1 to work.0
      work.i = changestr(".",work.i," ")
      do j = 1 to chars.0
         work.i = changestr(chars.j,work.i," ")
      end
   end
   numeros. = work.
return

tabla_coordenadas:
/* meto en special.i.j donde hay caracteres especiales */
/* meto en chars. los caracteres especiales            */
   call copio_record_a_work
   drop special.
   drop chars.
   i_char = 0
   drop asterisco.
   i_ast  = 0
   do i = 1 to work.0
      work.i = changestr(".",work.i," ")
      do j = 0 to 9
         work.i = changestr(j,work.i," ")
      end
      palabras = words(work.i)
      if palabras = 0 then iterate
      
      do j = 1 to palabras
         donde = wordindex(work.i,j)
         if substr(work.i,donde,1) = '*' then do
            i_ast = i_ast + 1 
            asterisco.i_ast = i ',' donde
         end /* if */
         i_char = i_char + 1
         chars.i_char = substr(work.i,donde,1)
      end
   end
   asterisco.0 = i_ast
   chars.0 = i_char

return

leer_fichero:
   drop in.
   x = 0
   input_file  = 'temp.txt'
   input_file  = 'Day3P1_Input.txt'
 

   do while lines(input_file) \= 0
      x = x+1
      in.x = linein(input_file)
   end
   in.0 = x

   call lineout input_file

   len_rec = length(in.1)

/* añado puntos alrededor */

   drop record.
   x = 1
   record.x = copies('.',len_rec + 2)
   do i = 1 to in.0
      x = x+1
      record.x = '.' || in.i || '.'
   end
   x = x+1
   record.x = copies('.',len_rec + 2)
   record.0 = x
return

copio_record_a_work:
   drop work.
   do i = 1 to record.0
      work.i = record.i
   end
   work.0 = record.0
return