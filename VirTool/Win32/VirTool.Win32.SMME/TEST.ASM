extrn _mme_: Proc
extrn _A_: Proc
extrn _B_: Proc
;; extrn MessageBoxA: proc
.386p
.model flat
.data
  db ?
.code
start:
      lea  esi, _exit
      mov  ecx, len_exit
      lea  edi, buffer
      push ebp
      lea  eax, buffer ; start ip
      call _mme_
      pop  ebp
      jmp  buffer  ; exit
_exit:
    db 1000 dup (90h)
    ret
len_exit = 1001
buffer:
    db 3000 dup (00h)
end start
