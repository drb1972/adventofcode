/* rexx adventofcode 2023 06 Part 2 */
call leer_fichero
call proceso
say 'Cont_ini 'Cont_ini
say 'Cont_fin 'Cont_fin
say 'Tot 'Cont_fin - Cont_ini + 1
exit

proceso:
   do j = 1 to (Tiempo-1)
      time_rem = Tiempo-j 
      act_dist = j * (tiempo-j)
      if act_dist > Distancia then do 
         Cont_ini = j 
         leave
      end
   end
   do j = (Tiempo-1) to 1 by -1
      time_rem = Tiempo-j 
      act_dist = j * (tiempo-j)
      if act_dist > Distancia then do 
         Cont_fin = j 
         leave
      end
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day6P1_Input.txt'

   do while lines(input_file) \= 0
      line = linein(input_file)
      if pos('Time:',line) > 0 then parse var line 'Time:' time 
      if pos('Distance:',line) > 0 then parse var line 'Distance:' distance
      tiempo = space(time,0)  
      distancia = space(distance,0)
   end
   call lineout input_file
return

