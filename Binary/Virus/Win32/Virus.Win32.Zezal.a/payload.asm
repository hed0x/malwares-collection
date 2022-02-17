
   payload proc near
       pusha
       test ebp,ebp
       jz pas_payload
       xor eax,eax
       push eax
       lea ebx,[ebp+msg]
       push ebx
       push ebx
       push eax
       call_ MessageBox

   pas_payload:
       popa
       ret
   payload endp
