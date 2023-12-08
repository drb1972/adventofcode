/* rexx - Advento of code Day 3 - 2023 */

call leer_fichero
call tabla_coordenadas
call dejar_solo_numeros
Tot = 0
call proceso
say 'Total = ' Tot
exit

proceso:

   do i = 1 to work.0 
      palabras = words(work.i)
      if palabras = 0 then iterate
      do j = 1 to palabras
         sumar = 'no'
         numero = word(work.i,j)
         digitos = length(numero)
         donde = wordindex(work.i,j)
         call buscar_izq 
         if sumar = 'si' then do
            Tot = Tot + numero
            iterate
         end /* if */
         call buscar_derecha
         if sumar = 'si' then do
            Tot = Tot + numero
            iterate
         end /* if */
         call buscar_arriba
         if sumar = 'si' then do
            Tot = Tot + numero
            iterate
         end /* if */
         call buscar_abajo
         if sumar = 'si' then do
            Tot = Tot + numero
            iterate
         end /* if */
      end /* do j */

   end /* do i */
return

buscar_izq:
   columna = donde - 1
   if special.i.columna = 'si' then sumar = 'si'
return

buscar_derecha:
   columna = donde + digitos
   if special.i.columna = 'si' then sumar = 'si'
return

buscar_arriba:
   columna = donde - 1
   fila = i - 1
   posiciones = columna + digitos + 1
   do k = columna to posiciones
      if special.fila.k = 'si' then sumar = 'si'
   end
return

buscar_abajo:
   columna = donde - 1
   fila = i + 1
   posiciones = columna + digitos + 1
   do k = columna to posiciones
      if special.fila.k = 'si' then sumar = 'si'
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
return

tabla_coordenadas:
/* meto en special.i.j donde hay caracteres especiales */
/* meto en chars. los caracteres especiales            */
   call copio_record_a_work
   drop special.
   drop chars.
   i_char = 0
   do i = 1 to work.0
      work.i = changestr(".",work.i," ")
      do j = 0 to 9
         work.i = changestr(j,work.i," ")
      end
      palabras = words(work.i)
      if palabras = 0 then iterate
      
      do j = 1 to palabras
         donde = wordindex(work.i,j)
         special.i.donde = 'si'
         i_char = i_char + 1
         chars.i_char = substr(work.i,donde,1)
      end
   end
   chars.0 = i_char

/* do i = 1 to 12
   do j = 1 to 12
      if special.i.j = 'si' then say special.i.j i j
   end
end */
return

leer_fichero:
   drop in.
   x = 0
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
      /* dxr  say work.i */
   end
   work.0 = record.0
return