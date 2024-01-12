/* rexx 2023 Day 12 Part1 */
call leer_fichero
call mapeo
call set_bin_arrays
Tot = 0
call proceso
do i = 1 to map.0
   Tot = Tot + map.i.total
end
say 'Tot:' Tot
exit

proceso:
   do label label1 i = 1 to map.0
   say 'record:' i
      map.i.total = 0
      ll = map.i.head.len
      do label label2 j = 1 to bin.ll.0
         if countstr('#',bin.ll.j) <> map.i.tale.suma then iterate
         if words(changestr('.',bin.ll.j,' ')) <> words(map.i.tale) then iterate
         do k = 1 to map.i.head.len
            select
               when substr(map.i.head,k,1) = '?' then iterate
               when substr(map.i.head,k,1) = '.' then do
                  if substr(bin.ll.j,k,1) <> '.' then iterate label2 
               end
               when substr(map.i.head,k,1) = '#' then do
                  if substr(bin.ll.j,k,1) <> '#' then iterate label2 
               end
               otherwise say 'ERROR'
            end
         end 
         do k = 1 to words(map.i.tale)
            temp = copies('#',word(map.i.tale,k))
            if word(changestr('.',bin.ll.j,' '),k) <> temp then iterate label2
         end
         /* say bin.ll.j */
         map.i.total = map.i.total+1
      end /* do j */
      /* say map.i.total */
   end /* do i */
return

set_bin_arrays:
   drop bin.
   do j = 1 to max_len
      cc = 0
      do i = 1 to 2**j-1
         cc = cc+1
         bin.j.cc = right(X2B(D2X(i)),j,0)
         bin.j.cc = changestr('0',bin.j.cc,'.') 
         bin.j.cc = changestr('1',bin.j.cc,'#') 
      end
      bin.j.0 = cc
      say 'bin'j cc
   end
/* do i = 1 to bin.4.0
   say bin.4.i 
end */
return

mapeo:
   max_len = 0
   do i = 1 to aux1.0
      parse var aux1.i map.i.head ' ' map.i.tale 
      map.i.tale = changestr(',',map.i.tale,' ')   
      temp = 0
      do j = 1 to words(map.i.tale)
         temp = temp + word(map.i.tale,j)
      end  
      map.i.tale.suma = temp
      map.i.head.len = length(map.i.head)
      if map.i.head.len > max_len then max_len = map.i.head.len
   end
   map.0 = i-1
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day12_Input.txt'

   drop map.
   i = 0
   max_len = 0
   drop aux1.
   do while lines(input_file) \= 0
      line = linein(input_file)
      i = i+1
      aux1.i = line
   end
   call lineout input_file
   aux1.0 = i
return