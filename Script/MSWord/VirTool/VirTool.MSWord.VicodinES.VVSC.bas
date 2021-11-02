olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.VicodinES.VVSC
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.VicodinES.VVSC - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Convert()
Attribute Convert.VB_ProcData.VB_Invoke_Func = "Project.ThisDocument.Convert"
Dim this As String
Dim that As String
Dim FinalConvert As String
Set CConvert = New DataObject

this = InputBox("Enter String To Convert :", "The VicodinES VBA String Converter")
If this = "" Then
MsgBox "No valid input", vbCritical, "VVSC Error"
End
End If
length_this = Len(this)
For countout = 1 To length_this
ToConvert = Mid(this, countout, 1)

For x = 1 To 400
that = Chr(x)
If that = ToConvert Then
FinalConvert = FinalConvert + "Chr(" & x & ")"
If countout <> length_this Then FinalConvert = FinalConvert + " + "
GoTo drop
End If
Next x

drop:

Next countout

MsgBox "Your Converted Text String Is In The Clipboard" + vbCr + vbCr + " --> Paste It Now So You Don't To Lose It! <-- ", vbInformation, "String.Poppy.Utility (c)1998"
CConvert.SetText FinalConvert
CConvert.PutInClipboard

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.VicodinES.VVSC
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4575 bytes
' Line #0:
' 	FuncDefn (Sub Convert())
' Line #1:
' 	Dim 
' 	VarDefn this (As String)
' Line #2:
' 	Dim 
' 	VarDefn that (As String)
' Line #3:
' 	Dim 
' 	VarDefn FinalConvert (As String)
' Line #4:
' 	SetStmt 
' 	New <crash>
' 	Set CConvert 
' Line #5:
' Line #6:
' 	LitStr 0x0019 "Enter String To Convert :"
' 	LitStr 0x0022 "The VicodinES VBA String Converter"
' 	ArgsLd InputBox 0x0002 
' 	St this 
' Line #7:
' 	Ld this 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x000E "No valid input"
' 	Ld vbCritical 
' 	LitStr 0x000A "VVSC Error"
' 	ArgsCall MsgBox 0x0003 
' Line #9:
' 	End 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Ld this 
' 	FnLen 
' 	St length_this 
' Line #12:
' 	StartForVariable 
' 	Ld countout 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld length_this 
' 	For 
' Line #13:
' 	Ld this 
' 	Ld countout 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ToConvert 
' Line #14:
' Line #15:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0190 
' 	For 
' Line #16:
' 	Ld x 
' 	ArgsLd Chr 0x0001 
' 	St that 
' Line #17:
' 	Ld that 
' 	Ld ToConvert 
' 	Eq 
' 	IfBlock 
' Line #18:
' 	Ld FinalConvert 
' 	LitStr 0x0004 "Chr("
' 	Add 
' 	Ld x 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St FinalConvert 
' Line #19:
' 	Ld countout 
' 	Ld length_this 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld FinalConvert 
' 	LitStr 0x0003 " + "
' 	Add 
' 	St FinalConvert 
' 	EndIf 
' Line #20:
' 	GoTo drop 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' Line #24:
' 	Label drop 
' Line #25:
' Line #26:
' 	StartForVariable 
' 	Ld countout 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' Line #28:
' 	LitStr 0x002E "Your Converted Text String Is In The Clipboard"
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x002F " --> Paste It Now So You Don't To Lose It! <-- "
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x001C "String.Poppy.Utility (c)1998"
' 	ArgsCall MsgBox 0x0003 
' Line #29:
' 	Ld FinalConvert 
' 	Ld CConvert 
' 	ArgsMemCall SetText 0x0001 
' Line #30:
' 	Ld CConvert 
' 	ArgsMemCall PutInClipboard 0x0000 
' Line #31:
' Line #32:
' 	EndSub 
' Line #33:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

