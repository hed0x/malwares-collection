packer  proc    far
; îÆ‡¨a‚ ·¶a‚Îx §a≠≠Îx:
;
;          ⁄ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒø
;end-°´Æ™: ≥0≥0≥0≥0≥0≥0≥0≥0≥
;          ¿ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒŸ
;
;             1-Î© °a©‚.      N °a©‚ ≠•·¶a‚. §a≠≠Îx
;          ⁄ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒø⁄ƒƒƒƒƒƒø⁄ƒƒø
; 0-°´Æ™:  ≥0≥Ñ´®≠a ≠•·¶a‚.≥≥     ⁄Ÿ≥  ≥
;          ¿ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒŸ¿ƒƒƒƒƒŸƒ¡ƒƒŸ
;            \______ ______/
;                   N
;
;
;             1-Î© °a©‚.      2-Î© °a©‚.       3-Î© °a©‚.    N °a©‚ ≠•·¶a‚. §a≠≠Îx
;         ⁄ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒø⁄ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒø⁄ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒø⁄ƒƒƒƒƒƒø⁄ƒƒø
; 1-°´Æ™: ≥1≥     ≥       ≥≥               ≥≥               ≥≥     ⁄Ÿ≥  ≥
;         ¿ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒŸ¿ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒŸ¿ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒŸ¿ƒƒƒƒƒŸƒ¡ƒƒŸ
;          /\Hi_Ñ´/\__N___/
;         /
; §´®≠a ·Æ¢Øa§•≠®Ô - 3
; (·‚a‡Ë®• 3 °®‚a)         ≥ 3-Î© °a©‚.    ≥ 2-Î© °a©‚.    ≥
;                          √ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ≈ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¥
;  2-© ® 3-© °a©‚Î         ≥                         ≥     ≥
; Æ°‡aß„Ó‚ 16-°®‚≠. ·´Æ¢Æ  ¿ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒŸ
;                          \_ë¨•È•≠®• ≠aßa§ max 8k__/\Lo_Ñ´/
;
;
;                          ≥ 2-Î© °a©‚.    ≥ 1-Î© °a©‚.    ≥
;                          √ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ≈ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¬ƒ¥
;                          ≥         ≥     ≥1≥             ≥
;                          ¿ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒ¡ƒŸ
;                         \_ë¨•È•≠®•/\Lo_Ñ´/ \Hi_Ñ´/\__N___/
;
;
;
statist:
         cld

         mov    di,offset _table  ;\ Ç·Ô ·‚a‚®·‚®™a ® x•Ë®‡Æ¢a≠®• ®ß PKLITE
         push     di              ; \ Å•ß ≠®x ™Æ¨Øa™‚≠••, ≠Æ ¨•§´•≠≠••...
         xor    ax,ax             ;  \
         mov    cx,4FDh           ;   \
         push     cx              ;    / Clear _table
         rep    stosw               ;/

         mov    cx,1FFFh          ;\
         mov    si,offset  _input ;  \
st_1:    call    _cache
         add    _table[bx+4],2   ;       > Init _table
         loop   st_1             ;      /
                                  ;     /
         pop      cx
         mov    ax,offset _tree-2 ;   /
         pop      di
st_2:    add   ax,[di]           ;  /
         stosw                   ; /
         loop  st_2              ;/

         mov      si,offset _input
         mov      cx,1FFFh
         mov      di,offset _table+2
st_3:    call    __cache
         add    word ptr [di][bx],2   ;   /
         mov    bx,[di][bx]           ;  /
         mov    [bx],si              ; /
         loop   st_3                 ;/



        mov     di,offset _output
        mov     si,offset _input
        xor     cx,cx
        jmp     short vyborka


__cache:
         xor    ax,ax
_cache:
        lodsb               ; ù‚Æ Cache-‰„≠™Ê®Ô
        mov   bx,ax         ; bx = f( [si], [si+1], [si+2]? )<<2
        shl   bx,2          ;
        mov   al,[si]       ;
        add   bx,ax         ;
        shl   bx,1          ;
        retn


_m_00:
        cmp      cx,1
m_00:                     ; ëÆß§a≠®• 0-°´Æ™a
        jb      _ret
        mov     [di],cl
        inc     di
s_1:
        sub     si,cx
        rep     movsb
_ret:   retn

end_vy:
        pop     di
        mov     bx,dx
        cmp     bx,0FFFFh
        je      short not_coding

        mov     ax,1111h
maxoffset:
        cmp     cx,10h            ;cx-·Á•‚Á®™ ≠•·¶a‚Îx ·®¨¢Æ´Æ¢
        DEC     SI
        call    m_00              ;•·´® ëX > 10h ·Æß§a•¨ 0-°´Æ™

        mov     bp,bx             ;§´®≠a ·Æ¢Øa§•≠®Ô
        shl     ax,3              ;·¨•È•≠®• ≠aßa§

        xchg    ax,bx
        
        and     al,7              ;¨´a§Ë®• 3 °®‚a §´®≠Î ·Æ¢Øa§•≠®Ô
        or      bl,al             ;AX - 2-© ® 3-© °a©‚Î

        mov     ax,bp             ;¢Æ··‚a≠Æ¢®¨ §´®≠„ ·Æ¢Øa§•≠®Ô
        shl     al,1
        and     al,70h            ;c‚a‡Ë®• 3 °®‚a §´®≠Î ·Æ¢Øa§•≠®Ô
        or      al,80h            ;c‚a‡Ë®© °®‚ 1-£Æ °a©‚a = 1
        or      al,cl             ;+ Á®·´Æ ≠•·¶a‚Îx ·®¨¢Æ´Æ¢

        stosb                     ; ëÆß§a≠®• 1-°´Æ™a
        xchg    ax,bx
        stosw

        call    s_1               ; Ø®Ë•¨ ≠•·¶a‚Î• §a≠≠Î• ( •·´® •·‚Ï )
        lea     si,[si+bp+3]
        jmp     short vyborka     ; è‡Æ§Æ´¶a•¨

not_coding:
        inc     cx
vyborka:

        cmp     si,offset _input+1FFCh
        ja      short end_coder

        cmp     cx,7Fh
        call    m_00
        call    __cache


        mov   bp,_table[bx+2]
        mov   bx,_table[bx]

        mov   dx,0FFFFh

        push  di

        jmp   short     begin_vy


next_vy:
        pop     cx
        pop     si
        inc     bx
        inc     bx
begin_vy:
        cmp     bx,bp
        jae     short end_vy
        cmp     si,[bx+2]
        jbe     short end_vy
        push    si
        push    cx
        mov     di,[bx+2]
        cmpsw
        jne     short next_vy


        mov     cx,offset _input+1FFDh
        sub     cx,si
        cmp     cx,3Fh
        jbe     short $+5
        mov     cx,3Fh
        mov     ax,cx
        repe    cmpsb
        jz      short $+3
        inc     cx
        sub     ax,cx
        cmp     ax,dx

        jle     short next_vy
        mov     dx,ax
        sub     si,di
        mov     word ptr cs:[maxoffset-2],si
        jmp     short next_vy


end_coder:
        call    _m_00
        mov     cx,offset _input+2000h
        sub     cx,si
        add     si,cx
        call    _m_00
        xor     ax,ax
        stosb

packer endp
