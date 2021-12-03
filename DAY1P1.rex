/* rexx */
"alloc da('RODDI01.ADVENTO.D1.DATA') fi(sonar) shr reu"
"execio * diskr sonar(finis stem sonar."
increased = 0
do 2 to sonar.0
   j = i-1
   if sonar.i > sonar.j then increased = increased + 1
end
"free fi(sonar)"
say 'increased = 'increased
exit