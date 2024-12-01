/* rexx - Advent of code Day 1-1 - 2024 */
parse arg day type


/* read puzzle data in file. */
call read_input


/* parse 2 values into 2 stems */
drop left. right.
do i = 1 to file.0
   parse var file.i a b
   left.i=strip(a); 
   right.i=strip(b)   
end
left.0=file.0
right.0=file.0


/* sort both stems */
drop temp.
/* temp. = left. not working ?? */
do i = 1 to left.0
   temp.i=left.i
end
temp.0=left.0
call sort
do i = 1 to temp.0
   left.i=temp.i
end

drop temp.
/* temp. = right. not working ??*/
do i = 1 to right.0
   temp.i=right.i
end
temp.0=right.0
call sort
do i = 1 to temp.0
   right.i=temp.i
end


/* Find total distance */
tot=0
do i = 1 to left.0
   if right.i>left.i then do
      tot=tot+right.i-left.i
   end
   else do
      tot=tot+left.i-right.i
   end
end 

say 'Tot: 'tot

say 'time: 'time('E')
exit

read_input:
   path_to_data='/u/users/group/product/prod001/advent_of_code/2024/'
   data=path_to_data||'Day'||day||'_Input'
   if type='t' then data=data||'_Test.txt'
   else data=data||'.txt'

   cmd = "cat "||""||data||""
   say cmd
   RRC=bpxwunix(cmd,,file.,err.) 
return

sort:
   do i=1 to (temp.0)-1
      do j=1 to (temp.0)-1
         next=j+1
   /* if an element is greater than the next one higher,
   interchange them */
         if temp.j > temp.next then do
               temp = temp.j
               temp.j = temp.next
               temp.next = temp
         end 
      end j
   end i
return
