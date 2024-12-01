/* rexx 
args:
  day: int (1-25)
  part: int (1/2)
  type: t/p (test-prod)

rexx rexxex.rex 1 1 p

zowe tso issue cmd "ex 'ds(mem)' 'day part type'" --ssm

*/
parse arg day part type
call check_parse(day,part,type)

path_to_data='/u/users/group/product/prod001/advent_of_code/2024/'
data=path_to_data||'Day'||day||'Input'
if type='t' then data=data||'_Test.txt'
else data=data||'.txt'
rexxdsn='PROD001.LIB.ADV2024'
rexxfile=rexxdsn||'(Day'||day||'P'||part||')'
/* say 'data= 'data
say 'rexxfile= 'rexxfile */

'zowe files ul ftds "Day'||day||'P'||part||'.rex" "'rexxfile'"' 
'zowe tso issue cmd "ex '''rexxfile''' '''day type'''" --ssm'


Exit

check_parse:
   message=''
   if day ='' | day < 1 | day > 25 Then message='Day between 1 and 25'
   if part='' | part < 1 | part > 2 Then message='Part 1 or 2'
   if type='' Then message='Type must be t or p'
   if type ='t' | type ='p' Then nop
   else message='Type must be t or p' 

   if message<>'' then do 
      say message
      exit
   end
return