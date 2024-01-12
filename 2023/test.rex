/* rexx */


set_bin_arrays:
   drop lap.
   do lap = 1 to max_broken
      cc = 0
      do i = 1 to 2**lap-1
         cc = cc+1
         lap.i.cc = right(X2B(D2X(i)),lap,0)
      end
      lap.i.0 = cc
   end
return
