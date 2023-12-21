/* rexx */
input_file  = 'temp.txt'
do while lines(input_file) \= 0
   line = linein(input_file)
end
call lineout input_file
sube = COUNTSTR("(",line) 
baja = COUNTSTR(")",line) 
say 'sube 'sube
say 'baja 'baja
say 'Tot ' sube - baja
exit