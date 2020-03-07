    firstdrv       equ     'C'
    lastdrv        equ     'E'+1
    v_id   equ     0b52dh

                           model   tiny
                            codeseg
                           org     100h
                           .386
    start:                 mov     ax,2524h
                           lea     dx,int24
                           int     21h
                           call    mon_init

    scan:                  lea     dx,masker
                           call    collect
                           jc      nextdrv
                           dec     file_cnt
                           mov     si,dx
                           lodsb
                           or      al,al
                           jnz     $-3
                           cmp     word ptr [si-4],'XE'
                           je      goodext
                           cmp     word ptr [si-4],'YS'
                           je      goodext
                           cmp     word ptr [si-4],'OC'
                           jne     scan

    goodext:               inc     file_cnt
                           mov     bp,dx
                           mov     ah,3
                           mov     bh,0
                           int     10h
                           push    dx
                           push    bp
                           mov     dx,bp

                           call    test_infected
                           jnc     no_inf

                           mov     ah,9
                           int     21h
                           pop     dx
                           mov     ah,9
                           int     21h
                           mov     ah,2
                           pop     dx
                           cmp     dh,20
                           jb      allok
                           call    mon_init
                           jmp     rty
    allok:                 int     10h
                           mov     ah,2
                           mov     dl,0ah
                           int     21h
                           mov     dl,0dh
                           int     21h
    rty:                   inc     virused_cnt
                           jmp     scan

    no_inf:                pop     dx
                           mov     ah,9
                           int     21h
                           mov     ah,2
                           pop     dx
                           int     10h
                           jmp     scan

    nextdrv:               add     totfilc,dx
                           inc     byte ptr masker
                           cmp     byte ptr masker,lastdrv
                           jnz     scan

                           movzx   eax,totfilc
                           lea     di,file_number
                           call    count
                           mov     eax,virused_cnt
                           lea     di,vir_asciz
                           call    count
                           mov     ah,9
                           lea     dx,log
                           int     21h

                           mov     ax,4c00h
                           int     21h

    test_infected:         mov     ax,3d00h
                           int     21h
                           xchg    ax,bx
                           jc      clcret

                           mov     ah,3fh
                           mov     cx,32
                           lea     dx,buffer
                           int     21h
                           xor     cx,ax
                           cmp     word ptr buffer+12h,v_id
                           jnz     clcret

                           lea     dx,cured
                           jmp     stcret

    clcret:                mov     ah,3eh
                           int     21h
                           clc
                           ret

    stcret:                mov     ah,3eh
                           int     21h
                           stc
                           ret

                           include count.inc
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

             mov     di,res_post
             lodsb
             stosb
             or      al,al
             jnz     $-4
    clear:   cmp     byte ptr [di],0ffh
             jz      cleared
             mov     byte ptr [di],20h
             inc     di
             jmp     clear
    cleared: mov     word ptr [di-2],0240dh
             jmp     yes_more

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
             cmp     dword ptr [si+1eh],'YCER'
             je      check_again
             cmp     dword ptr [si+1eh],'IRIV'
             je      check_again

    no_virii:
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
    result   db      100h dup (0),0ffh

   ; --- cut here ---


    int24:                 mov     al,3
                           iret

    mon_init:              mov     ax,3
                           int     10h
                           mov     ah,1
                           mov     ch,100000b
                           int     10h
                           lea     dx,cop
                           mov     ah,9
                           int     21h
          mov     ax,1856h
          int     21h
           cmp     ax,3265h        ; AX=3265 - § ç¨â, çâ® ª®¯¨ï ¢¨àãá  ã¦¥ ¢

                           jnz     initret
                           lea     dx,mem
                           mov     ah,9
                           int     21h
                           xor     ax,ax
                           int     16h
                           xor     ax,ax
                           int     21h
    initret:               ret

    totfilc                dw      0
    cop                    db      "[KSENIA] Virus Finder",0dh,0ah,24h
    mem                    db      "Virus found in memory",0dh,0ah,24h
    masker                 db      firstdrv,":\*.*",0
    log                    db      0dh
                           db      '------------------------------------',0dh,0ah
                           db      'Total files tested: '
    file_number            db      15 dup (' '),0dh,0ah
                           db      'Infected: '
    vir_asciz              db      15 dup (' '),0dh,0ah,24h
    cured                  db      'Infected - ',24h
    virused_cnt            dd      0
    buffer                 db      4096 dup (?)
    dtaz                   db      4096 dup (?)

                           end     start
