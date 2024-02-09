/* rexx 2023 Day 16 Part1 */
call leer_fichero
a = 1
b = 0
/* cc=0 */
viene_de = 'LEFT'
queue '1 0 LEFT'
do while queued() > 0 
   call process
   /* cc=cc+1 */
   /* if cc = 10000 then leave */
end
/* call display */
call calculate
say 'Tot:' Tot
exit

process: 
   parse pull a b viene_de  
   select
      when viene_de = 'LEFT' then b = b+1
      when viene_de = 'RIGHT' then b = b-1
      when viene_de = 'UP' then a = a+1
      when viene_de = 'DOWN' then a = a-1
      otherwise say 'ERROR1' viene_de
   end

   ener.a.b = '#'

   temp = a || viene_de || b
   if cache.temp = 'si' then return

   if b < 1 | b > cols | a < 1 | a > rows then return
    
      select
         when viene_de = 'LEFT'  then do
            select
               when map.a.b = '.' then do
                  viene_de = 'LEFT'
                  queue a b viene_de
               end
               when map.a.b = '-' then do
                  viene_de = 'LEFT'
                  queue a b viene_de
               end
               when map.a.b = '/' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'DOWN'
                  queue a b viene_de
               end
               when map.a.b = '\' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'UP'
                  queue a b viene_de
               end
               when map.a.b = '|' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'UP'
                  queue a b viene_de
                  viene_de = 'DOWN'
                  queue a b viene_de
               end
               otherwise say 'ERROR' a b 
            end
         end
         when viene_de = 'RIGHT' then do
            select
               when map.a.b = '.' then do
                  viene_de = 'RIGHT'
                  queue a b viene_de
               end
               when map.a.b = '-' then do
                  viene_de = 'RIGHT'
                  queue a b viene_de
               end
               when map.a.b = '/' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'UP'
                  queue a b viene_de
               end
               when map.a.b = '\' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'DOWN'
                  queue a b viene_de
               end
               when map.a.b = '|' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'UP'
                  queue a b viene_de
                  viene_de = 'DOWN'
                  queue a b viene_de
               end
               otherwise say 'ERROR' a b 
            end
         end
         when viene_de = 'UP' then do
            select
               when map.a.b = '.' then do
                  viene_de = 'UP'
                  queue a b viene_de
               end
               when map.a.b = '-' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'RIGHT'
                  queue a b viene_de
                  viene_de = 'LEFT'
                  queue a b viene_de
               end
               when map.a.b = '/' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'RIGHT'
                  queue a b viene_de
               end
               when map.a.b = '\' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'LEFT'
                  queue a b viene_de
               end
               when map.a.b = '|' then do
                  viene_de = 'UP'
                  queue a b viene_de
               end
               otherwise say 'ERROR' a b 
            end
         end
         when viene_de = 'DOWN' then do 
            select
               when map.a.b = '.' then do
                  viene_de = 'DOWN'
                  queue a b viene_de
               end
               when map.a.b = '-' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'LEFT'
                  queue a b viene_de
                  viene_de = 'RIGHT'
                  queue a b viene_de
               end
               when map.a.b = '/' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'LEFT'
                  queue a b viene_de
               end
               when map.a.b = '\' then do
                  temp = a || viene_de || b ; cache.temp = 'si'
                  viene_de = 'RIGHT'
                  queue a b viene_de
               end
               when map.a.b = '|' then do
                  viene_de = 'DOWN'
                  queue a b viene_de
               end
               otherwise say 'ERROR' a b 
            end
         end
         otherwise say 'ERROR' a b 
      end

return

calculate:
   Tot = 0
   do i = 1 to rows
      do j = 1 to cols
         if ener.i.j = '#' then Tot = Tot + 1
      end 
   end 
return

display:
   do i = 1 to rows
      kk = ''
      do j = 1 to cols
         kk = kk || ener.i.j
      end 
      say kk
   end
return

leer_fichero:
   input_file  = 'Day16_Input.txt'
   input_file  = 'temp.txt'

   cc = 0
   drop aux.
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc = cc+1
      aux.cc = line
   end
   call lineout input_file
   aux.0 = cc
   rows = aux.0
   drop map.
   cols = length(aux.1)
   do i = 1 to rows
      do j = 1 to cols
         map.i.j = substr(aux.i,j,1)
      end /* j */
   end /* i */
   ener. = '.'
   ener.0 = rows
return