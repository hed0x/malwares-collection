
pusho                   macro   lbl             ; kind of 'push offset lbl'
                        local   __tmp
                        call    __tmp
                        jmp     lbl
__tmp:                  endm


pusha_eax               =       (dword ptr 7*4)
pusha_ecx               =       (dword ptr 6*4)
pusha_edx               =       (dword ptr 5*4)
pusha_ebx               =       (dword ptr 4*4)
pusha_esp               =       (dword ptr 3*4)
pusha_ebp               =       (dword ptr 2*4)
pusha_esi               =       (dword ptr 1*4)
pusha_edi               =       (dword ptr 0*4)

popa_eax                =       (dword ptr 7*4)
popa_ecx                =       (dword ptr 6*4)
popa_edx                =       (dword ptr 5*4)
popa_ebx                =       (dword ptr 4*4)
popa_esp                =       (dword ptr 3*4)
popa_ebp                =       (dword ptr 2*4)
popa_esi                =       (dword ptr 1*4)
popa_edi                =       (dword ptr 0*4)


VxDcall                 macro   VxD, Service
                        db      0CDh
                        db      020h
                        dw      Service
                        dw      VxD
                        endm

VMMcall                 macro   Service
                        VxDcall VMM, Service
                        endm


VMM                     equ     0001h
Get_Config_Directory    equ     00B7h
Out_Debug_String        equ     00C2h
Get_System_Time         equ     003Fh
GetDDBList              equ     013Fh
PageQuery               equ     0134h
PageAllocate            equ     0053h
PageFree                equ     0055h
PAGEZEROINIT            equ     00000001h
PAGEFIXED               equ     00000008h
PG_SYS                  equ     1
PG_VM                   equ     0
PageModifyPermissions   equ     0133h
GetVxDName              equ     017Eh
PC_WRITEABLE            equ     00020000H
PC_USER                 equ     00040000H
PC_STATIC               equ     20000000H
Call_When_Idle          equ     003Ah
Get_System_Time         equ     003Fh
Hook_Device_Service     equ     0090h
Install_IO_Handler      equ     0096h
Get_DDB                 equ     0146h
IFSMGR                  equ     0040h
Get_Drive_Info          equ     0034h
Ring0GetDriveInfo       equ     0035h
InstallFileSystemApiHook equ    0067h
GetHeap                 equ     000Dh
UniToBCSPath            equ     0041h
IFSFN_OPEN              equ     36
IFSFN_RENAME            equ     37
IFSFN_FILEATTRIB        equ     33
Ring0_FileIO            equ     0032h
R0_OPENCREATFILE        equ     0D500h  ; Open/Create a file
R0_OPENCREAT_IN_CONTEXT equ     0D501h  ; Open/Create file in current context
R0_READFILE             equ     0D600h  ; Read a file, no context
R0_WRITEFILE            equ     0D601h  ; Write to a file, no context
R0_READFILE_IN_CONTEXT  equ     0D602h  ; Read a file, in thread context
R0_WRITEFILE_IN_CONTEXT equ     0D603h  ; Write to a file, in thread context
R0_CLOSEFILE            equ     0D700h  ; Close a file
R0_GETFILESIZE          equ     0D800h  ; Get size of a file
R0_FINDFIRSTFILE        equ     04E00h  ; Do a LFN FindFirst operation
R0_FINDNEXTFILE         equ     04F00h  ; Do a LFN FindNext operation
R0_FINDCLOSEFILE        equ     0DC00h  ; Do a LFN FindClose operation
R0_FILEATTRIBUTES       equ     04300h  ; Get/Set Attributes of a file
GET_ATTRIBUTES          equ     00h
SET_ATTRIBUTES          equ     01h
R0_RENAMEFILE           equ     05600h  ; Rename a file
R0_DELETEFILE           equ     04100h  ; Delete a file
R0_LOCKFILE             equ     05C00h  ; Lock/Unlock a region in a file
R0_GETDISKFREESPACE     equ     03600h  ; Get disk free space
R0_READABSOLUTEDISK     equ     0DD00h  ; Absolute disk read
R0_WRITEABSOLUTEDISK    equ     0DE00h  ; Absolute disk write
VXDLDR                  equ     0027h
GetDeviceList           equ     0005h
Begin_Critical_Section  equ     001Fh
End_Critical_Section    equ     0020h
Call_When_Idle          equ     003Ah
Call_When_Not_Critical  equ     0024h
Cancel_Call_When_Idle   equ     012Bh

MAXPATH                 equ     260
OPEN_EXISTING           equ     3
CREATE_ALWAYS           equ     2
GENERIC_READ            equ     80000000h
GENERIC_WRITE           equ     40000000h
FILE_SHARE_READ         equ     00000001h
FILE_SHARE_WRITE        equ     00000002h
FILE_ATTRIBUTE_NORMAL   equ     00000080h
IDLE_PRIORITY_CLASS     equ     00000040h
DETACHED_PROCESS        equ     00000008h
DRIVE_FIXED             equ     3
DRIVE_REMOTE            equ     4
DRIVE_UNKNOWN           equ     0
DRIVE_NO_ROOT_DIR       equ     1
DRIVE_REMOVABLE         equ     2
DRIVE_CDROM             equ     5
DRIVE_RAMDISK           equ     6

SW_NORMAL               equ     1
FILE_BEGIN              equ     0
Win32_Get_Ring0_Handle  equ     0033h

GET_ATTRIB_COMP_FILESIZE        equ     2       ; see also IFS.INC
SET_ATTRIB_MODIFY_DATETIME      equ     3
GET_ATTRIB_MODIFY_DATETIME      equ     4
SET_ATTRIB_LAST_ACCESS_DATETIME equ     5
GET_ATTRIB_LAST_ACCESS_DATETIME equ     6
SET_ATTRIB_CREATION_DATETIME    equ     7
GET_ATTRIB_CREATION_DATETIME    equ     8
GET_ATTRIB_FIRST_CLUST          equ     9

OPEN_EXISTING           equ     3
CREATE_ALWAYS           equ     2
GENERIC_READ            equ     80000000h
GENERIC_WRITE           equ     40000000h
FILE_SHARE_READ         equ     00000001h
FILE_SHARE_WRITE        equ     00000002h
FILE_ATTRIBUTE_NORMAL   equ     00000080h
FILE_BEGIN              equ     0
FILE_END                equ     2

PAGE_EXECUTE_READWRITE  equ     00000040h


ifs_onstack_struc       struc
                        dd      ? ; return address
                        dd      ? ; the address of the FSD function that is to be called for this API
_function               dd      ? ; the function that is being performed
_drive                  dd      ? ; the 1-based drive the operation is being performed on (-1 if UNC)
                        dd      ? ; the kind of resource the operation is being performed on
_codepage               dd      ? ; the codepage that the user string was passed in on
_ioreq_ptr              dd      ? ; pointer to IOREQ structure
                        ends

ff_struc                struc                   ; win32 "searchrec" structure
ff_attr                 dd      ?
ff_time_create          dd      ?,?
ff_time_lastaccess      dd      ?,?
ff_time_lastwrite       dd      ?,?
ff_size_hi              dd      ?
ff_size                 dd      ?
                        dd      ?,?
ff_fullname             db      260 dup (?)
ff_shortname            db      14 dup (?)
                        ends

HKEY_CLASSES_ROOT       equ     80000000h
HKEY_CURRENT_USER       equ     80000001h
HKEY_LOCAL_MACHINE      equ     80000002h
HKEY_USERS              equ     80000003h
HKEY_PERFORMANCE_DATA   equ     80000004h
HKEY_CURRENT_CONFIG     equ     80000005h
HKEY_DYN_DATA           equ     80000006h

REG_NONE                equ     0
REG_SZ                  equ     1
REG_EXPAND_SZ           equ     2
REG_BINARY              equ     3
REG_DWORD               equ     4
REG_DWORD_LITTLE_ENDIAN equ     4
REG_DWORD_BIG_ENDIAN    equ     5
REG_LINK                equ     6
REG_MULTI_SZ            equ     7
REG_RESOURCE_LIST       equ     8
REG_FULL_RESOURCE_DESCRIPTOR    equ     9
REG_RESOURCE_REQUIREMENTS_LIST  equ     10
REG_QWORD               equ     11
REG_QWORD_LITTLE_ENDIAN equ     11

WAVE_FORMAT_PCM         equ     1
SND_SYNC                equ     00000000h
SND_ASYNC               equ     00000001h
SND_NODEFAULT           equ     00000002h
SND_MEMORY              equ     00000004h
SND_LOOP                equ     00000008h
SND_NOSTOP              equ     00000010h
SND_NOWAIT              equ     00002000h
SND_ALIAS               equ     00010000h
SND_ALIAS_ID            equ     00110000h
SND_FILENAME            equ     00020000h
SND_RESOURCE            equ     00040004h
SND_PURGE               equ     00000040h
SND_APPLICATION         equ     00000080h

MB_OK                   equ     000000000h
