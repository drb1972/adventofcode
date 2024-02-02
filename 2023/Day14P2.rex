/* rexx 2023 Day 14 Part1 */
NUMERIC DIGITS 18
call leer_fichero
aux2. = mirrors.
drop cache.
xx = 0
do until salir = 'yes'
   salir = 'no'
   call cycle
   call create_long_reg   
   xx = xx+1
   cache.xx = long_rec
   cache.0 = xx
   if xx = 1 then do 
      /* say 'Num:' xx 'Rec:' long_rec */
      iterate
   end
   /* say 'Num:' xx 'Rec:' long_rec */
   do yy = 1 to (xx-1)
      say 'Comparando actual:' xx 'con:' yy
      if cache.yy = long_rec then do
         salir = 'yes'
         leave
      end
   end
end
tramo = xx - yy
say 'tramo:' tramo
resto = (1000000000 - xx)// tramo
say 'resto:' resto
ciclos = yy + resto /* tramo */

mirrors. = aux2.
say 'ciclos:' ciclos
do ciclos
   call cycle
end

Tot = 0
call calculate 
say 'Tot:' Tot
exit

create_long_reg:
   long_rec = ''
   do i = 1 to rows
      do j = 1 to cols
         long_rec = long_rec || mirrors.i.j
      end 
   end
return

calculate:
   do i = 1 to rows
      do j = 1 to cols
         if mirrors.i.j = 'O' then Tot = Tot + rows - i + 1
      end 
   end 
return

cycle: 
   do 4
      call all_up
      call turn_right
   end
return

all_up:
   set = 0
   do until set = 1
      set = 1
      do i = 2 to rows
         do j = 1 to cols
            k = i-1
            if mirrors.i.j = 'O' & mirrors.k.j = '.' then do
               mirrors.k.j = 'O'
               mirrors.i.j = '.'
               set = 0
            end    
         end 
      end 
   end
return

turn_right:
   drop aux.
   temp = rows
   do jj = 1 to cols 
      cc = 0
      do ii = rows to 1 by -1
         cc = cc+1
         aux.jj.cc = mirrors.ii.jj
      end
   end 
   Rows = Cols
   Cols = Temp
   mirrors. = aux.
return

display:
   do i = 1 to rows
      kk = ''
      do j = 1 to cols
         kk = kk || mirrors.i.j
      end 
      say kk
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day14_Input.txt'

   cc = 0
   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc = cc+1
      map.cc = line
   end
   call lineout input_file
   map.0 = cc
   rows = map.0
   drop mirrors.
   cols = length(map.1)
   do i = 1 to rows
      do j = 1 to cols
         mirrors.i.j = substr(map.i,j,1)
      end /* j */
   end /* i */
return