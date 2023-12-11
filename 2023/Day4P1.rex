/* rexx - Advento of code Day 4-1 - 2023 */
call leer_fichero
exit




leer_fichero:
   drop in.
   drop premios. numeros. 
   input_file  = 'Day4P1_Input.txt'
   input_file  = 'temp.txt'

   do while lines(input_file) \= 0
      aux = linein(input_file)
      parse var aux . ':' premios '|' numeros

      do i = 1 to words(premios)
         premios.i = word(premios,i)
      end
      premios.0 = i 

      do i = 1 to words(numeros)
         numeros.i = word(numeros,i)
         say numeros.i
      end
      numeros.0 = i  
   end
   call lineout input_file

cont = 0
sum  =  0
tot = 0

/* do i = 1 to premios.0
   do j = 1 to numeros.0
      if premio.i = numero.j then cont = cont+1   
   end
   if cont > 0 then do
      do cont
         say cont
      end
   end
end */
return



