/* rexx 2023 Day 13 Part1 */
call leer_fichero
Tot = 0
do j = 1 to mirrors.0
   SubTot = 0
   search = 'hor'
   call process
   if check = 'false' then do 
      call switch
      search = 'ver'
      call process
   end
   say 'ignorar.'|| j '=' i || search
   Tot = Tot+SubTot
end /*do j */

/* do j = 1 to mirrors.0
   say ' '
   do i = 1 to mirrors.j.0
      say mirrors.j.i 
   end
end   */

say 'Tot:' Tot
exit

process:
/* say 'search:' search */
   fin = mirrors.j.0 - 1
   do i = 1 to fin
      check = 'false'
      k = i+1
      /* say mirrors.j.i mirrors.j.k  */
      if mirrors.j.i = mirrors.j.k then do
         /* say ' ' */
         /* say entra */
         call check_true
         /* say 'check:' check
         say ' ' */
      end
      /* say 'check search i:' check search i */
      if check = 'true' & search = 'hor' then SubTot = i * 100
      if check = 'true' & search = 'ver' then SubTot = i 
      /* say 'SubTot:' SubTot */
      if check = 'true' then do 
         say 'j i sub:'j i search SubTot
         return
      end
   end
return

check_true:
   ii = i
   kk = k 
   do forever 
      ii = ii+1
      kk = kk-1
      if mirrors.j.ii \= mirrors.j.kk then return
      if ii = mirrors.j.0 | kk = 1 then do
         check = 'true'
         return
      end
   end
return

switch:
   search = 'ver'
   aux. = ''
   rows = mirrors.j.0
   cols = length(mirrors.j.1)

   do i = 1 to rows
      do k = 1 to cols 
         aux.k = aux.k || substr(mirrors.j.i,k,1)
      end
   end 
   mirrors.j.0 = cols
   do i = 1 to cols
      mirrors.j.i = aux.i
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day13_Input.txt'
   drop mirrors.
   i = 0
   j = 1
   max_len = 0
   drop aux1.
   do while lines(input_file) \= 0
      line = linein(input_file)
      if line = '' then do
         mirrors.j.0 = i 
         i = 0
         j = j+1
         iterate
      end
      i = i+1
      mirrors.j.i = line
   end
   call lineout input_file
   mirrors.j.0 = i 
   mirrors.0 = j
   /* say mirrors.0 */

/* do j = 1 to mirrors.0
   say ' '
   do i = 1 to mirrors.j.0
      say mirrors.j.i 
   end
end  */

return