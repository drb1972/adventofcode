/* rexx adventofcode 2023 06 Part 1 */

call leer_fichero

Tot = 1
do i = 1 to carreras
   Tiempo = stem.Time.i 
   Distancia = stem.Distance.i 
   call proceso
end
say 'Tot 'Tot

exit

proceso:
   Cont = 0
   do j = 1 to (Tiempo-1)
      time_rem = Tiempo-j 
      act_dist = j * (tiempo-j)
      if act_dist > Distancia then Cont = Cont+1 
   end
   Tot = Tot * Cont
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day6P1_Input.txt'

   drop stem.Time. stem.Distance
   do while lines(input_file) \= 0
      line = linein(input_file)
      parse var line kk ':' rest
      carreras = words(rest)
      do i = 1 to carreras
         command = 'stem.'||kk||'.'i  '= strip(word(rest,i))'
         interpret command 
      end
   end
   call lineout input_file
/* do i = 1 to carreras
   say stem.Time.i 
   say stem.Distance.i
end */
return

