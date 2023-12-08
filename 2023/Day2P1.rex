/* rexx - Advento of code Day 2 - 2023 */

drop in.
x = 0
input_file  = 'Day2P1_Input.txt'
do while lines(input_file) \= 0
   x = x+1
   in.x = linein(input_file)
end
in.0 = x

call lineout input_file
/*-------------------------*/

tot = 0
do i = 1 to in.0
   record = in.i
   call divide_record
   call divide_tiradas
   call quita_comas
   call proceso
   tot = tot + id
end
say 'Total = ' tot

exit

divide_record:
   parse var record "Game " id ":" rest 
   tiradas = countstr(";",rest)
return

divide_tiradas:
   drop tirada.
   do j = 1 to tiradas
      parse var rest tirada ";" rest
      tirada.j = tirada
   end
   tirada.j = rest /* j sale con una iteracion del bucle */
   tirada.0 = j
return

quita_comas:
   do j = 1 to tirada.0
      tirada.j = changestr(",",tirada.j,"")
   end
return

proceso:
   do j = 1 to tirada.0
      azul  = 0
      rojo  = 0
      verde = 0

      hay_azul = wordpos('blue',tirada.j)
      if hay_azul > 0 then do
         azul = azul + word(tirada.j, hay_azul - 1)
         if azul > 14 then do
            id = 0
            return
         end
      end /* if */
      hay_rojo = wordpos('red',tirada.j)
      if hay_rojo > 0 then do
         rojo = rojo + word(tirada.j, hay_rojo - 1)
         if rojo > 12 then do
            id = 0
            return
         end
      end /* if */
      hay_verde = wordpos('green',tirada.j)
      if hay_verde > 0 then do
         verde = verde + word(tirada.j, hay_verde - 1)
         if verde > 13 then do
            id = 0
            return
         end
      end /* if */
   end
return