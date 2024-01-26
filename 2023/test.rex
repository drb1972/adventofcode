/* Calculate Fibonacci using recursion */
tinit = time(s)
numbers = ''
cache. = ''
do n = 1 to 34
  numbers = numbers fibonacci(n)","
  numeros = changestr(",",numbers," ")
  ult = words(numeros)
  cache.n = word(numeros,ult)
end

do n = 1 to 4
  say 'Cache:' n cache.n 
end

tend  = time(s)
time = tend - tinit
say numbers"..."
say ' Time:' time 's.'
exit

  fibonacci: procedure
    parse arg n .
    if cache.n \= '' then return cache.n  
    if n < 3 then n = 1
    else do 
      n = fibonacci(n-1) + fibonacci(n-2)
    end
  return n