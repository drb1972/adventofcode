/* rexx 2023 Day 15 Part1 */
NUMERIC DIGITS 18
call leer_fichero
numeros = '123456789'
box.  = ''
box.0 = 256
say 'map.0' map.0
do i = 1 to map.0
   SubTot = 0
   call proceso
end

Tot = 0
do i = 1 to box.0
   if box.i = '' then iterate
   /* say dxr box.i  */
   cc = 0
   do j = 1 to length(box.i)
      num = substr(box.i,j,1)
      if verify(num,numeros) = 0 then do
         cc = cc+1
         Tot = Tot + (i * cc * num)
         /* say i cc num */
      end  
   end

end
say 'Tot:' Tot
exit

proceso:
   l = length(map.i)
   code = ''
   do j = 1 to l
      char = substr(map.i,j,1)
      select 
         when char <> '=' & char <> '-' then do 
            xx = char~c2d
            SubTot = ((SubTot + xx) * 17)//256
         end
         when char = '-' then do
            SubTot = SubTot+1
            if box.SubTot = '' then return
            code = '@'||code||'@'
            donde = pos(code,box.SubTot)
            if donde = 0 then return
            l1 = length(code) + 1
            box.SubTot = overlay(' ',box.SubTot,donde,l1)
         end
         when char = '=' then do
            SubTot = SubTot+1
            code = '@'||code||'@'
            num = substr(map.i,j+1,1)
            donde = pos(code,box.SubTot)
            l1 = length(code) + 1
            if donde = 0 then box.SubTot = box.SubTot || code || num
            else do
               box.SubTot = overlay(code||num,box.SubTot,donde,l1)
            end
         end
         otherwise say 'ERROR'
      end
      code = code || char
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day15_Input.txt'

   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
   end
   call lineout input_file
   input = changestr(',',line,' ')
   drop map.
   map.0 = words(input)
   do i = 1 to map.0
      map.i = word(input,i)
       /* say map.i  */
   end
return