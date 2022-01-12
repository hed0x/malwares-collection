
b0              equ     (byte ptr 0)
b1              equ     (byte ptr 1)
b2              equ     (byte ptr 2)
b3              equ     (byte ptr 3)

w0              equ     (word ptr 0)
w1              equ     (word ptr 1)
w2              equ     (word ptr 2)
w3              equ     (word ptr 3)

d0              equ     (dword ptr 0)
d1              equ     (dword ptr 1)
d2              equ     (dword ptr 2)
d3              equ     (dword ptr 3)

l               equ     w0
h               equ     w2

o               equ     w0
s               equ     w2

offs            equ     w0
segm            equ     w2

                ; flags

_CF             equ     0001h
_PF             equ     0004h
_AF             equ     0010h
_ZF             equ     0040h
_SF             equ     0080h
_TF             equ     0100h
_IF             equ     0200h
_OF             equ     0800h

                ; dos file attributes

_Readonly       equ     01h
_Hidden         equ     02h
_System         equ     04h
_VolumeID       equ     08h
_Directory      equ     10h
_Archive        equ     20h

mve             macro   x, y
                push    y
                pop     x
                endm

outb            macro   _dx, _al
                mov     dx, _dx
                mov     al, _al
                out     dx, al
                endm

outw            macro   _dx, _ax
                mov     dx, _dx
                mov     ax, _ax
                out     dx, ax
                endm

outd            macro   _dx, _eax
                mov     dx, _dx
                mov     eax, _eax
                out     dx, eax
                endm

setalc          macro
                db      0D6h
                endm


lastword        macro   name
name            equ     word ptr $-2
                endm

lastbyte        macro   name
name            equ     byte ptr $-1
                endm





getint          macro   xx
                mov     ax, 35&xx&h
                int     21h
                mov     old&xx&.o, bx
                mov     old&xx&.s, es
                endm

setint          macro   xx
                mov     ax, 25&xx&h
                mve     ds, cs
                lea     dx, int&xx
                int     21h
                endm

replaceint      macro   xx
                getint  xx
                setint  xx
                endm

tsr             macro   lastlabel
                mov     ah, 49h
                mov     es, cs:[002Ch]
                int     21h
                mov     ax, 3100h
                mov     dx, (lastlabel - start + 256 + 15) / 16
                int     21h
                endm


                ; dta

dta_struc       struc
dta_drive       db      ?               ; 0=a,1=b,2=c
dta_name8       db      8 dup (?)
dta_ext3        db      3 dup (?)
dta_searchattr  db      ?
dta_num         dw      ?               ; 0=. 1=..
dta_dircluster  dw      ?
                dd      ?               ; unused
dta_attr        db      ?               ; 1=r 32=a 16=d 2=h 4=s 8=v
dta_time        dw      ?               ; чччччммм мммссссс
dta_date        dw      ?               ; гггггггм мммддддд
dta_size        dd      ?
dta_name        db      13 dup (?)
                ends

                ; exe header

exe_struc       struc
exe_mz          dw      ?
exe_last512     dw      ?
exe_num512      dw      ?
exe_relnum      dw      ?
exe_headersize  dw      ?
exe_minmem      dw      ?
exe_maxmem      dw      ?
exe_ss          dw      ?
exe_sp          dw      ?
exe_checksum    dw      ?
exe_ip          dw      ?
exe_cs          dw      ?
exe_relofs      dw      ?
exe_ovrnum      dw      ?
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
sft_flags       dw      ?               ; бит 14 - сохранять дату/время при закрытии
sft_deviceptr   dd      ?               ; если символьное устр-во - header драйвера
sft_filecluster dw      ?               ; начальный кластер файла
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



                .model  tpascal
                .code
                .386p
                assume  ds:code, ss:code, es:code
                locals  @@
                jumps


