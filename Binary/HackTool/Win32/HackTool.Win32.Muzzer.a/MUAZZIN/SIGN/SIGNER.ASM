;Muazzin signer

.386p
.model flat

locals

ofs    equ offset
by     equ byte ptr
wo     equ word ptr
dwo    equ dword ptr

extrn GetOpenFileNameA:PROC
extrn ExitProcess:PROC
extrn CreateFileA:PROC
extrn CloseHandle:PROC
extrn GetFileSize :PROC
extrn CreateFileMappingA:PROC
extrn MapViewOfFile:PROC
extrn UnmapViewOfFile:PROC
extrn GetTickCount:PROC
extrn MessageBoxA:PROC
extrn Shell_NotifyIcon:PROC
extrn LoadIconA:PROC
;extrn :PROC

.data

titulo  db 'Autentificador de MUAZZIN(tm)', 0

done    db 'Muazzin autenticado com sucesso!', 0

help    db 'Escolha o MUAZZIN(tm) que deseja autenticar...', 0

filters db 'Muazzin files', 0
        db '*', 0
        db 'All files', 0
        db '*.*', 0
        dd 0

_openfilename     equ this byte
lStructSize       dd ofs _openfilename_size_-ofs _openfilename
hwndOwner         dd 0
hInstance         dd 0
lpstrFilter       dd ofs filters
lpstrCustomFilter dd 0
nMaxCustFilter    dd 0
nFilterIndex      dd 0
lpstrFile         dd ofs namebuffer
nMaxFile          dd MAX_PATH
lpstrFileTitle    dd 0
nMaxFileTitle     dd 0
lpstrInitialDir   dd 0
lpstrTitle        dd ofs help
Flags             dd OFN_FILEMUSTEXIST+OFN_HIDEREADONLY+OFN_LONGNAMES
nFileOffset       dw 0
nFileExtension    dw 0
lpstrDefExt       dd 0
lCustData         dd 0
lpfnHook          dd 0
lpTemplateName    dd 0
_openfilename_size_:

icon_data:
cbSize            dd ofs icon_data_-ofs icon_data
hWnd              dd 0
uID               dd 666
uFlags            dd NIF_ICON+NIF_TIP
uCallbackMessage  dd 0
hIcon             dd 0
szTip             db "Autenticando muazzin..."
szTip_            db (64-(szTip_-szTip)) dup (0)
icon_data_:

namebuffer     db 'plugin', 0
               db (MAX_PATH-($-ofs namebuffer)) dup (?)

tea_key        db BN_BYTE dup (?)              ;this is our TEA key with same
                                               ;key size as RSA
seed           dd ?
muazzin_map    dd ?
muazzin_handle dd ?
muazzin_size   dd ?
data_size      dd ?
muazzin_mem    dd ?

.code

start:
       cld

       push 32515
       push 0
       call LoadIconA
       mov [hIcon], eax

       push ofs _openfilename
       call GetOpenFileNameA                   ;choose 'muazzin' to sign
       test eax, eax
       jz @@error

       sub ebp, ebp

       push ebp
       push 80h
       push 3
       push ebp
       push ebp
       push 80000000h+40000000h
       push dwo [lpstrFile]
       call CreateFileA
       mov [muazzin_handle], eax
       mov ebx, eax
       inc eax
       jz @@error

       push ebp
       push ebx
       call GetFileSize
       inc eax
       jz @@error1

       add eax, 0fh-1
       and al, 11110000b                       ;round data size to 16 boundary
       mov [data_size], eax

       add eax, BN_BYTE                        ;add TEA key buffer

       mov [muazzin_size], eax

       push ebp
       push eax
       push ebp
       push PAGE_READWRITE
       push ebp
       push ebx
       call CreateFileMappingA
       test eax, eax
       jz @@error1
       mov [muazzin_map], eax

       push dwo [muazzin_size]
       push ebp
       push ebp
       push FILE_MAP_WRITE
       push eax
       call MapViewOfFile
       test eax, eax
       jz @@error2
       mov [muazzin_mem], eax

       push ofs icon_data
       push NIM_ADD
       call Shell_NotifyIcon

       call autenticar                         ;sign in memory 'muazzin'

       push ofs icon_data
       push NIM_DELETE
       call Shell_NotifyIcon

       push ebp
       push ofs titulo
       push ofs done
       push ebp
       call MessageBoxA

       push dwo [muazzin_mem]
       call UnmapViewOfFile

  @@error2:
       push dwo [muazzin_map]
       call CloseHandle

  @@error1:
       push dwo [muazzin_handle]
       call CloseHandle

  @@error:
       push 0
       call ExitProcess

autenticar:
       pushad

       call init_rnd

       call get_rnd
       and eax, 0111b
       mov ecx, eax
       inc ecx
  @@loop_seed:                                 ;skip first 1-8 rnd number
       call get_rnd
       loop @@loop_seed

       mov ecx, BN_DWORD                       ;choose TEA key and fill rest
       mov edi, ofs tea_key                    ;of buffer with rnd values
  @@loop_seed2:
       call get_rnd
       stosd
       loop @@loop_seed2

       push ofs tea_key                        ;first 128b of TEA key will be
       push dwo [data_size]                    ;the hash
       push dwo [muazzin_mem]
       call tea_hash

       mov ecx, [data_size]                    ;encrypt muazzin body with TEA
       shr ecx, 3                              ;key=RND(64b)+HASH(64b)+RND(..)
       mov edi, [muazzin_mem]
       mov esi, ofs tea_key                    ;ecx=number of TEA rounds
  @@TEA:
       call TEA_Encrypt                        ;encrypt 64b with TEA
       add edi, 64/8
       add esi, 128/8                          ;get next TEA round key
       cmp esi, ofs tea_key+BN_BYTE
       jb @@continue
       sub esi, BN_BYTE                        ;back to start of TEA key
  @@continue:
       loop @@TEA

       push ofs tea_key
       push edi
       push ofs rsa_d
       push ofs rsa_n
       call rsa_modexp_fast                    ;sign TEA_KEY with RSA

       popad
       ret

include signer.inc

include rnd.asi

include hash.asi

include xtea.asi

include key\keysize.asi
include key\d.inc                                  ;we use D and N to encrypt
include key\n.asi                                  ;and E and N to decrypt

include rsa\rsalib.asi

end    start

