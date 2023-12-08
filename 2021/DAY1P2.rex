/* rexx */
"alloc da('RODDI01.ADVENTO.D1.DATA') fi(sonar) shr reu"
"execio * diskr sonar(finis stem sonar."
"free fi(sonar)"
x = sonar.0 - sonar.0//3
drop newsonar.
c = 0
do i = 1 to x
   j = i + 1
   k = j + 1
   c = c + 1
   newsonar.c = sonar.i + sonar.j + sonar.k
end

increased = 0
do i = 2 to c
   j = i-1
   if newsonar.i > newsonar.j then increased = increased + 1
end

say 'increased = 'increased
exit