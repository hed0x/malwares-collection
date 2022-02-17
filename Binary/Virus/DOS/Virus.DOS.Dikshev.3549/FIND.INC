   ;*®¨áª áâà®ª¨ ¢ ¯ ¬ïâ¨ (c) 1999 by RedArc

   ;‚•Ž„:
   ;DS:SI - €„*…‘ ˆ‘ŠŽŒŽ‰ ‘’*ŽŠˆ
   ;ES:DI - €„*…‘ „‹Ÿ *Žˆ‘Š€
   ;CX - ŠŽ‹ˆ—…‘’‚Ž *€‰’ „‹Ÿ ‘*€‚*…*ˆŸ
   ;BX - „‹ˆ*€ ˆ‘ŠŽŒŽ‰ ‘’*ŽŠˆ
   ;‚›•Ž„:
   ;DI    - ‘Œ…™…*ˆ… ‚ ‘…ƒŒ…*’… …‘‹ˆ *€˜‹ˆ, ‚ **Ž’ˆ‚*ŽŒ ‘‹“—€… 0FFFFH
   concatenat_string_in_memory:
                push ax bx cx dx
                cld
                mov al,byte ptr ds:[si]
   next_find_string:
                repne scasb
                je found_first_char
                mov di,0ffffh
                jmp end_find_string
   found_first_char:
                push cx
                push di
                push si
                mov cx,bx
                dec di
                repe cmpsb
                je found_string
                pop si
                pop di
                pop cx
                jmp next_find_string
   found_string:
                pop si
                pop di
                dec di
                pop cx
   end_find_string:
                pop dx cx bx ax
                ret
