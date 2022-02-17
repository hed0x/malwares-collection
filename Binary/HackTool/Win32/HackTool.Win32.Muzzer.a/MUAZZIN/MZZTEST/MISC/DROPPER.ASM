.386p
.model flat

.data
db 512 dup("!")

.code

titulo db "Muazzin tester for Hybris",0
mensagem db "Este arquivo e o produto de um muazzin",0

extrn ExitProcess:PROC
extrn MessageBoxA:PROC

main:
push 0
push offset titulo
push offset mensagem
push 0
call MessageBoxA
push 0
call ExitProcess

end main
