/* rexx - Advento of code Day 3 - 2023 */

call leer_fichero
call tabla_coordenadas
call dejar_solo_numeros
Tot = 0
call proceso
/* say 'Total = ' Tot  */
exit

proceso:

   do i = 1 to asterisco.0
      producto = 1
      parse var asterisco.i fila ',' columna
      fila = strip(fila)
      columna = strip(columna)
      contador = 0
      call buscar_candidato
      if candidatos > 1 then do
         call buscar_izq
         call buscar_derecha
      end



/* say 'cont 'contador
say 'num_i 'num_i
say 'num_d ' num_d */
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
   num_a = ''
   col = columna   
   fil = fila - 1

   aux = substr(numeros.fil,col,1)
   num_a = aux 

   do forever
      col = col-1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_a = aux || num_a 
      end
      else leave
   end

   do forever
      col = col+1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_a = num_a || aux
      end
      else leave
   end
return

buscar_arriba:
   num_b = ''
   col = columna   
   fil = fila + 1

   aux = substr(numeros.fil,col,1)
   num_b = aux 

   do forever
      col = col-1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_b = aux || num_b 
      end
      else leave
   end

   do forever
      col = col+1
      aux = substr(numeros.fil,col,1)
      if aux \= ' ' then do
         num_b = num_b || aux
      end
      else leave
   end
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
return

buscar_derecha:
   num_d = ''
   col = columna   
   do forever
      col = col + 1
      aux = substr(numeros.fila,col,1)
      if aux \= ' ' then do
         num_i = num_i || aux
      end
      else leave
   end
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
   input_file  = 'Day3P1_Input.txt'
   input_file  = 'temp.txt'

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
      /* dxr  say work.i */
   end
   work.0 = record.0
return