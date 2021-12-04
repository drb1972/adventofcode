/* rexx */
"alloc da('RODDI01.ADVENTO.D3.DATA') fi(sonar) shr reu"
"execio * diskr sonar(finis stem sonar."
"free fi(sonar)"
pos. = 0
pos.0 = 12
do i = 1 to sonar.0
   parse var sonar.i 1 b1 2 b2 3 b3 4 b4 5 b5 6 b6 , 
      7 b7 8 b8 9 b9 10 b10 11 b11 12 b12
   pos.1  = pos.1  + b1
   pos.2  = pos.2  + b2
   pos.3  = pos.3  + b3
   pos.4  = pos.4  + b4
   pos.5  = pos.5  + b5
   pos.6  = pos.6  + b6
   pos.7  = pos.7  + b7
   pos.8  = pos.8  + b8
   pos.9  = pos.9  + b9
   pos.10 = pos.10 + b10
   pos.11 = pos.11 + b11
   pos.12 = pos.12 + b12
end

mid = sonar.0 / 2

number1 = ''
do i = 1 to pos.0
   if pos.i > mid then number1 = number1 || '1'
   else number1 = number1 || '0'
end
hex = B2X(number1)
number1 = X2D(hex)

number2 = ''
do i = 1 to pos.0
   if pos.i > mid then number2 = number2 || '0'
   else number2 = number2 || '1'
end
hex = B2X(number2)
number2 = X2D(hex)

number = number1 * number2
say ' Number = 'number
exit
