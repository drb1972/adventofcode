/* rexx - Advent of code Day 3-2 - 2024 */
parse arg day type

/* read puzzle data in file. */
call read_input
/* string=file.1 */
string=''
do i = 1 to file.0
   string=string||file.i
end
string='do()'||string 
range=(0123456789)
rangeb=' '
tot=0

do forever
   pos=pos('mul(',string)
   if pos=0 then leave
   parse var string head 'mul(' a ',' b ')'  rest
   var_do =lastpos('do()',head)
   var_don=lastpos("don't(",head)
   if pos>var_do & pos>var_don then do
      select
         when var_do>var_don then sw=true
         when var_do<var_don then sw=false
         otherwise nop
      end
   end
   /* say pos var_do var_don sw */
   if sw=true & verify(a,range)=0 & verify(b,range)=0 & , 
      verify(a,rangeb)=1 & verify(b,rangeb)=1 ,
      then do 
         tot=tot+(a*b)
         /* say 'entra' a b */
      end
   start=pos('mul(',string)
   start=start+4
   string=substr(string,start)
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
