/* Entran por la izq */
do a = 1 to rows
   b = 0
   drop cache.
   ener. = '.'
   ener.0 = rows
   viene_de = 'LEFT'
   queue a b viene_de
   do while queued() > 0 
      call process
   end
   /* call display */
   call calculate
   if SubTot > Tot then Tot = SubTot
end

/* Entran por arriba */
do b = 1 to cols
   a = 0
   drop cache.
   ener. = '.'
   ener.0 = rows
   viene_de = 'UP'
   queue a b viene_de
   do while queued() > 0 
      call process
   end
   /* call display */
   call calculate
   if SubTot > Tot then Tot = SubTot
end

/* Entran por la der */
do a = 1 to rows
   b = cols+1
   drop cache.
   ener. = '.'
   ener.0 = rows
   viene_de = 'RIGHT'
   queue a b viene_de
   do while queued() > 0 
      call process
   end
   /* call display */
   call calculate
   if SubTot > Tot then Tot = SubTot
end

/* Entran por abajo */
do b = 1 to cols
   a = rows+1
   drop cache.
   ener. = '.'
   ener.0 = rows
   viene_de = 'DOWN'
   queue a b viene_de
   do while queued() > 0 
      call process
   end
   /* call display */
   call calculate
   if SubTot > Tot then Tot = SubTot
end