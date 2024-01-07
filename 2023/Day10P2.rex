/* rexx 2023 Day 10 Part1 */
call leer_fichero
Tot = 1
call proceso
say 'Tot: 'Tot / 2
exit

proceso:
   ant.0 = b||a
   do forever
      if step.b.a = 'S' then b = b+1 /* starting point */ 
      dd = Tot
      ant.dd = b || a 
      Tot = Tot+1
      dd = dd-1
      select
         when step.b.a = '|' then do
         say 'Entra en |' ant.dd b||a 
            cc = b-1
            if cc || a \= ant.dd then b = cc
            else b = b+1
         end
         when step.b.a = '-' then do
         say 'Entra en -' ant.dd b||a 
            cc = a-1
            if b || cc \= ant.dd then a = cc
            else a = a+1
         end
         when step.b.a = 'L' then do
         say 'Entra en L' ant.dd b||a 
            cc = b-1
            if cc || a \= ant.dd then b = cc
            else a = a+1
         end
         when step.b.a = 'J' then do
         say 'Entra en J' ant.dd b||a 
            cc = b-1
            if cc || a \= ant.dd then b = cc
            else a = a-1
         end
         when step.b.a = '7' then do
         say 'Entra en 7' ant.dd b||a 
            cc = a-1
            if b || cc \= ant.dd then a = cc
            else b = b+1
         end
         when step.b.a = 'F' then do
         say 'Entra en F' ant.dd b||a 
            cc = b+1
            if cc || a \= ant.dd then b = cc
            else a = a+1
         end
         otherwise say 'ERROR'
      end
      if step.b.a = 'S' then leave
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day10_Input.txt'
   cc = 0
   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc = cc+1
      map.cc = line
   end
   call lineout input_file
   map.0 = cc
   drop steps.
   l = length(map.1)
   do i = 1 to map.0
      do j = 1 to l
         step.i.j = substr(map.i,j,1)
         if step.i.j = 'S' then do 
            a = j ; b = i 
         end
      end /* j */
   end /* i */
return