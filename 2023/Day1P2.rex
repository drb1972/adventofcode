/* rexx - Advento of code Day 1-2 - 2003 */

drop in.
x = 0
input_file  = 'Day1P1_Input.txt'

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
   caracteres = length(record)

   call buscar_prim_num
   call buscar_ulti_num

   left = prim_num
   pos_prim = pos_prim_num

   right = ulti_num
   pos_ulti = pos_ulti_num

   call definir

   call buscar_primer_numchar
   call buscar_ulti_numchar


   /* dxr  say 'primer = ' left  ' pos' pos_prim */
   /* dxr  say 'ulti   = ' right ' pos' pos_ulti */

   num = left || right
   tot = tot + num  
   /* dxr */ say 'tot = ' tot
end /* do i */
exit

buscar_primer_numchar:
   do j =  1 to 9
      pos = pos(numeros.j,record)
      if pos = 0 then iterate
      if pos < pos_prim then do
         left = j
         pos_prim = pos
      end /* if */
   end /* do */
return

buscar_ulti_numchar:
   do j =  1 to 9
      pos = lastpos(numeros.j,record)
      if pos = 0 then iterate
      if pos > pos_ulti then do
         right = j
         pos_ulti = pos
      end /* if */
   end /* do */
return

buscar_prim_num:
   do j = 1 to caracteres
      char = substr(record,j,1)
      do l = 0 to 9
         if l = char then do
            prim_num = char
            pos_prim_num = j
            return
         end /* if */
      end /* do l */
   end /* do j */
return

buscar_ulti_num:
   do j = caracteres to 1 by -1
      char = substr(record,j,1)
      do l = 0 to 9
         if l = char then do
            ulti_num = char
            pos_ulti_num = j
            return
         end /* if */
      end /* do l */
   end /* do j */
return 

definir:
   drop numeros.
   numeros.1 = 'one' 
   numeros.2 = 'two'
   numeros.3 = 'three'
   numeros.4 = 'four'
   numeros.5 = 'five'
   numeros.6 = 'six'
   numeros.7 = 'seven'
   numeros.8 = 'eight' 
   numeros.9 = 'nine'
   numeros.0 = '9'
return