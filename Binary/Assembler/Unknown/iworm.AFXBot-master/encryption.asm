Decrypt proto :dword
Encrypt proto :dword

.data
szCrypt byte 'x', 0

.data?
szCryptBuffer1 byte 8 dup (?)
szCryptBuffer2 byte 1024 dup (?)

.code
Encrypt proc uses eax esi edi szData:dword
local dwChar:dword
invoke RtlZeroMemory, addr szCryptBuffer2, 1024
mov esi, szData
mov edi, szData
mov edx, offset szKey
xor ecx, ecx
@@:
lodsb
.if al == 0
  stosb
  jmp @F
.endif
mov ah, [edx]
.if ah == 0
  mov edx, offset szKey
  mov ah, [edx]
.endif
xor al, ah
stosb
inc edx
inc ecx
jmp @B
@@:
mov esi, szData
xor edx, edx
@@:
xor eax, eax
lodsb
.if edx >= ecx
  jmp @F
.endif  
mov dwChar, eax
push ecx
push edx
push esi
invoke dwtoa, dwChar, addr szCryptBuffer1
invoke lstrcat, addr szCryptBuffer2, addr szCrypt
invoke lstrcat, addr szCryptBuffer2, addr szCryptBuffer1
pop esi
pop edx
pop ecx
inc edx
jmp @B
@@:
invoke RtlZeroMemory, szData, 1024
invoke lstrcpy, szData, addr szCryptBuffer2
ret
Encrypt endp

Decrypt proc uses eax ebx ecx edx esi edi szData:dword
local bExit:byte
mov esi, szData
mov edi, offset szCryptBuffer1
mov ebx, offset szCryptBuffer2
mov edx, offset szKey
mov al, [esi]
.if al != 120
  xor eax, eax
  mov [esi], al
  ret
.endif
inc esi
@@:
lodsb
.if al == 0 || al == 120
  .if al == 0
    mov bExit, 1
  .endif  
  push edx
  mov al, 0
  stosb
  invoke atodw, addr szCryptBuffer1
  pop edx
  mov edi, offset szCryptBuffer1
  mov ah, [edx]
  .if ah == 0
    mov edx, offset szKey
    mov ah, [edx]
  .endif
  xor al, ah
  mov [ebx], al
  inc ebx
  inc edx
  .if bExit == 1
    jmp @F
  .else      
    jmp @B
  .endif    
.endif
stosb
jmp @B
@@:
mov al, 0
mov [ebx], al
invoke lstrlen, addr szCryptBuffer2
mov ecx, eax
inc ecx
invoke lstrcpyn, szData, addr szCryptBuffer2, ecx
ret
Decrypt endp