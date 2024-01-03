/* rexx 2023 Day 7 Part2 */
call init
call leer_fichero

do i = 1 to play.0
   call analizar_jugada
end 

/* arrays jugadas.x. */
do i = 1 to jugadas.0
   if jugadas.i.0 = 0 then iterate
   call ordenar 
end 

cont = 0
Tot  = 0
do i = 1 to jugadas.0
   do j = 1 to jugadas.i.0
      /* say i jugadas.i.j  */
      xx = jugadas.i.j
      cont = cont + 1
      Tot = Tot + (cont * play.xx)
      say i xx play.xx tot
   end
end
say 'Cont=' Cont
say 'Tot =' Tot

exit

ordenar:
/* do j = 1 to jugadas.i.0
   say jugadas.i.j
end */

/* Sort stem list. with all the members (old and new)  */
   Do k = jugadas.i.0 To 1 By -1 Until flip_flop = 1
      flip_flop = 1
      Do j = 2 To k
         m = j - 1
         Do l = 1 to 5
            x = pos(substr(jugadas.i.m,l,1),valor)
            y = pos(substr(jugadas.i.j,l,1),valor)
            if x < y | x > y then leave
         end

         If x < y Then Do
            xchg   = jugadas.i.m
            jugadas.i.m = jugadas.i.j
            jugadas.i.j = xchg
            flip_flop = 0
         End 
      End /* Do j = 2 */
   End /* Do i = stem.0 */

return

analizar_jugada:
   temp = ''
   do j = 1 to valor.0
      temp = temp || countstr(valor.j,play.i)
   end /* do j */
   temp = changestr('0',temp,'')
   temp = changestr('1',temp,'')
   joker = ''
   joker = countstr('J',play.i)
   /* repoker    = 7
      poker      = 6
      full       = 5
      trio       = 4
      dobles     = 3
      pareja     = 2
      carta_alta = 1 */
   select
      when joker = '5' then jugada = 7
      when temp = ''   then do
         select
            when joker = 4 then jugada = 7
            when joker = 3 then jugada = 6
            when joker = 2 then jugada = 4
            when joker = 1 then jugada = 2
            otherwise jugada = 1
         end         
      end
      when temp = '2'  then do
         select
               when joker = 3 then jugada = 7
               when joker = 2 then jugada = 6
               when joker = 1 then jugada = 4
               otherwise jugada = 2
         end
      end
      when temp = '22' then do
         select
            when joker = 1 then jugada = 5
            otherwise jugada = 3
         end
      end
      when temp = '3'  then do
         select
            when joker = 2 then jugada = 7
            when joker = 1 then jugada = 6
            otherwise jugada = 4
         end
      end
      when temp = '23' | temp = '32' then jugada = 5
      when temp = '4'  then do
         select
            when joker = 1 then jugada = 7
            otherwise jugada = 6
         end
      end
      when temp = '5'  then jugada = 7
      otherwise say 'ERROR'
   end
   cc = jugadas.jugada.0
   cc = cc + 1 
   jugadas.jugada.cc = play.i
   jugadas.jugada.0  = cc
return

leer_fichero:
   cc = 0
   do while lines(input_file) \= 0
      bid = ''
      line = linein(input_file)
      cc = cc+1
      parse var line play.cc bid 
      temp = play.cc
      play.temp = bid 
   end
   play.0 = cc
   call lineout input_file
return

init:
   input_file  = 'temp.txt'
   input_file  = 'Day7P1_Input.txt'
   drop play. jugadas. valor.
   
   /* repoker    = 7
      poker      = 6
      full       = 5
      trio       = 4
      dobles     = 3
      pareja     = 2
      carta_alta = 1 */

   jugadas.0 = 7
   do i = 1 to jugadas.0
      jugadas.i.0 = 0
   end

   valor = 'A K Q T 9 8 7 6 5 4 3 2'
   valor.0   = words(valor)
   do i = 1 to valor.0
      valor.i = word(valor,i)
   end
   valor = 'AKQT98765432J'

return