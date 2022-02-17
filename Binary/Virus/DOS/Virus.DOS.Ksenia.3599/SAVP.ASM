                           model   tiny
                           codeseg
                           org     100h
                           .386

    start:                 mov     ax,18ddh
                           int     21h
                           cmp     ax,0303h
                           jne     no_in_mem

                           mov     ah,9
                           lea     dx,vir_found
                           int     21h
                           int     20h

    no_in_mem:             mov     ax,3
                           int     10h
                           mov     ah,1
                           mov     ch,100000b
                           int     10h

                           push    ds 0
                           pop     ds
                           mov     word ptr ds:[24h*4],offset int24
                           mov     word ptr ds:[24h*4+2],cs
                           pop     ds
                           lea     dx,copyright
                           call    screen
                           mov     ah,3
                           mov     bh,0
                           int     10h
                           mov     cur_pos,dx

                           mov     si,81h
    up_reg_comline:        lodsb
                           cmp     al,61h
                           jb      ok_reg
                           cmp     al,7ah
                           ja      ok_reg
                           sub     al,20h
    ok_reg:                mov     byte ptr [si-1],al
                           cmp     al,0dh
                           jne     up_reg_comline

                           mov     si,81h
    ignore_space:          lodsb
                           cmp     al,0dh
                           je      help
                           cmp     al,20h
                           je      ignore_space
                           dec     si
                           mov     dx,si
                           mov     al,0dh
                           mov     di,81h
                           mov     cx,0ffffh
                           repne   scasb
                           dec     di
                           mov     byte ptr [di],0

    get_separ:             dec     di
                           cmp     byte ptr [di],'\'
                           je      set_dots
                           cmp     byte ptr [di],':'
                           je      set_dots
                           cmp     byte ptr [di],20h
                           je      get_separ
                           jmp     aaaa

    set_dots:              mov     word ptr [di+1],'.*'
                           mov     word ptr [di+3],'*'

    aaaa:                  call    collect
                           jc      report
                           push    dx
                           mov     dx,cur_pos
                           mov     ah,2
                           mov     bh,0
                           int     10h
                           pop     dx
                           dec     dx
                           call    screen
                           inc     dx
                           push    dx
                           mov     ah,3
                           mov     bh,0
                           int     10h
                           push    dx
                           lea     dx,spaces
                           call    screen
                           pop     dx
                           mov     ah,2
                           int     10h
                           pop     dx
                           call    test_infected
                           jnc     no_inf
                           call    screen
                           cmp     dx,offset virused
                           jne     no_increment
                           inc     virused_cnt
    no_increment:          mov     ah,3
                           mov     bh,0
                           int     10h
                           cmp     dh,20
                           jb      ok_pos
                           mov     ax,3
                           int     10h
                           mov     ah,1
                           mov     ch,100000b
                           int     10h
                           xor     dx,dx
    ok_pos:                mov     cur_pos,dx
    no_inf:                jmp     aaaa

    report:                push    dx
                           mov     dx,cur_pos
                           mov     bh,0
                           mov     ah,2
                           int     10h
                           lea     dx,spaces
                           call    screen
                           mov     ah,2
                           mov     bh,0
                           mov     dx,cur_pos
                           int     10h
                           pop     dx
                           movzx   eax,dx
                           lea     di,file_number
                           stc
                           call    count
                           mov     eax,virused_cnt
                           lea     di,vir_asciz
                           call    count
                           lea     dx,log
                           call    screen

                           jmp     terminate

    help:                  lea     dx,error_com_line
                           call    screen
    terminate:             mov     ax,4c00h
                           int     21h

    test_infected:         mov     ax,3d00h
                           int     21h
                           lea     dx,rerr
                           jc      quit_all
                           xchg    ax,bx
                           mov     ax,4202h
                           mov     cx,-1
                           mov     dx,-2
                           int     21h
                           mov     ah,3fh
                           mov     cx,2
                           lea     dx,two_bytes
                           int     21h
                           push    ax
                           mov     ah,3eh
                           int     21h
                           pop     ax
                           cmp     ax,2
                           clc
                           jne     quit_all
                           cmp     word ptr two_bytes,0c39dh
                           stc
                           lea     dx,virused
                           je      quit_all
                           clc
    quit_all:              ret

    two_bytes              dw      ?
                           include count.inc
                           include screen.inc
    ; --- cut here ---
   ; ¯®¤¯à®£à ¬¬  "collect" ¤«ï  å®¦¤¥¨ï ä ©«®¢ ¯® § ¤ ®© ¬ áª¥
   ; copyright (c) 1998-99 Deadman
   ;   ¢å®¤¥: cs:dx - ¬ áª 
   ;   ¢ëå®¤¥ cs:dx -  ©¤¥ë© ä ©« ¢ ä®à¬ â¥ ASCIZ+'$'
   ; ¥á«¨ ä ©«®¢ ¡®«ìè¥ ¥â, â® cf=1 ¨ dx = ª®«¨ç¥áâ¢®  ©¤¥ëå ¤® ä ©«®¢
   ; ¯à¨ ¯®¢â®à®¬ ¢ë§®¢¥ à ¡®â ¥â ª ª "find next"
   ; ¯à¨ ®âáãâáâ¢¨¨ ä ©«®¢ (cf=1) ¯à®æ¥¤ãà  á¡à áë¢ ¥âáï ¢ à¥¦¨¬ "find first"
   ; ¯®àâ¨â à¥£¨áâàë: flags, dx
   ; § ¬¥ç ¨¥: ¯®¤¯à®£à ¬¬  ¤®«¦  ¡ëâì à á¯®«®¦¥  ¯®á«¥¤¥©, â.ª. ¥©
   ; âà¥¡ã¥âáï ¬¥áâ® ¤«ï åà ¥¨ï DTA ¢«®¦¥ëå ¯®¤ª â «®£®¢
    collect:
             push    ax bx cx si di bp ds es  ; á®åà ¨âì à¥£¨áâàë \dx

             mov     ah,2fh                   ; ¯®«ãç¨âì ¢ es:bx  ¤à¥á
             int     21h                      ; â¥ªãé¥£® dta
             push    es bx                    ; á®åà ¨âì ¥£® ¢ áâ¥ª¥

             push    cs cs         ; ãáâ ®¢¨âì á¥£¬¥âë¥ à¥£¨áâàë
             pop     es ds         ; ds ¨ es   á¥£¬¥â ª®¤ 

             cmp     fron,0        ; ¯¥à¢ë© ¢ë§®¢ (find first)?
             jne     find_next

             mov     in_dx,dx      ; á®åà ¨âì á¬¥é¥¨¥ ¬ áª¨ ¯®¨áª 
             mov     file_cnt,0    ; total files found: 0

             mov     si,dx              ; § áããâì ¢ di  ¤à¥á ¬ áª¨
             dec     si
    col_get_eol:                        ; ¨é¥¬ §¨à® ¢ ¬ áª¥
             inc     si
             cmp     byte ptr [si],0
             jne     col_get_eol        ;  è«¨?

             std                   ; ¨é¥¬  ç «® £®«®© ¬ áª¨ ( ¯à¨¬¥à, *.COM)
    get_mask:
             lodsb                 ; áç¨â âì ¢ al á¨¬¢®«
             cmp     al,':'        ; à §¤¥«¨â¥«ì? (c:...)
             je      have_got
             cmp     al,'\'        ; \...?
             je      have_got
             cmp     si,dx         ; ¥á«¨ ãª §   £®« ï ¬ áª , â.¥. ¡¥§ ":" ¨ "\"
             jae     get_mask      ; â® ¢§ïâì §   ç «® ®®© á¬¥é¥¨¥ ¨§ dx
             dec     si
    have_got:
             inc     si            ; ¢ëà ¢¨¢ ¨¥    ç «® (¥¡ ë© std :-)
             inc     si
             mov     msk_pnt,si    ; á®åà ¨âì á¬¥é¥¨¥
             mov     cx,si         ; ¢ëç¨á«¨âì ª®«¨ç¥áâ¢® ¡ ©â ®â  ç «  áâà®ª¨
             sub     cx,dx         ; ¤®  ç «  ¬ áª¨ (â.¥. ¯ãâì)

             lea     di,result     ; ¯¥à¥ª ç âì ¯ãâì ¨§ î§¥à®¢áª®£® ¡ãä¥à  ¢
             mov     si,dx         ; ¡ãä¥à à¥§ã«ìâ â®¢
             cld
             repz    movsb
             mov     res_post,di   ; á®åà ¨âì á¬¥é¥¨¥ ª®æ  ;-) ¯ãâ¨
    find_first:
             mov     ah,4eh        ; ¨é¥¬ ¯¥à¢ë© ä ©«
             jmp     $+4           ; çâ®¡ ¥ ¨á¯ å ¡¨«¨ ah

    find_next:
             mov     ah,4fh        ;   âãâ ¨é¥¬ next
             push    ax dx         ; ãáâ  ¢«¨¢ ¥¬ dta ¯®  ¤à¥áã, ãª § ®¬ã
             mov     ah,1ah        ; ¢ ¯¥à¥¬¥®© "dta_pnt"
             mov     dx,dta_pnt
             int     21h
             pop     dx ax
             mov     cx,0ffefh and (not 1000b) ; ¨é¥¬ ¢á¥ ?*:%;( ªà®¬¥ ª â «®£®¢
             int     21h
             jc      check_dir     ; ¥âã ¡®«ìè¥ ä ©«®¢ -> ¯¥à¥©â¨ ¢ ¤àã£ãî
                                   ; '¯ ¯ªã'

             mov     si,dta_pnt    ; âãâ  ª ç ¥¬ ¨¬ï ¨ ä ¬¨«¨î  ©¤¥®£® ä ©« 
             add     si,1eh        ; ¯®  ¤à¥áã "res_post"

             push    si
             lodsb
             cmp     al,'.'
             jne     $-3
             lodsd
             pop   si
             cmp     eax,'SYS'
             je      good
             cmp     eax,'MOC'
             je      good
             cmp     eax,'EXE'
             jne     find_next
    good:

             mov     di,res_post
             lodsb
             stosb
             or      al,al
             jnz     $-4
             mov     al,'$'        ; á®áâ®á¨âì '$' ¢ ª®æ¥ ASCIZ áâà®ª¨ ¤«ï
             stosb                 ; ¥¥ ¨á¯®«ì§®¢ ¨ï 9-© äãªæ¨¥© dos
             jmp     yes_more      ; ¯®ª § âì ä ©«

    check_dir:
             mov     ah,4eh                ; ¨é¥¬ ¯ ¯ª¨
             mov     si,res_post
             mov     word ptr [si],'.*'    ; (dir)\(*.*),0
             mov     word ptr [si+2],'*'
             lea     dx,result
             mov     cx,0ffffh             ; íâ® ¤«ï â®£®, çâ®¡ë ¢áïª¨¥ hidden'ë
    check_again:                           ; ¥ ãáª®«ì§ã«¨ ®â ¬®¥£® £« § 
             int     21h
             jc      cd_dotdot             ; âãâ  ¨ç¥ ¥âã -> ¤¥« ¥¬ ¯á¥¢¤®-CD
             mov     si,dta_pnt            ; ¨ ç¥ â¥áâ¨¬ î¨â, ¥áâì «¨ ®
             mov     ah,4fh                ; ®à¬ «ì ï ¯ ¯ª , ¨«¨ ®
             cmp     byte ptr [si+1eh],'.' ; ä ©« ¨«¨ (.)(..), â.¥. ä¨«ìâàã¥¬
             je      check_again
             test    byte ptr [si+15h],10000b
             jz      check_again

             mov     si,dta_pnt            ;  è«¨ ¯ ¯ªã -> ¯¥à¥ª ç âì
             add     si,1eh                ;  §¢ ¨¥ ¢ 'result'
             mov     di,res_post

             lodsb
             stosb
             or      al,al
             jnz     $-4
             mov     byte ptr [di-1],'\'   ; ª®¥æ ¯ãâ¨
             mov     ax,di
             xchg    res_post,ax
             mov     si,dta_pnt            ; á®åà ¨âì ãª § â¥«ì   ª®¥æ ¯ãâ¨
             mov     [si+43],ax            ; ¯à¥¤ë¤ãé¥£® ãà®¢ï

             mov     si,msk_pnt     ; ¯¥à¥ª ç âì ¬ áªã ¤«ï ¯®¨áª  ¢ *’Ž‰ ¯ ¯ª¥
             lodsb
             stosb
             or      al,al
             jnz     $-4

             lea     dx,result      ; ¨é¥¬ á«¥¤ãîé¨¥ ä ©«ë, § â¥¬ ª â «®£¨
             add     dta_pnt,45
             inc     dir_cnt
             jmp     find_first

    cd_dotdot:                      ; âãâ  ¤® á¤¥« âì ¯á¥¢¤® CD .. ¤«ï ¯®¨áª 
             dec     dir_cnt        ; ®áâ ¢è¨åáï ä ©«®¢ ¨ ¯ ¯®ª ¢ ¯à¥¤ë¤ãé¥©
             jz      no_more        ; ¯ ¯ª¥
             sub     dta_pnt,45
             mov     si,dta_pnt
             mov     dx,si
             mov     ah,1ah
             int     21h
             mov     di,[si+43]
             mov     res_post,di
             mov     ah,4fh
             jmp     check_again

    yes_more:                                  ; ¢ë¢®¤¨¬  ©¤¥ë© ä ©«
             inc     dword ptr file_cnt        ; ª®«¨ç¥áâ¢®  ©¤¥ëå ä ©«®¢
             clc
             mov     fron,1                    ; á«¥¤ãîé¨© ¢ë§®¢ - find next
             lea     dx,result

    exit:    mov     bp,dx
             pop     dx ds
             pushf
             mov     ah,1ah
             int     21h
             popf
             mov     dx,bp

             pop     es ds bp di si cx bx ax
             ret

    no_more: mov     fron,0                        ; á¡à áë¢ ¥¬ ¯¥à¥¬¥ë¥
             mov     dta_pnt,offset dtaz
             mov     dir_cnt,1
             mov     dx,file_cnt                   ; ¡ë«®  ©¤¥® dx ä ©«®¢
             stc
             jmp     exit

    fron     db      0
    file_cnt dw      0
    dir_cnt  dw      1
    dta_pnt  dw      dtaz
    msk_pnt  dw      ?
    res_post dw      ?
    in_dx    dw      ?
             db      0ah
    result   db      100h dup (?)

   ; --- cut here ---


    int24:                 mov     al,3
                           iret

    vir_found              db      'Virus in memory, can''t work',0dh,0ah,24h
    copyright              db      0ah,'Speed Anti-Virus Program Copyright (C) 1998-99 Deadman',0dh,0ah,0dh,0ah,24h
    error_com_line         db      0ch,'Error in command line! Usage: SAVP <path>',0dh,0ah,24h
    log                    db      0ah,0dh,0ah,'Total files tested: '
    file_number            db      15 dup (' '),0dh,0ah
                           db      'Virused: '
    vir_asciz              db      15 dup (' '),0dh,0ah,24h
    crlf                   db      0ah,0dh,24h
    spaces                 db      0ch,100h dup (' '),24h
    virused                db      0ch,'- Virused!',0dh,0ah,24h
    rerr                   db      0ah,'- Read error!',0dh,0ah,24h
    virused_cnt            dd      0
    cur_pos                dw      ?
    dtaz:                  end     start
