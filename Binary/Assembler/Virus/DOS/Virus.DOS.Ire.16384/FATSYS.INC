   ; filesystem access unit

   ;               Access   Address
   ;               Method   Type     Target      Start
   ;               -------- -------- ----------- -----------
   ; Level 0:      IO-Ports Physical HD          c=0:h=0:s=1
   ; Level 1:      Level0   Logical  HD          s=0
   ; Level 2:      Level1   Logical  Partition   s=0
   ; Level 3:      Level2   Logical  FAT,Cluster cluster=2



   ;MIN_SECT_PER_CLUST     equ       8     ;  4k MIN
   MAX_SECT_PER_CLUST      equ     128     ; 64k MAX

   direntry_name           equ     (byte ptr 00h)  ; directory entry
   direntry_ext            equ     (byte ptr 08h)
   direntry_attr           equ     (byte ptr 0Bh)
   direntry_time           equ     (word ptr 16h)
   direntry_cluster        equ     (word ptr 1Ah)
   direntry_size           equ     (dword ptr 1Ch)

   char_DELETED            equ     0E5h            ; some constants
   char_NOFILE             equ     0

   fa_readonly             equ     00000001b       ; file attributes
   fa_hidden               equ     00000010b
   fa_system               equ     00000100b
   fa_volumeid             equ     00001000b
   fa_directory            equ     00010000b
   fa_archive              equ     00100000b

   ROOT                    equ     0               ; root dir cluster
   EOF                     equ     -1              ; EOF cluster

   ; ---------------------------------------------------------------------------

   level0_getcmdport:      mov     dx, 1F7h        ; master
                           test    level0_drive, 10b
                           jz      __1
                           mov     dx, 177h        ; slave
   __1:                    ret

   level0_calcdrive:       xor     al, al          ; primary/secondary
                           bt      word ptr level0_drive, 0
                           rcl     al, 5
                           or      al, 10100000b
                           ret

   level0_init:            call    level0_getcmdport

   __1:                    in      al, dx          ; busy
                           test    al, 00000001b
                           jnz     __error
                           test    al, 10000000b
                           jnz     __1

                           dec     dx              ; drive #
                           call    level0_calcdrive
                           out     dx, al

                           inc     dx              ; ready
                           xor     cx, cx
   __2:                    dec     cx
                           jz      __error
                           in      al, dx
                           test    al, 00000001b
                           jnz     __error
                           test    al, 01000000b
                           jz      __2

                           mov     al, 0ECh        ; indentify drive
                           out     dx, al

   __3:                    in      al, dx          ; data
                           test    al, 00000001b
                           jnz     __error
                           test    al, 00001000b
                           jz      __3

                           sub     dl, 7           ; read
                           lea     di, level0_driveinfo
                           mov     cx, 256/2
                           rep     insw

                           clc
                           ret

   __error:                stc
                           ret

   level0_read:            call    io_mask

                           call    level0_rw
                           jc      __error

                           mov     al, 20h         ; read
                           out     dx, al

                           mov     si, level0_count
                           les     di, level0_ptr

   __3:                    in      al, dx          ; data
                           test    al, 00000001b
                           jnz     __error
                           test    al, 00001000b
                           jz      __3

                           sub     dl, 7

                           mov     cx, 512/2       ; read
                           rep     insw

                           add     dl, 7

                           dec     si
                           jnz     __3

                           push    cs
                           pop     es

                           call    io_unmask

                           clc
                           ret

   __error:                call    io_unmask

                           stc
                           ret

   level0_write:           call    io_mask

                           call    level0_rw
                           jc      __error

                           mov     al, 30h         ; write
                           out     dx, al

                           mov     di, level0_count
                           les     si, level0_ptr

   __3:                    in      al, dx          ; ready?
                           test    al, 00000001b
                           jnz     __error
                           test    al, 00001000b
                           jz      __3

                           sub     dl, 7

                           mov     cx, 512/2       ; write
                           seges
                           rep     outsw

                           add     dl, 7

                           dec     di
                           jnz     __3

                           push    cs
                           pop     es

                           call    io_unmask

                           clc
                           ret

   __error:                call    io_unmask

                           stc
                           ret

   io_mask:                in      al, 21h
                           mov     level0_port21, al
                           in      al, 0A1h
                           mov     level0_portA1, al
                           mov     al, 0FFh
                           out     21h, al
                           out     0A1h, al
                           ret

   io_unmask:              mov     al, level0_port21
                           out     21h, al
                           mov     al, level0_portA1
                           out     0A1h, al
                           ret

   level0_rw:              call    level0_getcmdport

   __1:                    in      al, dx
                           test    al, 00000001b
                           jnz     __error
                           test    al, 10000000b
                           jnz     __1

                           sub     dl, 5           ; sector count
                           mov     al, byte ptr level0_count
                           out     dx, al

                           inc     dx              ; sector
                           mov     al, byte ptr level0_sector
                           out     dx, al

                           inc     dx              ; cylinder - lo
                           mov     ax, level0_cylinder
                           out     dx, al

                           inc     dx              ; cylinder - hi
                           mov     al, ah
                           out     dx, al

                           inc     dx              ; drive #
                           call    level0_calcdrive
                           or      al, byte ptr level0_head
                           out     dx, al

                           inc     dx              ; ready
   __2:                    in      al, dx
                           test    al, 00000001b
                           jnz     __error
                           test    al, 01000000b
                           jz      __2

                           clc
                           ret

   __error:                stc
                           ret

   ; ---------------------------------------------------------------------------

   level1_read:            call    level1_rw

                           call    level0_read

                           ret

   level1_write:           call    level1_rw

                           call    level0_write

                           ret

   level1_rw:              push    level1_ptr
                           pop     level0_ptr

                           mov     ax, level1_count
                           mov     level0_count, ax

                           mov     eax, level1_sector
                           cdq
                           movzx   ecx, level0_max_sector
                           div     ecx
                           inc     dx
                           mov     level0_sector, dx
                           xor     edx, edx
                           movzx   ecx, level0_max_head
                           div     ecx
                           mov     level0_head, dx
                           mov     level0_cylinder, ax

                           ret

   ; ---------------------------------------------------------------------------

   level2_init:            mov     level2_drivecount, 0
                           lea     di, level2_drivestart

                           xor     ebp, ebp
                           call    level2_recscan

                           clc
                           ret

   level2_recscan:         call    __read

                           cmp     level2_mbr.word ptr 512-2, 0AA55h
                           jne     __exit

                           lea     si, level2_mbr + 512 - 2 - 64
                           mov     cx, 4

   __scan_ptable:          push    cx
                           push    si

                           mov     al, [si].byte ptr 4

                        ;  cmp     al, 1           ; fat12
                        ;  je      __found_drive

                           cmp     al, 4           ; fat16
                           je      __found_drive
                           cmp     al, 6           ; bigdos
                           je      __found_drive

                           cmp     al, 5           ; extended
                           je      __found_ext

   __scan_next:            pop     si
                           pop     cx

                           cmp     level2_drivecount, 26
                           jae     __exit

                           add     si, 16
                           loop    __scan_ptable

   __exit:                 ret

   __read:                 pushad

                           mov     level1_sector, ebp
                           mov     level1_count, 1
                           mov     level1_ptr.o, offset level2_mbr
                           mov     level1_ptr.s, cs
                           call    level1_read

                           popad
                           ret

   __found_drive:          mov     eax, [si].dword ptr 8
                           add     eax, ebp

                           ; scan drives to avoid recursive extended
                           pusha
                           lea     di, level2_drivestart
                           mov     cx, level2_drivecount
                           repnz   scasd
                           popa
                           jz      __scan_next

                           inc     level2_drivecount
                           stosd

                           jmp     __scan_next

   __found_ext:            push    ebp
                           add     ebp, [si].dword ptr 8

                           call    level2_recscan

                           pop     ebp

                           call    __read

                           jmp     __scan_next

   level2_initdrive:       mov     bx, level2_drive
                           shl     bx, 2
                           push    level2_drivestart[bx]
                           pop     level2_basesector
                           ret

   level2_read:            call    level2_rw

                           call    level1_read

                           ret

   level2_write:           call    level2_rw

                           call    level1_write

                           ret

   level2_rw:              push    level2_ptr
                           pop     level1_ptr

                           mov     eax, level2_sector
                           add     eax, level2_basesector
                           mov     level1_sector, eax

                           push    level2_count
                           pop     level1_count

                           ret

   ; ---------------------------------------------------------------------------

   level3_init:            mov     level2_sector, 0
                           mov     level2_count, 1
                           mov     level2_ptr.o, offset level3_boot
                           mov     level2_ptr.s, cs
                           call    level2_read
                           jc      __error

                           lea     bx, level3_boot

                           cmp     [bx].word ptr 512-2, 0AA55h
                           jne     __error

                           lea     si, [bx].byte ptr 36h
                           lea     di, FAT16_ID
                           mov     cx, 8
                           rep     cmpsb
                           je      __FAT16

                           jmp     __error

   __FAT16:                movzx   eax, [bx].word ptr 0Eh
                           mov     level3_reserved, eax

                           xor     eax, eax

                           mov     al, [bx].byte ptr 0Dh
                           mov     level3_sectpercluster, eax

                         ; cmp     eax, MIN_SECT_PER_CLUST
                         ; jb      __error
                           cmp     eax, MAX_SECT_PER_CLUST
                           ja      __error

                           mov     al, [bx].byte ptr 10h
                           mov     level3_fatcopies, eax

                           mov     ax, [bx].word ptr 11h
                           mov     level3_rootdirentries, eax

                           shl     eax, 5
                           add     eax, 511
                           shr     eax, 9
                           mov     level3_rootdirsectors, eax

                           cmp     eax, MAX_SECT_PER_CLUST
                           ja      __error

                           movzx   eax, [bx].word ptr 16h
                           mov     level3_sectperfat, eax

                           mov     eax, level3_sectperfat
                           imul    eax, level3_fatcopies
                           add     eax, level3_reserved
                           mov     level3_rootstart, eax
                           add     eax, level3_rootdirsectors
                           mov     level3_datastart, eax

                           movzx   eax, [bx].word ptr 13h
                           or      ax, ax
                           jnz     __1
                           mov     eax, [bx].dword ptr 20h
   __1:                    mov     level3_totalsectors, eax

                           sub     eax, level3_datastart
                           xor     edx, edx
                           mov     ecx, level3_sectpercluster
                           div     ecx
                           mov     level3_totalclusters, eax

                           mov     level3_cachesector, -1

                           clc
                           ret

   __error:                stc
                           ret

                           ; input:   bx=cluster
                           ; output:  ax=value

   level3_cluster_get:     call    level3_read_fat_sector

                           push    bx
                           call    level3_calcfat_LO
                           mov     ax, word ptr level3_cache[bx]
                           pop     bx

                           ret

                           ; input:   bx=cluster
                           ;          ax=value

   level3_cluster_set:     call    level3_read_fat_sector

                           push    bx
                           call    level3_calcfat_LO
                           mov     word ptr level3_cache[bx], ax
                           pop     bx

                           call    level3_write_fat_sector

                           ret

   level3_calcfat_HI:      movzx   eax, bx   ; fat sector #
                           shr     eax, 8
                           ret

   level3_calcfat_LO:      and     bx, 255
                           shl     bx, 1
                           ret

                           ; input: ebx=cluster #

   level3_read_fat_sector: pushad

                           call    level3_calcfat_HI
                           add     eax, level3_reserved  ; partition sector #

                           cmp     level3_cachesector, eax
                           je      __skip
                           mov     level3_cachesector, eax

                           mov     level2_sector, eax
                           mov     level2_count, 1
                           mov     level2_ptr.o, offset level3_cache
                           mov     level2_ptr.s, cs
                           call    level2_read

   __skip:                 popad
                           ret

   level3_write_fat_sector:pushad

                           call    level3_calcfat_HI
                           add     eax, level3_reserved  ; partition sector #

                           mov     level2_sector, eax
                           mov     level2_count, 1
                           mov     level2_ptr.o, offset level3_cache
                           mov     level2_ptr.s, cs

                           mov     ecx, level3_fatcopies

   __1:                    pushad
                           call    level2_write
                           popad

                           mov     eax, level3_sectperfat
                           add     level2_sector, eax

                           loop    __1

                           popad
                           ret

   level3_read:            pushad

                           call    level3_calc
                           call    level2_read

                           popad
                           ret

   level3_write:           pushad

                           call    level3_calc
                           call    level2_write

                           popad
                           ret

   level3_calc:            push    level3_ptr
                           pop     level2_ptr

                           cmp     level3_cluster, ROOT
                           je      __root

                           movzx   eax, level3_count
                           imul    eax, level3_sectpercluster
                           mov     level2_count, ax

                           movzx   eax, level3_cluster
                           sub     eax, 2
                           xor     edx, edx
                           mov     ecx, level3_sectpercluster
                           mul     ecx
                           add     eax, level3_datastart
                           mov     level2_sector, eax

                           ret

   __root:                 mov     eax, level3_rootdirsectors
                           mov     level2_count, ax

                           mov     eax, level3_rootstart
                           mov     level2_sector, eax

                           ret

   ; ---------------------------------------------------------------------------

   FAT16_ID                db      'FAT16   '

   ; ---------------------------------------------------------------------------
