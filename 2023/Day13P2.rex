/* rexx 2023 Day 13 Part2 */
call leer_fichero
Tot = 0
do j = 1 to mirrors.0
   say 'Espejo:' j
   SubTot = 0
   search = 'hor'
   call process
   if check = 'false' then do 
      call switch
      search = 'ver'
      call process
   end
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

   do mm = 1 to mirrors.j.0   
      orig = mirrors.j.mm 
      do ll = 1 to length(mirrors.j.mm)
         mirrors.j.mm = orig 
         if substr(mirrors.j.mm,ll,1) = '#' then mirrors.j.mm = overlay('.',mirrors.j.mm,ll)
         else mirrors.j.mm = overlay('#',mirrors.j.mm,ll)
         fin = mirrors.j.0 - 1
         do i = 1 to fin
            hola = upper(i || search)
            if ignorar.j = hola then do 
               /* say 'HOLA' j i */
               iterate
            end
            check = 'false'
            k = i+1
            /* say mirrors.j.i '   '   mirrors.j.k  */
            if mirrors.j.i = mirrors.j.k then do
               call check_true
            end
            if check = 'true' & search = 'hor' then SubTot = i * 100
            if check = 'true' & search = 'ver' then SubTot = i 
            if check = 'true' then do 
               /* say 'j i sub:'j i search SubTot  */
               return
            end
         end
      mirrors.j.mm = orig 
      end
   end

return

check_true:
   ii = i
   kk = k 
   do forever 
      ii = ii+1
      kk = kk-1
      /* say mirrors.j.ii '==' mirrors.j.kk  dxr */
      /* if mm = 2 then say '======> ' mirrors.j.ii '--' mirrors.j.kk */
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
   say 'j:' j
   /* say mirrors.0 */

/* do j = 1 to mirrors.0
   say ' '
   do i = 1 to mirrors.j.0
      say mirrors.j.i 
   end
end  */
/* ignorar.1 = 5ver
ignorar.2 = 4hor */

ignorar.1 = 6ver
ignorar.2 = 10hor
ignorar.3 = 16hor
ignorar.4 = 12ver
ignorar.5 = 1ver
ignorar.6 = 5hor
ignorar.7 = 8ver
ignorar.8 = 2hor
ignorar.9 = 1ver
ignorar.10 = 2hor
ignorar.11 = 12hor
ignorar.12 = 15ver
ignorar.13 = 12hor
ignorar.14 = 8hor
ignorar.15 = 1hor
ignorar.16 = 1hor
ignorar.17 = 12ver
ignorar.18 = 2hor
ignorar.19 = 14ver
ignorar.20 = 14ver
ignorar.21 = 1ver
ignorar.22 = 13hor
ignorar.23 = 10hor
ignorar.24 = 9hor
ignorar.25 = 1ver
ignorar.26 = 3hor
ignorar.27 = 5ver
ignorar.28 = 12ver
ignorar.29 = 16ver
ignorar.30 = 4ver
ignorar.31 = 2ver
ignorar.32 = 1ver
ignorar.33 = 5hor
ignorar.34 = 4hor
ignorar.35 = 3hor
ignorar.36 = 11hor
ignorar.37 = 1hor
ignorar.38 = 7ver
ignorar.39 = 14ver
ignorar.40 = 1hor
ignorar.41 = 3hor
ignorar.42 = 4hor
ignorar.43 = 5ver
ignorar.44 = 11hor
ignorar.45 = 4hor
ignorar.46 = 12hor
ignorar.47 = 13ver
ignorar.48 = 5ver
ignorar.49 = 3ver
ignorar.50 = 9hor
ignorar.51 = 3ver
ignorar.52 = 5ver
ignorar.53 = 9hor
ignorar.54 = 16hor
ignorar.55 = 12ver
ignorar.56 = 10ver
ignorar.57 = 3hor
ignorar.58 = 16hor
ignorar.59 = 8ver
ignorar.60 = 8ver
ignorar.61 = 4hor
ignorar.62 = 2ver
ignorar.63 = 13ver
ignorar.64 = 13hor
ignorar.65 = 11ver
ignorar.66 = 9hor
ignorar.67 = 12hor
ignorar.68 = 6hor
ignorar.69 = 5ver
ignorar.70 = 1ver
ignorar.71 = 2hor
ignorar.72 = 8ver
ignorar.73 = 1ver
ignorar.74 = 1hor
ignorar.75 = 4ver
ignorar.76 = 6hor
ignorar.77 = 1hor
ignorar.78 = 16hor
ignorar.79 = 8hor
ignorar.80 = 1hor
ignorar.81 = 1hor
ignorar.82 = 13ver
ignorar.83 = 13hor
ignorar.84 = 10ver
ignorar.85 = 5ver
ignorar.86 = 6hor
ignorar.87 = 1hor
ignorar.88 = 11hor
ignorar.89 = 9ver
ignorar.90 = 3hor
ignorar.91 = 11ver
ignorar.92 = 12ver
ignorar.93 = 5ver
ignorar.94 = 12hor
ignorar.95 = 2hor
ignorar.96 = 13ver
ignorar.97 = 1hor
ignorar.98 = 14hor
ignorar.99 = 5ver
ignorar.100 = 2ver

return