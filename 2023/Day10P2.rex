/* rexx 2023 Day 10 Part2 */
call leer_fichero
Tot = 1
call proceso

/* call tiles */
/* call otro */

do i = 1 to dibujo.0
      reg = ''
      do j = 1 to l 
      reg = reg || dibujo.i.j
      if dibujo.i.j = '.' then Tot = Tot+1
   end
   say reg
end
say 'Tot:' a /* from pts */

pts = ''
do i = 1 to dibujo.0
      do j = 1 to l 
         if pos(dibujo.i.j,'LJ7F') > 0 then pts = pts || '('i','j'),'
   end
end
kkk = length(pts)-1
pts = substr(pts,1,kkk)
call pts

exit

pts:
   if pts='' then pts= '(3,4),(5,11),(12,8),(9,5),(5,6)'   /*Not specified?   Use default. */
   pts=space(pts,0); z=pts                                 /*elide extra blanks;  save pts.*/
   do n=1 until z=''                                       /*perform destructive parse on z*/
      parse var z '(' x.n ',' y.n ')' ',' z                 /*obtain X and Y coördinates    */
   end
   a=0
   Do i=1 To n-1
      j=i+1
      a=a+x.i*y.j-x.j*y.i
   End
   a=a+x.n*y.1-x.1*y.n
   a=abs(a)/2
   say 'polygon area of' n 'points:' pts 'is --->' a
return


otro:
   do i = 1 to dibujo.0
      sum = 0
      do j = 1 to l
         if pos(dibujo.i.j,'|LJ7FS') > 0 then sum = sum+1
         if sum = 0 then do 
            dibujo.i.j = 'O'
            iterate
         end
         if dibujo.i.j = '.' & sum//2 = 0 then dibujo.i.j = 'O'
      end
   end
return

tiles:
/* barrido izq der */
   do i = 1 to dibujo.0
      do j = 1 to l 
         if pos(dibujo.i.j,'|-LJ7FS') = 0 then dibujo.i.j = 'O'
         else leave
      end /* do j */
   end /* do i */

/* barrido der izq */
   do i = 1 to dibujo.0
      do j = l to 1 by -1 
         if pos(dibujo.i.j,'|-LJ7FS') = 0 then dibujo.i.j = 'O'
         else leave
      end /* do j */
   end /* do i */

/* barrido arr aba */
   do j = 1 to l 
      do i = 1 to dibujo.0
         if pos(dibujo.i.j,'|-LJ7FS') > 0 then leave
         else dibujo.i.j = 'O'
      end /* do i */
   end /* do j */

/* barrido arr aba */
   do j = 1 to l 
      do i = dibujo.0 to 1 by -1
         if pos(dibujo.i.j,'|-LJ7FS') > 0 then leave
         else dibujo.i.j = 'O'
      end /* do i */
   end /* do j */

   do until hay = false
      hay = false
      do i = 1 to dibujo.0
         do j = 1 to l
            if dibujo.i.j = '.' then do   
               call check
            end
         end
      end 
   end 
return

check:
   a11 = i-1
   a12 = j-1
   a21 = i-1
   a22 = j
   a31 = i-1
   a32 = j+1
   m11 = i
   m12 = j-1
   m31 = i
   m32 = j+1
   b11 = i+1
   b12 = j-1 
   b21 = i+1
   b22 = j
   b31 = i+1
   b32 = j+1
   if dibujo.a11.a12 = 'O' | ,
      dibujo.a21.a22 = 'O' | ,
      dibujo.a31.a32 = 'O' | ,
      dibujo.m11.m12 = 'O' | ,
      dibujo.m31.m32 = 'O' | ,
      dibujo.b11.b12 = 'O' | ,
      dibujo.b21.b22 = 'O' | ,
      dibujo.b31.b32 = 'O' then do 
         dibujo.i.j = 'O'
         hay = True
   end
return

proceso:
   ant.0 = b||a
   do forever
      if step.b.a = 'S' then do 
         dibujo.b.a = step.b.a
         b = b+1 /* starting point */ 
      end
      dd = Tot
      ant.dd = b || a 
      Tot = Tot+1
      dd = dd-1
      dibujo.b.a = step.b.a
      select
         when step.b.a = '|' then do
            cc = b-1
            if cc || a \= ant.dd then b = cc
            else b = b+1
         end
         when step.b.a = '-' then do
            cc = a-1
            if b || cc \= ant.dd then a = cc
            else a = a+1
         end
         when step.b.a = 'L' then do
            cc = b-1
            if cc || a \= ant.dd then b = cc
            else a = a+1
         end
         when step.b.a = 'J' then do
            cc = b-1
            if cc || a \= ant.dd then b = cc
            else a = a-1
         end
         when step.b.a = '7' then do
            cc = a-1
            if b || cc \= ant.dd then a = cc
            else b = b+1
         end
         when step.b.a = 'F' then do
            cc = b+1
            if cc || a \= ant.dd then b = cc
            else a = a+1
         end
         otherwise say 'ERROR'
      end
      if step.b.a = 'S' then leave
   end
return

leer_fichero:
   input_file  = 'temp.txt'
   input_file  = 'Day10_Input.txt'
   cc = 0
   drop map.
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc = cc+1
      map.cc = line
   end
   call lineout input_file
   map.0 = cc
   drop steps.
   l = length(map.1)
   do i = 1 to map.0
      do j = 1 to l
         step.i.j = substr(map.i,j,1)
         if step.i.j = 'S' then do 
            a = j ; b = i 
         end
         dibujo.i.j = '.'
      end /* j */
   end /* i */
   dibujo.0 = map.0
return