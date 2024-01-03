/* rexx 2023 Day 8 Part2 */
NUMERIC DIGITS 18
call leer_fichero
Tot = ''
do j = 1 to var.0 
   num = 0
   call proceso
   Tot = strip(Tot num) 
end

say 'Tot: ' Tot

num = 1
do i = 1 to words(Tot)
   call lcm(num word(Tot,i))
end
exit

proceso:
   do forever
      do i = 1 to length(directions)
         num = num + 1
         LR = substr(directions,i,1)
         temp = var.j
         dir = stem.temp.LR
         var.j = dir
         if substr(dir,3,1) = 'Z' then return
      end /* do i */
   end /* do forever */
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day8_Input.txt'

   cc = 0
   do while lines(input_file) \= 0
      line = linein(input_file)
      select
         when line = ''then iterate
         when pos('=',line) = 0 then directions = line
         otherwise do
            parse var line A ' = (' B ', 'C')'
            stem.A.L = B
            stem.A.R = C 
            if substr(A,3,1) = 'A' then do
               cc = cc + 1
               var.cc = A
            end /* if */
         end
      end
   end
   var.0 = cc
   call lineout input_file
return

lcm:
   parse arg a b .

   if b = '' then call usagemsg

   if \ datatype( a, 'Whole' ) then
   call usagemsg 'The 1st argument ('a') must be a positive whole number'

   if a < 1 then
   call usagemsg 'The 1st argument ('a') must be a positive whole number'

   if \ datatype( b, 'Whole' ) then
   call usagemsg 'The 1st argument ('||b||') must be a positive whole number'

   if b < 1 then
   call usagemsg 'The 1st argument ('||b||') must be a positive whole number'

   say ( a * b ) / gcd( a, b )
   num = ( a * b ) / gcd( a, b )

return

gcd : procedure
  parse arg a, b
  if b = 0 then return a
  return gcd( b, a // b )

usagemsg : procedure
  if arg(1) <> '' then do
    call lineout !, 'Note:' arg(1)
    call lineout !, ''
        end
  call lineout !, 'Usage:'
  call lineout !, ' r4 LCM n1 n2'
  exit 1