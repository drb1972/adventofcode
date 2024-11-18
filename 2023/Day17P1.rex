/* rexx 2023 Day 17 Part1 */
call leer_fichero
call calcular_grid
call crear_grid

call crear_camino
/* call rellenar   */
call pintar_grid

exit


rellenar:
   do i = 1 to max_ver 
      if grid.i.1='#' then pintar=1
      else pintar=0
      do j=2 to max_hor
         k=j-1
         say 'grid 'i j grid.i.j 'pintar-'pintar
         select
            when grid.i.j='.' & pintar=1 then grid.i.j='#'
            when grid.i.j='#' & grid.i.k='#' & pintar=1 then nop
            when grid.i.j='#' & pintar=1 then pintar=0
            when grid.i.j='#' & pintar=0 then pintar=1
            otherwise nop
         end
      end
   end 
return

crear_camino:
   x=1 ; y=1
   grid.1.1='#'
   drop color.
   do i = 1 to cc
      select
         when dir.i = 'R' then do
            do num.i 
               y=y+1
               grid.x.y='#'
               color.x.y=rgb.i
            end
         end
         when dir.i = 'L' then do
            do num.i 
               y=y-1
               grid.x.y='#'
               color.x.y=rgb.i
            end
         end
         when dir.i = 'D' then do
            do num.i 
               x=x+1
               grid.x.y='#'
               color.x.y=rgb.i
            end
         end
         when dir.i = 'U' then do
            do num.i 
               x=x-1
               grid.x.y='#'
               color.x.y=rgb.i
            end
         end
         otherwise say error
      end
   end
return

pintar_grid:
say ''
   do i = 1 to max_ver
      linea=''
      do j = 1 to max_hor
         linea=linea||grid.i.j
      end
      say linea
   end
   say ''
return

crear_grid:
   drop grid.
   do i = 1 to max_ver
      do j=1 to max_hor
         grid.i.j='.'
      end
   end
return

calcular_grid:
/* calcula las dimensiones del grid */
   acum_hor=1; max_hor=1
   acum_ver=1; max_ver=1
   do i = 1 to cc
      select
         when dir.i = 'R' then acum_hor=acum_hor+num.i
         when dir.i = 'L' then acum_hor=acum_hor-num.i
         when dir.i = 'D' then acum_ver=acum_ver+num.i 
         when dir.i = 'U' then acum_ver=acum_ver-num.i
         otherwise 'say error'
      end
      if acum_hor>max_hor then max_hor=acum_hor
      if acum_ver>max_ver then max_ver=acum_ver
   end
   say 'max_hor: 'max_hor
   say 'max_ver: 'max_ver
return


leer_fichero:
   input_file  = 'Day17_Input.txt'
   input_file  = 'temp.txt'
      input_file  = 'Day17_Input.txt'
   cc = 0
   drop dir. ; drop num. ; drop rgb 
   do while lines(input_file) \= 0
      line = linein(input_file)
      cc=cc+1
      parse var line dir.cc num.cc rgb.cc
   end
   dir.0=cc 
   num.0=cc
   rgb.0=cc  
   call lineout input_file
return