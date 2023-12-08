/* rexx */
"alloc da('RODDI01.ADVENTO.D1.DATA') fi(sonar) shr reu"
"execio * diskr sonar(finis stem sonar."
"free fi(sonar)"
hor = 0
ver = 0
do i = 1 to sonar.0
   parse var sonar.i v1 v2
   select
      when v1 = 'forward' then hor = hor + v2
      when v1 = 'down'    then ver = ver + v2
      when v1 = 'up'      then ver = ver - v2
      otherwise nop
   end
say 'hor = 'hor
say 'ver = 'ver 
total = hor * ver
say 'Total = 'Total
end /* do for */
exit